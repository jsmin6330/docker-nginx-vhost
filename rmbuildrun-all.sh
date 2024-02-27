figlet remove serv-a , serv-b , lb
docker stop serv-a serv-b lb
docker rm serv-a serv-b lb
docker rmi serv-a:1 serv-b:1 lb:1
docker network rm  r-net

figlet build, run serv-a , serv-b , lb
docker build -t serv-a:1 -f serv-a/Dockerfile serv-a/
docker build -t serv-b:1 -f serv-b/Dockerfile serv-b/
docker network create r-net
docker run -d --name serv-a --network r-net serv-a:1
docker run -d --name serv-b --network r-net serv-b:1
docker build -t lb:1 -f lb/Dockerfile lb/
docker run -d -p 8001:80 --name lb --network r-net lb:1
