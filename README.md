

# Inelso Technical Task

Contains the technical task for Inelso, composed from a deployment of Django application with PostgreSQL and RabbitMQ using Docker, and Kubernetes.

## Repository Structure

```plaintext
Inelso/
├── code/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── [Django application files]
├── kuber/
│   ├── deployment/
│   │   ├── django-deployment.yaml
│   │   ├── postgres-deployment.yaml
│   │   └── rabbitmq-deployment.yaml
│   ├── configmap/
│   │   └── configmap.yaml
│   └── secret/
│       └── secret.yaml
└── docker-compose.yaml
```

## Dockerfile Overview

The `Dockerfile` is configured as follows:

```dockerfile
FROM python:3.12-slim

# Дебаг 
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Указываем рабочию директорию
WORKDIR /code

# Устанавливаем зависимости и нужные пакеты
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Копируем файлы Django-приложения
COPY . /code/

```
It used in docker-compose.yaml, which was created for local debugging

## Application Overview

Nothis special at all :) 


# Q&A:

- **Dockerfile и инструкции по сборке и запуску**:
  - Для сборки и запуска Docker образа используйте команду:
    ```bash
    docker compose up
    ```
    После запуска будет доступно по адресу `127.0.0.1:8000` .

- **YAML-манифесты и инструкции по развёртыванию в Kubernetes**:
  - Все необходимые YAML манифесты находятся в директории `kuber/`.
  - Для развёртывания Kubernetes ресурсов используйте следующие команды:
    ```bash
    kubectl apply -f kuber/secret/secret.yaml
    kubectl apply -f kuber/configmap/configmap.yaml
    kubectl apply -f kuber/deployment/postgres-deployment.yaml
    kubectl apply -f kuber/deployment/rabbitmq-deployment.yaml
    kubectl apply -f kuber/deployment/django-deployment.yaml
    ```
  - (Optional) воспользоваться application.yaml при наличии ArgoCD 
  - Проверка статуса Pod'ов и сервисов:
    ```bash
    kubectl get pods
    kubectl get services
    ```

- **Описание проверки подключений к PostgreSQL и RabbitMQ**:
  - **PostgreSQL**:
    ```bash
    kubectl exec -it <postgres-pod> -- psql -U admin -d mydatabase
    psql_ready <db> <port> 
    ```
  - **RabbitMQ**:
    ```bash
    kubectl exec -it <rabbitmq-pod> -- rabbitmqctl status
    ```


# Expected Behaviour: 

![alt text](https://github.com/NotLGBT/Inelso/blob/NotLGBT/Lancelot/be.gif)