FROM jess/chromium

USER 0

RUN apt-get update && apt-get install -y chromium-sandbox

RUN /bin/echo -e 'export GOOGLE_API_KEY="no"\nexportGOOGLE_DEFAULT_CLIENT_ID="no"\nexportGOOGLE_DEFAULT_CLIENT_SECRET="no"' > /etc/chromium.d/googleapikeys

USER 1000

CMD [ "--no-sandbox", "https://web.skype.com/" ]

# Run it like this:
#
# docker run -it --rm --name skype --hostname $(uname -n) -u $(id --user):$(id --group) --cpuset-cpus 0 --memory 512mb -e DISPLAY -v ${HOME}/docker-volumes/skype-home:${HOME} -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v ${HOME}/.Xauthority:${HOME}/.Xauthority:ro -v /dev/shm:/dev/shm v6net/skype
