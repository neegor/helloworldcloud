# HelloWorld Django Web App Example

Это простое докеризированое Django приложение с целью продемонстрировать:
* как сделать Dockerfile
* как прикрутить метрики Prometheus
* как запустить приложение в docker-compose совместно с Promepheus и Grafana
* как настроить дашборд в Grafana
* и образец yaml файлов для Kubernetes

### Запуск приложения

```bash
docker-compose build --no-cache
docker-compose up
```

Приложение уже включает в себя метрики Prometheus а так же health-check и ready-check.

```bash
http://localhost:8000    # Django App
http://localhost:9090    # Prometheus
http://localhost:3000    # Grafana (admin:admin)

http://localhost:8000/metrics      # метрики Prometheus
http://localhost:8000/healthz      # проверка работоспособности
http://localhost:8000/readiness    # проверка работоспособности
```

### Настройка Grafana

Prometheus не требует настройки. Для Grafana необходимо только подключть дашборд.

* в Grafana подключаем источник данных Prometheus
* импортируем дашборд из ```./grafana/grafana-dashboard.json```

[Как импортировать?](http://docs.grafana.org/reference/export_import/#importing-a-dashboard)

### Kubernetes

В проект приложены yaml файлы для Kubernetes и Minikube ```./kubernetes```

```bash
# развертываение в Minikube
kubectl create -f ./kubernetes/deployment.yaml

# развертываение в K8S
kubectl create -f ./kubernetes/deployment.yaml
kubectl create -f ./kubernetes/autoscaler.yaml
kubectl create -f ./kubernetes/job.yaml
```

### Test Dockerfile

```bash
# Install latest version to /usr/local/bin
curl -fsSL https://goss.rocks/install | sh
# Build docker
docker build -t helloworld .
# Start test
dgoss run helloworld
```

ВНИМАНИЕ! ДАННЫЙ ПРИМЕР ЯВЛЯЕТСЯ ДЕМОНСТРАЦИОННЫМ И НЕ МОЖЕТ РАССМАТРИВАТЬСЯ КАК ПРОДАКШЕН РЕШЕНИЕ.