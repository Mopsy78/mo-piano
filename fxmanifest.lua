fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'MO Design'
description 'Piano'
version '0.0.01-alpha'

lua54 'yes'

dependencies {
	'rsg-core',
	'rsg-inventory',
	'ox_lib',
	'ox_target'
}

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua'
}

files {
	'locales/*.json'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}