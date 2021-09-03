FROM python:3.6

# Install prerequisites
RUN pip install python-openstackclient python-heatclient

# User management
ARG UID=1001
ARG GID=1001

RUN groupadd deployer -g $GID
RUN useradd deployer -g $GID -u $UID -m -s /bin/bash

USER deployer

# Copy repository contents
WORKDIR /deploy
COPY . .

CMD ["bash"]
