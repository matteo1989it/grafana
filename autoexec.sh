docker build --build-arg "GRAFANA_VERSION=latest" --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel, grafana-piechart-panel, grafana-worldmap-panel,grafana-simple-json-datasource" -t grafana-weai -f Dockerfile .

docker run -d -v (path_to_var_folder):/var/lib/grafana -p 3000:3000 --name=grafana grafana-weai

docker exec -it grafana bash /etc/config/post.sh