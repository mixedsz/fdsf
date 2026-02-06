shared_script '@WaveShield/resource/include.lua'

fx_version 'cerulean'
game 'gta5' lua54 'yes'

version 'V1'
author 'discord.gg/bDU43jPvzy'

-- Loading Screen
loadscreen 'resources/flake_loadingv2/web/index.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

shared_scripts {
    '@core/imports.lua',
    '@ox_lib/init.lua',
    'util/shared/*.lua',
    'config.lua',
    'resources/**/config.lua'
}

client_scripts {
    'util/client/*.lua',
    'resources/**/client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@mysql-async/lib/MySQL.lua',
    'sconfig.lua',
    'resources/**/sconfig.lua',
    'util/server/*.lua',
    'resources/**/server/*.lua',
}

ui_page 'web/build/index.html'

files {
    'web/build/index.html',
    'web/build/assets/**',
    -- Loading Screen files
    'resources/flake_loadingv2/config/config.js',
    'resources/flake_loadingv2/web/**/*',
    -- Chat HTML files
    'resources/chat/html/**/*',
}