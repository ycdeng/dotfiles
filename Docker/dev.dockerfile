FROM ubuntu:19.04

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
&& apt-get update \
&& apt-get upgrade \
&& apt-get install -y git-svn build-essential zsh tmux wget libncurses5-dev libncursesw5-dev \
&& sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
&& git -c advice.detachedHead=false clone --quiet --depth 1 https://github.com/vim/vim.git /usr/src/vim \
&& cd /usr/src/vim \
&& make -j12 -s \
&& rm -fr /usr/src/vim \
&& git clone https://github.com/ycdeng/dotfiles.git /usr/src/dotfiles \
&& make install

WORKDIR /root
