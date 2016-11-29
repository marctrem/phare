#! /bin/sh

function cloud_name {

  # This functions returns a shortname for the current infrastructure provider.
 

  # Check if Joyent
  if [ -e /native/usr/sbin/mdata-get ]; then
    echo "joy"
  else
    echo "loc"
  fi 
}

function dc_name {
  
  local CN=$(cloud_name)
  
  if [ "$CN" == "joy" ]; then
    echo $(/native/usr/sbin/mdata-get dc)
  else
    echo 'na'
  fi
}

function dc_canonical_name {

  echo $(cloud_name)-$(dc_name)
  
}

if [ -z "$@" ]; then
  echo "Todo: Usage"
  exit
fi
$@
