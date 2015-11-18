#!/bin/sh

vim=`which vim 2>&1`
if [[ ! ${?} = "0" ]]; then
  echo "Install \`vim\` to execute\n"
  exit 127
fi

if [[ ${#} -lt 1 ]]; then
  echo 'Invalid arguments'
  exit 1
fi

for f in ${@}; do
  ${vim} -X -N -u NONE -i NONE -V1 -e --cmd "source ${f} | qall!" 2>&1
done
