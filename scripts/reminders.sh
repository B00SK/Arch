#!/bin/bash

water_interval=3600    # 1 heure
break_interval=5400    # 1h30

water_timer=0
break_timer=0

while true; do
    sleep 60
    water_timer=$((water_timer + 60))
    break_timer=$((break_timer + 60))

    if [ $water_timer -ge $water_interval ]; then
        notify-send "💧 Hydratation" "N'oublie pas de boire de l'eau !" -u normal
        water_timer=0
    fi

    if [ $break_timer -ge $break_interval ]; then
        notify-send "🧘 Pause écran" "Lève-toi et étire-toi !" -u normal
        break_timer=0
    fi
done
