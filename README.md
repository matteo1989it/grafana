# Grafana (ubuntu) Dockerfile with preinstalled plugins

## How to build the image

Once cloned the repository move inside it and execute the build command 

```bash
cd Docker

docker build \

--build-arg "GRAFANA_VERSION=latest" \

--build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel, \
  grafana-piechart-panel,grafana-worldmap-panel,grafana-simple-json-datasource" \

-t grafana-weai -f Dockerfile .
```

## Create a persistent volume for data in /var/lib/grafana (database and plugins)

```bash
docker volume create grafana-storage
```
## Start the container 
```
docker run -d -v grafana-storage:/var/lib/grafana -p 3000:3000 --name=grafana grafana-weai
```