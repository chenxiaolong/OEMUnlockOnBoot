exec >/data/local/tmp/OEMUnlockOnBoot.log 2>&1

mod_dir=${0%/*}

header() {
    echo "----- ${*} -----"
}

header Environment
echo "Timestamp: $(date)"
echo "Script: ${0}"
echo "UID/GID/Context: $(id)"

header Enable OEM unlocking
CLASSPATH=$(echo "${mod_dir}/"app-*.apk) app_process / @NAMESPACE@.Main &
pid=${!}
wait "${pid}"
echo "Exit status: ${?}"
echo "Logcat:"
logcat -d --pid "${pid}"
