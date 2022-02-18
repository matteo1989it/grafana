docker build --build-arg "GRAFANA_VERSION=latest" --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel, grafana-piechart-panel, grafana-worldmap-panel,grafana-simple-json-datasource" -t grafana-weai -f Dockerfile .

docker volume create grafana-storage

docker run -d -v grafana-storage:/var/lib/grafana -p 3000:3000 --name=grafana grafana-weai

docker exec -t grafana bash /etc/config/post.sh