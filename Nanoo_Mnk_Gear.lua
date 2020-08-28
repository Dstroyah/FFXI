function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Godhands','Staff','ProcStaff','ProcClub','Spharai','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +3"} 
	sets.precast.JA['Boost'].OutOfCombat = {hands="Anchorite's Gloves +3"} --, Remove Haste and Add Slow Gear.
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +3"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +3"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +3"} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {feet="Anch. Gaiters +3"}
	sets.precast.JA['Formless Strikes'] = {body="Hes. Cyclas +3"}
	sets.precast.JA['Mantra'] = {feet="Hes. Gaiters +3"} --feet="Hesychast's Gaiters +1"

	sets.precast.JA['Chi Blast'] = {head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body={ name="Hes. Cyclas +3", augments={'Enhances "Formless Strikes" effect',}},
    hands="Anchor. Gloves +3", legs="Anch. Hose +2", feet="Anch. Gaiters +3",
    neck="Loricate Torque +1", waist="Luminary Sash", left_ear="Gwati Earring",
    right_ear="Genmei Earring", left_ring="Vertigo Ring", right_ring="Levia. Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','System: 1 ID: 640 Val: 4',}},}
	
	sets.precast.JA['Chakra'] = {
	ammo="Staunch Tathlum +1",
    head="Genmei Kabuto",
    body={ name="Hes. Cyclas +3", augments={'Enhances "Formless Strikes" effect',}}, hands="Anchor. Gloves +3",
    legs="Anch. Hose +3", feet="Anch. Gaiters +3", neck="Unmoving Collar +1", waist="Moonbow Belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring", right_ring="Defending Ring",
    back="Reiki Cloak",}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
	body="Dread Jupon",hands="Leyline Gloves",ring2="Lebeche Ring",ring2="Kishar Ring",
	legs="Rawhide Trousers"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
			ammo="Knobkierrie",
			head={ name="Herculean Helm", augments={'Accuracy+13','Weapon skill damage +4%','STR+4','Attack+9',}},
			body={ name="Herculean Vest", augments={'Accuracy+18','Weapon skill damage +5%','STR+1',}},
			hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
			legs="Hiza. Hizayoroi +2",  feet={ name="Herculean Boots", augments={'Accuracy+18 Attack+18','Weapon skill damage +5%','AGI+6','Accuracy+6','Attack+2',}},
			neck="Caro Necklace",
			waist="Moonbow belt +1",
			left_ear="Thrud Earring",
			right_ear="Sherida Earring",
			left_ring="Epona's Ring", 
			right_ring="Ilabrat Ring",
			back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
			}
	sets.precast.WSSomeAcc = {ammo="Falcon Eye",head="Dampening Tam",legs="Hiza. Hizayoroi +2"}
	sets.precast.WSAcc = {ammo="Falcon Eye",head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ring2="Ramuh Ring +1",body="Malignance Tabard",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WSFullAcc = {ammo="Falcon Eye",head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",body="Malignance Tabard",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {ammo="Knobkierrie", head="Adhemar Bonnet +1", body="Adhemar Jacket +1", hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Ken. Hakama +1", feet={ name="Herculean Boots", augments={'Accuracy+20','"Triple Atk."+4','AGI+10','Attack+12',}},
    neck="Monk's nodowa +2", waist="Moonbow belt +1", left_ear="Moonshade Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},)
	
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {head="Lilitu Headpiece",body=gear.herculean_wsd_body})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {neck="Caro Necklace",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",feet=gear.herculean_wsd_feet})
	
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {ammo="Knobkierrie",
	head="Adhemar Bonnet +1", body="Ken. Samue +1", hands="Ryuo Tekko",
    legs="Ken. Hakama +1", feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','STR+7',}},
    neck="Fotia Gorget", waist="Moonbow belt +1", left_ear="Moonshade Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},)
	
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {ammo="Knobkierrie", head="Ken. Jinpachi +1", body="Adhemar Jacket +1", hands="Adhemar Wrist. +1",
    legs="Ken. Hakama +1", feet={ name="Herculean Boots", augments={'Accuracy+20','"Triple Atk."+4','AGI+10','Attack+12',}},
    neck="Fotia Gorget", waist="Moonbow belt +1", left_ear="Mache Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Ilabrat Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},})
	
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head="Hesychast's Crown +3",
    body={ name="Herculean Vest", augments={'Attack+23','Weapon skill damage +3%','STR+13',}},
    hands="Anchor. Gloves +3",
    legs="Hiza. Hizayoroi +2", feet="Anch. Gaiters +3", neck="Fotia Gorget", waist="Moonbow belt +1",
    left_ear="Moonshade Earring", right_ear="Sherida Earring", left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}})
	
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head="Hesychast's Crown +3",
    body={ name="Herculean Vest", augments={'Attack+23','Weapon skill damage +3%','STR+13',}},
    hands="Anchor. Gloves +3",
    legs="Hiza. Hizayoroi +2", feet="Anch. Gaiters +3", neck="Fotia Gorget", waist="Moonbow belt +1",
    left_ear="Moonshade Earring", right_ear="Sherida Earring", left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}})
	
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {waist="Grunfeld Rope"})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",legs="Mummu Kecks +2",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {head="Adhemar Bonnet +1",neck="Caro Necklace",body="Abnoba Kaftan",ring1="Begrudging Ring",waist="Grunfeld Rope"})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {ear1="Moonshade Earring",body="Abnoba Kaftan",ring1="Begrudging Ring"})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)


	sets.precast.WS['Cataclysm'] = {ammo="Dosis Tathlum",
		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		hands="Malignance Gloves",ring1="Shiva Ring +1",
		back="Toro Cape",legs="Nahtirah Trousers"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body="Hesychast's Cyclas",ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1", body="Malignance Tabard", hands="Adhemar Wrist. +1", legs="Malignance Tights",
	feet="Hes. Gaiters +3", neck="Loricate Torque +1", waist="Moonbow belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}

	sets.idle.Weak = {ammo="Staunch Tathlum +1",
		head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Sheltered Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}

	sets.idle.PDT = {ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1", body="Malignance Tabard", hands="Adhemar Wrist. +1", legs="Malignance Tights",
	feet="Hes. Gaiters +3", neck="Loricate Torque +1", waist="Moonbow belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}		

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1", body="Malignance Tabard", hands="Adhemar Wrist. +1", legs="Malignance Tights",
	feet="Hes. Gaiters +3", neck="Loricate Torque +1", waist="Moonbow belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}
		
	-- Defense sets
	sets.defense.HP = {ammo="Staunch Tathlum +1",
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Segomo's Mantle",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Dampening Tam",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Flax Sash",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head=empty,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Respite Cloak",hands="Leyline Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
		back="Toro Cape",waist="Flax Sash",legs="Samnuha Tights",feet="Malignance Boots"}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Aurgelmir Orb +1",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.SomeAcc = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}
	sets.engaged.FullAcc = {ammo="Falcon Eye",
		head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
	sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back="Segomo's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1", body="Malignance Tabard", hands="Adhemar Wrist. +1", legs="Malignance Tights",
	feet="Hes. Gaiters +3", neck="Loricate Torque +1", waist="Moonbow belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}
	sets.engaged.SomeAcc.PDT = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.Acc.PDT = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Patricius Ring",
		back="Segomo's Mantle",waist="Olseni Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.FullAcc.PDT = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Defending Ring",ring2="Patricius Ring",
		back="Segomo's Mantle",waist="Olseni Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum +1",
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {})




	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
	sets.buff.Footwork = {feet="Shukuyu Sune-Ate"}
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {feet="Anch. Gaiters +3"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Spharai = {main="Spharai"}
	sets.weapons.Staff = {main="Malignance Pole",sub="Bloodrain Strap"}
	sets.weapons.ProcStaff = {main="Terra's Staff"}
	sets.weapons.ProcClub = {main="Mafic Cudgel"}
	sets.weapons.ProcSword = {main="Ark Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(5, 20)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 20)
	elseif player.sub_job == 'THF' then
		set_macro_page(6, 20)
	elseif player.sub_job == 'RUN' then
		set_macro_page(7, 20)
	else
		set_macro_page(6, 20)
	end
end