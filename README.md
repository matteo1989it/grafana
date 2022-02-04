# Grafana (ubuntu) Dockerfile with preinstalled plugins (beta)


## How to build the image

Once cloned the repository move inside ```grafana\Docker``` and execute the build command 

```bash
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

## Navigate to the login page
Open a web browser page at localhost:3000 and use the default ```user/password``` combination (admin\admin)

## (WIP) bash script for auto-deploy
execute ```autoexec.sh``` to build and and launch the image in one click 