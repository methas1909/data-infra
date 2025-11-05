#!/bin/bash
set -euo pipefail

echo "Starting the bootstrap process..."

# Resolve repo paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DOCKER_DIR="${REPO_ROOT}/docker"
ENV_EXAMPLE="${DOCKER_DIR}/.env.example"
ENV_FILE="${DOCKER_DIR}/.env"

# Ensure docker/.env exists
if [ ! -f "${ENV_FILE}" ]; then
	if [ -f "${ENV_EXAMPLE}" ]; then
		cp "${ENV_EXAMPLE}" "${ENV_FILE}"
		echo "Created ${ENV_FILE} from .env.example"
	else
		echo "ERROR: ${ENV_EXAMPLE} not found"
		exit 1
	fi
else
	echo "${ENV_FILE} already exists"
fi

# Ensure AIRFLOW_FERNET_KEY is set (urlsafe base64)
echo "Ensuring AIRFLOW_FERNET_KEY..."
python - << 'PY' "${ENV_FILE}"
import os, re, sys, base64
env_path = sys.argv[1]
with open(env_path, 'r', encoding='utf-8') as f:
    content = f.read()

def needs_key(val: str) -> bool:
    return (not val) or (val.strip() in ('please_generate_fernet_key', 'PLACEHOLDER'))

m = re.search(r'^AIRFLOW_FERNET_KEY=(.*)$', content, flags=re.M)
current = m.group(1).strip() if m else ''
if needs_key(current):
    new_key = base64.urlsafe_b64encode(os.urandom(32)).decode('utf-8')
    if m:
        content = re.sub(r'^AIRFLOW_FERNET_KEY=.*$', f'AIRFLOW_FERNET_KEY={new_key}', content, flags=re.M)
    else:
        content += f'\nAIRFLOW_FERNET_KEY={new_key}\n'
    with open(env_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print("AIRFLOW_FERNET_KEY set.")
else:
    print("AIRFLOW_FERNET_KEY already set.")
PY

echo "Bootstrap process completed."