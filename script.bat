echo "Criando as imagens..."

docker build -t leonardocavi/projetok8s-backendphp:1.0 backend/.
docker build -t leonardocavi/projetok8s-databasemysql:1.0  database/.

echo "Realizando o push das imagens..."

docker push leonardocavi/projetok8s-backendphp:1.0
docker push leonardocavi/projetok8s-databasemysql:1.0

echo "Criando serviços no cluster K8s..."

kubectl.exe apply -f ./services.yml

echo "Criando os deployments..."

kubectl.exe apply -f ./deployment.yml

