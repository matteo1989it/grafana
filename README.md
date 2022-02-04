# Grafana (ubuntu) Dockerfile with preinstalled plugins

## How to build the image:

```
cd Docker

docker build \

  --build-arg "GRAFANA_VERSION=latest" \

  --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-piechart-panel,grafana-worldmap-panel,grafana-simple-json-datasource" \

  -t grafana-weai-image -f Dockerfile .

mkdir data # creates a folder for your data

ID=$(id -u) # saves your user id in the ID variable

# starts grafana with your user id and using the data folder
docker run -d --user $ID -v grafana-storage:/var/lib/grafana -p 3000:3000 --name=grafana grafana-weai-container
```