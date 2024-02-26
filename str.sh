#/bin/bash

ffmpeg -re -i 'rtsp://admin:Aa123456@91.196.39.251:559/ISAPI/Streaming/Channels/101' -vcodec copy -c:a aac -f flv 'rtmp://68.183.142.244:1935/LiveApp/boon3' && ffmpeg -re -i 'rtsp://admin:Aa123456@91.196.39.251:559/ISAPI/Streaming/Channels/101' -vcodec copy -c:a aac -f flv 'rtmp://68.183.142.244:1935/LiveApp/boon4'

