FROM ubuntu:22.04 as builder

RUN apt-get update && \
    apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        sudo \
        curl \
        gpg-agent \
        software-properties-common \
        build-essential \
        zsh \
        git \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Add neovim repo
RUN add-apt-repository -y ppa:neovim-ppa/unstable

# Install system dependencies
RUN apt-get install -y --no-install-recommends \
        neovim

FROM builder as base

ARG USER=flynn
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USER \
    && useradd --uid $USER_UID --gid $USER_GID --shell /bin/zsh -m $USER \
    # Add sudo support
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

ADD bootstrap.sh /home/$USER/bootstrap.sh
RUN chmod +x /home/$USER/bootstrap.sh

USER $USER

WORKDIR /home/$USER/workspace

RUN bash -c ~/bootstrap.sh

ENTRYPOINT [ "zsh" ]
