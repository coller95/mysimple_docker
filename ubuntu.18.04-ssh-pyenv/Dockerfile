FROM ubuntu:18.04

RUN apt update && apt install openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu

RUN echo 'ubuntu:password' | chpasswd

ENV DEBIAN_FRONTEND=noninteractive

RUN apt -y install -y curl make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git --no-install-recommends 

USER ubuntu
WORKDIR /home/ubuntu

ENV PATH="/home/ubuntu/.pyenv/bin:$PATH"
ENV PYENV_VIRTUALENV_DISABLE_PROMPT=1

RUN curl https://pyenv.run | bash && \
echo 'export PATH="/home/ubuntu/.pyenv/bin:$PATH"' >> ~/.bashrc && \
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc && \
echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc && \
echo 'export PYENV_VIRTUALENV_DISABLE_PROMPT=1' >> ~/.bashrc && \
~/.bashrc && \
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install --force 3.6.9 -v && pyenv global 3.6.9

USER root
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 22
ENTRYPOINT ["/entrypoint.sh"]
