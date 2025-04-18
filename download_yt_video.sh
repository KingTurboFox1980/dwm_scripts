#!/bin/sh

targeturl=$(xclip -o -selection clipboard)

# Pass targeturl to youtube downloader (works for any kind of video)
yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -P /mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/VIDEO_DOWNLOADS/ "$targeturl"
