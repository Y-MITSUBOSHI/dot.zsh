# set iTerm background color
set_term_bgcolor(){
  local R=$1
  local G=$2
  local B=$3
  /usr/bin/osascript <<EOF
tell application "iTerm"
  tell current session of first window
    set background color to {$(($R*65535/255)), $(($G*65535/255)), $(($B*65535/255))}
  end tell
end tell
EOF
}

# please settings ssh_config. ~/.ssh/config
# ex) Host hoge.com # develop
color_change_ssh(){
  if alias ssh_config_update > /dev/null 2>&1; then
    ssh_config_update
  fi
  if [ $# -eq 0 ] && alias ssh-p > /dev/null 2>&1; then
    ssh-p
    return 0
  fi
  # [develop, staging, production]
  local level="$(echo $@[$#] | sed 's;.*@;;g' | xargs -I{} grep {} ~/.ssh/config | grep -o '#.*' | head -n1)"
  
  if [[ $level =~ 'develop' ]]; then
    set_term_bgcolor 0 0 60
  elif [[ $level =~ 'staging' ]]; then
    set_term_bgcolor 35 35 0 # yellow
  else # no settings. [production]
    set_term_bgcolor 60 0 0 # red
  fi
  \ssh $@
  set_term_bgcolor 0 0 0
}
