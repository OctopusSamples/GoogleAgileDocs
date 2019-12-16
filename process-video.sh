#!/bin/bash

# Convert the AVI files into MP4
VIDEO_FILES="/home/runner/work/GoogleAgileDocs/GoogleAgileDocs/*.avi"
for f in $VIDEO_FILES
do
  echo "Processing $f"
  vlc -I dummy \
    "$f" \
    "--sout=#transcode{vcodec=h264,vb=1024,acodec=mp4a,ab=192,channels=2,deinterlace}:standard{access=file,mux=mp4,dst=\"${f%.*}.mp4\"}" \
    vlc://quit
done

# Merge all the videos into one single file
VIDEO_FILE_LIST=(/tmp/videos/*.mp4)
echo "${VIDEO_FILE_LIST[@]}"
vlc -I dummy \
   "${VIDEO_FILE_LIST[@]}" \
   --no-sout-all \
   --sout-keep \
   --sout \
   "#gather:std{access=file,mux=mp4,dst=\"/home/runner/work/GoogleAgileDocs/GoogleAgileDocs/video.mp4\"}" \
   vlc://quit

# Speed the video up slightly
ffmpeg -i /home/runner/work/GoogleAgileDocs/GoogleAgileDocs/video.mp4 "-filter:v" "setpts=0.75*PTS" "/home/runner/work/GoogleAgileDocs/GoogleAgileDocs/processed.mp4"