kill-screen() {
  screen -X -S $1 kill
}
docker-screen-wipe() {
  kill -9 $(screen -ls | grep '[0-9].tty' | sed 's/.tty.*//g') && screen -wipe
}
