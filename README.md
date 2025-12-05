# 🧠 StockPulse Data Ingestion & Storage

---

## 🚀 Features

- ✅ Ingest live ticks from Kafka  
- ✅ Convert ticks into 1-minute OHLCV candles  
- ✅ Store historical candles in PostgreSQL  
- ✅ Perform UPSERT logic (update existing candle for the same minute)

---

## 🐳 Kafka Setup

If Kafka is **not already running**, start it using Docker:

```bash
docker compose up -d
````

---

## 🧩 1. Install Node.js Dependencies

Initialize and install required packages:

```bash
npm init -y
npm install kafkajs dotenv redis
```

---

## ⚙️ 2. Environment Setup

Copy `.env.example` → create your own `.env` file.

Edit `.env` and add your PostgreSQL username and password.

---

## ▶️ 3. Running the System

### Run the ingestion service

(Consumes live tick data from Kafka and stores candles)

### Run the cache service

```bash
node index.js
```

---

## 📊 Architecture Overview

```
Kafka Producer → Kafka Broker → Consumer Service → Redis
```

* **Kafka Producer**: Sends live tick data
* **Consumer (this project)**: Connect to Redis and consumes live ticks
* **Redis**: Stores live tick cache