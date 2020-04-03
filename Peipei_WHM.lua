-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('caster_buffWatcher.lua')
	include('common_info.status.lua')
	buffWatcher.watchList = {
                        ["Aquaveil"]="Aquaveil",
                        ["Haste"]="Haste",
                        ["Stoneskin"]="Stoneskin",
                        ["Phalanx"]="Phalanx",
                        ["Protect"]="Protect V",
                        ["Shell"]="Shell V",
						["Blink"]="Blink",
						["Regen"]="Regen IV",
                        }
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Misery')
	
	state.MagicBurst = M(false, 'Magic Burst')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells (main 4 + ammo 2 + head 10 + neck 5 + ear2 2 + body 14 + hands 5 + ring2 2 + back 10 + waist 3 + legs 6 + feet 7 = 70% + Light Arts 10% = 80%)
    sets.precast.FC = {main="Grioavolr",sub="Niobid Strap",ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},neck="Orunmila's Torque",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Lebeche Ring",ring2="Prolix Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Regal Pumps +1"}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"}) -- Dynasty Mitts

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat",hands="Carapacho Cuffs",waist="Siegel Sash"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

	-- - Cure Casting Time (head 10 + body 14 + back 10 + legs 12 + feet 18 = 64% - Gifts + 8 - Light Arts + 10 = 82%)
    sets.precast.FC.Cure = {
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},body="Inyanga Jubbah",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},legs="Ebers Pantaloons +1",feet="Hygieia Clogs +1"}
	-- Impatiens
		
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.CureMisery = sets.precast.FC.Cure
	sets.precast.FC.CureMelee = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +3"}
	sets.precast.JA['Afflatus Solace'] = {body="Ebers Bliaud +1",back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}}
	sets.precast.JA.Devotion = {head="Piety Cap +3"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Nahtirah Hat",neck="Unmoving Collar +1",ear2="Roundel Earring",ear1="Soil Pearl",
		body="Ebers Bliaud +1",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Titan Ring",ring2="Titan Ring",
		back="Iximulew Cape",waist="Warwolf Belt",legs="Lengo Pants",feet="Gendewitha Galoshes"}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
    sets.precast.WS = {
		head="Ebers Cap",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Ebers Bliaud +1",hands="Piety Mitts +3",ring1="Petrov Ring",ring2="Rufescent Ring",
		back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},waist="Fotia Belt",legs="Piety Pantaloons +3",feet="Medium's Sabots"}--Fanatic Gloves
    
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS,  {ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Chironic Doublet",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Fenrir Ring",ring2="Stikini Ring +1 +1",
		back={ name="Alaunus's Cape", augments={'STR+32','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},waist="Refoccilation Stone",legs="Lengo Pants",feet="Medium's Sabots"})--Fanatic Gloves
		
	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS,   {
		head="Ebers Cap",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Chironic Doublet",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Levia. Ring",ring2="Rufescent Ring",
		back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},waist="Fotia Belt",legs="Lengo Pants",feet="Medium's Sabots"})--Fanatic Gloves
		
	sets.precast.WS['Hexa Strike'] = {
		head="Piety Cap +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
		body="Piety Briault +3",hands="Piety Mitts +3",ring1="Ilabrat Ring",ring2="Begrudging Ring",
		back={ name="Alaunus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},waist="Fotia Belt",legs="Piety Pantaloons +3",feet="Piety Duckbills +3"}
		
	sets.precast.WS['Mystic Boon'] = {
		head="",
		}
    
	sets.precast.WS['Black Halo'] = {
		head="",
		}

    -- Midcast Sets
    
    sets.midcast.FastRecast = {ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},neck="Orunmila's Torque",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Lebeche Ring",ring2="Prolix Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Witful Belt",legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},feet="Chelona Boots",}
		-- Enchanter's Earring +1
    
    -- Cure sets
    gear.default.obi_waist = "Hachirin-no-Obi"
    gear.default.obi_back = "Mending Cape"

	-- Cure Potency = (main 10 + sub 3 + head 17 + ring1 3 + back 10 + feet 10 = 53%) Cure Potency II = (main 2 + ear2 2 + hands 4 = 8%)
	-- -Enmity = Merits 5 (main 10 + head 6 + ear1 3 + ear2 5 + hands 7 + ring1 5 + feet 10 = 51 / 50)
    sets.midcast.CureSolace = set_combine(sets.midcast.FastRecast,   {main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},sub="Ammurapi Shield",ammo="Hydrocera",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},neck="Incanter's Torque",ear1="Halasz Earring",ear2="Glorious Earring",
		body="Ebers Bliaud +1",hands="Theophany Mitts +3",ring1="Lebeche Ring",ring2="Sirona's Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15',}},waist="Witful Belt",legs="Ebers Pantaloons +1",feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}})
	
	-- Cure Potency = Head 17 + Neck 7 + ear1 3 + ring1 3 + back 10 + feet 10 = 50% Cure Potency II = ear2 2 + body 6 + hands 4 = 12%
	-- -Enmity = Merits 5 + head 6 + neck 10 + ear2 5 + body 6 + hands 7 + ring1 5 + feet 10 = 54 -Enmity
	sets.midcast.CureMisery = {main="Yagrush",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},neck="Cleric's Torque +1",ear1="Nourishing Earring +1",ear2="Glorious Earring",
		body="Theophany Briault +3",hands="Theophany Mitts +3",ring1="Lebeche Ring",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15',}},waist="Carrier's Sash",legs="Ebers Pantaloons +1",feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}}
		
    sets.midcast.Cure = sets.midcast.CureSolace
	
	sets.midcast.storm_active = set_combine(sets.midcast.CureSolace, {waist="Hachirin-no-obi"})

	-- Cure Potency = (main 15 + head 17 + ear1 7 + ring1 3 + back 10 + feet 10 = 62%) Cure Potency II = (main 2 + ear2 2 + body 6 + hands 4 = 14%)
	-- -Enmity = Merits 5 (main 10 + head 6 + neck 3 + ear2 5 + body 6 + hands 7 + ring1 5 + feet 10 = 57 / 50)
    sets.midcast.Curaga = set_combine(sets.midcast.FastRecast,    {main={ name="Queller Rod", augments={'MND+15','Mag. Acc.+15','"Cure" potency +15%',}},sub="Ammurapi Shield",ammo="Hydrocera",
		head={name="Vanya Hood",augments={'MP+50','"Cure" potency +7%','Enmity -6'}},neck="Orunmila's Torque",ear2="Glorious Earring",ear1="Nourishing Earring +1",
		body="Theophany Briault +3",hands="Theophany Mitts +3",ring1="Lebeche Ring",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15',}},waist="Luminary Sash",legs="Ebers Pantaloons +1",feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}})
		
    sets.midcast.CureMelee = set_combine(sets.midcast.FastRecast,    {main="Ababinili +1",sub="Curatio Grip",ammo="Hydrocera",
		head={name="Vanya Hood",augments={'MP+50','"Fast Cast"+10','Haste+2%'}},neck="Colossus's Torque",ear1="Nourishing Earring +1",ear2="Glorious Earring",
		body={name="Vanya Robe",augments={'Healing Magic Skill +20','"Cure" spellcasting time -7%','Magic Dmg. taken -3%'}},hands="Theophany Mitts +3",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15',}},waist="Witful Belt",legs="Ebers Pantaloons +1",feet="Inyanga Crackows +2"})
	-- Skal laves færdigt	
	-- sets.midcast.Cura = 

	-- 572 Healing Magic Skill + 82% fra +Cursna gear = 51% removal rate
    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast,    {main="Yagrush",sub="Genmei Shield",ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},neck="Malison Medallion",ear1="Beatific Earring",ear2="Loquacious Earring",
		body="Ebers Bliaud +1",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Ephedra Ring",ring2="Sirona's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Witful Belt",legs="Theophany Pantaloons +3",feet={name="Vanya Clogs", augments={'Healing Magic Skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3%',}}})
		
    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast,    {main="Yagrush",sub="Genmei Shield",ammo="Incantor Stone",
		head="Ebers Cap",neck="Cleric's Torque +1",ear1="Ethereal Earring",ear2="Mendi. Earring",
		body="Inyanga Jubbah +2",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Defending Ring",
		legs="Ebers Pantaloons +1",back="Mending Cape"})
	-- Impatiens

    -- 80 nødvendig for at nå 500 Skill
	-- Enhancing Magic Skill (main 15 + hands 20 + ring 5 + legs 22 + feet 25) = +87 Enhancing Magic
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,    {main="Beneficus",sub="Ammurapi Shield",ammo="Impatiens",
		head={name="Vanya Hood",augments={'MP+50','"Fast Cast"+10','Haste+2%'}},neck="Incanter's Torque",ear1="Glorious Earring",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1 +1 +1",ring2="Lebeche Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Witful Belt",legs="Piety Pantaloons +2",feet="Ebers Duckbills +1"})
		
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],	{head="Chironic Hat", hands="Regal Cuffs", waist="Emphatikos Rope"})
		
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast,   {neck="Nodens Gorget",waist="Siegel Sash",legs="Haven Hose"})

    sets.midcast.Auspice = set_combine(sets.midcast.FastRecast,   {feet="Ebers Duckbills +1"}) -- hands Dynasty Mitts

	-- Beneficus +5 MDB, Piety Pantaloons +1 +36, Ebers set 8% Annul Dam.
    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],	{main="Beneficus",ammo="Incantor Stone",
		head="Ebers Cap",neck="Incanter's Torque",
		body="Ebers Bliaud +1",hands="Ebers Mitts +1",
		legs="Piety Pantaloons +3",feet="Ebers Duckbills +1"})
		-- Impatiens

    sets.midcast.Regen = set_combine(sets.midcast.FastRecast,    {main="Bolelabunga",sub="Ammurapi Shield",ammo="Impatiens",head="Inyanga Tiara +2",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Gifted Earring",
		body="Piety Briault +3",hands="Ebers Mitts +1",ring1="Lebeche Ring",ring2="Kuchekula Ring",
		back="Perimede Cape",waist="Luminary Sash",legs="Theophany Pantaloons +3",feet="Theophany Duckbills +3"})

    sets.midcast['Divine Magic'] = set_combine(sets.midcast.FastRecast,   {ammo="Dosis Tathlum",
		head={ name="Chironic Hat", augments={'Mag. Acc.+13','AGI+10','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},neck="Eddy Necklace",ear1="Dignitary's Earring",ear2="Friomisi Earring",
		body="Chironic Doublet",hands="Piety Mitts +3",ring1="Stikini Ring +1 +1",ring2="Globidonta Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Refoccilation Stone",legs={ name="Chironic Hose", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Resist Silence"+6','Mag. Acc.+12',}},feet={ name="Chironic Slippers", augments={'Mag. Acc.+14','AGI+8','"Store TP"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}})

	sets.midcast.Banish = set_combine(sets.midcast.FastRecast,   {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Ipoca Beret",neck="Eddy Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Theophany Briault",hands="Piety Mitts +3",ring1="Stikini Ring +1 +1",ring2="Globidonta Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Refoccilation Stone",legs={ name="Chironic Hose", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','Mag. Acc.+11','"Mag.Atk.Bns."+13',}},feet={ name="Chironic Slippers", augments={'Mag. Acc.+14','AGI+8','"Store TP"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}})

    sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast,    {ammo="Dosis Tathlum",
		head="Inyanga Tiara +2",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Inyanga Jubbah +2",hands={ name="Fanatic Gloves", augments={'MP+45','Healing magic skill +9','"Conserve MP"+6','"Fast Cast"+5',}},ring1="Adoulin Ring",ring2="Evanescence Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Refoccilation Stone",legs="Lengo Pants",feet="Gende. Galoshes"})

	sets.midcast.Drain = set_combine(sets.midcast.FastRecast,    {main="Maxentius",sub="Ammurapi Shield",ammo="Hydrocera",
		head="Inyanga Tiara +2",neck="Mizukage-no-Kubikazari",ear1="Abyssal Earring",ear2="Psystorm Earring",
		body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Tamas Ring",ring2="Evanescence Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Fucho-No-Obi",feet="Inyanga Crackows +2"})
		-- Appetence Crown
		
	sets.midcast['Impact'] = set_combine(sets.midcast.FastRecast,   {main={ name="Grioavolr", augments={'Enfb.mag. skill +11','MND+5','Mag. Acc.+25','"Mag.Atk.Bns."+13',}},sub="Enki Strap",ammo="Hydrocera",
		head=empty,neck="Erra Pendant",ear1="Dignitary's Earring",ear2="Gwati Earring",
		body="Twilight Cloak",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1 +1",ring2="Stikini Ring +1 +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Luminary Sash",legs="Theophany Pantaloons +3",feet="Theophany Duckbills +3"})
		
	sets.midcast.Aspir = sets.midcast.Drain
		
		
    -- Custom spell classes
    sets.midcast.MndEnfeebles = set_combine(sets.midcast.FastRecast,   {main="Maxentius",sub="Ammurapi Shield",ammo="Hydrocera",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Dignitary's Earring",ear2="Gwati Earring",
		body="Theophany Briault +3",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1 +1",ring2="Stikini Ring +1 +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Luminary Sash",legs={ name="Chironic Hose", augments={'Mag. Acc.+30','Pet: Mag. Acc.+5','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},feet="Theophany Duckbills +3"})
	-- Theophany head +3

	sets.midcast.IntEnfeebles = set_combine(sets.midcast.FastRecast,   {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Theophany Cap +2",neck="Erra Pendant",ear1="Dignitary's Earring",ear2="Gwati Earring",
		body="Theophany Briault +3",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1 +1",ring2="Stikini Ring +1 +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Luminary Sash",legs={ name="Chironic Hose", augments={'Mag. Acc.+30','Pet: Mag. Acc.+5','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},feet="Theophany Duckbills +3"})
    -- Theophany head +3
	
	sets.magic_burst = {neck="Mizukage-no-Kubikazari",ring1="Locus Ring",ring2="Mujin Band"}

    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Niobid Strap",ammo="Homiliary"}
    

    -- Idle sets
    sets.idle = {main="Maxentius",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Flashward Earring",
		body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyanga Crackows +2"}

    sets.idle.PDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
		body="Inyanga Jubbah +2",hands="Theophany Mitts +3",ring1="Succor Ring",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Luminary Sash",legs="Theophany Pantaloons +3",feet="Battlecast Gaiters"}

    sets.idle.Town = {main="Yagrush",sub="Ammurapi Shield",ammo="Homiliary",
		head="Vanya Hood",neck="Warder's Charm +1",ear1="Nourishing Earring +1",ear2="Glorious Earring",
		body="Inyanga Jubbah +2",hands="Theophany Mitts +3",ring1="Stikini Ring +1",ring2="Defending Ring",
		back="Pahtli Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
    
    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Ayanmo Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Succor Ring",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Luminary Sash",legs="Ayanmo Cosciales +2",feet="Ayanmo Gambieras +2"}
    
	sets.idle.Misery = {main="Yagrush",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Flashward Earring",
		body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Purity Ring",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10','Mag. Evasion+15',}},waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyanga Crackows +2"}
	
    -- Defense sets

	-- -39% -damage taken
	-- -12% PDT
	-- ammo 3 + head 3 + neck 6 + ear2 2 + body 6 + hands 3 + ring2 10 + back 10 + legs 5 + feet 3 = 51% / 50%
    sets.defense.PDT = {main="Maxentius",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Ayanmo Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Purity Ring",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15',}},waist="Porous Rope",legs="Ayanmo Cosciales +2",feet="Ayanmo Gambieras +2"}
	-- Succor Ring	

	-- Shell = 29% MDT - 21% nødvendig for cap
	-- -10% -damage taken
	-- -20% MDT 
	--	30% MDT + Shell = 59%
    sets.defense.MDT = 
		{main="Maxentius",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Flashward Earring",ear2="Hearty Earring",
		body="Inyanga Jubbah +2",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1 +1",ring2="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Mag. Evasion+15',}},waist="Carrier's Sash",legs="Theophany Pantaloons +3",feet="Inyanga Crackows +2"}

    sets.Kiting = {feet="Herald's Gaiters"}
	
    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="Amar Cluster",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Apate Ring",
		back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+2','"Dbl.Atk."+10',}},waist="Windbuffet Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.Acc = set_combine(sets.precast.engaged,    {ammo="Amar Cluster",
		head="Aya. Zucchetto +2",neck="Subtlety Spec.",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Apate Ring",
		back="Umbra Cape",waist="Windbuffet Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"})

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end

---------------------------------------------------------------------------------------------------------------------Auto Sublimation-----------------------------------
------------------------------------------------------------------------------------
--If MP is below 45% will auto-activate uppon using any spell 
--and 
--when it becomes "Complete" if MP is still Below 75% it will auto-activate uppon using any spell.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function job_post_aftercast(spell, action, spellMap, eventArgs)
    if spell.type ~= 'JobAbility' then
        auto_sublimation()
    end
end
 
function auto_sublimation()
    local abil_recasts = windower.ffxi.get_ability_recasts()
    if not (buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']) then
        if not (buffactive['Invisible'] or buffactive['Weakness']) then
            if abil_recasts[234] == 0 then
                send_command('@wait 2;input /ja "Sublimation" <me>')
            end
        end
    elseif buffactive['Sublimation: Complete'] then
        if player.mpp < 45 and abil_recasts[234] == 0 then
            send_command('@wait 2;input /ja "Sublimation" <me>')
        end
    end         
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == "Aurorastorm" then
		equip(sets.midcast.storm_active)
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
		elseif default_spell_map == 'Cura' and state.Buff['Afflatus Misery'] then
			return "CureMisery"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end