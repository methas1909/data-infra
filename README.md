## โครงสร้าง docker-compose.dev.yml (Docker Compose Overview)

**ภาษาไทย:**  
ไฟล์ `docker-compose.dev.yml` จะรวบรวมบริการหลักที่ใช้ใน data platform นี้ เช่น Zookeeper, Kafka, MinIO, ClickHouse, Airflow, Spark, Flask API และ Python dev container โดยแต่ละ service จะถูกตั้งค่าพอร์ตและ environment variable ให้พร้อมใช้งานสำหรับการพัฒนาและทดสอบในเครื่องเดียว

**English:**  
The `docker-compose.dev.yml` file defines all core services for this data platform, including Zookeeper, Kafka, MinIO, ClickHouse, Airflow, Spark, Flask API, and a Python dev container. Each service is configured with ports and environment variables for easy local development and testing.

---

## สิ่งที่ต้องเตรียม (Requirements & Setup)

**ภาษาไทย:**  
- ติดตั้ง [Docker Desktop](https://www.docker.com/products/docker-desktop)  
- (แนะนำ) ติดตั้ง `make` (บน Windows ใช้ Git Bash หรือ Chocolatey)  
- เตรียมไฟล์ `.env` สำหรับตั้งค่าระบบ  
- ใช้คำสั่ง `make` เพื่อเตรียมและรันบริการต่าง ๆ

**English:**  
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)  
- (Recommended) Install `make` (on Windows, use Git Bash or Chocolatey)  
- Prepare a `.env` file for configuration  
- Use `make` commands to initialize and run all services

---

## เริ่มต้นอย่างไร (Step-by-step)

1. ติดตั้ง [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. ดาวน์โหลดหรือโคลนโปรเจกต์นี้
3. เตรียมไฟล์ `.env` และคีย์ Airflow ด้วยคำสั่ง:
   ```bash
   make init
   ```
4. เปิดบริการทั้งหมด:
   ```bash
   make up
   ```
5. เปิดเบราว์เซอร์ไปที่ [http://localhost:8080](http://localhost:8080) เพื่อเข้าใช้งาน Airflow

ตัวอย่างหน้าจอ:
![ตัวอย่างหน้าจอ Airflow](docs/images/airflow-example.png)

---

## Make (optional แต่แนะนำ)

### Windows
- แนะนำให้ใช้ `make` ผ่าน Git Bash หรือ
- ติดตั้ง `make` ด้วย Chocolatey:
	```powershell
	choco install make
	```

หลังติดตั้งแล้ว ให้ปิด/เปิดเทอร์มินัลใหม่ แล้วตรวจสอบว่าใช้งานได้ด้วย:

```powershell
make --version
```

### วิธีใช้งานในโปรเจกต์นี้
- ดูรายการคำสั่งที่มี:

	```powershell
	make help
	```

- ตรวจสอบเวอร์ชันของ make:

	```powershell
	make check-make
	```

- ตรวจสอบเวอร์ชันของ Python (ถ้ามีติดตั้ง):

	```powershell
	make check-python
	```


# data-infra

## Local Quickstart (Docker)
- ติดตั้ง Docker Desktop และแนะนำให้รันคำสั่งผ่าน Git Bash (บน Windows)
- เตรียมไฟล์ .env และคีย์ Airflow:
  ```bash
  make init
  ```
- เปิดบริการทั้งหมด:
  ```bash
  make up
  ```
- ดู log:
  ```bash
  make logs
  ```
- ปิดและลบคอนเทนเนอร์/วอลุ่มชั่วคราว:
  ```bash
  make down
  ```

Endpoints:
- Airflow: http://localhost:8080 (user: admin / pass: admin)
- MinIO Console: http://localhost:9001 (user/pass จาก docker/.env)
- ClickHouse HTTP: http://localhost:8123
- Kafka (ภายในเครือข่าย Docker): kafka:9092