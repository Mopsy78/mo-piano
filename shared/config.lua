Config = Config or {}

Config.DefaultPianoSeatOffset = {
	x = 0.0,
	y = -0.75,
	z = 0.5,
	heading = 0.0
}

-- Abweichende Sitzpositionen je Klaviermodell koennen hier eingetragen werden.
Config.PianoSeatOffsets = {
	['p_piano03x'] = {
		x = 0.0,
		y = -0.75,
		z = 0.5,
		heading = 0.0
	}
}

Config.Piano = {
    'sha_man_piano02',
    'sha_man_piano01',
    'p_piano03x',
    'p_piano02x',
    'p_nbxpiano01x',
    'p_nbmpiano01x',
    'p_gen_piano01x_tc01'
}

