# Docker nginx vhost


___
## Dockerfile
### Dockerfile 생성
```
# serv-a, serv-b
FROM nginx
COPY index.html /usr/share/nginx/html
```

```
# lb
upstream serv{
    server serv-a:80;
    server serv-b:80;
}
server{
    listen 80;
    location /
    {
        proxy_pass http://serv;
    }
}
```

### Build
각 Dockerfile이 있는 곳에서 해야 한다.
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
___
### Nginx Routing with URL PATH 

```
sh rm-all.sh
http://localhost:8001
curl http://localhost:8001/blog
```

