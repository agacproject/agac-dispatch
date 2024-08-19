fx_version "adamant"
game "gta5"
lua54 'yes'

author 'forealdeniz'
description 'Dispatch by forealdeniz'

ui_page "ui/src/index.html"
files{
    "ui/src/*.png",
    "ui/src/index.html",
    "ui/src/input.css",
    "ui/src/script.js",
    "ui/dist/output.css",
}

client_script 'main_cl.lua'
client_script 'main_editable.lua'
server_script 'main_sv.lua'
shared_script 'main_sh.lua'

-- discord.gg/forealdeniz
-- forealdeniz
