# docker-data

**Description**

Dockerfile for Data Volume Container

**Building**

```
docker build -t v6net/data .
```

**Usage**

First run data volume container you just created

```
docker run --name datavolume v6net/data
```

Then run your application container which uses /data volume

```
docker run --volumes-from datavolume ....
```

You can always jump into data volume with any container using shell like this

```
docker run --volumes-from datavolume -it busybox
```

**Backup**

```
docker run --volumes-from datavolume -v $(pwd):/backup busybox tar cvf /backup/backup.tar /data
```

or

```
docker run --volumes-from datavolume busybox tar cvf - data | gzip > backup.tgz
```

**Restore**

```
docker run --volumes-from datavolume -v $(pwd):/backup busybox tar xvf /backup/backup.tar
```

or

```
gunzip < backup.tgz | docker run --volumes-from datavolume -i busybox tar xvf -
```

**Cleanup**

```
docker rm -v datavolume
```
