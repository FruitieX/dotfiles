# This script requires mutt's urlview script, which is packaged
# by many distros, and can be downloaded at
# ftp://ftp.mutt.org/pub/mutt/contrib/urlview-0.9.tar.gz
# Written by Eric <eric225125@gmail.com>.
# This script is public domain.

# Commands:
# /urls
# Pass current buffer to urlview.

# History:
# 2011-02-07, Eric:
# version 0.1: script creation

require "shellwords"

def weechat_init
    # Check that urlview is in PATH.
    if ! system("which urlview > /dev/null 2>&1")
        return Weechat::WEECHAT_RC_ERROR
    end

    Weechat.register("urlview", "Eric", "0.1", "Public Domain", "Passes current buffer through urlview", "", "")
    Weechat.hook_command("urls", "Passes current buffer to urlview.", "", "", "", "passBuffer", "");

    return Weechat::WEECHAT_RC_OK
end

# Pass current buffer to urlview.
def passBuffer(data, buffer, args)
    # Read curent buffer into "lines".
    infolist = Weechat.infolist_get("buffer_lines", buffer, "")
    lines = ""
    while Weechat.infolist_next(infolist) == 1 do
        lines += Weechat.infolist_string(infolist, "message") + "\n"
    end
    Weechat.infolist_free(infolist)

    system("echo #{Shellwords.escape(lines)} | urlview")
    if $? != 0
        Weechat.print(buffer, "No URLs found.")
    end

    # Clean up the window.
    Weechat.command(buffer, "/window refresh")

    return Weechat::WEECHAT_RC_OK
end

