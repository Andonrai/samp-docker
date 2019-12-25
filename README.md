SA-MP
=====

It's a docker image for SA-MP.

## Building the image

With default arguments (version 0.3.7-R2):

```
docker build -t sa-mp:0.3.7-r2 .
```

With custom arguments:

```
docker build \
  --build-arg SAMP_URL=http://files.sa-mp.com/samp037svr_R2-1.tar.gz \
  --build-arg SAMP_VERSION=0.3.7-r2 \
  -t sa-mp:0.3.7-r2 .
```

## Running the server

```
docker run \
  --rm -it \
  -e SAMP_RCON_PASSWORD=passw0rd \
  -p 7777/tcp \
  -p 7777/udp \
  sa-mp:0.3.7-r2
```

## Configuration reference

| Property             | Description |
|----------------------|-------------|
| SAMP_LAN_MODE        |             |
| SAMP_RCON_PASSWORD   |             |
| SAMP_MAX_PLAYERS     |             |
| SAMP_PORT            |             |
| SAMP_HOSTNAME        |             |
| SAMP_FILTER_SCRIPTS  |             |
| SAMP_ANNOUNCE        |             |
| SAMP_QUERY           |             |
| SAMP_WEB_URL         |             |
| SAMP_MAX_NPC         |             |
| SAMP_ONFOOT_RATE     |             |
| SAMP_INCAR_RATE      |             |
| SAMP_WEAPON_RATE     |             |
| SAMP_STREAM_DISTANCE |             |
| SAMP_STREAM_RATE     |             |
