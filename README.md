# Grafana (ubuntu) Dockerfile with preinstalled plugins (beta)


## How to build the image

Once cloned the repository move inside ```grafana\``` and execute the build command 

```bash
docker build \

--build-arg "GRAFANA_VERSION=latest" \

--build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel, \
  grafana-piechart-panel,grafana-worldmap-panel,grafana-simple-json-datasource" \

-t grafana-weai -f Dockerfile .
```


## Start the container 

The ```var``` folder contains an up-to-date copy of grafana.db that we need to copy in our container via the ```-v``` flag. This will also allow us to sync changes between container and host.

```
docker run -d -v (path_to_var_folder):/var/lib/grafana -p 3000:3000 --name=grafana grafana-weai
```

## Update datasources

During the building phase, the ```post.sh``` script has been copied inside our container. It launches a PUT call that will update the datasource using the content of ```config/datasources/datasource.json```. This changes can also be made using grafana's UI  
```
docker exec -t grafana bash /etc/config/post.sh
```

## Navigate to the login page
Open a web browser page at localhost:3000 and use the default ```user/password``` combination (admin\admin)

## EXTRA: Bash script for auto-deploy
```autoexec.sh``` runs sequentially all commands showed until now. If you want to use it just remember to insert the path to the ```var``` folder.