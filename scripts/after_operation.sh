#!/bin/bash

# OPTIONAL : Uncomment to put Nextcloud in maintenance mode by switching the value of the maintenance variable in the config file
# cp /nextcloud/config.php ~/config.php
# sed -i "s/'maintenance' => true/'maintenance' => false/"  ~/config.php
# cp -f ~/config.php /nextcloud/config.php 
# chown www-data:www-data /nextcloud/config.php

# OPTIONAL : Uncomment to use a Slack webhook
# SLACK_MSG=":white_check_mark: Operation : *${DUPLICATI__OPERATIONNAME}* performed for _${DUPLICATI__backup_name}_\nStatus : *${DUPLICATI__PARSED_RESULT}*"
# curl -s -X POST -H 'Content: application/json' --data "{\"text\": \"${SLACK_MSG}\", \"icon_emoji\": \":robot_face:\"}" "${SLACK_WEBHOOK_URL}"
