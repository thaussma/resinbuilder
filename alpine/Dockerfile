FROM resin/amd64-golang:1.9

# diffstat gcc-multilib
RUN apk add --no-cache g++ gcc chrpath curl gawk git texinfo unzip wget xterm cpio file python python3 openssh-client iproute2 sudo nodejs-npm nodejs jq

RUN sudo curl https://raw.githubusercontent.com/esrlabs/git-repo/stable/repo > /bin/repo \
	&& sudo chmod a+x /bin/repo

RUN cat /etc/apk/repositories
RUN apk add --no-cache iputils docker

RUN apk add diffstat device-mapper --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ 

# Install balena 
RUN addgroup balena && curl -sfL https://balena.io/install.sh | sh 
#url="https://github.com/resin-os/balena/releases/download/${tag}/balena-${tag}-${arch}.tar.gz"
#curl -sL "$url" | sudo tar xzv -C /usr/local/bin --strip-components=1
#RUN curl -sL "https://github.com/resin-os/balena/releases/download/17.06-rev1/balena-17.06-rev1-x86_64.tar.gz" | sudo tar xzv -C ~
