FROM ubuntu:22.10

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        sudo \
        ca-certificates

RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=tasos
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID --shell /bin/zsh -m $USERNAME \
    # Add sudo support
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

RUN apt-get install -y \
        curl \
        zsh \
        git \
        neovim \
        nano


RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

WORKDIR /home/$USERNAME/app

SHELL [ "/bin/bash" ]

ENTRYPOINT [ "zsh" ]
