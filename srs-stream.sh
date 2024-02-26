#/bin/bash 


    for((;;)); do \
        ./objs/ffmpeg/bin/ffmpeg -re -i rtsp://admin:Aa123456@91.196.39.251:559/ISAPI/Streaming/Channels/101 \
        -c copy \
        -f flv rtmp://195.250.79.33/live/livestream; \
        sleep 1; \
    done
