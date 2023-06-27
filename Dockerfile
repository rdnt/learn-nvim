FROM ubuntu:22.04 as builder

RUN apt-get update && \
    apt-get upgrade -y

FROM builder

RUN apt-get install -y --no-install-recommends \
        ca-certificates \
        sudo \
        curl
        
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ARG USER=flynn
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USER \
    && useradd --uid $USER_UID --gid $USER_GID --shell /bin/zsh -m $USER \
    # Add sudo support
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

ADD bootstrap.sh /home/$USER/bootstrap.sh
RUN chmod +x /home/$USER/bootstrap.sh

USER $USER

RUN /home/$USER/bootstrap.sh

WORKDIR /home/$USER/app

ENTRYPOINT [ "zsh" ]
