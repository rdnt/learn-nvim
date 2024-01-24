FROM ubuntu:23.04 as builder

RUN apt-get update && \
    apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        tzdata \
        ca-certificates \
        sudo \
        curl \
        wget \
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
ARG TZ=UTC
ARG USER_UID=1001
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USER \
    && useradd --uid $USER_UID --gid $USER_GID --shell /bin/zsh -m $USER \
    # Add sudo support
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

ADD bootstrap.sh /home/$USER/bootstrap.sh
RUN chmod +x /home/$USER/bootstrap.sh

USER $USER
ENV TZ=$TZ

WORKDIR /home/$USER/workspace

RUN bash -c ~/bootstrap.sh

ENTRYPOINT [ "zsh" ]
