FROM phusion/baseimage:0.9.22

ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get update && apt-get install -y --no-install-recommends \
										build-essential chrpath curl diffstat gcc-multilib gawk git-core locales \
                                        texinfo unzip wget xterm cpio file python python3 openssh-client iputils-ping iproute2 \
                                        sudo apt-transport-https ca-certificates software-properties-common \
                                        npm nodejs repo jq\
                                        && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install docker-ce
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
		&& add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
		&& apt-get update && apt-get install -y docker-ce \
		&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Install balena 
RUN groupadd balena && curl -sfL https://balena.io/install.sh | sh 

# Create user that can run balena and docker without root
RUN useradd --uid 1000 --create-home builder \
	&& echo "builder ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers \
    && usermod -aG docker builder \
    && usermod -aG balena builder

VOLUME ["/home/builder"]
WORKDIR /home/builder

# Create start script for dockerd and balenad
RUN echo '#!/bin/bash\n\
sudo service docker start\n\
sudo balenad&\n\
sleep 5\n\
exec setuser builder $@\n'\
>> /entrypoint.sh \
&& chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]