fx_version 'adamant'
game 'gta5'
author 'Blacklist'
version '1.0'
lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
    'client/*.lua',
    'client/modules/*.lua'
}

dependencies {
    'ox_lib',
    'stevo_lib'
}