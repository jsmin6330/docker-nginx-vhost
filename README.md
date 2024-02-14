# Docker nginx vhost


## Dockerfile
### Build
```
sudo docker build -t ng-s-a:0.1.0 .
sudo docker build -t ng-s-b:0.1.0 .
sudo docker build -t ng-s-lb:0.1.0 .
```

### run 
```
sudo docker run -d --name serv-a -p 9001:80 ng-s-a:0.1.0
sudo docker run -d --name serv-b -p 9002:80 ng-s-b:0.1.0
sudo docker run -d --name lb -p 9003:80 ng-s-lb:0.1.0
```

### network connect
```
sudo docker network create ablb
sudo docker network connect ablb serv-a
sudo docker network connect ablb serv-b
sudo docker network connect ablb lb

sudo docker network inspect abc # 네트워크 상세 정보 보기
```

