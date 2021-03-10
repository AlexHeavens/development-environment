FROM ubuntu:20.04

ARG user=developer
ARG user_id=1000
ARG group_id=$user_id

# Create a user matching the host's
RUN groupadd --gid $group_id $user
RUN useradd \
	--shell /bin/bash \
	--create-home \
	--uid $user_id --gid $group_id \
	--groups sudo \
	$user

# Interactive mode requires user-prompts during build.
RUN DEBIAN_FRONTEND='noninteractive' TZ='Europe/London' apt-get update && apt-get install --assume-yes \
	tzdata keyboard-configuration

# Packaging
RUN apt-get update && apt-get install --assume-yes \
    sudo

# Basic terminal use
RUN apt-get update && apt-get install --assume-yes \
	vim curl htop tldr tree apt-file locate # basic terminal use

# GUI
RUN apt-get update && apt-get install --assume-yes \
	firefox vlc xclip

# Development
RUN apt-get update && apt-get install --assume-yes \
	git tig meld docker docker-compose python3 python3-pip python3-venv jq

USER $user
CMD bash
