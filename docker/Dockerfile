FROM aheavens/development-environment-base:match-host-id-on-entry

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

USER $user
CMD bash
