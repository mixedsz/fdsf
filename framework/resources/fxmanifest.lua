fx_version 'adamant'
game 'gta5'

Author 'Fast Scripts'
description 'Fast Loading Screen V3'
version '1.0'

loadscreen 'web/index.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

files {
    'config/**.*',
    'web/**.*',
}

escrow_ignore {
    'config/**.*',
    'web/**.*',
}
dependency '/assetpacks'