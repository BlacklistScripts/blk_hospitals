fx_version 'adamant'
game 'gta5'
author 'Blacklist'
version '1.1'
lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
    'client/*.lua',
    'client/modules/*.lua'
}

server_scripts {
    'server/*.lua',
    'server/modules/*.lua'
}

dependencies {
    'ox_lib',
    'stevo_lib'
}