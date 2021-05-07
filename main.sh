sudo rm -rf ${OS_LAB_PATH}
sudo docker stop $(docker ps -a | grep app | awk '{print $1}') $(docker ps -a | grep grafana/grafana | awk '{print $1}') $(docker ps -a | grep prom/node-exporter | awk '{print $1}') $(docker ps -a | grep prom/prometheus | awk '{print $1}') $(docker ps -a | grep mysql | awk '{print $1}')
sudo docker rm $(docker ps -a | grep app | awk '{print $1}') $(docker ps -a | grep grafana/grafana | awk '{print $1}') $(docker ps -a | grep prom/node-exporter | awk '{print $1}') $(docker ps -a | grep prom/prometheus | awk '{print $1}') $(docker ps -a | grep mysql | awk '{print $1}')

mkdir ${OS_LAB_PATH}
git clone https://github.com/daniiloleshchuk/DB-Lab6 ${OS_LAB_PATH}
cd ${OS_LAB_PATH}
sudo mvn package -Dmaven.test.skip=true
sudo docker-compose up -d
