fx_version 'adamant'
games { 'gta5' }

server_scripts {
    '@vrp/lib/utils.lua',
    "server.lua",
}
client_scripts {
    "client.lua",
}
ui_page {
    'nui/ui.html',
}
files {
    'nui/ui.html',
    'nui/css/main.css',
    'nui/js/app.js',
}

-- Dette er Aik-10's notepad, der er "ændret" til vRP. IK ændre navnet væk fra "notepad".
-- Originalt script: https://forum.cfx.re/t/releases-esx-notepad/655595