function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Aeneas','DualWeapons','DualSwords','DualNukeWeapons')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
	
	send_command('wait 6;input /lockstyleset 12')
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {main="Tauret",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Tauret",sub="Skinflayer"}
	sets.weapons.DualSwords = {main="Vampirism",sub="Vampirism"}
	sets.weapons.DualNukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
			ammo="Sapience Orb", --2
			head="Vanya Hood", --10
			neck="Orunmila's Torque", --5
			ear1="Loquacious earring", --2
			ear2="Enchntr. Earring +1",
			body="Inyanga Jubbah +2", --14
			hands="Leyline Gloves", --8
			ring1="Kishar Ring", --4
			ring2="Rahab Ring", --2
			back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, --10
			waist="Embla Sash", --5
	} --

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {
			main={ name="Kali", augments={'MP+60','Mag. Acc.+20','"Refresh"+1',}},
			sub="Genmei Shield",
			body="Inyanga Jubbah +2",
			head="Fili Calot +1",
			neck="Loricate Torque +1",
			ear1="Ethereal Earring",
			ear2="Loquac. Earring",
			hands="Gendewitha Gages",
			ring1="Kishar Ring",
			ring2="Defending Ring",
			back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
			waist="Flume Belt +1",
			legs="Ayanmo cosciales +2",
			feet={ name="Telchine Pigaches", augments={'"Mag.Atk.Bns."+18','Song spellcasting time -7%','MND+5 CHR+5',}},
	}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Linos"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {range="Linos"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'] = {range="Linos"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'] = {range="Linos"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Linos"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Linos"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
			ammo="Ginsen",
			head="Lustratio Cap +1",
			neck="Caro Necklace",
			ear1="Moonshade Earring",
			ear2="Ishvara Earring",
			body="Ayanmo Corazza +2",
			hands="Aya. Manopolas +2",
			ring1="Karieyh Ring",
			ring2="Ilabrat Ring",
			back="Ground. Mantle +1",
			waist="Grunfeld Rope",
			legs="Lustratio Subligar +1",
			feet="Lustratio Leggings +1"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	--sets.midcast.Lullaby = {range="Linos"}
	--sets.midcast.Lullaby.Resistant = {range="Blurred Harp +1"}
	--sets.midcast['Horde Lullaby'] = {range="Linos"}
	--sets.midcast['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	--sets.midcast['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	--sets.midcast['Horde Lullaby II'] = {range="Linos"}
	--sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	--sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {body="Inyanga Jubbah +2", legs="Ayanmo cosciales +2", feet={ name="Telchine Pigaches", augments={'"Mag.Atk.Bns."+18','Song spellcasting time -7%','MND+5 CHR+5',}}, range="Terpander"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Linos"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {} --feet="Fili Cothurnes +1" Brioso Slippers still provides more Duration
	--sets.midcast['Magic Finale'] = {range="Blurred Harp +1"}
	--sets.midcast.Mazurka = {range="Linos"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
			main="Kali",
			sub="Genmei Shield",
			ammo=empty,
			range="Linos",
			head="Fili Calot +1",
			neck="Moonbow Whistle",
			ear1="Enchntr. Earring +1",
			ear2="Loquacious Earring",
			body="Fili Hongreline +1",
			hands="Fili Manchettes +1",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Intarabus's Cape",
			waist="Flume Belt +1",
			legs="Inyanga Shalwar +2",
			feet="Brioso Slippers +2"
	}
		
	sets.midcast.SongEffect.DW = {}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
			main="Kali",
			sub="Ammurapi Shield",
			ammo=empty,
			head="Brioso Roundlet +2",
			neck="Moonbow Whistle",
			ear1="Gwati Earring",
			ear2="Digni. Earring",
			body="Fili Hongreline +1",
			hands="Brioso Cuffs +2",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Intarabus's Cape",
			waist="Luminary Sash",
			legs="Brioso Cannions +2",
			feet="Brioso Slippers +2"
	}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Kali",sub="Ammurapi Shield",ammo=empty,
		head="Aya. Zucchetto +2",neck="Moonbow Whistle",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Luminary Sash",legs="Inyanga Shalwar +2",feet="Aya. Gambieras +2"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Blurred Harp +1",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +2"}
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
			main="Daybreak",
			sub="Genmei Shield",
			ammo="Staunch Tathlum +1",
			head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
			body="Vanya Robe",
			hands="Inyan. Dastanas +1",
			legs="Kaykaus Tights",
			feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
			neck="Incanter's Torque",
			waist="Bishop's Sash",
			left_ear="Beatific Earring",
			right_ear="Genmei Earring",
			left_ring="Sirona's Ring",
			right_ring="Lebeche Ring",
			back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	sets.idle = {
			main="Daybreak",
			sub="Genmei Shield",
			ammo="Staunch Tathlum +1",
			head="Inyanga Tiara +2",
			body="Ashera Harness",
			hands="Inyan. Dastanas +1",
			legs="Brioso Cannions +2",
			feet="Fili Cothurnes +1",
			neck="Loricate Torque +1",
			waist="Flume Belt +1",
			left_ear="Odnowa Earring +1",
			right_ear="Genmei Earring",
			left_ring="Purity Ring",
			right_ring="Defending Ring",
			back="Engulfer Cape +1",
	}

	sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
	
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.Kiting = {feet="Fili Cothurnes +1"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
			main="Ipetam",
			sub="Genmei Shield",
			ammo="Ginsen",
			head="Aya. Zucchetto +2",
			body="Ashera Harness",
			hands="Aya. Manopolas +2",
			legs="Aya. Cosciales +2",
			feet="Aya. Gambieras +2",
			neck="Lissome Necklace",
			waist="Windbuffet Belt",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Petrov Ring",
			right_ring="Ilabrat Ring",
			back="Bleating Mantle",
	}
	sets.engaged.Acc = {main="Aeneas",sub="Genmei Shield",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back="Letalis Mantle",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = {main="Aeneas",sub="Blurred Knife +1",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DW.Acc = {main="Aeneas",sub="Blurred Knife +1",ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 11)
end