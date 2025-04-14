#!/usr/bin/env fish
# Functions for common Hugo commands.

function hbuild
    hugo --cleanDestinationDir --destination public/build --minify --quiet
end

function hnew -a slug
    set dest (date "+content/posts/%Y/%m/%Y-%m-%d.$date.md")
    hugo new $dest
    zed $dest
end

function hsync
    rsync --archive --delete --quiet public/build/ root@haiku.ing:/var/www/html/
end

function hserve
    hugo serve --buildFuture --cleanDestinationDir --destination public/serve --minify
end
