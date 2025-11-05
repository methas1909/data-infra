## docker-compose.dev.yml Structure (Docker Compose Overview)

**English:**  
The `docker-compose.dev.yml` file defines all core services for this data platform, including Zookeeper, Kafka, MinIO, ClickHouse, Airflow, Spark, Flask API, and a Python dev container. Each service is configured with ports and environment variables for easy local development and testing.

---

## Requirements & Setup

**English:**  
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)  
- (Recommended) Install `make` (on Windows, use Git Bash or Chocolatey)  
- Prepare a `.env` file for configuration  
- Use `make` commands to initialize and run all services

---

## Getting Started (Step-by-step)

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. Download or clone this project
3. Prepare the `.env` file and Airflow keys using:
   ```bash
   make init
   ```
4. Start all services:
   ```bash
   make up
   ```
5. Open your browser at [http://localhost:8080](http://localhost:8080) to access Airflow

Example screen:
![Airflow Example Screen](docs/images/airflow-example.png)

---

## Make (optional but recommended)

### Windows
- It is recommended to use `make` via Git Bash or
- Install `make` using Chocolatey:
	```powershell
	choco install make
	```

After installation, restart your terminal and verify it works with:

```powershell
make --version
```

### Usage in this project
- View available commands:

	```powershell
	make help
	```

- Check the version of make:

	```powershell
	make check-make
	```

- Check the version of Python (if installed):

	```powershell
	make check-python
	```


# data-infra

## Local Quickstart (Docker)
- Install Docker Desktop and use Git Bash (on Windows) for commands
- Prepare the `.env` file and Airflow keys:
  ```bash
  make init
  ```
- Start all services:
  ```bash
  make up
  ```
- View logs:
  ```bash
  make logs
  ```
- Stop and remove temporary containers/volumes:
  ```bash
  make down
  ```

Endpoints:
- Airflow: http://localhost:8080 (user: admin / pass: admin)
- MinIO Console: http://localhost:9001 (user/pass from docker/.env)
- ClickHouse HTTP: http://localhost:8123
- Kafka (within Docker network): kafka:9092