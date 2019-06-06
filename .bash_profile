## Based off Geerlingguy's .bash_profile
# https://github.com/geerlingguy/dotfiles

# Nicer prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '

# Use colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$HOME/.composer/vendor/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bashrc file (if present)
if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Git upstream branch syncer
# Usage: gsync master (checks out master, pull upstream, push origin)
function gsync() {
  if [[ ! "$1" ]] ; then
      echo "You must supply a branch."
      return 0
  fi

  BRANCHES=$(git branch --list $1)
  if [ ! "$BRANCHES" ] ; then
     echo "Branch $1 does not exist."
     return 0
  fi

  git checkout "$1" && \
  git pull upstream "$1" && \
  git push origin "$1"
}

# Super useful Docker container oneshots
# Usage: dockrun, or dockrun [centos7|fedora27|debian9|debian8|ubuntu1404|etc.]
docrun() {
  docker run -it geerlingguy/docker-"${1:-centos7}"-ansible /bin/bash
}

# Super useful Docker container oneshots
# Usage: dockrun, or dockrun [centos7|fedora27|debian9|debian8|ubuntu1404|etc.]
docruntest() {
  docker run -it geerlingguy/docker-"${1:-centos7}"-ansible:testing /bin/bash
}

# Enter a running Docker container
function dockenter() {
  if [[ ! "$1" ]] ; then
      echo "You must supply a container ID or name."
      return 0
  fi

  docker exec -it $1 bash
  return 0
}

# Delete a given line number in the known_hosts file
knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    echo "error: line number missing" >&2;
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}
