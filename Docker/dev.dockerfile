FROM ubuntu:19.04

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
&& apt-get update \
&& apt-get upgrade \
&& apt-get install -y git-svn build-essential zsh tmux wget libncurses5-dev libncursesw5-dev \
&& git -c advice.detachedHead=false clone --depth 1 https://github.com/vim/vim.git /usr/src/vim \
&& cd /usr/src/vim \
&& make -j12 -s \
&& make install \
&& rm -fr /usr/src/vim \
&& git clone https://github.com/ycdeng/dotfiles.git /usr/src/dotfiles \
&& ln /usr/src/dotfiles/.tmux.conf ~/ 

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


WORKDIR /root
