fx_version 'cerulean'
games {'common'}

author 'Rubidium & Sydres'
version '1.0.0'
description 'Hywave Boilerplate'

client_scripts {'**/cl_*.*'}
shared_scripts {'initialize.lua', '_enums/*.*', '**/sh_*.*'}
server_scripts {'_utils/debug.lua', '_utils/logs.lua', '**/sv_*.*'}

client_script "@rpc/client/cl_rpc.lua"
server_script "@rpc/server/sv_rpc.lua"
server_script "@sql/server/sv_sql.lua"
