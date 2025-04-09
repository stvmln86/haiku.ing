#!/usr/bin/env fish
# Functions for common Hugo commands.

function hbuild -d "Build the site to public/build."
    hugo --cleanDestinationDir --destination public/build --minify --quiet
end

function hsync -d "Sync the site to root@haiku.ing."
    rsync --archive --delete --quiet public/build/ root@haiku.ing:/var/www/html/
end

function hserve -d "Serve the site to localhost:1313."
    hugo serve --buildFuture --cleanDestinationDir --destination public/serve --minify
end
