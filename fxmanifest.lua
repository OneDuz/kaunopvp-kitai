fx_version 'cerulean'
game 'gta5'

lua54 "yes"
author "onecodes"
version "1.0.5"
description 'Random system scripts for pvp server'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
    'client.lua',
}

shared_script '@es_extended/imports.lua'
shared_script '@ox_lib/init.lua'
