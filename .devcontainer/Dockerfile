FROM debian:12.2

ENV DEBIAN_FRONTEND=noninteractive

# Perform an update.
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean all

# Install common utilities and tools.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests \
	bash curl wget tar zip bzip2 xz-utils \
	unzip make ca-certificates gnupg \
	git git-core openssh-client vim

# Install nodejs LTS version.
RUN mkdir -p /etc/apt/keyrings && \
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | \
	    gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
	echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | \
	    tee /etc/apt/sources.list.d/nodesource.list && \
	apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests nodejs && \
	apt-get autoremove -y && apt-get clean all

# Install Chrome Browser for performing headless tests.
RUN apt-get update && \
	apt-get install -y --no-install-recommends --no-install-suggests fonts-liberation && \
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
	apt-get install -y --no-install-recommends --no-install-suggests -f ./*.deb && \
	rm -f *.deb && apt-get autoremove -y && apt-get clean all

# Install angular framwork.
RUN npm install -g @angular/cli

# Create default user.
ENV USER_ID=1000
ENV USER_NAME=devuser
RUN addgroup --gid ${USER_ID} ${USER_NAME} && \
	adduser --disabled-password --gecos "" \
	    --uid ${USER_ID} --gid ${USER_ID} ${USER_NAME}

# Set default user.
ENV HOME /home/devuser
USER devuser

CMD /bin/bash
