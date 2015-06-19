Global settings_lang as integer
Global settings_highScore as integer
Global settings_settingsFile as string

function settings_readSettings()
	settings_settingsFile = "fruitmemo.jsi"
    
    if GetFileExists(settings_settingsFile) = 1
		id as integer
        id = OpenToRead(settings_settingsFile)
        settings_lang = ReadInteger(id)
        settings_highScore = ReadInteger(id)
    else
		settings_lang = 0
		settings_highScore = 0
    endif
endfunction

function settings_saveSettings()
	id as integer
    id = OpenToWrite(settings_settingsFile)
    WriteInteger(id, settings_lang)
    WriteInteger(id, settings_highScore)
endfunction
