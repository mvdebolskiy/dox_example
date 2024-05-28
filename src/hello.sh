#!/bin/bash


SCRIPT=$( basename  "$0" )

#!! Example script on how to use options and arguments in bash
#!!@note
#!! in example.md `extra_filetypes: sh #!` means you need `#!!` for ford to parse
#!!@endnote


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
"Usage: $SCRIPT [options] STRING1 STRING2 ... STRINGN"
""
"Options:"
"  --help, -h            Print help."
"  --who, -w             Who to say hello to"
"  STRING1 ... STRINGN   any number of strings separated by space to print after hello"

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
PARSEDARGS=$(getopt -o hw: --long help,who: -- "$@")

if [ "$?" != "0" ]; then
  badusage
fi

eval set -- "$PARSEDARGS"

# check for options and get all positional arguments into one big string.
while true; do
    case $1 in
      --help | -h)
        help
        exit;;
      --who | -w)
        who=$2 ; shift 2 ;;

      -- ) posargs=$@ ;shift ; break ;;

      *) badusage "$1" ; shift ; exit ;;
    esac
done

# convert posargs into an array
FS=' ' read -r -a posargs <<< "$posargs"

# pop the first element (--)
posargs=("${posargs[@]:1}")

# Print when who is set to default

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

#Loop through strings and print them
for str in "${posargs[@]}"
do
    echo "$str"
done