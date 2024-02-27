figlet remove serv-a , serv-b , lb
docker stop serv-a serv-b lb
docker rm serv-a serv-b lb
docker rmi serv-a:1 serv-b:1 lb:1
docker network rm  r-net
