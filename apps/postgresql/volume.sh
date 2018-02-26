docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.1.170,rw \
    --opt device=:/media/wd5t/kuber/postgres \
    postgres
