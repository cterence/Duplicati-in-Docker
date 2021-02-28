# Duplicati in Docker

[What is Duplicati ?](https://www.duplicati.com/)

A Docker-Compose implementation of Duplicati tailored to work with a Nextcloud instance

## Run

* Create the environment file from the example  file

```
cp .env.example .env
```
* Change the environment variables to your liking
* Specify the path where the data you want to backup is in `docker-compose.yml`
* Launch the container
```
docker-compose up -d
```
* Access `<host_ip>:8200` with your browser

## Nextcloud

There are a few options to tailor this Duplicati instance to backup a Nextcloud data instance

### Automatic maintenance mode enabling/disabling

* Uncomment the corresponding code in the scripts
* Link the Nextcloud `config.php` file to the corresponding volume in `docker-compose.yml`

### MySQL / MariaDB database backup

* Setup a cron job with the script in `tools/db_bak.sh`
* Link the database backup directory to the corresponding volume in `docker-compose.yml`
* In your Duplicati backup configuration, select the `/source/db_bak` source directory

## Restoration point

You can specify the data restoration point into the `docker-compose.yml` if your host system storage is too small. You may link it to a external drive

You will need to tell Duplicati to use the `/restore/` directory when restoring data

## Alerts

You can enable Slack alerts with the `before_operation.sh` and `after_operation.sh` files
* Uncomment the corresponding code in the scripts
* Fill the `SLACK_WEBHOOK_URL` environment variable
* In your backup configuration :
  * Go to the options section
  * Show the advanced options
  * Choose the `run-script-before` option and fill it with `/scripts/before_operation.sh`
  * Choose the `run-script-after` option and fill it with `/scripts/after_operation.sh`
  * Save