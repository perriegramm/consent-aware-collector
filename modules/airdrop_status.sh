#!/bin/bash

OUTDIR=~/forensics_monitor/$(date +%Y%m%d)/airdrop_status
mkdir -p "$OUTDIR"

echo '[airdrop_status] Running (intel-grade)...' | tee "$OUTDIR/airdrop_status.log"

# 🛰️ 1. Tryb widoczności systemu (discoverability)
defaults read com.apple.sharingd DiscoverableMode 2>/dev/null > "$OUTDIR/discoverable_mode.txt"

# 🧠 2. Aktywne ustawienia systemowe
/usr/libexec/PlistBuddy -c "Print :Sharing:AirDrop" ~/Library/Preferences/com.apple.sharingd.plist 2>/dev/null > "$OUTDIR/system_sharing_config.txt"

# 🔍 3. Logi sharingd — połączenia, peer discovery, błędy (ostatnie 60 min)
log show --predicate 'process == "sharingd" AND (eventMessage CONTAINS[c] "connection" OR eventMessage CONTAINS[c] "peer" OR eventMessage CONTAINS[c] "invitation" OR eventMessage CONTAINS[c] "reject")' --style syslog --last 1h > "$OUTDIR/sharingd_activity_detailed.log"

# 🧬 4. Logi XPC i bonjour związane z sharingd
log show --predicate 'eventMessage CONTAINS[c] "com.apple.sharing" OR eventMessage CONTAINS[c] "NSXPCConnection"' --style syslog --last 1h > "$OUTDIR/sharingd_xpc.log"

# 🧷 5. Aktywne porty i procesy powiązane z sharingd / AirDrop
lsof -i -n -P | grep sharingd > "$OUTDIR/sharingd_ports.log" 2>/dev/null
netstat -anv | grep -Ei '6010|6011|airdrop|bonjour|mdns|udp' > "$OUTDIR/network_signature_airdrop.log" 2>/dev/null

# 📡 6. mdns-scan – czy urządzenie się ogłasza
dns-sd -B _airdrop._tcp > "$OUTDIR/mdns_airdrop_browse.log" 2>&1 & sleep 5; kill $!

# ⚠️ [DIAGNOSTYKA] Sprawdzenie realnych statusów Bluetooth, Wi-Fi, AirDrop, FindMy
STATUS_LOG="$OUTDIR/system_status_check.txt"

echo "[STATUS CHECK] $(date)" > "$STATUS_LOG"

# ✅ Wi-Fi status
echo "---- Wi-Fi ----" >> "$STATUS_LOG"
networksetup -getairportpower en0 >> "$STATUS_LOG" 2>&1
ifconfig en0 | grep status >> "$STATUS_LOG" 2>&1

# ✅ Bluetooth status
echo -e "\n---- Bluetooth ----" >> "$STATUS_LOG"
defaults read /Library/Preferences/com.apple.Bluetooth ControllerPowerState >> "$STATUS_LOG" 2>/dev/null
system_profiler SPBluetoothDataType | grep -E 'Power:|Discoverable:' >> "$STATUS_LOG" 2>/dev/null

# ✅ AirDrop mode (discoverability)
echo -e "\n---- AirDrop ----" >> "$STATUS_LOG"
defaults read com.apple.sharingd DiscoverableMode >> "$STATUS_LOG" 2>/dev/null

# ✅ FindMy Beaconing / rapportd / beaconingd
echo -e "\n---- FindMy / Beacon ----" >> "$STATUS_LOG"
log show --predicate 'process CONTAINS[c] "findmy" OR process CONTAINS[c] "rapportd"' --style syslog --last 1h | grep beaconingState >> "$STATUS_LOG" 2>/dev/null

# ✅ Alert jeśli coś aktywne mimo "off"
echo -e "\n---- ⚠️ ALERTY ----" >> "$STATUS_LOG"
grep -Ei 'Active|YES|Discoverable: Yes|Power: Yes|status: active' "$STATUS_LOG" >> "$STATUS_LOG"

