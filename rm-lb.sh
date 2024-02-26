figlet remove lb
docker stop lb
docker rm lb
docker rmi lb:1

figlet build,run lb
docker build -t lb:1 -f lb/Dockerfile lb/
docker run -d -p 8001:80 --name lb --network r-net lb:1
