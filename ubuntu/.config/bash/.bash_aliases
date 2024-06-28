#!/bin/bash

############ General ############
alias cls="clear"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias distro="cat /etc/*-release"
alias myip="dig ANY +short @resolver2.opendns.com myip.opendns.com"
alias reload='source ~/.zshrc'
alias sapu="sudo apt-get update"
alias big="du -aBM 2>/dev/null | sort -nr | head -n 50 | more"
# Rerun the previous command with sudo:
alias ffs='sudo $(fc -ln -1)'
alias untar='tar -zxvf'
alias path='echo -e ${PATH//:/\\n}'
# Show open ports
alias ports='sudo netstat -tulanp'
# Allow wget resume
alias wget='wget -c'
alias gh='history|grep'
alias alibaba='code ~/.bash_aliases'

############ Safety ############
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

############ Globals ############
# Pipe a command’s output to grep. You can use it like so: history G ssh
alias -g G='| grep'
# Pipe a command’s output to less. You can use it like so: cat production.log L
alias -g L='| less'

# Navigation
alias dev="cd ~/env/dev/"
alias perso="cd ~/env/dev/perso/"
alias windaube="cd /mnt/c/Users/veben"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

############ Terraform ############
alias tf='/usr/bin/terraform'
alias tfp='/usr/bin/terraform plan'
alias tfa='/usr/bin/terraform apply'
alias tfd='/usr/bin/terraform destroy'

############ Kubectl ############
#alias k="kubectl --insecure-skip-tls-verify=true"
alias k="kubectl"
alias kc="k config get-contexts"
alias kcd="k config use-context sypel-blobfish"
alias kcr="k config use-context sypel-boa"
alias kcpp="k config use-context sypel-bison"
alias kcp="k config use-context sypel-beluga"
alias kpd="k delete pod --field-selector=status.phase==Succeeded"
alias kpg="k get pods"
alias kjd="k delete jobs --field-selector status.successful=1" 
alias kjdold="k get jobs -o go-template --template '{{range .items}}{{.metadata.name}} {{.metadata.creationTimestamp}}{{"\n"}}{{end}}' | awk '$2 <= "'$(date -d'now-${1} days' -Ins --utc | sed 's/+0000/Z/')'" { print $1 }' | xargs --no-run-if-empty k delete job"
kpx() {
if [ "$#" -eq 2 ]; then
	k exec -it $(k get pods | awk '{print $1}' | grep ${1:-webdav}) -c $2 -- /bin/bash
fi
k exec -it $(k get pods | awk '{print $1}' | grep ${1:-webdav}) -- /bin/bash
}
klog() {
if [ "$#" -eq 2 ]; then
    k logs -f $(k get pods | awk '{print $1}' | grep ${1}) -c $2
fi
k logs -f $(k get pods | awk '{print $1}' | grep ${1})
}
kdes() { k describe pods $(k get pods | awk '{print $1}' | grep ${1})
}

############ Docker ############
alias d="docker"
alias dps="docker ps"
alias dc="docker-compose"
alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dkc='docker rm -vf $(docker ps -a -q)'
alias dki='docker rmi -f $(docker images -a -q)'

############ Jetbrains ############
alias toolbox="~/.jetbrains/toolbox"
alias pycharm="~/.jetbrains/pycharm"

############ SDKmman ############
alias java11="sdk use java 11.0.8.hs-adpt"
alias java14="sdk use java 14.0.2.hs-adpt"

############ VSCode ############
alias notes="code '/mnt/c/Users/benoit.veyriere/My Drive/docs/notes'"
alias snippets="code '/mnt/c/Users/benoit.veyriere/My Drive/docs/snippets'"

############ Maven ############
notified_maven() {
  if [ -x ./mvnw ]; then
    echo "## Maven Wrapper"
    ./mvnw $@ -Dspring.output.ansi.enabled=ALWAYS
  else
    echo "## Global Maven"
    mvn $@ -Dspring.output.ansi.enabled=ALWAYS
  fi

  if [ $? -eq 0 ]; then
    notify-send --icon=face-cool "`basename $(pwd)`: mvn $*" "Build SUCCESS"
  else
    notify-send --icon=face-crying "`basename $(pwd)`: mvn $*" "Build FAILED"
  fi
}
alias mci='notified_maven clean install'
alias mcp='notified_maven clean package'
alias mcv='notified_maven clean verify'

############ Gradle ############
notified_gradle() {
  if [ -x ./gradlew ]; then
    echo "## Gradle Wrapper"
    ./gradlew $@ -Dspring.output.ansi.enabled=ALWAYS
  else
    echo "## Global Gradle"
    gradle $@ -Dspring.output.ansi.enabled=ALWAYS
  fi

  if [ $? -eq 0 ]; then
    notify-send --icon=face-cool "`basename $(pwd)`: gradle $*" "Build SUCCESS"
  else
    notify-send --icon=face-crying "`basename $(pwd)`: gradle $*" "Build FAILED"
  fi
}
alias gcb='notified_gradle clean build --info'
