# Развертывание и управление в Kubernetes

### Docker
```bash
docker login quay.io

docker build --no-cache -t quay.io/grissli/doorway:<tag> .
docker push quay.io/grissli/doorway:<tag>
```

### Kubernetes
```bash
# Установка
kubectl --kubeconfig ./grissli/admin.conf create -f /mnt/c/grissli/doorway/kubernetes/doorway-deployment.yaml

# Удаление
kubectl --kubeconfig ./grissli/admin.conf delete -f /mnt/c/grissli/doorway/kubernetes/doorway-deployment.yaml

# Обновление образов
kubectl --kubeconfig ./grissli/admin.conf set image deployment/doorway *=quay.io/grissli/doorway:<tag>

# Доступ в под
kubectl --kubeconfig ./grissli/admin.conf exec -it <doorway-pod> -- bash

# Чтение логов
kubectl --kubeconfig ./grissli/admin.conf logs <doorway-pod>

# Последние события по поду
kubectl --kubeconfig ./grissli/admin.conf describe pods <doorway-pod>
```