FROM phusion/baseimage:0.9.22

ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get update && apt-get install -y --no-install-recommends \
										build-essential chrpath curl diffstat gcc-multilib gawk git-core locales \
                                        texinfo unzip wget xterm cpio file python python3 openssh-client iputils-ping iproute2 \
                                        sudo apt-transport-https ca-certificates software-properties-common \
                                        npm nodejs repo jq libdevmapper-dev \
                                        && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install docker-ce
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
		&& add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
		&& apt-get update && apt-get install -y docker-ce \
		&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Install balena 
RUN groupadd balena && curl -sfL https://balena.io/install.sh | sh 

VOLUME ["/resinbuilder"]
WORKDIR /resinbuilder
