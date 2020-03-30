#
# Usage
#
# a) anonymous run:
#    docker run -ti --rm -e DISPLAY -v $HOME/.Xauthority:/home/user/.Xauthority:ro --net=host v6net/microsoft-teams
# b) to keep settings, mount $HOME
#    docker run -ti --rm -v docker-volumes/teams:/home/user -e DISPLAY -v $HOME/.Xauthority:/home/user/.Xauthority:ro --net=host v6net/microsoft-teams
#

FROM microsoft/teams-docker

RUN apt-get update
ADD https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb /tmp/teams.deb

RUN apt install -y /tmp/teams.deb && rm /tmp/teams.deb

RUN groupadd --gid 1000 user
RUN adduser --home /home/user --uid 1000 --gid 1000 user

USER 1000:1000
WORKDIR /home/user

ADD teams.sh /usr/local/bin/teams.sh
CMD /usr/local/bin/teams.sh

