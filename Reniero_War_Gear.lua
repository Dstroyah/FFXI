function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','GS','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('Chango','Greatsword','Polearm','DWNaegling')

	gear.da_jse_back = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	gear.crit_jse_back = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10'}}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Greatsword;gs c update')
	
	select_default_macro_book()
	send_command('wait 6;input /lockstyleset 10')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	
    sets.Enmity = {
			ammo="Aqreqaq Bomblet",
			head="Halitus Helm",
			body={ name="Souveran Cuirass", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}},
			hands={ name="Eschite Gauntlets", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
			legs={ name="Odyssean Cuisses", augments={'Attack+12','Weapon skill damage +3%','VIT+5','Accuracy+10',}},
			feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
			neck="Unmoving Collar",
			waist="Goading Belt",
			left_ear="Friomisi Earring",
			right_ear="Eabani Earring",
			left_ring="Supershear Ring",
			right_ring="Provocare Ring",
			back="Agema Cape",
	}
	sets.Knockback = {}
	sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle",body="Pummeler's Lorica +2"}
	sets.precast.JA['Warcry'] = {}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"}
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
                   
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
						head="Flam. Zucchetto +2",
						body="Flamma Korazin +2",
						hands="Sulev. Gauntlets +2",
						legs="Sulevi. Cuisses +2",
						feet="Flam. Gambieras +2",
						neck="Fotia Gorget",
						waist="Fotia Belt",
						left_ear="Cessance Earring",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						right_ring="Niqmaddu Ring",
						left_ring="Karieyh Ring",
						back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {back="Letalis Mantle",})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
						ammo="Knobkierrie",
						head={ name="Valorous Mask", augments={'Weapon skill damage +5%','STR+10','Accuracy+14','Attack+1',}},
						body="Flamma Korazin +2",
						hands={ name="Odyssean Gauntlets", augments={'Attack+25','Weapon skill damage +3%','VIT+9','Accuracy+14',}},
						legs={ name="Odyssean Cuisses", augments={'Attack+12','Weapon skill damage +3%','VIT+5','Accuracy+10',}},
						feet="Sulev. Leggings +2",
						neck="Fotia Gorget",
						waist="Fotia Belt",
						left_ear="Ishvara Earring",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						left_ring="Karieyh Ring",
						right_ring="Niqmaddu Ring",
						back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS["Full Break"] = set_combine(sets.precast.WS, {
						ammo="Ginsen",
						head="Flam. Zucchetto +2",
						body="Flamma Korazin +2",
						hands="Flamma Manopolas +2",
						legs="Flamma Dirs +2",
						feet="Flam. Gambieras +2",
						neck="Lissome Necklace",
						waist="Ioskeha Belt",
						left_ear="Cessance Earring",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						right_ring="Niqmaddu Ring",
						left_ring="Karieyh Ring",
						back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})

    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
						ammo="Knobkierrie",
						head={ name="Valorous Mask", augments={'Weapon skill damage +5%','STR+10','Accuracy+14','Attack+1',}},
						body="Pummeler's Lorica +2",
						hands={ name="Odyssean Gauntlets", augments={'Attack+25','Weapon skill damage +3%','VIT+9','Accuracy+14',}},
						legs={ name="Odyssean Cuisses", augments={'Attack+12','Weapon skill damage +3%','VIT+5','Accuracy+10',}},
						feet="Sulev. Leggings +2",
						neck="Fotia Gorget",
						waist="Ioskeha Belt",
						left_ear="Ishvara Earring",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						left_ring="Regal Ring",
						right_ring="Niqmaddu Ring",
						back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
						ammo="Seeth. Bomblet +1",
						head="Flam. Zucchetto +2",
						body="Argosy Hauberk +1",
						hands="Argosy Mufflers +1",
						legs="Argosy Breeches +1",
						feet="Flam. Gambieras +2",
						neck="Fotia Gorget",
						waist="Fotia Belt",
						left_ear="Brutal Earring",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						right_ring="Niqmaddu Ring",
						left_ring="Regal Ring",
						back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ruinator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Ruinator'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Rampage'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Rampage'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Rampage'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {
						ammo="Yetshila",
						head="Flam. Zucchetto +2",
						body="Flamma Korazin +2",
						hands="Flamma Manopolas +2",
						legs="Sulevi. Cuisses +2",
						feet="Pumm. Calligae +2",
						neck="Lissome Necklace",
						waist="Ioskeha Belt",
						left_ear="Brutal Earring",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						right_ring="Niqmaddu Ring",
						left_ring="Flamma Ring",
						back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	})
    sets.precast.WS['Raging Rush'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Raging Rush'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Raging Rush'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {
						ammo="Yetshila",
						neck="Fotia Gorget",
						waist="Fotia Belt",
						body="Argosy Hauberk +1",
						hands="Argosy Mufflers +1",
						legs="Argosy Breeches +1",
						right_ring="Niqmaddu Ring",
						left_ring="Karieyh Ring",
						left_ear="Brutal Earring",
						feet="Pumm. Calligae +2",
						right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})
    sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["King's Justice"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["King's Justice"].Fodder = set_combine(sets.precast.WS.Fodder, {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring"}

     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Idle sets
	sets.idle = {
			ammo="Staunch Tathlum +1",
			head="Valorous Mask",
			neck="Loricate Torque +1",
			ear1="Genmei Earring",
			ear2="Eabani Earring",
			body="Souveran Cuirass",
			hands="Sulev. Gauntlets +2",
			ring1="Karieyh Ring",
			ring2="Defending Ring",
			back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist="Flume Belt +1",
			legs="Sulevia's Cuisses +2",
			feet="Hermes' Sandals"}
		
	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {
			ammo="Staunch Tathlum +1",
			head="Genmei Barbuta",
			neck="Loricate Torque +1",
			left_ear="Telos Earring",
			right_ear="Cessance Earring",
			body="Tartarus Platemail",
			hands="Sulev. Gauntlets +2",
			ring1="Moonbeam Ring",
			ring2="Moonbeam Ring",
			back="Shadow Mantle",
			waist="Flume Belt",
			legs="Pumm. Cuisses +2",
			feet="Pumm. Calligae +2",
	}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Genmei Barbuta",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Genmei Barbuta",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}

	sets.Kiting = {}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
     
            -- Engaged sets
	sets.engaged = {
					ammo="Ginsen",
					head="Flam. Zucchetto +2",
					body="Valorous Mail",
					hands="Sulev. Gauntlets +2",
					legs="Pumm. Cuisses +2",
					feet="Pumm. Calligae +2",
					neck="Lissome Necklace",
					waist="Ioskeha Belt",
					left_ear="Brutal Earring",
					right_ear="Cessance Earring",
					left_ring="Flamma Ring",
					right_ring="Niqmaddu Ring",
					back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
    
	sets.engaged.GS = {
					ammo="Ginsen",
					head="Flam. Zucchetto +2",
					body="Valorous Mail",
					hands="Sulev. Gauntlets +2",
					legs="Pumm. Cuisses +2",
					feet="Pumm. Calligae +2",
					neck="Lissome Necklace",
					waist="Ioskeha Belt",
					left_ear="Brutal Earring",
					right_ear="Cessance Earring",
					left_ring="Hetairoi Ring",
					right_ring="Niqmaddu Ring",
					back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back="Cichol's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back="Cichol's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Cichol's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
		
--[[
    sets.engaged.Charge = {}
	sets.engaged.SomeAcc.Charge = {}
	sets.engaged.Acc.Charge = {}
	sets.engaged.FullAcc.Charge = {}
	sets.engaged.Fodder.Charge = {}
	
    sets.engaged.Mighty = {}
	sets.engaged.SomeAcc.Mighty = {}
	sets.engaged.Acc.Mighty = {}
	sets.engaged.FullAcc.Mighty = {}
	sets.engaged.Fodder.Mighty = {}

    sets.engaged.Charge.Mighty = {}
	sets.engaged.SomeAcc.Charge.Mighty = {}
	sets.engaged.Acc.Charge.Mighty = {}
	sets.engaged.FullAcc.Charge.Mighty = {}
	sets.engaged.Fodder.Charge.Mighty = {}
	
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
    sets.engaged.Adoulin.Charge = {}
	sets.engaged.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Acc.Adoulin.Charge = {}
	sets.engaged.FullAcc.Adoulin.Charge = {}
	sets.engaged.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Acc.Adoulin.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.Adoulin.Charge.Mighty = {}

    sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
    sets.engaged.PDT.Charge = {}
	sets.engaged.SomeAcc.PDT.Charge = {}
	sets.engaged.Acc.PDT.Charge = {}
	sets.engaged.FullAcc.PDT.Charge = {}
	sets.engaged.Fodder.PDT.Charge = {}
	
    sets.engaged.PDT.Mighty = {}
	sets.engaged.SomeAcc.PDT.Mighty = {}
	sets.engaged.Acc.PDT.Mighty = {}
	sets.engaged.FullAcc.PDT.Mighty = {}
	sets.engaged.Fodder.PDT.Mighty = {}

    sets.engaged.PDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Charge.Mighty = {}
	
    sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
    sets.engaged.PDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge = {}
	
    sets.engaged.PDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Mighty = {}
	
    sets.engaged.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge.Mighty = {}

    sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
    sets.engaged.MDT.Charge = {}
	sets.engaged.SomeAcc.MDT.Charge = {}
	sets.engaged.Acc.MDT.Charge = {}
	sets.engaged.FullAcc.MDT.Charge = {}
	sets.engaged.Fodder.MDT.Charge = {}
	
    sets.engaged.MDT.Mighty = {}
	sets.engaged.SomeAcc.MDT.Mighty = {}
	sets.engaged.Acc.MDT.Mighty = {}
	sets.engaged.FullAcc.MDT.Mighty = {}
	sets.engaged.Fodder.MDT.Mighty = {}

    sets.engaged.MDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Charge.Mighty = {}
	
    sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
    sets.engaged.MDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge = {}
	
    sets.engaged.MDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Mighty = {}
	
    sets.engaged.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
]]--
	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Chango = {main="Hepatizon Axe +1",sub="Utu Grip"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
	sets.weapons.Polearm = {main="Kaja Lance",sub="Utu Grip"}
	sets.weapons.DWNaegling = {main="Naegling",sub="Barbarity"}
	
end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 3)
    else
        set_macro_page(5, 3)
    end
end