#!/bin/bash

# script to be called by wrap_srun+preproc.sh

SCRIPT=$( basename  "$0" )


# functions for output
function help
{
  echo "$SCRIPT for saying hello to someone"
  echo ""
  usage
}


function usage
{

    local txt=(
"Usage: $SCRIPT [options] [arguments]"
""
"Options:"
"  --help, -h          Print help."
"  --who, -w           Who to say hello to"

""
"  defaults are:"
"  who = World"
    )

    printf "%s\n" "${txt[@]}"
}

function badusage
{
  local message="$1"
  local txt=(
  "For overview  execute:"
  "$SCRIPT --help"
  )
  [[ $message ]] && printf "$message\n"
  printf "%s\\n" "${txt[@]}"
}

#define vars
who=""


#process arguments
PARSEDARGS=$(getopt -o h:w --long help,who -- "$@")

if [ "$?" != "0" ]; then
  badusage
fi

eval set -- "$PARSEDARGS"

while true; do
    case $1 in
      --help | -h)
        help
        exit;;
      --GCM | -g)
        who=$2 ; shift 2 ;;
      --) shift ; break ;;
      *) badusage "$1" ; shift ; exit ;;
    esac
done



# errors when vars are not set by args

if [[ -z "$who" ]] ; then
    echo
    echo "Who is not defined"
    echo ""
    echo ""
    echo "Setting to default:"
    who="World"
    echo "Hello ${who}!!"
    exit
fi


echo "Hello ${who}!!"