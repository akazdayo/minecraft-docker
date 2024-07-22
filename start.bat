docker stop mcserver
docker rm mcserver
docker run -it -p 25565:25565 --name mcserver minecraft-server