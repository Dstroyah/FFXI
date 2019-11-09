---Intermediate BLU .lua---
--Based off of Spicyryan of Asura's .lua https://pastebin.com/u/Spicyryan

-------------------------------------
---------                   ---------
------                         ------
---         Start of Gear         ---
------                         ------
---------                   ---------
------------------------------------- 

--Place Augmented Gear here, do //export while wearing it 
--Then find the folder where you store your .luas--
-- Select default macro book on initial load or subjob change.


function get_sets()
	maps()

	HerculeanHelm = {}
	HerculeanHelm.Nuke = { name = "Herculean Helm", augments = { 'Mag. Acc.+18 "Mag.Atk.Bns."+18', '"Fast Cast"+1', 'INT+9', 'Mag. Acc.+9', '"Mag.Atk.Bns."+12', } }
	HerculeanHelm.DT = { name = "Herculean Helm", augments = { 'Attack+12', 'Phys. dmg. taken -4%', 'STR+9', 'Accuracy+8', } }
	HerculeanHelm.Refesh = { name = "Herculean Helm", augments = { 'Weapon skill damage +2%','Pet: Accuracy+11 Pet: Rng. Acc.+11','"Refresh"+2', } }
	HerculeanHelm.WSD = { name = "Herculean Helm", augments = { 'Attack+18','Weapon skill damage +4%','STR+10','Accuracy+12', } }
	HerculeanHelm.WSDAcc = { name = "Herculean Helm", augments = { 'Accuracy+23 Attack+23','Weapon skill damage +3%','STR+3','Accuracy+13','Attack+11', } }
	
	HerculeanVest = {}
	HerculeanVest.Phalanx = { name="Herculean Vest", augments = {'Accuracy+2','DEX+8','Phalanx +2','Accuracy+1 Attack+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	HerculeanVest.CDC  = { name="Herculean Vest", augments={'Accuracy+19 Attack+19','Crit. hit damage +3%','DEX+14','Accuracy+3',}}
	
	TaeonBody = {}
	TaeonBody.FC = { name="Taeon Tabard", augments={'Accuracy+23','"Fast Cast"+5','HP+36',} }
	TaeonBody.SIR = {name="Taeon Tabard", augments = {'Spell interruption rate down -8%','STR+7 VIT+7'} }
	
	HerculeanGloves = {}
	HerculeanGloves.WSD = { name = "Herculean Gloves", augments = { 'Accuracy+21 Attack+21', 'Weapon skill damage +4%', 'Accuracy+9', 'Attack+10', } }
	HerculeanGloves.DT = { name = "Herculean Gloves", augments = { 'Accuracy+13', 'Damage taken-3%', 'AGI+1', 'Attack+5', } }
	HerculeanGloves.HighAcc = { name = "Herculean Gloves", augments = { 'Accuracy+23 Attack+23', '"Triple Atk."+2', 'DEX+15', 'Accuracy+11', 'Attack+13', } }
	HerculeanGloves.Refresh = { name = "Herculean Gloves", augments = { 'DEX+7', 'Weapon skill damage +2%', '"Refresh"+1', } }
	HerculeanGloves.Crit = { name = "Herculean Gloves", augments = { 'Attack+23', 'Crit. hit damage +4%', 'DEX+8', 'Accuracy+11', } }
	HerculeanGloves.Phalanx = { name="Herculean Gloves", augments={'INT+5','Pet: "Dbl. Atk."+3','Phalanx +4',}}
	HerculeanGloves.PhysicalSpells = { name="Herculean Gloves", augments={'Accuracy+11 Attack+11','"Triple Atk."+2','STR+10','Accuracy+15','Attack+5', } }
	
	TelchineLegs = {}
	TelchineLegs.CP = { name = "Telchine Braconi" , augments = {'Potency of "Cure" effect received+7%','INT+1 MND+1',} }
	
	HerculeanLegs = {}
	HerculeanLegs.DT = { name = "Herculean Trousers", augments = { 'Accuracy+22', 'Damage taken-2%', 'VIT+6', } }
	HerculeanLegs.WSD = { name = "Herculean Trousers", augments = { 'Attack+28', 'Weapon skill damage +3%', 'STR+10', 'Accuracy+9', } }

	TaeonBoots = {}
	TaeonBoots.Regen ={ name="Taeon Boots", augments = {'Mag. Acc.+9','"Conserve MP"+5','"Regen" potency+3',} }
	
	HerculeanFeet = {}
	HerculeanFeet.QA = { name = "Herculean Boots", augments = { 'AGI+4', '"Dbl.Atk."+2', 'Quadruple Attack +3', 'Accuracy+4 Attack+4', } }
	HerculeanFeet.TA = { name = "Herculean Boots", augments = { 'Accuracy+14 Attack+14', '"Triple Atk."+4', 'DEX+3', 'Accuracy+2', 'Attack+15' } }
	HerculeanFeet.DT = { name = "Herculean Boots", augments = { 'Accuracy+23', 'Damage taken -3%' } }
	HerculeanFeet.Idle = { name = "Herculean Boots", augments = { 'Crit. hit damage +1%','STR+10','"Refresh"+2','Accuracy+15 Attack+15','Mag. Acc.+17 "Mag.Atk.Bns."+17', } }
	HerculeanFeet.CritDmg = { name = "Herculean Boots", augments = { 'Accuracy+28', 'Crit. hit damage +5%', 'DEX+9' } }
	HerculeanFeet.WSD = { name = "Herculean Boots", augments = { 'Attack+22', 'Weapon skill damage +4%', 'Accuracy+15' } }
	HerculeanFeet.DW = { name = "Herculean Boots", augments = { 'Accuracy+3 Attack+3','"Dual Wield"+4','AGI+3','Accuracy+14' } }
	HerculeanFeet.Phalanx = { name = "Herculean Boots", augments = {'Mag. Acc.+11 "Mag.Atk.Bns."+11','STR+6','Phalanx +2','Accuracy+12 Attack+12', } }
	HerculeanFeet.TH = { name="Herculean Boots", augments = { 'Mag. Acc.+17','"Blood Pact" ability delay -2','"Treasure Hunter"+1' } }
	
	Rosmerta = {}
	Rosmerta.Crit = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10', } }
	Rosmerta.WSD = { name = "Rosmerta's Cape", augments = { 'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%', } }
	Rosmerta.STP = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10', } }
	Rosmerta.DA = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10' } }
	Rosmerta.DW = { name = "Rosmerta's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10', } }
	Rosmerta.Nuke = { name = "Rosmerta's Cape", augments = { 'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10', } }
	Rosmerta.Cure = { name = "Rosmerta's Cape", augments = { 'MND+20','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%' } }
	Rosmerta.MagicEva = { name = "Rosmerta's Cape", augments = {'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10' } }
	
	
	sets.Idle = {}
	--Idle Sets--
	sets.Idle.index = { 'Standard', 'DT' }
	Idle_ind = 1
	sets.Idle.Standard = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Assim. Jubbah +1",
		hands="Serpentes Cuffs",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		feet="Serpentes Sabots",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Genmei Earring",
		right_ear="Ethereal Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring +1",
		back="Engulfer Cape +1",
	}

	sets.Idle.DT = {
		ammo = "Staunch Tathlum",
		head = "Blistering Sallet +1",
		neck = "Loricate Torque +1",
		ear1 = "Genmei Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = "Moonbeam Cape",
		waist = "Flume belt",
		legs = "Carmine Cuisses +1",
		feet = "Ahosi Leggings"
	}

	--TP Sets--
	sets.TP = {}
	sets.TP.index = { 'DualWield', 'CappedHaste', 'AccuracyLite', 'AccuracyMid', 'AccuracyFull' }
	TP_ind = 1 --Default set, 1 is DW, 2, Haste, etc

	--DW III, +31 DW needed to cap with only Flutter on--
	sets.TP.DualWield = {
		ammo="Ginsen",
		head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
		body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
		hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
		legs={ name="Herculean Trousers", augments={'"Triple Atk."+3','STR+8','Accuracy+10','Attack+12',}},
		feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+3','DEX+8',}},
		neck="Lissome Necklace",
		waist="Reiki Yotai",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Petrov Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','"Store TP"+10',}},
	}
	--+11 DW for capping with DW3--	
	sets.TP.CappedHaste = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Asperity necklace",
		ear1 = "Suppanomimi",
		ear2 = "Brutal Earring",
		body = "Adhemar Jacket +1",
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Hetairoi Ring",
		back = Rosmerta.DA,
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.QA
	}

	sets.TP.AccuracyLite = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Lissome Necklace",
		ear1 = "Suppanomimi",
		ear2 = "Cessance Earring",
		body = "Adhemar Jacket +1",
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Hetairoi Ring",
		back = Rosmerta.DA,
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyMid = {
		ammo = "Falcon Eye",
		head = "Dampening Tam",
		neck = "Lissome Necklace",
		ear1 = "Suppanomimi",
		ear2 = "Telos earring",
		body = "Adhemar Jacket +1",
		hands = "Adhemar Wristbands +1",
		ring1 = "Epona's ring",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.DA,
		waist = "Kentarch Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
	}

	sets.TP.AccuracyFull = {
		ammo = "Falcon Eye",
		head = "Carmine Mask +1",
		neck = "Combatant's Torque",
		ear1 = "Mache Earring +1",
		ear2 = "Telos earring",
		body = "Adhemar Jacket +1",
		hands = HerculeanGloves.HighAcc,
		ring1 = "Cacoethic Ring +1",
		ring2 = "Ilabrat Ring",
		back = Rosmerta.DA,
		waist = "Olseni Belt",
		legs = "Carmine Cuisses +1",
		feet = HerculeanFeet.CritDmg
	}
	
	--DT Sets--
	sets.DT = {}
	sets.DT.index = { 'DT', 'DTHybrid', 'MDTV', 'MEVA', 'MDTHybrid' }
	DT_ind = 1 

	sets.DT.DT = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands={ name="Herculean Gloves", augments={'Accuracy+24 Attack+24','"Triple Atk."+3','DEX+4',}},
		legs="Aya. Cosciales +1",
		feet={ name="Herculean Boots", augments={'Accuracy+16','Damage taken-4%','STR+10','Attack+2',}},
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Genmei Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Defending Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','"Store TP"+10',}},
	}

	sets.DT.DTHybrid = {
		ammo="Staunch Tathlum",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands={ name="Herculean Gloves", augments={'Accuracy+24 Attack+24','"Triple Atk."+3','DEX+4',}},
		legs="Aya. Cosciales +1",
		feet={ name="Herculean Boots", augments={'Accuracy+16','Damage taken-4%','STR+10','Attack+2',}},
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Genmei Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Defending Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','"Store TP"+10',}},
	}

	--Shell V on. Need 23% when 5/5 with pants, 21% with sheltered (23 again with sheltered and trust)--
	sets.DT.MDTV = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring",
		ear2 = "Etiolation Earring",
		body = "Amalric Doublet",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Shadow Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Amalric Slops",
		feet = "Ahosi Leggings"
	}
	
	sets.DT.MEVA = {
		ammo = "Staunch Tathlum",
		head = "Amalric Coif",
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring",
		ear2 = "Hearty Earring",
		body = "Amalric Doublet",
		hands = "Shrieker's Cuffs",
		ring1 = "Defending Ring",
		ring2 = "Purity Ring",
		back = Rosmerta.MagicEva,
		waist = "Carrier's Sash",
		legs = "Amalric Slops",
		feet = "Ahosi Leggings"
	}
	
	sets.DT.MDTHybrid = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Ayanmo Corazza +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Flume Belt",
		legs = "Ayanmo Cosciales +1",
		feet = "Ahosi Leggings"
	}
	
	--Weaponskill Sets--
	sets.WS = {}

	sets.Requiescat = {}

	sets.Requiescat.index = { 'Attack', 'Accuracy' }
	Requiescat_ind = 1

	sets.Requiescat.Attack = {
		ammo="Staunch Tathlum",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches +1",
		neck="Atzintli Necklace",
		waist="Flume Belt",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Jhakri Ring",
		right_ring="Acumen Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','"Store TP"+10',}},
	}

	sets.Requiescat.Accuracy = {
		ammo = "Falcon Eye",
		head = "Jhakri Coronal +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Telos Earring",
		body = "Jhakri Robe +2",
		hands = "Jhakri Cuffs +2",
		ring1 = "Epona's ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Fotia Belt",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.CDC = {}

	sets.CDC.index = { 'AttackUncapped', 'AttackCapped', 'Accuracy' }
	CDC_ind = 1

	sets.CDC.AttackUncapped = {
		ammo="Expeditious Pinion",
		head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
		body={ name="Herculean Vest", augments={'Accuracy+19','Crit. hit damage +2%','AGI+1','Attack+14',}},
		hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
		legs={ name="Herculean Trousers", augments={'Attack+28','Weapon skill damage +3%','DEX+8',}},
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear="Moonshade Earring",
		left_ring="Ilabrat Ring",
		right_ring="Apate Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','"Store TP"+10',}},
	}

	sets.CDC.AttackCapped = set_combine(sets.CDC.AttackUncapped, {		
		feet = "Thereoid Greaves",
	})
	
	sets.CDC.Accuracy = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade earring",
		ear2 = "Mache Earring",
		body = HerculeanVest.CDC,
		hands = "Adhemar Wristbands +1",
		ring1 = "Ilabrat Ring",
		ring2 = "Begrudging Ring",
		back = Rosmerta.Crit,
		waist = "Fotia Belt",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.CritDmg
	}

	sets.Expiacion = {}

	sets.Expiacion.index = { 'Attack', 'Accuracy' }
	Expiacion_ind = 1

	sets.Expiacion.Attack = {
		ammo="Ginsen",
		head={ name="Herculean Helm", augments={'Attack+25','Weapon skill damage +4%','Accuracy+5',}},
		body={ name="Herculean Vest", augments={'Accuracy+20','Weapon skill damage +4%','STR+5','Attack+14',}},
		hands="Jhakri Cuffs +1",
		legs={ name="Herculean Trousers", augments={'Attack+28','Weapon skill damage +3%','DEX+8',}},
		feet={ name="Herculean Boots", augments={'Attack+9','Weapon skill damage +3%','DEX+4','Accuracy+11',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Shukuyu Ring",
		right_ring="Karieyh Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+4','"Store TP"+10',}},
	}

	sets.Expiacion.Accuracy = {
		ammo = "Falcon Eye",
		head = HerculeanHelm.WSDAcc,
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Telos Earring",
		body = "Assim. Jubbah +3",
		hands = "Jhakri Cuffs +2",
		ring1 = "Karieyh Ring +1",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = HerculeanLegs.WSD,
		feet = HerculeanFeet.WSD
	}

	sets.SavageBlade = {}

	sets.SavageBlade.index = { 'Attack', 'Accuracy' }
	SavageBlade_ind = 1
	sets.SavageBlade.Attack = set_combine(sets.Expiacion.Attack, {
	})

	sets.SavageBlade.Accuracy = set_combine(sets.Expiacion.Accuracy, {
	})

	sets.SanguineBlade = {
		ammo = "Pemphredo Tathlum",
		head = "Pixie Hairpin +1",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Hecate's earring",
		body = "Jhakri Robe +2",
		hands = "Jhakri Cuffs +2",
		ring1 = "Archon Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.CircleBlade = set_combine(sets.Expiacion.Attack[sets.Expiacion.index[Expiacion_ind]], {
	})

	---------
	--Clubs-- These indexs probably will never need to be toggled,
	--------- but they exist anyway
	sets.Judgement = {}

	sets.Judgement.index = { 'Attack', 'Accuracy' }
	Judgement_ind = 1
	sets.Judgement.Attack = set_combine(sets.Expiacion.Attack, {})

	sets.Judgement.Accuracy = set_combine(sets.Expiacion.Accuracy, {})
	
	sets.BlackHalo = {}

	sets.BlackHalo.index = { 'Attack', 'Accuracy' }
	BlackHalo_ind = 1
	sets.BlackHalo.Attack = {
		ammo = "Floestone",
		head = HerculeanHelm.WSD,
		neck = "Caro Necklace",
		ear1 = "Moonshade Earring",
		ear2 = "Telos Earring",
		body = "Assim. Jubbah +3",
		hands = "Jhakri Cuffs +2",
		ring1 = "Karieyh Ring +1",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = HerculeanLegs.WSD,
		feet = HerculeanFeet.WSD
	}
	
	sets.BlackHalo.Accuracy = set_combine(sets.Expiacion.Accuracy, {})
	
	sets.Realmrazer = {}

	sets.Realmrazer.index = { 'Attack', 'Accuracy' }
	Realmrazer_ind = 1
	sets.Realmrazer.Attack = {
		ammo = "Hydrocera",
		head = "Jhakri Coronal +1",
		neck = "Fotia Gorget",
		ear1 = "Telos Earring",
		ear2 = "Ishvara Earring",
		body = "Jhakri Robe +2",
		hands = "Jhakri Cuffs +2",
		ring1 = "Ilabrat Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Fotia Belt",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	sets.Realmrazer.Accuracy = set_combine(sets.Realmrazer.Attack, {})

	sets.FlashNova = {}

	sets.FlashNova.index = { 'Attack', 'Accuracy' }
	FlashNova_ind = 1
	sets.FlashNova.Attack = {
		ammo = "Pemphredo Tathlum",
		head = "Jhakri Coronal +1",
		neck = "Sanctity Necklace",
		ear1 = "Hecate's Earring",
		ear2 = "Friomisi Earring",
		body = "Jhakri Robe +2",
		hands = "Jhakri Cuffs +2",
		ring1 = "Shiva Ring +1",
		ring2 = "Acumen Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}
	
	sets.FlashNova.Accuracy = set_combine(sets.FlashNova.Attack, {})

	-------------------
	--Blue Magic Sets--
	-------------------
	sets.BlueMagic = {}

	sets.BlueMagic.STR = {
		ammo = "Floestone",
		head = "Adhemar Bonnet +1",
		neck = "Caro Necklace",
		ear1 = "Telos Earring",
		ear2 = "Odnowa Earring +1",
		body = "Assim. Jubbah +3",
		hands = HerculeanGloves.PhysicalSpells,
		ring1 = "Ifrit Ring +1",
		ring2 = "Shukuyu Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = HerculeanLegs.WSD,
		feet = "Jhakri Pigaches +1"
	}

	sets.BlueMagic.STRDEX = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRVIT = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.STRMND = set_combine(sets.BlueMagic.STR, {})

	sets.BlueMagic.AGI = set_combine(sets.BlueMagic.STR, {	})
	--------------------------------------------------
	sets.BlueMagic.INT = {}
	sets.BlueMagic.INT.index = { "MAB", "MACC" }
	MAB_ind = 1

	sets.BlueMagic.INT.MAB = {
		ammo="Hydrocera",
		head="Jhakri Coronal +1",
		body="Amalric Doublet",
		hands="Amalric Gages",
		legs={ name="Telchine Braconi", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}},
		feet="Jhakri Pigaches +1",
		neck="Atzintli Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Strendu Ring",
		right_ring="Acumen Ring",
		back="Toro Cape",
	}
	
	sets.BlueMagic.INT.MACC = {
		ammo = "Pemphredo Tathlum",
		head = "Jhakri Coronal +1",
		neck = "Erra Pendant",
		ear1 = "Hermetic Earring",
		ear2 = "Friomisi earring",
		body = "Jhakri Robe +2",
		hands = "Jhakri Cuffs +2",
		ring1 = "Shiva Ring +1",
		ring2 = "Acumen Ring",
		back = Rosmerta.Nuke,
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}
	-----------------------------------------
	
	--CP cap 50%, CP Received cap 30%--
	sets.BlueMagic.Cures = {
		ammo = "Hydrocera",
		head = "Carmine Mask",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Calamitous Earring",
		body = "Vrikodara Jupon",
		hands = "Hashishin Bazubands +1",
		ring1 = "Stikini Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Cure,
		waist = "Luminary Sash",
		legs = "Gyve Trousers",
		feet = "Medium's Sabots"
	}
	
	sets.BlueMagic.SelfCures = {
		ammo = "Hydrocera",
		head = "Carmine Mask",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Calamitous Earring",
		body = "Vrikodara Jupon",
		hands = "Telchine Gloves",
		ring1 = "Kunaji Ring",
		ring2 = "Rufescent Ring",
		back = Rosmerta.Cure,
		waist = "Gishdubar Sash",
		legs = TelchineLegs.CP,
		feet = "Medium's Sabots"
	}

	--Conserve MP Gear--
	sets.BlueMagic.Buffs = {
		ammo = "Pemphredo Tathlum",
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Mendicant's Earring",
		ear2 = "Calamitous Earring",
		body = "Vedic Coat",
		hands = "Shrieker's Cuffs",
		ring1 = "Kishar Ring",
		back = "Solemnity Cape",
		waist = "Hachirin-no-Obi",
		legs = "Lengo Pants",
		feet = "Carmine Greaves +1"
	}

	sets.BlueMagic.Battery = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
		waist = "Gishdubar Sash"
	})

	--Telchine Regen+ potency augments--
	sets.BlueMagic.Regeneration = set_combine(sets.BlueMagic.Buffs, {
		Body = "Telchine Chasuble",
		Feet =  TaeonBoots.Regen
	})

	sets.BlueMagic.Stun = {
		ammo = "Pemphredo Tathlum",
		head = "Carmine Mask +1",
		neck = "Erra Pendant",
		ear1 = "Telos Earring",
		ear2 = "Dignitary's Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Etana Ring",
		ring2 = "Stikini Ring",
		back = "Cornflower cape",
		waist = "Eschan Stone",
		legs = "Hashishin Tayt +1",
		feet = HerculeanFeet.Idle
	}

	sets.BlueMagic.HeavyStrike = {
		ammo = "Falcon Eye",
		head = "Adhemar Bonnet +1",
		neck = "Caro Necklace",
		ear1 = "Telos Earring",
		ear2 = "Odnowa Earring +1",
		body = "Adhemar Jacket +1",
		hands = HerculeanGloves.Crit,
		ring1 = "Ifrit Ring +1",
		ring2 = "Rufescent Ring",
		back = Rosmerta.WSD,
		waist = "Prosilio Belt +1",
		legs = "Samnuha Tights",
		feet = HerculeanFeet.TA
	}

	sets.BlueMagic.WhiteWind = {
		ammo = "Falcon Eye",
		head = "Blistering Sallet +1",
		neck = "Phalaina Locket",
		ear1 = "Mendicant's Earring",
		ear2 = "Ethereal Earring",
		body = "Vrikodara Jupon",
		hands = "Telchine Gloves",
		ring1 = "Kunaji Ring",
		ring2 = "Etana Ring",
		back = "Reiki Cloak",
		waist = "Carrier's Sash",
		legs = "Gyve Trousers",
		feet = "Medium's Sabots"
	}

	sets.BlueMagic.MagicAccuracy = {
		ammo = "Pemphredo Tathlum",
		head = "Carmine Mask +1",
		neck = "Erra Pendant",
		ear1 = "Hermetic earring",
		ear2 = "Dignitary's earring",
		body = "Jhakri Robe +2",
		hands = "Rawhide Gloves",
		ring1 = "Sangoma Ring",
		ring2 = "Stikini Ring",
		back = "Cornflower Cape",
		waist = "Eschan Stone",
		legs = "Jhakri Slops +1",
		feet = "Jhakri Pigaches +1"
	}

	--Occultation is every 50 skill, magic barrier equals skill, rest dont matter
	---For example diamondhide caps at 500
	sets.BlueMagic.Skill = {
		ammo = "Pemphredo Tathlum",
		head = "Luhlaza Keffiyeh",
		neck = "Incanter's Torque",
		ear1 = "Suppanomimi",
		ear2 = "Ethereal earring",
		body = "Assim. Jubbah +3",
		hands = "Hashishin Bazubands +1",
		ring1 = "Kishar Ring",
		ring2 = "Stikini Ring",
		back = "Cornflower cape",
		waist = "Gishdubar Sash",
		legs = "Hashishin Tayt +1",
		feet = "Luhlaza Charuqs"
	}

	sets.BlueMagic.Enmity = {
		ammo = "Sapience Orb",
		head = "Rabid Visor",
		neck = "Warder's Charm +1",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "None",
		ring1 = "Supershear Ring",
		ring2 = "Pernicious Ring",
		back = Rosmerta.MagicEva,
		waist = "Kasiri Belt",
		legs = "Obatala Subligar",
		Feet = "Ahosi Leggings"
	}


	--Enhancing Sets--
	
	sets.Enhancing = set_combine(sets.BlueMagic.Buffs, {
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		body = "Telchine Chasuble",
		back = "Perimede Cape",
		legs = "Carmine Cuisses +1"
	})
	
	sets.Enhancing.Phalanx = set_combine(sets.BlueMagic.Buffs, {
		head = "Telchine Cap",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		body = HerculeanVest.Phalanx,
		hands = HerculeanGloves.Phalanx,
		feet = HerculeanFeet.Phalanx,
		back = "Perimede Cape",
		legs = "Carmine Cuisses +1"
	})
	
	sets.Enhancing.Aquaveil = set_combine(sets.BlueMagic.Buffs, {
		head = "Amalric Coif",
	})
	
	sets.Enhancing.ProShell = set_combine(sets.BlueMagic.Buffs, {
		ring2 = "Sheltered Ring"
	})

	----------------
	--Utility Sets--
	----------------
	--These sets are either called in rules (like TH or Herp-a-Derp DT) or locked in manually
	--Manual locking macro
	--/console gs equip sets.  <name>
	--/console gs c lockgearindex
	--Hit it again to take it off
	
	sets.Utility = {}
	
	sets.Utility.TH = {
		waist = "Chaac Belt",
		feet = HerculeanFeet.TH
	}
	--Comes on while terrored, asleep, etc
	sets.Utility.DerpDT = {
		ammo = "Staunch Tathlum",
		head = "Blistering Sallet +1",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Ethereal Earring",
		body = "Ayanmo Corazza +1",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = "Engulfer Cape +1",
		waist = "Flume belt",
		legs = "Ayanmo Cosciales +1",
		feet = "Ahosi Leggings"
	}
	
	--Shell II only, need 36%--
	sets.Utility.MDTII = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Warder's Charm +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Amalric Doublet",
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Shadow Ring",
		back = "Mubvumbamiri Mantle",
		waist = "Carrier's Sash",
		legs = "Ayanmo Cosciales +1",
		feet = "Ahosi Leggings"
	}

	--No Shell--
	sets.Utility.MDTNO = {
		ammo = "Staunch Tathlum",
		head = "Dampening Tam",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = "Ayanmo Corazza +1", 
		hands = HerculeanGloves.DT,
		ring1 = "Defending ring",
		ring2 = "Dark ring",
		back = "Engulfer Cape +1",
		waist = "Carrier's Sash",
		legs = "Ayanmo Cosciales +1",
		feet = HerculeanFeet.DT
	}

	--Job Ability Sets--

	sets.JA = {}

	sets.JA.ChainAffinity = { feet = "Assim. charuqs +1" }

	sets.JA.BurstAffinity = { feet = "Hashishin Basmak +1" }

	sets.JA.Efflux = { legs = "Hashishin Tayt +1", back= Rosmerta.WSD }

	sets.JA.AzureLore = { hands = "Luhlaza bazubands" }

	sets.JA.Diffusion = set_combine(sets.BlueMagic.Buffs, { feet = "Luhlaza Charuqs" })

	sets.JA.Provoke = set_combine(sets.BlueMagic.Enmity, {})

	sets.JA.Warcry = set_combine(sets.BlueMagic.Enmity, {})


	--Precast Sets--
	sets.precast = {}

	sets.precast.FastCast = {}

	sets.precast.FastCast.Standard = {
					ammo="Impatiens",
					head={ name="Herculean Helm", augments={'Attack+25','Weapon skill damage +4%','Accuracy+5',}},
					body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
					hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
					legs={ name="Psycloth Lappas", augments={'MP+65','Mag. Acc.+12','"Fast Cast"+6',}},
					feet="Carmine Greaves",
					neck="Voltsurge Torque",
					waist="Witful Belt",
					left_ear="Loquac. Earring",
					right_ear="Genmei Earring",
					left_ring="Prolix Ring",
					right_ring="Kishar Ring",
					back="Swith Cape",
	}

	--Empy body stacks with FC, 80% cap, empy hands must be on at time of casting (mid) for effect--
	sets.precast.FastCast.Blue = set_combine(sets.precast.FastCast.Standard, {
		--body = "Hashishin Mintan"       --remove the -- in order to make active
	})
end

---End of Gear---------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------
---------                   ---------
------                         ------
---         Start of Maps         ---
------                         ------
---------                   ---------
------------------------------------- 

-------------------------
--   BLU Spells List   --
-------------------------

--Place spells into either Physical or Magical, and then further seperate them into type--
--Anything In Physical or Magical is only for making a rule, it won't swap simply for being in that category--
function maps()
	--All physical spells go here then they are filtered specifically. Add accordingly.
	PhysicalSpells = S {
		'Asuran Claws', 'Bilgestorm', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite', 'Queasyshroom',
		'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash', 'Smite of Rage',
		'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch', 'Battle Dance', 'Bloodrake',
		'Death Scissors', 'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion',
		'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Amorphic Spikes', 'Barbed Crescent',
		'Claw Cyclone', 'Disseverment', 'Foot Kick', 'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage',
		'Paralyzing Triad', 'Seedspray', 'Sinker Drill', 'Vanity Dive', 'Cannonball', 'Delta Thrust',
		'Glutinous Dart', 'Grand Slam', 'Quad. Continuum', 'Sprout Smack', 'Benthic Typhoon', 'Helldive',
		'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats', 'Heavy Strike'
	}

	PhysicalBlueMagic_STR = S {
		'Asuran Claws', 'Bilgestorm', 'Battle Dance', 'Bludgeon', 'Bloodrake', 'Death Scissors', 
		'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill', 
		'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Saurian Slide', 'Sinal Cleave', 
		'Paralyzing Triad'
	}

	PhysicalBlueMagic_DEX = S {
		'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
		'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Seedspray',
		'Vanity Dive'
	}

	PhysicalBlueMagic_VIT = S {
		'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
		'Sprout Smack', 'Sweeping Gouge'
	}

	PhysicalBlueMagic_AGI = S {
		'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats',
		'Spiral Spin'
	}
	--Heavy Strike has -100 acc penalty--
	BlueMagic_PhysicalAcc = S {
		'Heavy Strike'
	}
	--All nuking spells go here then they are filtered specifically. Add accordingly.
	MagicalSpells = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind',
		'Firespit', 'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Magic Barrier', 'Nectarous Deluge',
		'Polar Roar', 'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm',
		'Spectral Floe', 'Subduction', 'Sudden Lunge', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot',
		'Water Bomb', 'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me', 'Blazing Bound',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush', 'Blinding Fulgor', 'Diffusion Ray', 'Ice Break',
		'Magic Hammer', 'Rail Cannon', 'Retinal Glare', 'Embalming Earth', 'Entomb', 'Sandspin', 'Vapor Spray',
	}
	--Any nuking spell that doesnt have certain armor to enhance it like the pixie hairpin +1 for dark nukes--
	BlueMagic_INT = S {
		'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind', 'Firespit',
		'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Nectarous Deluge', 'Polar Roar',
		'Regurgitation', 'Rending Deluge', 'Scouring Spate', 'Searing Tempest', 'Silent Storm', 'Spectral Floe',
		'Subduction', 'Tem. Upheaval', 'Thermal Pulse', 'Thunderbolt', 'Uproot', 'Water Bomb'
	}

	BlueMagic_Dark = S {
		'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
		'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
	}

	BlueMagic_Light = S {
		'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
	}

	--- here if you need it for earth spells but down below, nuking these spells goes to the same int nuke set at others. I don't carry the neck
	BlueMagic_Earth = S {
		'Embalming Earth', 'Entomb', 'Sandspin'
	}

	BlueMagic_Accuracy = S {
		'1000 Needles', 'Absolute Terror', 'Auroral Drape', 'Awful Eye', 'Blastbomb', 'Blank Gaze', 'Blistering Roar', 'Blitzstrahl',
		'Blood Drain', 'Blood Saber', 'Chaotic Eye', 'Cimicine Discharge', 'Cold Wave', 'Digest', 'Corrosive Ooze',
		'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Filamented Hold', 'Frightful Roar',
		'Geist Wall', 'Hecatomb Wave', 'Infrasonics', 'Light of Penance', 'Lowing', 'Mind Blast', 'Mortal Ray',
		'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Sound Blast', 'Stinking Gas',
		'Venom Shell', 'Voracious Trunk', 'Yawn'
	}

	BlueMagic_Breath = S {
		'Bad Breath', 'Flying Hip Press', 'Final Sting', 'Frost Breath', 'Heat Breath', 'Magnetite Cloud',
		'Poison Breath', 'Radiant Breath', 'Self Destruct', 'Thunder Breath', 'Vapor Spray', 'Wind Breath'
	}

	BlueMagic_Buffs = S {
		'Barrier Tusk', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
		'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat', 
		'Feather Barrier','Refueling','Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge', 'Amplification'
	}

	BlueMagic_Skill = S {
		'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation', 'Atra. Libations'
	}

	BlueMagic_Healing = S {
		'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot'
	}
--- Acc + Macc "Stun" set ---
	BlueMagic_Stun = S {
		'Frypan', 'Head Butt', 'Sudden Lunge', 'Tail slap', 'Sub-zero Smash'
	}
	BlueMagic_Enmity = S {
		'Actinic Burst', 'Exuviation', 'Fantod', 'Jettatura', 'Temporal Shift'
	}
	BlueMagic_Diffusion = S {
		 'Harden Shell', 'Mighty Guard', 'Carcharian Verve', 'Magic Barrier'
	}
end

---End of Maps----------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------
---------                    ---------
------                          ------
---         Start of Rules         ---
------                          ------
---------                    ---------
-------------------------------------- 

-------------------------------
--         Variables         --
-------------------------------
SetLocked = false --Used to Check if set is locked before changing equipment
LockedEquipSet = {} --Placeholder to store desired lock set
LockGearSet = {}
equipSet = {} --Currently Equiped Gearset
LockGearIndex = false
TargetDistance = 0
TH = false
DT = false

--TH rule description--
--TH in this GS works as follows. alt T or macro the command in the toggle to turn it on and off
--It will not equip in your idle set, or while casting buffs, enhancing, cures, skill based BLU spells, diffusion based spells, or blue cures
--It will equip when engaging, and after an action is performed by you it comes off until you re-engage or toggle it on and off.
---You can change this, but I found it silly to full time it.
--If you are idle, and cast either physical blue spells or offensive magical blue spells it will equip on top of your sets
---Diaga and stuff don't apply. Feel free to add it.
--When you return to being strictly idle, it doesn't equip either, becuase that would be pointless.

--So basically, TH gear (add yours in where applicable) comes on when engaging unti a new action is performed, and while idle using physical or offensive magical nukes.

------------------------------------
--         Windower Hooks         --
------------------------------------


function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"terror","petrification","sleep","stun"}:contains(name) then
        if gain then
            ChangeGear(sets.Utility.DerpDT) -- Put this set on when terrored etc
        elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
            if player.status == 'Engaged' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
				elseif not LockGearIndex then
					if DT == true then
						ChangeGear(sets.DT[sets.DT.index[DT_ind]])
					else
						ChangeGear(sets.TP[sets.TP.index[TP_ind]])
					end
				end
            elseif player.status == 'Idle' then
                if LockGearIndex then
                    ChangeGear(LockGearSet)
                elseif not LockGearIndex then
                    ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
                end
            end
        end
    elseif name == "doom" then
        if gain then
            send_command('@input /p Doomed {~o~:} !')
        else
			send_command('@input /p Doom is off {^_^}')
        end
	elseif name == "charm" then
		if gain then
			send_command('@input /p Charmed {<3_<3:} !')
		else
			send_command('@input /p Charm is off {~_^}')
		end
	end
	
end

function has_any_buff_of(buff_set)--returns true if you have any of the buffs given
    for i,v in pairs(buff_set) do
        if buffactive[v] ~= nil then return true end
    end
end
---------------------------
--         Binds         --
---------------------------
send_command('bind f9 gs c toggle TP set') --This means if you hit f9 it toggles the sets
send_command('bind f10 gs c toggle CDC set')
send_command('bind f11 gs c toggle Other Sword sets')
send_command('bind f12 gs c toggle Idle set')
send_command('bind ^f8 input /ws "Sanguine Blade" <t>')
send_command('bind ^f9 input /ws "Chant du Cygne" <t>') -- ^ means cntrl, so hit cntrl + f9
send_command('bind ^f10 input /ws "Expiacion" <t>')
send_command('bind ^f11 input /ws "Requiescat" <t>')
send_command('bind ^f12 input /ws "Savage Blade" <t>')
send_command('bind !f7 gs c toggle DT set') -- ! means alt
send_command('bind !f8 gs c toggle DT') -- DT on or off
send_command('bind !f9 gs c toggle backwards')
send_command('bind !f10 gs c changemaccmab') -- Toggles macc and mab nuke sets
send_command('bind !f11 gs c toggle Club sets')
send_command('bind !f12 gs c lockgearindex') -- locks your gear in, but allows midcast changes.

send_command('bind !e input /item "Echo Drops" <me>')
send_command('bind !r input /item "Remedy" <me>')
send_command('bind !p input /item "Panacea" <me>')
send_command('bind !h input /item "Holy Water" <me>')
send_command('bind !w input /equip ring2 "Warp Ring"; /echo Warping; wait 11; input /item "Warp Ring" <me>;')
send_command('bind !q input /equip ring2 "Dim. Ring (Holla)"; /echo Reisenjima; wait 11; input /item "Dim. Ring (Holla)" <me>;')
send_command('bind !t gs c toggle TH') -- alt + t toggles TH mode

--Unload Binds
function file_unload()
	send_command('unbind ^f8')
	send_command('unbind ^f9')
	send_command('unbind ^f10')
	send_command('unbind ^f11')
	send_command('unbind ^f12')
	send_command('unbind !f8')
	send_command('unbind !f9')
	send_command('unbind !f10')
	send_command('unbind !f11')
	send_command('unbind !f12')
	send_command('unbind f9')
	send_command('unbind f10')
	send_command('unbind f11')
	send_command('unbind f12')
	
	send_command('unbind !e')
	send_command('unbind !r')
	send_command('unbind !p')
	send_command('unbind !h')
	send_command('unbind !w')
	send_command('unbind !q')
	send_command('unbind !t')
end
--------------------------------------
--         Console Commands         --
--------------------------------------
function self_command(command)
	if command == 'togglelock' then
		if SetLocked == false then
			SetLocked = true
		msg("Equipment Set LOCKED !!!")
		else
			SetLocked = false
			msg("Equipment Set UNLOCKED!")
		end
	elseif command == 'lockgearindex' then
		if LockGearIndex == false then
			LockGearIndex = true
			LockGearSet = {
				ammo = player.equipment.ammo,
				head = player.equipment.head,
				neck = player.equipment.neck,
				ear1 = player.equipment.left_ear,
				ear2 = player.equipment.right_ear,
				body = player.equipment.body,
				hands = player.equipment.hands,
				ring1 = player.equipment.left_ring,
				ring2 = player.equipment.right_ring,
				back = player.equipment.back,
				waist = player.equipment.waist,
				legs = player.equipment.legs,
				feet = player.equipment.feet
			}
			msg("Gear Index Locked")
		else
			LockGearIndex = false
			msg("Gear Index Unlocked")
			if player.status == 'Engaged' then
				if DT == true then
					ChangeGear(sets.DT[sets.DT.index[DT_ind]])
				else
					ChangeGear(sets.TP[sets.TP.index[TP_ind]])
				end
			else
				ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
			end
		end
	end
	if command == 'toggle TP set' then
		if DT == true then
			DT_ind = DT_ind + 1
			if DT_ind > #sets.DT.index then DT_ind = 1 end
			send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
			ChangeGear(sets.DT[sets.DT.index[DT_ind]])
		elseif DT == false then
			TP_ind = TP_ind + 1
			if TP_ind > #sets.TP.index then TP_ind = 1 end
			send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
			if player.status == 'Engaged' then
				ChangeGear(sets.TP[sets.TP.index[TP_ind]])
			end
		end
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind + 1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to ' .. sets.Idle.index[Idle_ind] .. ' ----->')
		if player.status == 'Idle' then
			ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
		end
	elseif command == 'toggle CDC set' then
		CDC_ind = CDC_ind + 1
		if CDC_ind > #sets.CDC.index then CDC_ind = 1 end
		send_command('@input /echo <----- CDC Set changed to ' .. sets.CDC.index[CDC_ind] .. ' ----->')
	elseif command == 'toggle Other Sword sets' then
		SavageBlade_ind = SavageBlade_ind + 1
		Expiacion_ind = Expiacion_ind + 1
		Requiescat_ind = Requiescat_ind + 1
		if SavageBlade_ind > #sets.SavageBlade.index then SavageBlade_ind = 1 end
		if Expiacion_ind > #sets.Expiacion.index then Expiacion_ind = 1 end
		if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		send_command('@input /echo <----- Savage/Expiacion/Req Set changed to ' .. sets.SavageBlade.index[SavageBlade_ind] .. ' ----->')
	elseif command == 'toggle Club sets' then
		BlackHalo_ind = BlackHalo_ind + 1
		Realmrazer_ind = Realmrazer_ind + 1
		Judgement_ind = Judgement_ind + 1
		FlashNova_ind = FlashNova_ind + 1
		if BlackHalo_ind > #sets.BlackHalo.index then BlackHalo_ind = 1 end
		if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
		if Judgement_ind > #sets.Judgement.index then Judgement_ind = 1 end
		if FlashNova_ind > #sets.FlashNova.index then FlashNova_ind = 1 end
		send_command('@input /echo <----- All Club WS Sets changed to ' .. sets.BlackHalo.index[BlackHalo_ind] .. ' ----->')
	elseif command == 'toggle DT set' then
		DT_ind = DT_ind + 1
		if DT_ind > #sets.DT.index then DT_ind = 1 end
		send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
			if DT == true then
				ChangeGear(sets.DT[sets.DT.index[DT_ind]])
			end
	elseif command == 'toggle DT' then
		if DT == true then
			DT = false
			send_command('@input /echo <----- DT TP: [Off] ----->')
        else
			DT = true
			send_command('@input /echo <----- DT TP: [On] ----->')
		end
		status_change(player.status)
	elseif command == 'toggle TH' then
		if TH == true then
			TH = false
			send_command('@input /echo <----- Treasure Hunter TP: [Off] ----->')
        else
			TH = true
			send_command('@input /echo <----- Treasure Hunter TP: [On] ----->')
		end
		status_change(player.status)
	elseif command == 'toggle backwards' then
		if DT == true then
			DT_ind = DT_ind -1
        if DT_ind == 0 then
            DT_ind = #sets.DT.index
        end
        send_command('@input /echo <----- DT Set changed to ' .. sets.DT.index[DT_ind] .. ' ----->')
        ChangeGear(sets.DT[sets.DT.index[DT_ind]])
    elseif DT == false then
        TP_ind = TP_ind -1
        if TP_ind == 0 then
            TP_ind = #sets.TP.index
        end
		send_command('@input /echo <----- TP Set changed to ' .. sets.TP.index[TP_ind] .. ' ----->')
        if player.status == 'Engaged' then
            ChangeGear(sets.TP[sets.TP.index[TP_ind]])
        end
    end
	elseif command == 'changemaccmab' then
		MAB_ind = MAB_ind + 1
		if MAB_ind > #sets.BlueMagic.INT.index then MAB_ind = 1 end
		send_command('@input /echo <-----Blue Magic INT Type Changed To: ' .. sets.BlueMagic.INT.index[MAB_ind] .. '----->')
	elseif string.sub(command, 0, 4) == '-cd ' then     --If the first 4 characters of the command are '-cd '
        add_to_chat (30, string.sub(command, 5, string.len(command)))      --add everything after '-cd ' to a message in the chat
	end
	
end

--------------------------------------
--         Character States         --
--------------------------------------
function IdleState()
    if LockGearIndex then
		ChangeGear(LockGearSet)
	elseif DT == true then
		ChangeGear(sets.DT[sets.DT.index[DT_ind]])
	else
		ChangeGear(sets.Idle[sets.Idle.index[Idle_ind]])
	end
	
	if player.mpp <= 50 and Idle_ind == 1 then
        ChangeGear({waist = "Fucho-no-obi"})
    end
	
end

function RestingState()

end

function EngagedState()
    if LockGearIndex then
        ChangeGear(LockGearSet)
	elseif not LockGearIndex then
		if DT == true then
			ChangeGear(sets.DT[sets.DT.index[DT_ind]])
		else
			ChangeGear(sets.TP[sets.TP.index[TP_ind]])
		end
    end
end

-----------------------------
--      Spell control      --
-----------------------------
unusable_buff = {
	spell={'Charm','Mute','Omerta','Petrification','Silence','Sleep','Stun','Terror'},
    ability={'Amnesia','Charm','Impairment','Petrification','Sleep','Stun','Terror'}}
  --check_recast('ability',spell.recast_id)  check_recast('spell',spell.recast_id)
function check_recast(typ,id) --if spell can be cast(not in recast) return true
    local recasts = windower.ffxi['get_'..typ..'_recasts']()
    if id and recasts[id] and recasts[id] == 0 then
        return true
    else
        return false
    end
end

 --return true if spell/ability is unable to be used at this time
function spell_control(spell)
	if spell.type == "Item" then
		return false
	--Stops spell if you do not have a target
	elseif spell.target.name == nil and not spell.target.raw:contains("st") then
		return true
	--Stops spell if a blocking buff is active
	elseif spell.action_type == 'Ability' and spell.type ~= 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability) or not check_recast('ability',spell.recast_id)) then
		return true
	elseif spell.type == 'WeaponSkill' and player.tp < 1000 then
		return true
	elseif spell.type == 'WeaponSkill' and (has_any_buff_of(unusable_buff.ability)) then
		msg("Weapon Skill Canceled, Can't")
		return true
	elseif spell.action_type == 'Magic' and (has_any_buff_of(unusable_buff.spell)
      or not check_recast('spell',spell.recast_id)) then
		return true
    --Stops spell if you do not have enuf mp/tp to use
	elseif spell.mp_cost and spell.mp_cost > player.mp and not has_any_buff_of({'Manawell','Manafont'}) then
        msg("Spell Canceled, Not Enough MP")
		return true
	end
    --Calculate how many finishing moves your char has up to 6
	local fm_count = 0
	for i, v in pairs(buffactive) do
		if tostring(i):startswith('finishing move') or tostring(i):startswith('?????????') then
			fm_count = tonumber(string.match(i, '%d+')) or 1
		end
	end
    --Stops flourishes if you do not have enough finishing moves
	local min_fm_for_flourishes = {['Animated Flourish']=1,['Desperate Flourish']=1,['Violent Flourish']=1,['Reverse Flourish']=1,['Building Flourish']=1,
                                   ['Wild Flourish']=2,['Climactic Flourish']=1,['Striking Flourish']=2,['Ternary Flourish']=3,}
	if min_fm_for_flourishes[spell.en] then
		if min_fm_for_flourishes[spell.en] > fm_count and not buffactive[507] then
			return true
		end
	end
	--Reomves Sneak when casting Spectral Jig
	if spell.en == 'Spectral Jig' then
		send_command('cancel 71')
	end
	if player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 7 and spell.type == 'WeaponSkill' then
		msg("Weapon Skill Canceled  Target Out of Range")
		return true
	end
end

-----------------------------
--         Precast         --
-----------------------------
function pc_JA(spell, act)
	if spell.english == 'Azure Lore' then
		ChangeGear(sets.JA.AzureLore)
	elseif spell.english == 'Provoke' then
		ChangeGear(sets.JA.Provoke)
	elseif spell.english == 'Warcry' then
		ChangeGear(sets.JA.Warcry)
	end
	
	IgnoreWS = S { "Sanguine Blade", "Red Lotus Blade", "Seraph Blade", "Flash Nova", "Realmrazer" } -- Excluded from Moonshade TP override rule.
	
	if spell.type == 'WeaponSkill' then
		if spell.english == 'Requiescat' then
			ChangeGear(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
		elseif spell.english == 'Chant du Cygne' or spell.english == 'Vorpal Blade' then
			ChangeGear(sets.CDC[sets.CDC.index[CDC_ind]])
		elseif spell.english == 'Expiacion' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Savage Blade' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'True Strike' or spell.english == 'Judgment' then
			ChangeGear(sets.Expiacion[sets.Expiacion.index[Expiacion_ind]])
		elseif spell.english == 'Realmrazer' then
			ChangeGear(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
		elseif spell.english == 'Judgement' then
			ChangeGear(sets.Judgement[sets.Judgement.index[Judgement_ind]])
		elseif spell.english == 'Black Halo' then
			ChangeGear(sets.BlackHalo[sets.BlackHalo.index[BlackHalo_ind]])
		elseif spell.english == 'Flash Nova' or spell.english == 'Red Lotus Blade' or spell.english == 'Seraph Blade' then
			ChangeGear(sets.FlashNova[sets.FlashNova.index[FlashNova_ind]])
		elseif spell.english == 'Circle Blade' then
			ChangeGear(sets.CircleBlade)
		elseif spell.english == 'Sanguine Blade' then
			ChangeGear(sets.SanguineBlade)
		end
		if player.tp > 2025 and player.equipment.main == 'Sequence' and buffactive['TP Bonus'] then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !!!!")
			end
		elseif player.tp > 2275 and player.equipment.main == 'Sequence' then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !!!")
			end
		elseif player.tp > 2550 and buffactive['TP Bonus'] then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !!")
			end
		elseif player.tp > 2775 then
			if IgnoreWS:contains(spell.english) then
				do return end
			else
				equip(set_combine(equipSet, { ear1 = "Ishvara Earring" }))
				msg("Ishvara Earring equiped !")
			end
		end
	elseif player.tp >= 1000 and player.target and player.target.distance and player.target.distance > 8 and spell.type == 'WeaponSkill' then
		cancel_spell()
		msg("Weapon Skill Canceled  Target Out of Range")
	end

    if spell.type == 'Step' then
        ChangeGear(set_combine(sets.TP.AccuracyFull, sets.Utility.TH))
    elseif spell.english == 'Animated Flourish' then
        ChangeGear(sets.BlueMagic.Enmity)
    end
end

function pc_Magic(spell, act)
	if spell.skill == 'Blue Magic' then
		ChangeGear(sets.precast.FastCast.Blue)
	else
		ChangeGear(sets.precast.FastCast.Standard)
	end
end

function pc_Item(spell, act)
end


-----------------------------
--         Midcast         --
-----------------------------
function mc_JA(spell, act)
end

function mc_Magic(spell, act)
	if spell.skill == 'Healing Magic' then
		if spell.target and spell.target.type == 'SELF' then
			ChangeGear(sets.BlueMagic.SelfCures)
		else
			ChangeGear(sets.BlueMagic.Cures)
		end
	end
	if spell.skill == 'Enhancing Magic' then
		if spell.english == 'Refresh' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif string.find(spell.english,'Shell') or string.find(spell.english,'Protect') then
			ChangeGear(sets.Enhancing.ProShell)
		elseif spell.english=="Phalanx" then
			ChangeGear(sets.Enhancing.Phalanx)
		elseif spell.english=="Aquaveil" then
			ChangeGear(sets.Enhancing.Aquaveil)
		else
			ChangeGear(sets.Enhancing)
		end
	end
	if spell.skill == 'Divine Magic' then
		if spell.english == 'Flash' then
			ChangeGear(sets.BlueMagic.Enmity)
		else
			ChangeGear(sets.BlueMagicMagicAccuracy)
		end
	end
	if spell.skill == 'Enfeebling Magic' then
		ChangeGear(sets.BlueMagic.MagicAccuracy)
	end
	if spell.skill == 'Dark Magic' then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
	elseif spell.skill == 'Elemental Magic' then
		ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
	end
	if spell.skill == 'Blue Magic' then
		if spell.english == 'Battery Charge' then
			ChangeGear(sets.BlueMagic.Battery)
		elseif spell.english == 'Regeneration' or string.find(spell.english,'Regen') then
			ChangeGear(sets.BlueMagic.Regeneration)
		else
			ChangeGear(sets.precast.FastCast.Blue)
		end
	end
		if BlueMagic_Diffusion:contains(spell.english) then
			ChangeGear(sets.JA.Diffusion)
		end
		
		if PhysicalSpells:contains(spell.english) then
			if PhysicalBlueMagic_STR:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STR)
			elseif PhysicalBlueMagic_DEX:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRDEX)
			elseif PhysicalBlueMagic_VIT:contains(spell.english) then
				ChangeGear(sets.BlueMagic.STRVIT)
			elseif PhysicalBlueMagic_AGI:contains(spell.english) then
				ChangeGear(sets.BlueMagic.AGI)
			elseif BlueMagic_PhysicalAcc:contains(spell.english) then
				ChangeGear(sets.BlueMagic.HeavyStrike)
			end
			if buffactive['Chain Affinity'] then
				ChangeGear(sets.JA.ChainAffinity)
			end
			if buffactive['Efflux'] then
				ChangeGear(sets.JA.Efflux)
			end
		end
		
		        if MagicalSpells:contains(spell.english) then
            if BlueMagic_INT:contains(spell.english) then
                ChangeGear(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]])
            elseif BlueMagic_Dark:contains(spell.english) then
                ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]],{head = "Pixie Hairpin +1", ring1 = "Archon Ring"}))
            elseif BlueMagic_Light:contains(spell.english) then
					ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]],{
					--	ring2 = "Weatherspoon Ring"
					}))
            elseif BlueMagic_Earth:contains(spell.english) then
                ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]],{
				--	neck = "Quanpur Necklace"
				}))
            end
			
            if buffactive['Burst Affinity'] then
                ChangeGear(sets.JA.BurstAffinity)
            end
            if world.day_element == spell.element or world.weather_element == spell.element then
                ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], { waist = 'Hachirin-no-Obi' }))
            end
        end

		if BlueMagic_Accuracy:contains(spell.english) then
			ChangeGear(sets.BlueMagic.MagicAccuracy)
		elseif BlueMagic_Stun:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Stun)
		elseif BlueMagic_Enmity:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Enmity)
		elseif BlueMagic_Buffs:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Buffs)
		elseif BlueMagic_Skill:contains(spell.english) then
			ChangeGear(sets.BlueMagic.Skill)
		elseif buffactive.Diffusion then
			ChangeGear(sets.JA.Diffusion)
		elseif spell.english == 'White Wind' then
			ChangeGear(sets.BlueMagic.WhiteWind)
		elseif BlueMagic_Healing:contains(spell.english) then 
			if spell.target and spell.target.type == 'SELF' then
				ChangeGear(sets.BlueMagic.SelfCures)
			else
				ChangeGear(sets.BlueMagic.Cures)
			end
		end
	end	


function mc_Item(spell, act)
end


------------------------------------------
-- After Cast               --
------------------------------------------
function ac_JA(spell)
end

function ac_Magic(spell)
end

function ac_Item(spell)
end

function ac_Global()
    if LockGearIndex == true then
        ChangeGear(LockGearSet)
        msg("Lock Gear is ON -- Swapping Gear")
    else
        if player.status == 'Engaged' then
            EngagedState()
        else
            IdleState()
        end
    end
end
---Based off of Spicyryan of Asura's .lua https://pastebin.com/u/Spicyryan
------------------------------------------
-- Framework Core            --
------------------------------------------
function status_change(new, old)
	if new == 'Idle' then
		IdleState()
	elseif new == 'Resting' then
		RestingState()
	elseif new == 'Engaged' then
		EngagedState();
	end
	
	if player.status == 'Engaged' and TH == true then
		ChangeGear(set_combine(equipSet, sets.Utility.TH))			
	end
	
	if DT == true then
		ChangeGear(sets.DT[sets.DT.index[DT_ind]])
	end
end

function precast(spell, act)
    if spell_control(spell) then
        cancel_spell()
        return
    end
    if spell.action_type == 'Ability' then 
        pc_JA(spell, act)
    elseif spell.action_type == 'Magic' then
        pc_Magic(spell, act)
    else
        pc_Item(spell, act)
    end
end

function midcast(spell, act)
	if spell.action_type == 'Ability' then
		mc_JA(spell, act)
	elseif spell.action_type == 'Magic' then 
		if TH == true and player.status == 'Idle' then
			if BlueMagic_Buffs:contains(spell.english) or BlueMagic_Diffusion:contains(spell.english) or BlueMagic_Healing:contains(spell.english) or BlueMagic_Skill:contains(spell.english) or spell.skill == 'Enhancing Magic' or spell.skill == 'Healing Magic' then
				mc_Magic(spell, act)
			elseif PhysicalSpells:contains(spell.english) then
				ChangeGear(set_combine(sets.BlueMagic.STR, sets.Utility.TH))
			elseif MagicalSpells:contains(spell.english) then
				ChangeGear(set_combine(sets.BlueMagic.INT[sets.BlueMagic.INT.index[MAB_ind]], sets.Utility.TH))
			end
		else 
			mc_Magic(spell, act)
		end
	else
		mc_Item(spell, act)
	end

end

function aftercast(spell, act, spellMap, eventArgs)
	if spell.action_type == 'Ability' then
		ac_JA(spell)
	elseif spell.action_type == 'Magic' then
		ac_Magic(spell)
	else
		ac_Item(spell)
	end
	ac_Global()
	
	--Countdowns--
	if not spell.interrupted then
		if spell.english == "Sheep Song" then
			send_command('wait 30;gs c -cd '..spell.name..': [Off In 10~30 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~20 Seconds!]')
		elseif spell.english == "Dream Flower" or spell.english == "Yawn" then
			send_command('wait 80;gs c -cd '..spell.name..': [Off In 10~40 Seconds!];wait 10;gs c -cd '..spell.name..': [Off In 0~30 Seconds!]')
        end 
	end
	
end

function ChangeGear(GearSet)
	equipSet = GearSet
	equip(GearSet)
end

function LockGearSet(GearSet)
	LockedEquipSet = GearSet
	equip(GearSet)
	SetLocked = true
end

function UnlockGearSet()
	locked = false
	equip(equipSet)
end

function msg(str)
	send_command('@input /echo <----- ' .. str .. ' ----->')
end

---End of Rules---------------------------------------------------------------------------------------------------------------------------------------------------------