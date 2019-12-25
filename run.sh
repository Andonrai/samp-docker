#!/bin/sh

update_property() {
  temp_file=$(mktemp)
  sed "/^$1\s/d" server.cfg > ${temp_file}
  echo "$1 $2" >> ${temp_file}
  cat ${temp_file} > server.cfg
  rm ${temp_file}
}

update_property lanmode          $SAMP_LAN_MODE
update_property rcon_password    $SAMP_RCON_PASSWORD
update_property maxplayers       $SAMP_MAX_PLAYERS
update_property port             $SAMP_PORT
update_property hostname         $SAMP_HOSTNAME
update_property filterscripts    $SAMP_FILTER_SCRIPTS
update_property announce         $SAMP_ANNOUNCE
update_property query            $SAMP_QUERY
update_property weburl           $SAMP_WEB_URL
update_property maxnpc           $SAMP_MAX_NPC
update_property onfoot_rate      $SAMP_ONFOOT_RATE
update_property incar_rate       $SAMP_INCAR_RATE
update_property weapon_rate      $SAMP_WEAPON_RATE
update_property stream_distance  $SAMP_STREAM_DISTANCE
update_property stream_rate      $SAMP_STREAM_RATE

exec $PWD/samp03svr
