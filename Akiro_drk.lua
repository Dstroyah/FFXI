--[[ Info
Commands
	//gs debugmode
	//gs showswaps
	//gs validate - looks for gear in your sets that isnt in inventory.

-- Scythe Light:
	Insurgency > Vorpal Scythe > Entropy > Guillotine > Entropy > Insurgency 
	Vorpal Scythe > Entropy > Guillotine > Entropy > Insurgency 
	Entropy > Guillotine > Entropy > Insurgency 
	Guillotine > Entropy > Insurgency
	
-- Scythe Darkness: 
    Insurgency (M) > Vorpal Scythe > Vorpal Scythe > Insurgency (M) > Entropy (MM) > Cross Reaper
    Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM)
	Cross Reaper > Insurgency (M) > Entropy (MM) > Cross Reaper
    Insurgency (M) > Entropy (MM) > Cross Reaper
	Cross Reaper > Entropy (MM)
    Entropy (MM) > Cross Reaper

-- Apoc Darkness
    Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM) > Catastrophe (R)
    Entropy (MM) > Guillotine > Entropy (MM) > Cross Reaper > Entropy (MM)
    Insurgency (M) > Entropy (MM) > Cross Reaper > Catastrophe (R)
	Insurgency (M) > Catastrophe (R) > Cross Reaper > Catastrophe (R)
	Cross Reaper > Insurgency (M) > Catastrophe (R) > Cross Reaper
	Catastrophe (R) > Cross Reaper > Catastrophe (R)
	Insurgency (M) > Catastrophe (R) > Cross Reaper
	Cross Reaper > Catastrophe (R) > Catastrophe (R)
    Cross Reaper > Entropy (MM) > Catastrophe (R)
	Entropy (MM) > Cross Reaper > Catastrophe (R)
    Catastrophe (R) > Catastrophe (R)
    Catastrophe (R) > Cross Reaper
    Cross Reaper > Catastrophe (R)

-- Other Light
	Catastrophe (R) > Savage Blade (Q) > Insurgency (M)
    Entropy (MM) > Savage Blade (Q) > Insurgency (M)
	Savage Blade (Q) > Insurgency (M)
	Chant du Cygne (E) > Torcleaver (E)

-- Other Dark
	Atonement (M) > Entropy (MM) > Cross Reaper
	Savage Blade (Q) > Cross Reaper > Entropy (MM)
	Chant du Cygne (E) > Catastrophe (R)
	Chant du Cygne (E) > Entropy (MM)
    Requiescat (MM) > Cross Reaper
	Requiescat (MM) > Torcleaver (E)

-- GreatSword
    Resolution (MM) > Torcleaver (E) > Scourge (R) > Resolution (MM) > Torcleaver (E)
	Resolution (MM) > Torcleaver (E) > Scourge (R) > Resolution (MM)
    Resolution (MM) > Scourge (R) > Torcleaver (E)
	Scourge (R) > Resolution (MM) > Torcleaver (E)
	Torcleaver (E) > Torcleaver (E)
	Scourge (R) > Resolution (MM)
--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
	 -- Load and initialize the include file.
    include('Mote-Include.lua')
	--include('organizer-lib')
end

function binds_on_load()
-- F9-F12
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f10 gs c cycle HybridMode')
	send_command('bind f11 gs c cycle CastingMode')
	send_command('bind f12 gs c cycle IdleMode')
-- ALT F9-12
	send_command('bind !f9 gs c update user')
	send_command('bind !f10 gs c cycle RangedMode')
	send_command('bind !f11 gs c cycle WeaponskillMode')
	send_command('bind !f12 gs c cycle Kiting')
	send_command('bind ^- gs c cycle Auto_ws')
end
 
-- Setup vars that are user-independent.
function job_setup()
    state.Buff.Aftermath = buffactive.Aftermath or false
    state.Buff.Souleater = buffactive.Souleater or false
	state.Buff['Dark Seal'] = buffactive['Dark Seal'] or false
	state.Buff['Last Resort'] = buffactive['Last Resort'] or false
	state.Buff['Doom'] = buffactive['Doom'] or false
	state.Buff['Curse'] = buffactive['Curse'] or false

	state.Auto = M{['description']='Auto', 'Normal', 'WS' }
	auto_ws = "['Resolution']"
	Apoc_weapons = S{'Apocalypse'}
	GS_weapons = S{'Ragnarok', 'Montante +1', 'Caladbolg'}
	Anguta_weapons = S{'Anguta'}
	Lib_weapons = S{'Liberator'}
    
	send_command('wait 10;input /lockstyleset 001')
	 
	get_combat_form()
	get_combat_weapon()

	LowTierNuke = S{
		'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
		'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
		'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
		
	Absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-ACC', 'Absorb-TP'}
		
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc')
    state.WeaponskillMode:options('Normal', 'Acc', 'Fotia')
    state.HybridMode:options('Normal', 'DamageTaken')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','DamageTaken')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
	if binds_on_unload then
		binds_on_unload()
	end
end

-- Define sets and vars used by this job file.
function init_gear_sets()
-- Precast sets
    sets.precast.JA['Diabolic Eye'] = {hands="Fallen's Finger Gauntlets"}
    sets.precast.JA['Arcane Circle'] = {feet="Chaos sollerets"}
    sets.precast.JA['Nether Void'] = {legs="Heathen's flanchard +1"}
    sets.precast.JA['Souleater'] = {head="Ignominy Burgonet +2"}
    sets.precast.JA['Last Resort'] = {feet="Fallen's Sollerets +1", back="Ankou's Mantle"}
    sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +2"}
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +1"}
	sets.precast.JA['Dark Seal']    = {head="Fallen's burgeonet +1"}

-- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo="Seething Bomblet +1",
        head="Loess Barbuta +1", body="Sulevia's Platemail +2",
        back="Moonbeam Cape", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +2", waist="Flume Belt +1",
        legs="Sulevia's Cuisses +2", feet="Amm Greaves",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Odnowa Earring +1", ear2="Odnowa Earring"}

-- Fast cast sets for spells
    sets.precast.FC = {
	ammo="Impatiens",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Found. Breastplate", augments={'Accuracy+13','Mag. Acc.+14','Attack+13','"Mag.Atk.Bns."+13',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Enif Cosciales",
    feet={ name="Odyssean Greaves", augments={'Accuracy+8','"Fast Cast"+5','AGI+9','Mag. Acc.+15','"Mag.Atk.Bns."+6',}},
    neck="Orunmila's Torque",
    waist="Dynamic Belt +1",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Ankou's Mantle", augments={'"Fast Cast"+10',}},
}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		head=empty, body="Twilight Cloak"})

-- Midcast Sets
    sets.midcast.FastRecast = {
	ammo="Impatiens",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body={ name="Found. Breastplate", augments={'Accuracy+13','Mag. Acc.+14','Attack+13','"Mag.Atk.Bns."+13',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+9','Mag. Acc.+5','"Mag.Atk.Bns."+6','"Fast Cast"+1',}},
    legs="Enif Cosciales",
    feet={ name="Odyssean Greaves", augments={'Accuracy+8','"Fast Cast"+5','AGI+9','Mag. Acc.+15','"Mag.Atk.Bns."+6',}},
    neck="Orunmila's Torque",
    waist="Dynamic Belt +1",
    left_ear="Infused Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Ankou's Mantle", augments={'"Fast Cast"+10',}},
	}

-- Specific spells
    sets.midcast['Dark Magic'] = {
    ammo="Pemphredo Tathlum",
    body="Lugra Cloak",
    hands="Fallen's finger gauntlets +1",
    legs={ name="Odyssean Cuisses", augments={'"Drain" and "Aspir" potency +9','"Store TP"+5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet="Ratri Sollerets",
    neck="Erra pendant",
    waist="Austerity belt +1",
    left_ear="Dark Earring",
    right_ear="Dignitary's earring",
    left_ring="Evanescence Ring",
    right_ring="Excelsis Ring",
    back="Niht mantle",
	}
	sets.midcast['Dark Magic'].Resistant = set_combine(sets.midcast['Dark Magic'], {
	ammo="Pemphredo Tathlum",
    body="Lugra Cloak",
    hands="Fallen's finger gauntlets +1",
    legs={ name="Odyssean Cuisses", augments={'"Drain" and "Aspir" potency +9','"Store TP"+5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet="Ratri Sollerets",
    neck="Erra pendant",
    waist="Austerity belt +1",
    left_ear="Dark Earring",
    right_ear="Dignitary's earring",
    left_ring="Evanescence Ring",
    right_ring="Excelsis Ring",
    back="Niht mantle",
	})
	
    sets.midcast['Enfeebling Magic'] = {
    ammo="Pemphredo Tathlum",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Pet: DEX+1','"Cure" potency +11%','Accuracy+10 Attack+10','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Gwati Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Sangoma Ring",
    back={ name="Niht Mantle", augments={'Attack+12','Dark magic skill +10','"Drain" and "Aspir" potency +21',}},
	}
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask +1", body="Flamma Korazin +1",
        hands="Flamma Manopolas +1", ear1="Dignitary's Earring",
		legs="Flamma Dirs +1"})

-- Based on HP when casted.
    sets.midcast['Dread Spikes'] = {
    ammo="Charitoni Sling",
    head={ name="Odyssean Helm", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','STR+13','Accuracy+13',}},
    body="Ignominy Cuirass +3",
    hands="Macabre Gaunt. +1",
    legs="Ig. Flanchard +3",
    feet="Ratri Sollerets",
    neck="Sanctity Necklace",
    waist="Carrier's Sash",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back="Xucau Mantle",
}

-- Absorbs
    sets.midcast.Absorb = {
    ammo="Pemphredo Tathlum",
    head="Ignominy burgonet +2",
    body="Ignominy Cuirass +3",
    hands="Flam. Manopolas +1",
    legs="Flamma Dirs +1",
    feet="Ratri Sollerets",
    neck="Erra pendant",
    waist="Hachirin-no-Obi",
    left_ear="Dignitary's earring",
    right_ear="Gwati Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring",
    back="Niht mantle",
}

    sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb, {hands="Heathen's Gauntlets +1"})
	sets.midcast['Absorb-TP'].Resistant = set_combine(sets.midcast.Absorb.Resistant, {hands="Heathen's Gauntlets +1"})

	sets.midcast.Stun = {	
	ammo="Pemphredo Tathlum",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Pet: DEX+1','"Cure" potency +11%','Accuracy+10 Attack+10','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    feet="Flam. Gambieras +2",
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Gwati Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Sangoma Ring",
	}

	sets.midcast.Stun.Resistant =set_combine(sets.midcast.Stun, {
		ammo="Pemphredo Tathlum", body="Flamma Korazin +1",
        hands="Flamma Manopolas +1", feet="Ignominy Sollerets +3",
		legs="Flamma Dirs +1", neck="Incanter's Torque",
		ear1="Dignitary's Earring"})
		
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
	ammo="Pemphredo Tathlum",
    head={ name="Fall. Burgeonet +1", augments={'Enhances "Dark Seal" effect',}},
    body="Carmine scale mail",
    hands={ name="Fall. Fin. Gaunt. +1", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Odyssean Cuisses", augments={'"Drain" and "Aspir" potency +9','"Store TP"+5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet="Ratri Sollerets",
    neck="Erra Pendant",
    waist="Hachirin-no-Obi",
    left_ear="Dark Earring",
    right_ear="Digni. Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Niht Mantle", augments={'Attack+11','Dark magic skill +5','"Drain" and "Aspir" potency +25',}},
})
	
	sets.midcast.Drain.Resistant = set_combine(sets.midcast['Dark Magic'].Resistant, {
	ammo="Pemphredo Tathlum",
    head={ name="Fall. Burgeonet +1", augments={'Enhances "Dark Seal" effect',}},
    body="Carmine scale mail",
    hands={ name="Fall. Fin. Gaunt. +1", augments={'Enhances "Diabolic Eye" effect',}},
    legs={ name="Odyssean Cuisses", augments={'"Drain" and "Aspir" potency +9','"Store TP"+5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
    feet="Ratri Sollerets",
    neck="Erra Pendant",
    waist="Austerity Belt +1",
    left_ear="Dark Earring",
    right_ear="Digni. Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Niht Mantle", augments={'Attack+11','Dark magic skill +5','"Drain" and "Aspir" potency +25',}},
	})

	sets.midcast['Drain III'] = sets.midcast.Drain
	sets.midcast['Drain III'].Resistant = sets.midcast.Drain.Resistant
		
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty, body="Twilight Cloak"})
	sets.midcast.Impact.Resistant = set_combine(sets.midcast['Dark Magic'].Resistant, {head=empty, body="Twilight Cloak"})

-- Elemental Magic sets are default for handling low-tier nukes.
	sets.midcast.LowTierNuke = {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask", body="Carmine Scale Mail",
		back="Izdubar Mantle", neck="Sanctity Necklace",
		hands="Carmine Finger Gauntlets +1", waist="Eschan Stone",
		legs="Eschite Cuisses",feet=Ody_MAB_feet,
		ring1="Shiva Ring +1", ring2="Shiva Ring +1",
		ear1="Crematio Earring", ear2="Friomisi Earring"}

	sets.midcast.LowTierNuke.Resistant = {
        ammo="Pemphredo Tathlum",
        head="Carmine Mask", body="Carmine Scale Mail",
        back=Ank_FC, neck="Sanctity Necklace",
        hands="Leyline Gloves", waist="Eschan Stone",
        legs="Eschite Cuisses",feet=Ody_MAB_feet,
        ring1="Shiva Ring +1", ring2="Shiva Ring +1",
        ear1="Crematio Earring", ear2="Friomisi Earring"}

	-- Custom classes for high-tier nukes.
	sets.midcast.HighTierNuke = sets.midcast.LowTierNuke
	sets.midcast.HighTierNuke.Resistant = sets.midcast.LowTierNuke.Resistant

-- Resting sets
	sets.resting = {
		ammo="Ginsen",
        head="", 
		body="Lugra Cloak +1",
        back="Moonbeam Cape", neck="Sanctity Necklace",
        hands="Sulevia's Gauntlets +2", waist="Flume Belt +1",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Sheltered Ring", ring2="Paguroidea Ring",
        ear1="Infused Earring", ear2="Genmei Earring"}

-- Idle sets
    sets.idle = {
	ammo="Staunch Tathlum",
    head={ name="Valorous Mask", augments={'Weapon Skill Acc.+8','Accuracy+5','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Emicho Haubert +1",
    hands="Sulevia's gauntlets +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulevia's leggings +2",
    neck="Sanctity Necklace",
    waist="Ioskeha Belt",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Moonbeam ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

    sets.idle.DamageTaken = {
	ammo="Staunch Tathlum",
    head={ name="Valorous Mask", augments={'Weapon Skill Acc.+8','Accuracy+5','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Flume Belt +1",
    left_ear="Dedition Earring",
    right_ear="Digni. Earring",
    left_ring="Moonbeam ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},	
	}

    sets.idle.Town = {
	ammo="Staunch Tathlum",
    head={ name="Valorous Mask", augments={'Weapon Skill Acc.+8','Accuracy+5','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    body="Emicho Haubert +1",
    hands="Sulevia's gauntlets +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulevia's Leggings +2",
    neck="Sanctity Necklace",
    waist="Flume Belt +1",
    left_ear="Infused Earring",
    right_ear="Ethereal Earring",
    left_ring="Moonbeam ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.idle.Weak = {
	ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body="Sulevia's Plate. +2",
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt",
    left_ear="Dedition Earring",
    right_ear="Digni. Earring",
    left_ring="Moonbeam ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.Kiting = {legs="Carmine Cuisses +1"}

-- Custom buff sets
	sets.Souleater = {head="Ignominy Burgonet +2"}
	sets['Last Resort'] = {}
	sets.Doom = {head="Twilight Helm", body="Twilight Mail", ring2="Purity Ring"}
	sets['Dark Seal'] = {head="Fallen's Burgeonet +1"}
	sets.Aftermath = {}

-- Earring considerations, given Lugra's day/night stats
    sets.BrutalLugra = { ear1="Brutal Earring", ear2="Lugra Earring +1" }
    sets.Lugra = { ear1="Lugra Earring +1" }

-- Engaged Sets
	--1044acc
	sets.engaged = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    legs="Ignominy Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal bead necklace +1",
    waist="Ioskeha Belt",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--1103acc
	sets.engaged.LowAcc = {
		ammo="Ginsen",
		head="Flamma Zucchetto +2", body=Val_QA_body,
		back=Ank_DA_TP, neck="Ganesha's Mala",
		hands="Sulevia's Gauntlets +2", waist="Ioskeha Belt",
		legs="Ignominy Flanchard +3", feet="Flamma Gambieras +1",
		ring1="Niqmaddu ring", ring2="Regal Ring",
		ear1="Brutal Earring", ear2="Dedition Earring"}
	--1165acc
	sets.engaged.MidAcc = {
		ammo="Ginsen",
		head=Arg_HQ_head, body=Val_DA_body,
		back=Ank_DA_TP, neck="Combatant's Torque",
		hands="Sulevia's Gauntlets +2", waist="Ioskeha Belt",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Niqmaddu ring", ring2="Regal ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1225acc
	sets.engaged.HighAcc = {
		ammo="Seething Bomblet +1",
		head="Ignominy Burgonet +3", body="Ignominy Cuirass +3",
		back=Ank_DA_TP, neck="Combatant's Torque",
		hands="Ignominy Gauntlets +2", waist="Olseni Belt",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Ramuh ring +1", ring2="Regal ring",
		ear1="Telos Earring", ear2="Mache Earring"}	

-- Liberator - Need 29stp for 5 hit. 76stp for 4hit.
	--1116acc 31stp 43da 8ta 8qa 22haste
	sets.engaged.Liberator = {
		ammo="Ginsen",
		head="Flamma Zucchetto +1", body=Val_QA_body,
		back=Ank_DA_TP, neck="Ganesha's Mala",
		hands=Arg_HQ_hands, waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet=Arg_HQ_feet,
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Brutal Earring", ear2="Dedition Earring"}
	--1157acc 32stp 44da 4ta 8qa 24haste
	sets.engaged.Liberator.LowAcc = {
		ammo="Ginsen",
		head=Arg_HQ_head, body=Val_QA_body,
		back=Ank_DA_TP, neck="Ganesha's Mala",
		hands=Arg_HQ_hands, waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet="Flamma Gambieras +1",
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1212acc 33stp 36da 4ta 5qa 21haste
	sets.engaged.Liberator.MidAcc = {
		ammo="Seething Bomblet +1",
		head=Arg_HQ_head, body=Val_DA_body,
		back=Ank_DA_TP, neck="Combatant's Torque",
		hands="Sulevia's Gauntlets +2", waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1297acc 33stp 12da 22haste
	sets.engaged.Liberator.HighAcc = {
		ammo="Seething Bomblet +1",
		head="Ignominy Burgonet +3", body="Ignominy Cuirass +3",
		back=Ank_STP, neck="Combatant's Torque",
		hands="Ignominy Gauntlets +2", waist="Olseni Belt",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Ramuh ring +1", ring2="Regal ring",
		ear1="Telos Earring", ear2="Mache Earring"}

-- Anguta - Need 26stp for 5 hit. 72stp for 4 hit.
	--1093acc 73stp 23da 8ta 6qa 22haste
	sets.engaged.Anguta = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    legs="Ignominy Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal bead necklace +1",
    waist="Ioskeha Belt",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--1155acc 73stp 27da 2ta 6qa 24haste
	sets.engaged.Anguta.LowAcc = {
		ammo="Ginsen",
		head=Arg_HQ_head, body=Val_QA_body,
		back=Ank_STP, neck="Combatant's Torque",
		hands=Arg_HQ_hands, waist="Windbuffet Belt +1",
		legs=Ody_STP_legs, feet="Flamma Gambieras +1",
		ring1="Niqmaddu Ring", ring2="Petrov Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1212acc 43stp 36da 4ta 5qa 21haste
	sets.engaged.Anguta.MidAcc = {
		ammo="Seething Bomblet +1",
		head=Arg_HQ_head, body=Val_DA_body,
		back=Ank_DA_TP, neck="Combatant's Torque",
		hands="Sulevia's Gauntlets +2", waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1297acc 43stp 12da 22haste
	sets.engaged.Anguta.HighAcc = {
		ammo="Seething Bomblet +1",
		head="Ignominy Burgonet +3", body="Ignominy Cuirass +3",
		back=Ank_STP, neck="Combatant's Torque",
		hands="Ignominy Gauntlets +2", waist="Olseni Belt",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Ramuh ring +1", ring2="Regal ring",
		ear1="Telos Earring", ear2="Mache Earring"}

-- Apocalypse - Need 33stp for 5 hit. 82stp for 4hit.
	--1180acc 33stp 41da 8ta 8qa 22haste
	sets.engaged.Apocalypse = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Found. Breastplate", augments={'Accuracy+13','Mag. Acc.+14','Attack+13','"Mag.Atk.Bns."+13',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Lissome Necklace",
    waist="Ioskeha Belt",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Flamma Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	--1217acc 37stp 44da 4ta 8qa 24haste
	sets.engaged.Apocalypse.LowAcc = {
		ammo="Ginsen",
		head=Arg_HQ_head, body=Val_QA_body,
		back=Ank_DA_TP, neck="Ganesha's Mala",
		hands=Arg_HQ_hands, waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet=Arg_HQ_feet,
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1272acc 33stp 36da 4ta 5qa 21haste
	sets.engaged.Apocalypse.MidAcc = {
		ammo="Seething Bomblet +1",
		head=Arg_HQ_head, body=Val_DA_body,
		back=Ank_DA_TP, neck="Combatant's Torque",
		hands="Sulevia's Gauntlets +2", waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1357acc 33stp 12da 22haste
	sets.engaged.Apocalypse.HighAcc = {
		ammo="Seething Bomblet +1",
		head="Ignominy Burgonet +3", body="Ignominy Cuirass +3",
		back=Ank_STP, neck="Combatant's Torque",
		hands="Ignominy Gauntlets +2", waist="Olseni Belt",
		legs="Ignominy Flanchard +3", feet=Val_STP_feet,
		ring1="Ramuh ring +1", ring2="Regal ring",
		ear1="Telos Earring", ear2="Mache Earring"}

-- GreatSword - Need 26stp for 6 hit. 62stp for 5 hit.
	--1109acc 31stp 43da 8ta 8qa 22haste
	sets.engaged.GreatSword = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    legs="Ignominy Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal bead necklace +1",
    waist="Ioskeha Belt",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--1150acc 32stp 44da 4ta 8qa 24haste	
	sets.engaged.GreatSword.LowAcc = {
		ammo="Ginsen",
		head=Arg_HQ_head, body=Val_QA_body,
		back=Ank_DA_TP, neck="Ganesha's Mala",
		hands=Arg_HQ_hands, waist="Windbuffet Belt +1",
		legs="Ignominy Flanchard +3", feet="Flamma Gambieras +1",
		ring1="Niqmaddu Ring", ring2="Hetairoi Ring",
		ear1="Telos Earring", ear2="Dedition Earring"}
	--1206acc 33stp 36da 4ta 5qa 21haste
	sets.engaged.GreatSword.MidAcc = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body="Emicho Haubert +1",
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','AGI+9','Accuracy+11','Attack+8',}},
    feet="Flam. Gambieras +2",
    neck="Sanctity Necklace",
    waist="Ioskeha Belt",
    left_ear="Mache Earring",
    right_ear="Digni. Earring",
    left_ring="Flamma Ring",
    right_ring="Begrudging Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	--1291acc 33stp 12da 22haste
	sets.engaged.GreatSword.HighAcc = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','AGI+9','Accuracy+11','Attack+8',}},
    feet="Flam. Gambieras +2",
    neck="Combatant's Torque",
    waist="Ioskeha Belt",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Petrov Ring",
    bback={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

-- Engaged DamageTaken
	sets.engaged.DamageTaken = {
	ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Ignominy Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	
	sets.engaged.LowAcc.DamageTaken = set_combine(sets.engaged.DamageTaken, {
	ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','AGI+9','Accuracy+11','Attack+8',}},
    feet="Flam. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	
	sets.engaged.MidAcc.DamageTaken = set_combine(sets.engaged.DamageTaken, {
	ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','AGI+9','Accuracy+11','Attack+8',}},
    feet="Flam. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	
	sets.engaged.HighAcc.DamageTaken = set_combine(sets.engaged.DamageTaken, {
	ammo="Staunch Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','AGI+9','Accuracy+11','Attack+8',}},
    feet="Flam. Gambieras +2",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Mache Earring +1",
    left_ring="Moonbeam Ring",
    right_ring="Defending Ring",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	
	-- Liberator DamageTaken
	sets.engaged.Liberator.DamageTaken = sets.engaged.DamageTaken
	sets.engaged.Liberator.LowAcc.DamageTaken = sets.engaged.LowAcc.DamageTaken
	sets.engaged.Liberator.MidAcc.DamageTaken = sets.engaged.MidAcc.DamageTaken
	sets.engaged.Liberator.HighAcc.DamageTaken = sets.engaged.HighAcc.DamageTaken
	-- Anguta DamageTaken
	sets.engaged.Anguta.DamageTaken = sets.engaged.DamageTaken
	sets.engaged.Anguta.LowAcc.DamageTaken = sets.engaged.LowAcc.DamageTaken
	sets.engaged.Anguta.MidAcc.DamageTaken = sets.engaged.MidAcc.DamageTaken
	sets.engaged.Anguta.HighAcc.DamageTaken = sets.engaged.HighAcc.DamageTaken
	-- Apocalypse DamageTaken
	sets.engaged.Apocalypse.DamageTaken = sets.engaged.DamageTaken
	sets.engaged.Apocalypse.LowAcc.DamageTaken = sets.engaged.LowAcc.DamageTaken
	sets.engaged.Apocalypse.MidAcc.DamageTaken = sets.engaged.MidAcc.DamageTaken
	sets.engaged.Apocalypse.HighAcc.DamageTaken = sets.engaged.HighAcc.DamageTaken		
	-- GreatSword DamageTaken
	sets.engaged.GreatSword.DamageTaken = sets.engaged.DamageTaken
	sets.engaged.GreatSword.LowAcc.DamageTaken = sets.engaged.LowAcc.DamageTaken
	sets.engaged.GreatSword.MidAcc.DamageTaken = sets.engaged.MidAcc.DamageTaken
	sets.engaged.GreatSword.HighAcc.DamageTaken = sets.engaged.HighAcc.DamageTaken

-- Weaponskill sets
	sets.precast.WS = {
	head={ name="Argosy Celata", augments={'STR+10','DEX+10','Attack+15',}},
    body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}},
    feet={ name="Argosy Sollerets", augments={'STR+10','DEX+10','Attack+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Zwazo Earring",
    right_ear="Brutal Earring",
    left_ring="Ifrit Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}

-- Insurgency - FTP 0.5, 3.25, 6.0 - STR 20%, INT 20% -- Fusion/Compression
	sets.precast.WS['Insurgency'] = {
	ammo="Seeth. Bomblet +1",
    head={ name="Odyssean Helm", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','STR+13','Accuracy+13',}},
    body="Ignominy Cuirass +3",
    hands={ name="Valorous Mitts", augments={'Accuracy+3','Weapon skill damage +5%','STR+4','Attack+6',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+22','Weapon skill damage +5%','STR+7','Accuracy+3',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Niqmaddu ring",
    right_ring="Shukuyu Ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

-- Entropy - FTP 0.75, 1.25, 2.0, - INT 85% -- Gravitation/Reverberation
	sets.precast.WS['Entropy'] = {
	ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Metalsinger Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}
		
-- Catastrophe - FTP 2.75 - STR 40%, INT 40% - WSdmg% -- Darkness/Gravitation
	sets.precast.WS['Catastrophe'] = {
		ammo="Knobkierrie",
		head=Val_WSdmg_head, body="Ignominy Cuirass +3",
		back=Ank_WSdmg, neck="Caro Necklace",
		hands=Ody_WSdmg_hands, waist="Metalsinger Belt",
		legs="Ratri Cuisses", feet="Sulevia's Leggings +2",
		ring1="Niqmaddu Ring", ring2="Regal Ring",
		ear1="Ishvara Earring", ear2="Moonshade Earring"}
	sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS['Catastrophe'], {
		ammo="Seething Bomblet +1", ear1="Mache Earring",
		head="Ignominy Burgonet +3", legs="Ignominy Flanchard +3"})

-- Cross Reaper - FTP 2.75 - STR 40%, INT 40% - WSdmg% -- Darkness/Gravitation
	sets.precast.WS['Cross Reaper'] = {
	ammo="Knobkierrie",
    head={ name="Odyssean Helm", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','STR+13','Accuracy+13',}},
    body="Ignominy Cuirass +3",
    hands={ name="Valorous Mitts", augments={'Accuracy+3','Weapon skill damage +5%','STR+4','Attack+6',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+22','Weapon skill damage +5%','STR+7','Accuracy+3',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Metalsinger Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Shukuyu Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

-- Quietus - FTP 3.0, - STR 60% MND 60% - Triple Dmg, Ignores Defense -- Darkness/Distortion
	sets.precast.WS['Quietus'] = {
		ammo="Knobkierrie",
		head=Val_WSdmg_head, body="Ignominy Cuirass +3",
		back=Ank_WSdmg, neck="Caro Necklace",
		hands=Ody_WSdmg_hands, waist="Metalsinger Belt",
		legs="Ratri Cuisses", feet="Sulevia's Leggings +2",
		ring1="Niqmaddu Ring", ring2="Regal Ring",
		ear1="Ishvara Earring", ear2="Moonshade Earring"}
	sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Quietus'], {
		ammo="Seething Bomblet +1", ear1="Mache Earring",
		head="Ignominy Burgonet +3", legs="Ignominy Flanchard +3"})

-- Resolution - FTP .71, 1.5, 2.25, - STR 85% Multi Hit -- Fragmentation/Scission
	sets.precast.WS['Resolution'] = {
    ammo="Seeth. Bomblet +1",
    head="Flam. Zucchetto +2",
    body={ name="Argosy Hauberk +1", augments={'STR+12','Attack+20','"Store TP"+6',}},
    hands={ name="Argosy Mufflers +1", augments={'STR+20','"Dbl.Atk."+3','Haste+3%',}},
    legs={ name="Argosy Breeches +1", augments={'STR+12','Attack+25','"Store TP"+6',}},
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}

-- Torcleaver - FTP 4.75, 7.5, 10, - VIT 80% -- Light/Distortion
	sets.precast.WS['Torcleaver'] = {
	ammo="Knobkierrie",
    head={ name="Odyssean Helm", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','STR+13','Accuracy+13',}},
    body="Ignominy Cuirass +3",
    hands={ name="Odyssean Gauntlets", augments={'Attack+22','Weapon skill damage +4%','VIT+12','Accuracy+7',}},
    legs={ name="Odyssean Cuisses", augments={'Attack+22','Weapon skill damage +5%','STR+7','Accuracy+3',}},
    feet="Sulev. Leggings +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Shukuyu Ring",
    right_ring="Niqmaddu ring",
    back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
		
-- Scourge - FTP 3.0, - STR 40% VIT 40% -- Light/Fusion
	sets.precast.WS['Scourge'] = sets.precast.WS['Torcleaver']
	sets.precast.WS['Scourge'].Acc = sets.precast.WS['Torcleaver'].Acc
	
-- Savage - FTP 4.0, 10.25, 13.75 - MND 50% STR 50% - Fragmentation/Scission
	sets.precast.WS['Savage Blade'] = {
		ammo="Knobkierrie",
		head=Val_WSdmg_head, body="Ignominy Cuirass +3",
		back=Ank_WSdmg, neck="Caro Necklace",
		hands=Ody_WSdmg_hands, waist="Metalsinger Belt",
		legs=Ody_WSdmg_legs, feet="Sulevia's Leggings +2",
		ring1="Niqmaddu Ring", ring2="Regal Ring",
		ear1="Ishvara Earring", ear2="Moonshade Earring"}
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {
		ammo="Seething Bomblet +1", ear1="Mache Earring",
		head="Ignominy Burgonet +3", legs="Ignominy Flanchard +3"})

-- Judgment
	sets.precast.WS['Judgment'] = {
		ammo="Knobkierrie",
		head=Val_WSdmg_head, body="Ignominy Cuirass +3",
		back=Ank_WSdmg, neck="Caro Necklace",
		hands=Ody_WSdmg_hands, waist="Metalsinger Belt",
		legs=Ody_WSdmg_legs, feet="Sulevia's Leggings +2",
		ring1="Niqmaddu Ring", ring2="Regal Ring",
		ear1="Ishvara Earring", ear2="Moonshade Earring"}
	sets.precast.WS['Judgment'].Acc = set_combine(sets.precast.WS['Cross Reaper'], {
		ammo="Seething Bomblet +1", ear1="Mache Earring",
		head="Ignominy Burgonet +3", legs="Ignominy Flanchard +3"})
end

function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type:endswith('Magic') and buffactive.silence then
        eventArgs.cancel = true
        send_command('input /item "Echo Drops" <me>')
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)

end

function job_post_precast(spell, action, spellMap, eventArgs)
	-- Make sure abilities using head gear don't swap 
    if spell.type:lower() == 'weaponskill' then
        if player.tp > 2999 then
            equip(sets.BrutalLugra)
        else -- use Lugra + moonshade
		if world.time >= (17*60) or world.time <= (7*60) then
			equip(sets.Lugra)
		else
			-- do nothing.
		end
        end
    end
end

function job_pretarget(spell, action, spellMap, eventArgs)
    if state.Buff[spell.english] ~= nil then
        state.Buff[spell.english] = true
    end
    -- If autora enabled, use WS automatically at 100+ TP
    if spell.action_type == 'melee' then
        if player.tp >= 1000 and state.Auto.value == 'WS' and not buffactive.amnesia then
            cancel_spell()
            use_weaponskill()
        end
    end
end 

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- autora
    if state.Auto.value ~= 'Normal' then
        use_ra(spell)
    end

    if state.Buff[spell.name] ~= nil then
        state.Buff[spell.name] = not spell.interrupted or buffactive[spell.english]
    end

end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = ''
    if state.Auto.value ~= 'Normal' then
        msg = '[Auto: ON]['..state.Auto.value..']'
    else
        msg = '[Auto: OFF]'
    end

  
end


-- Job-specific hooks for standard casting events.
function job_midcast(spell, action, spellMap, eventArgs)
 
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' and spell.target.type == 'SELF' then
		equip(sets.midcast.CureSelf)
	end
	if buffactive['Dark Seal'] and S{"Drain III"}:contains(spell.english)then
        equip({head="Fallen's Burgeonet +1"})
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
 
end

function job_post_aftercast(spell, action, spellMap, eventArgs)

end

---------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
---------------------------------------------------------------------

-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)

end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff['Doom'] or state.Buff['Curse'] then
        idleSet = set_combine(idleSet, sets.Doom)
	end
	return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
	if state.Buff.Souleater then
		meleeSet = set_combine(meleeSet, sets.Souleater)
	end
	if state.Buff['Doom'] or state.Buff['Curse'] then
		meleeSet = set_combine(meleeSet, sets.Doom)
	end
	return meleeSet
end


---------------------------------------------------------------------
-- General hooks for other events.
---------------------------------------------------------------------

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)

end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
	if buff == "Souleater" then
        handle_equipping_gear(player.status)
    end
	if buff == "Doom" or buff == "Curse" then
		if gain then
			equip(sets.doom)
		else
			handle_equipping_gear(player.status)
		end
	end
end

----------------------------------------------------------------------
-- User code that supplements self-commands.
-----------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	get_combat_form()
	get_combat_weapon()
end

----------------------------------------------------------------------
-- Utility functions specific to this job.
-----------------------------------------------------------------------
function get_combat_form()
    -- Check Weapontype
	if  Apoc_weapons:contains(player.equipment.main) then
		state.CombatForm:set('Apocalypse')
	elseif
		Anguta_weapons:contains(player.equipment.main) then
		state.CombatForm:set('Anguta')
	elseif
		GS_weapons:contains(player.equipment.main) then
		state.CombatForm:set('GreatSword')
	elseif
		Lib_weapons:contains(player.equipment.main) then
		state.CombatForm:set('Liberator')
	else
		state.CombatForm:reset()
    end
end

function get_combat_weapon()
	if  Apoc_weapons:contains(player.equipment.main) then
		state.CombatWeapon:set('Apocalypse')
	elseif Anguta_weapons:contains(player.equipment.main) then
		state.CombatWeapon:set('Anguta')
	elseif GS_weapons:contains(player.equipment.main) then
		state.CombatWeapon:set('GreatSword')
	elseif
		Lib_weapons:contains(player.equipment.main) then
		state.CombatForm:set('Liberator')
	else -- Use regular set.
		state.CombatWeapon:reset()
    end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)

end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Dark Magic' and Absorbs:contains(spell.english) then
		return 'Absorb'
	end

	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
		if LowTierNuke:contains(spell.english) then
			return 'LowTierNuke'
		else
			return 'HighTierNuke'
		end
	end
end

function select_earring()
    if world.time >= (17*60) or world.time <= (7*60) then
        return sets.Lugra
    else
        -- do nothing
    end
end

function update_melee_groups()

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'RDM' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 2)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 2)
    else
        set_macro_page(1, 2)
    end
end

