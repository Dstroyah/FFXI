
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Footwork = buffactive.Footwork or false
    state.Buff.Impetus = buffactive.Impetus or false

    state.FootworkWS = M(false, 'Footwork on WS')

    info.impetus_hit_count = 0
    windower.raw_register_event('action', on_action_for_impetus)
end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'SomeAcc', 'Acc')
    state.WeaponskillMode:options('Normal', 'SomeAcc', 'Acc', 'Fodder')
	state.HybridMode:options('Normal', 'PDT', 'EVASION', 'Counter')
    state.PhysicalDefenseMode:options('PDT')

    update_combat_form()
    update_melee_groups()

    select_default_macro_book(1, 4)
end


-- Define sets and vars used by this job file.
function init_gear_sets()
 sets.enmity = {ear1="Friomisi Earring",neck="Unmoving Collar +1",body="Emet Harness +1",hands="Kurys Gloves",waist="Warwolf Belt",ring1="Petrov Ring",ring2="Begrudging Ring"}

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs on use
    sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}

	sets.precast.JA['Boost'] = {hands="Anchor. Gloves +3"}

	sets.precast.JA['Dodge'] = {feet="Anch. Gaiters +3"}

	sets.precast.JA['Focus'] = {head="Anchorite's Crown +3"}

	sets.precast.JA['Counterstance'] = {feet="Hes. Gaiters +3"}

	sets.precast.JA['Chi Blast'] = {head={ name="Hes. Crown +3", augments={'Enhances "Penance" effect',}},
    body={ name="Hes. Cyclas +3", augments={'Enhances "Formless Strikes" effect',}},
    hands="Anchor. Gloves +3", legs="Anch. Hose +2", feet="Anch. Gaiters +3",
    neck="Loricate Torque +1", waist="Luminary Sash", left_ear="Gwati Earring",
    right_ear="Genmei Earring", left_ring="Vertigo Ring", right_ring="Levia. Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','System: 1 ID: 640 Val: 4',}},}

	sets.precast.JA['Footwork'] = {feet="Anch. Gaiters +3"}

	sets.precast.JA['Perfect Counter'] = {head="Tantra Crown +2"}
	
	sets.precast.JA['Formless Strikes'] = {body="Hes. Cyclas +3"}

	sets.precast.JA['Mantra'] = {feet="Hes. Gaiters +3"}
	
	sets.precast.JA['Inner Strength'] = {ammo="Falcon Eye",
		head="Genmei Kabuto", neck="Subtlety Spectacles", ear1="Ethereal Earring",
		body="Melee Cyclas", hands="Melee Gloves +2", ring1="Adoulin Ring", ring2="Meridian Ring",
		waist="Eschan Stone", legs="Melee Hose", feet="Hizamaru Sune-ate +1"}

	sets.precast.JA['Chakra'] = {ammo="Tantra Tathlum",
		head="Genmei Kabuto",ear1="Kemas Earring",ear2="Genmei Earring",
		body="Temple Cyclas",hands="Melee Gloves +2",ring1="Sirona's Ring",ring2="Spiral Ring",
		back="Melee Cape",legs="Hizamaru Hizayoroi +2",feet="Hizamaru Sune-ate +1"}

	sets.precast.JA['Provoke'] = sets.enmity
		
    -- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Tantra Tathlum",
		head="Lithelimb Cap",neck="Unmoving Collar +1",ear1="Kemas Earring",ear2="Soil Pearl",
		body="Taeon Tabard",hands="Hizamaru Kote",ring1="Sirona's Ring",ring2="Spiral Ring",
		back="Iximulew Cape",waist="Warwolf Belt",legs="Hizamaru Hizayoroi +2",feet="Taeon Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {ammo="Amar Cluster",
		head="Hizamaru Somen +1",neck="Subtlety Spectacles",ear1="Steelflash Earring",ear2="Kemas Earring",
		body="Tantra Cyclas +2",hands="Hizamaru Kote",ring1="Keen Ring",ring2="Heed Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-ate +1"}
	
    sets.precast.Flourish1 = {head="Dampening Tam",neck="Stoicheion Medal",hands="Taeon Gloves",ring1="Adoulin Ring",waist="Yamabuki-No-Obi",legs="Rawhide Trousers",feet="Taeon Boots"}

	
    -- Fast cast sets for spells
    
	sets.precast.FC = {ammo="Impatiens",head="Herculean Helm",neck="Voltsurge Torque",body="Taeon Tabard",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",ring1="Weatherspoon Ring",ring2="Prolix Ring",
	hands="Leyline Gloves",legs="Rawhide Trousers",back="Mujin Mantle",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = { ammo="Knobkierrie", head={ name="Herculean Helm", augments={'Accuracy+13','Weapon skill damage +4%','STR+4','Attack+9',}},
    body={ name="Herculean Vest", augments={'Accuracy+18','Weapon skill damage +5%','STR+1',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Hiza. Hizayoroi +2",  feet={ name="Herculean Boots", augments={'Accuracy+18 Attack+18','Weapon skill damage +5%','AGI+6','Accuracy+6','Attack+2',}},
    neck="Caro Necklace", waist="Moonbow belt +1", left_ear="Thrud Earring", right_ear="Sherida Earring",
    left_ring="Epona's Ring", right_ring="Ilabrat Ring", back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
    
	sets.precast.WSMod = {}
    sets.precast.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
    sets.precast.WS.Mod = set_combine(sets.precast.WS, sets.precast.WSMod)

    -- Specific weaponskill sets.
    
    -- legs={name="Samnuha Tights", augments={'Phys. dmg. taken -2%','Magic dmg. taken -2%','STR+8'}}}

    sets.precast.WS['Raging Fists'] = {ammo="Knobkierrie", head="Adhemar Bonnet +1", body="Adhemar Jacket +1", hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs="Ken. Hakama +1", feet={ name="Herculean Boots", augments={'Accuracy+20','"Triple Atk."+4','AGI+10','Attack+12',}},
    neck="Monk's nodowa +2", waist="Moonbow belt +1", left_ear="Moonshade Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Final Heaven'] = {ammo="Knobkierrie", head="Hesychast's Crown +3",
    body={ name="Herculean Vest", augments={'Attack+23','Weapon skill damage +3%','STR+13',}},
    hands="Anchor. Gloves +3",
    legs="Hiza. Hizayoroi +2", feet={ name="Herculean Boots", augments={'Accuracy+18 Attack+18','Weapon skill damage +5%','AGI+6','Accuracy+6','Attack+2',}},
    neck="Fotia Gorget", waist="Moonbow belt +1", left_ear="Thrud Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Gere Ring", back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},	
	}
    
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {ammo="Cheruski Needle",
    head="Hesychast's Crown +3",
    body={ name="Adhemar Jacket +1", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands="Anchor. Gloves +3",
    legs="Hiza. Hizayoroi +2",
    feet={ name="Herculean Boots", augments={'Accuracy+18 Attack+18','Weapon skill damage +5%','AGI+6','Accuracy+6','Attack+2',}}, neck="Fotia Gorget",
    waist="Moonbow belt +1", left_ear="Thrud Earring", right_ear="Brutal Earring", left_ring="Karieyh Ring",
    right_ring="Gere Ring", back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}})
																	   -- WS Dam + STR
    sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {ammo="Tantra Tathlum",ear2="Kemas Earring"})
    
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {ammo="Jukukik Feather",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Abnoba Kaftan", hands={ name="Ryuo Tekko", augments={'STR+10','DEX+10','Accuracy+15',}},
    legs="Hes. Hose +3", feet={ name="Herculean Boots", augments={'Accuracy+18 Attack+18','Weapon skill damage +5%','AGI+6','Accuracy+6','Attack+2',}},
    neck="Fotia Gorget", waist="Moonbow belt +1", left_ear="Digni. Earring", right_ear="Flame Pearl", left_ring="Begrudging Ring",
    right_ring="Ifrit Ring", back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	)
    sets.precast.WS['Victory Smite']   = set_combine(sets.precast.WS, {ammo="Knobkierrie",
	head="Adhemar Bonnet +1", body="Ken. Samue +1", hands="Ryuo Tekko",
    legs="Ken. Hakama +1", feet={ name="Herculean Boots", augments={'Accuracy+29','Weapon skill damage +4%','STR+7',}},
    neck="Fotia Gorget", waist="Moonbow belt +1", left_ear="Moonshade Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	)
    sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {ammo="Knobkierrie", head="Ken. Jinpachi +1", body="Adhemar Jacket +1", hands="Adhemar Wrist. +1",
    legs="Ken. Hakama +1", feet={ name="Herculean Boots", augments={'Accuracy+20','"Triple Atk."+4','AGI+10','Attack+12',}},
    neck="Fotia Gorget", waist="Moonbow belt +1", left_ear="Mache Earring", right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring", right_ring="Ilabrat Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
	)
    sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {ammo="Knobkierrie",
    head="Hesychast's Crown +3",
    body={ name="Herculean Vest", augments={'Attack+23','Weapon skill damage +3%','STR+13',}},
    hands="Anchor. Gloves +3",
    legs="Hiza. Hizayoroi +2", feet="Anch. Gaiters +3", neck="Fotia Gorget", waist="Moonbow belt +1",
    left_ear="Moonshade Earring", right_ear="Sherida Earring", left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}
	)
    sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {ammo="Knobkierrie", head="Hes. Crown +3", body="Ken. Samue +1",  hands="Adhemar Wrist. +1",
    legs="Ken. Hakama +1", feet="Anch. Gaiters +3", neck="Mnk. Nodowa +2", waist="Moonbow belt +1",
    left_ear="Moonshade Earring", right_ear="Sherida Earring", left_ring="Niqmaddu Ring",
    right_ring="Gere Ring", back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	)
    
    sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
    sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
    sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
    sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc)
    sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc)
    sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
    sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
    sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

    sets.precast.WS["Raging Fists"].Mod = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSMod)
    sets.precast.WS["Howling Fist"].Mod = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSMod)
    sets.precast.WS["Asuran Fists"].Mod = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSMod)
    sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSMod)
    sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSMod)
    sets.precast.WS["Shijin Spiral"].Mod = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSMod)
    sets.precast.WS["Dragon Kick"].Mod = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSMod)
    sets.precast.WS["Tornado Kick"].Mod = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSMod)


    sets.precast.WS['Cataclysm'] = {
		head="Dampening Tam",neck="Sancitity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
		back="Toro Cape",waist="Fotia Belt"}
    
    
    -- Midcast Sets
	sets.midcast.FastRecast = {ammo="Impatiens",
		head="Herculean Helm",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",neck="Voltsurge Torque",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",back="Mujin Mantle",
		waist="Black Belt",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}},legs="Rawhide Trousers"}

	-- Specific spells
	sets.midcast.Utsusemi = {ammo="Impatiens",
		head="Herculean Helm",ear2="Loquacious Earring",neck="Magoraga Beads",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",back="Mujin Mantle",
		waist="Black Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}},legs="Rawhide Trousers"}

    
    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {head="Skormoth Mask",ear1="Infused Earring",neck="Sanctity Necklace",back="Melee cape",
		body="Hiza. Haramaki +1",hands="Hes. Gloves +1",ring1="Matrimony Ring",ring2="Defending Ring"}
    

    -- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1", body="Malignance Tabard", hands="Adhemar Wrist. +1", legs="Malignance Tights",
	feet="Hes. Gaiters +3", neck="Loricate Torque +1", waist="Moonbow belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}

	sets.idle.Town = {main="",ammo="Ginsen",
		head="Skormoth Mask",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Etiolation Earring",
		body="Hiza. Haramaki +1",hands="Hes. Gloves +1",ring1="Matrimony Ring",ring2="Defending Ring",
		back="Bleating Mantle",waist="Windbuffet Belt +1",legs={ name="Herculean Trousers", augments={'CHR+10','Attack+18','"Treasure Hunter"+2','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},feet="Hermes' Sandals"}--Cessance Earring

	sets.idle.Weak = {ammo="Amar Cluster",
		head="Skormoth Mask",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Cessance Earring",
		body="Hiza. Haramaki +1",hands="Hes. Gloves +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Letalis Mantle",waist="Windbuffet Belt +1",legs={ name="Herculean Trousers", augments={'CHR+10','Attack+18','"Treasure Hunter"+2','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},feet="Hermes' Sandals"}    
    
	-- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
    head="Ken. Jinpachi +1", body="Malignance Tabard", hands="Adhemar Wrist. +1", legs="Malignance Tights",
	feet="Hes. Gaiters +3", neck="Loricate Torque +1", waist="Moonbow belt +1",
    left_ear="Sherida Earring", right_ear="Telos Earring", left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	}
	
		
	sets.defense.MDT = {ammo="Tantra Tathlum",
		head="Dampening Tam",neck="Twilight Torque",
		body="Qaaxo Harness",hands="Adhemar Wristbands",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Ta'lab Trousers",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}

    sets.Kiting = {feet="Hermes' Sandals"}

    sets.ExtraRegen = {head="Ocelomeh Headpiece +1",body="Hiza. Haramaki +1",neck="Sanctity Necklace",ear1="Infused Earring"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee sets
    sets.engaged = {ammo="Ginsen",
    head="Adhemar Bonnet +1", body="Kendatsuba Samue +1", hands="Adhemar Wrist. +1",
    legs="Hesychast's hose +3", feet="Anch. Gaiters +3",
    neck="Monk's nodowa +2", waist="Moonbow belt +1", Right_ear="Sherida Earring",
    left_ear="Telos Earring", left_ring="Niqmaddu Ring", right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}
	
	
    sets.engaged.SomeAcc = {ammo="Ginsen",
    head="Ken. Jinpachi +1", body="Ken. Samue +1", hands="Adhemar Wrist. +1",
    legs="Hesychast's hose +3",  feet="Hes. Gaiters +3", neck="Monk's Nodowa +2",
    waist="Moonbow belt +1",  left_ear="Telos Earring", right_ear="Sherida Earring",
    left_ring="Gere Ring", right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
	sets.engaged.Acc = {ammo="Honed Tathlum",
		head="Hizamaru Somen +1",neck="Ej Necklace",ear1="Brutal Earring",ear2="Steelflash Earring",
		body="Hiza. Haramaki +1",hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},ring1="Petrov Ring",ring2="Varar Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},waist="Anguinus Belt",legs="Hiza. Hizayoroi +2",feet="Hiza. Sune-ate +1"}

    -- Defensive melee hybrid sets
    sets.engaged.PDT = {ammo="Staunch Tathlum +1", head="Ken. Jinpachi +1", body="Ken. Samue +1",
    hands="Adhemar Wrist. +1", legs="Malignance Tights", feet="Anch. Gaiters +3",
    neck="Loricate Torque +1", waist="Moonbow belt +1", left_ear="Brutal Earring",
    right_ear="Sherida Earring", left_ring="Defending Ring", right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},}
    
	sets.engaged.SomeAcc.PDT = {ammo="Honed Tathlum",
		head="Dampening Tam",neck="Twilight Torque",ear1="Digni. Earring",ear2="Zennaroi Earring",
		body="Emet Harness +1",hands="Leyline Gloves",ring1="Dark Ring",ring2="Defending Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}
    
	sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
		head="Dampening Tam",neck="Twilight Torque",ear1="Digni. Earring",ear2="Zennaroi Earring",
		body="Emet Harness +1",hands="Leyline Gloves",ring1="Dark Ring",ring2="Defending Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}
    
	sets.engaged.EVASION = {ammo="Amar Cluster",
		head="Skormoth Mask",neck="Ej Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Emet Harness +1",hands="Herculean Gloves",ring1="Varar Ring",ring2="Epona's Ring",
		back="Letalis Mantle",waist="Windbuffet Belt +1",legs={ name="Herculean Trousers", augments={'Attack+22','MND+4','Quadruple Attack +2','Accuracy+11 Attack+11',}},feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}
	
	sets.engaged.SomeAcc.EVASION = {ammo="Honed Tathlum",
		head="Dampening Tam",neck="Ej Necklace",ear1="Digni. Earring",ear2="Zennaroi Earring",
		body="Emet Harness +1",hands="Hes. Gloves +1",ring1="Petrov Ring",ring2="Varar Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}
	
	sets.engaged.Acc.EVASION = {ammo="Honed Tathlum",
		head="Dampening Tam",neck="Ej Necklace",ear1="Digni. Earring",ear2="Zennaroi Earring",
		body="Emet Harness +1",hands="Hes. Gloves +1",ring1="Varar Ring",ring2="Varar Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Attack+19','"Triple Atk."+4','Accuracy+10',}}}    
	
	sets.engaged.Counter = {ammo="Amar Cluster", head="Genmei Kabuto",
    body={ name="Hes. Cyclas +3", augments={'Enhances "Formless Strikes" effect',}},
    hands={ name="Rao Kote +1", augments={'Accuracy+12','Attack+12','Evasion+20',}},
    legs="Anch. Hose +3", feet="Hes. Gaiters +3", neck="Loricate Torque +1",
    waist="Moonbow belt +1", left_ear="Genmei Earring", right_ear="Sherida Earring",
    left_ring="Defending Ring", right_ring="Gelatinous Ring +1",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','System: 1 ID: 640 Val: 4',}},
	}
    
	sets.engaged.Acc.Counter = {ammo="Honed Tathlum",
		head="Dampening Tam",neck="Ej Necklace",ear1="Digni. Earring",ear2="Zennaroi Earring",
		body="Emet Harness +1",hands="Hes. Gloves +1",ring1="Varar Ring",ring2="Varar Ring",
		back="Letalis Mantle",waist="Anguinus Belt",legs="Ta'lab Trousers",feet="Sokushitsu Sune-ate"}


    -- Hundred Fists/Impetus melee set mods
    sets.engaged.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +1"})
	sets.engaged.HF = set_combine(sets.engaged)
    sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +1"})
    sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
    sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Bhikku Cyclas +1"})
    sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
    sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Bhikku Cyclas +1"})
    sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
    sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Bhikku Cyclas +1"})


    -- Footwork combat form
    sets.engaged.Footwork = {ammo="Ginsen",
    head="Adhemar Bonnet +1", body="Adhemar Jacket +1", hands="Adhemar Wrist. +1",
    legs="Hes. Hose +3", feet="Anch. Gaiters +3",
    neck="Monk's nodowa +2", waist="Moonbow belt +1", Right_ear="Sherida Earring",
    left_ear="Cessance Earring", left_ring="Ilabrat Ring", right_ring="Epona's Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}}
	
    sets.engaged.Footwork.Acc = {ammo="Honed Tathlum",
		head="Skormoth Mask",neck="Ej Necklace",ear1="Digni. Earring",ear2="Zennaroi Earring",
		body="Emet Harness +1",hands="Hes Gloves +1",ring1="Varar Ring",ring2="Varar Ring",
		back="Segomo's Mantle",waist="Anguinus Belt",legs="Ta'lab Trousers",feet="Sokushitsu Sune-ate"}
        
    -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
    sets.impetus_body = {body="Bhikku Cyclas +1"}
    sets.footwork_kick_feet = {feet="Anchorite's Gaiters"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    -- Don't gearswap for weaponskills when Defense is on.
    if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
        eventArgs.handled = true
    end
end

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and state.DefenseMode.current ~= 'None' then
        if state.Buff.Impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
            -- Need 6 hits at capped dDex, or 9 hits if dDex is uncapped, for Tantra to tie or win.
            if (state.OffenseMode.current == 'Fodder' and info.impetus_hit_count > 5) or (info.impetus_hit_count > 8) then
                equip(sets.impetus_body)
            end
        elseif state.Buff.Footwork and (spell.english == "Dragon's Kick" or spell.english == "Tornado Kick") then
            equip(sets.footwork_kick_feet)
        end
        
        -- Replace Moonshade Earring if we're at cap TP
        if player.tp == 3000 then
            equip(sets.precast.MaxTP)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and not spell.interrupted and state.FootworkWS and state.Buff.Footwork then
        send_command('cancel Footwork')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Set Footwork as combat form any time it's active and Hundred Fists is not.
    if buff == 'Footwork' and gain and not buffactive['hundred fists'] then
        state.CombatForm:set('Footwork')
    elseif buff == "Hundred Fists" and not gain and buffactive.footwork then
        state.CombatForm:set('Footwork')
    else
        state.CombatForm:reset()
    end
    
    -- Hundred Fists and Impetus modify the custom melee groups
    if buff == "Hundred Fists" or buff == "Impetus" then
        classes.CustomMeleeGroups:clear()
        
        if (buff == "Hundred Fists" and gain) or buffactive['hundred fists'] then
            classes.CustomMeleeGroups:append('HF')
        end
        
        if (buff == "Impetus" and gain) or buffactive.impetus then
            classes.CustomMeleeGroups:append('Impetus')
        end
    end

    -- Update gear if any of the above changed
    if buff == "Hundred Fists" or buff == "Impetus" or buff == "Footwork" then
        handle_equipping_gear(player.status)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if player.hpp < 75 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_combat_form()
    update_melee_groups()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if buffactive.footwork and not buffactive['hundred fists'] then
        state.CombatForm:set('Footwork')
    else
        state.CombatForm:reset()
    end
end

function update_melee_groups()
    classes.CustomMeleeGroups:clear()
    
    if buffactive['hundred fists'] then
        classes.CustomMeleeGroups:append('HF')
    end
    
    if buffactive.impetus then
        classes.CustomMeleeGroups:append('Impetus')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 6)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 6)
	elseif player.sub_job == 'WAR' then
		set_macro_page(3, 6)
    elseif player.sub_job == 'RUN' then
        set_macro_page(3, 6)
    else
        set_macro_page(3, 6)
    end
end


function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end


-------------------------------------------------------------------------------------------------------------------
-- Custom event hooks.
-------------------------------------------------------------------------------------------------------------------

-- Keep track of the current hit count while Impetus is up.
function on_action_for_impetus(action)
    if state.Buff.Impetus then
        -- count melee hits by player
        if action.actor_id == player.id then
            if action.category == 1 then
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- Reactions (bitset):
                        -- 1 = evade
                        -- 2 = parry
                        -- 4 = block/guard
                        -- 8 = hit
                        -- 16 = JA/weaponskill?
                        -- If action.reaction has bits 1 or 2 set, it missed or was parried. Reset count.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 1
                        end
                    end
                end
            elseif action.category == 3 then
                -- Missed weaponskill hits will reset the counter.  Can we tell?
                -- Reaction always seems to be 24 (what does this value mean? 8=hit, 16=?)
                -- Can't tell if any hits were missed, so have to assume all hit.
                -- Increment by the minimum number of weaponskill hits: 2.
                for _,target in pairs(action.targets) do
                    for _,action in pairs(target.actions) do
                        -- This will only be if the entire weaponskill missed or was parried.
                        if (action.reaction % 4) > 0 then
                            info.impetus_hit_count = 0
                        else
                            info.impetus_hit_count = info.impetus_hit_count + 2
                        end
                    end
                end
            end
        elseif action.actor_id ~= player.id and action.category == 1 then
            -- If mob hits the player, check for counters.
            for _,target in pairs(action.targets) do
                if target.id == player.id then
                    for _,action in pairs(target.actions) do
                        -- Spike effect animation:
                        -- 63 = counter
                        -- ?? = missed counter
                        if action.has_spike_effect then
                            -- spike_effect_message of 592 == missed counter
                            if action.spike_effect_message == 592 then
                                info.impetus_hit_count = 0
                            elseif action.spike_effect_animation == 63 then
                                info.impetus_hit_count = info.impetus_hit_count + 1
                            end
                        end
                    end
                end
            end
        end
        
        --add_to_chat(123,'Current Impetus hit count = ' .. tostring(info.impetus_hit_count))
    else
        info.impetus_hit_count = 0
    end
    
end


--- Raging Ashuran Raging Victory Victory