-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:
        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
                                        Light Arts              Dark Arts
        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
---------------||   H O W    T O    A C T I V A T E     M A G I C    B U R S T  ||--------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------




--You can try it just manually typing in 

--                                        /console gs c toggle MagicBurst 

--and it should put a message in your chat log saying "Magic Burst is now on."


------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('caster_buffWatcher.lua')
	include('SCH_helix_timer.lua')
	buffWatcher.watchList = {
                        ["Aquaveil"]="Aquaveil",
                        ["Haste"]="Haste",
                        ["Stoneskin"]="Stoneskin",
                        ["Phalanx"]="Phalanx",
                        ["Protect"]="Protect V",
                        ["Shell"]="Shell V",
						["Blink"]="Blink",
						["Regen"]="Regen V",
                        }
	include('SCH_helix_timer.lua')
	include('common_info.status.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V", "Stone VI", "Water VI", "Aero VI", "Fire VI", "Blizzard VI", "Thunder VI"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    --update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Refresh', 'Normal')--'None'
    state.CastingMode:options('Normal', 'MP_Back', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	state.MagicBurst = M(false, 'Magic Burst')

    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
    info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II", "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III", "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV"}
    info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V", "Stone VI", "Water VI", "Aero VI", "Fire VI", "Blizzard VI", "Thunder VI"}

	info.Helix = S{"Geohelix","Hydrohelix","Anemohelix","Pyrohelix","Cryohelix","Ionohelix","Luminohelix","Noctohelix",
                  "Geohelix II","Hydrohelix II","Anemohelix II","Pyrohelix II","Cryohelix II","Ionohelix II","Luminohelix II","Noctohelix II"}
	
    send_command('bind ^` input /ma Stun <t>')

    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Light Arts'] = {body="Academic's Pants +1"}
	sets.precast.JA['Dark Arts'] = {body="Academic's Gown +1"}
	sets.precast.JA['Addendum: White'] = {body="Arbatel Gown"}
	sets.precast.JA['Addendum: Black'] = {body="Arbatel Gown"}

    -- Fast cast sets for spells

	sets.precast.Waltz = {
		head="Merlinic Hood",neck="Unmoving Collar +1",ear2="Roundel Earring",ear1="Soil Pearl",
		body="Mallquis Saio +2",hands="Chironic Gloves",ring1="Titan Ring",ring2="Titan Ring",
		back="Iximulew Cape",waist="Warwolf Belt",legs="Merlinic Shalwar",feet={ name="Merlinic Crackows", augments={'CHR+9','"Mag.Atk.Bns."+27','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}}
	
	-- Light/Dark Arts 10 + Head 12 + neck 5 + ear2 2 + body 6 + hands 5 + ring1 4 + ring2 2 + waist 3 + legs 7 + feet 11 = 67% FC
    sets.precast.FC = {head={ name="Merlinic Hood", augments={'Mag. Acc.+26','"Fast Cast"+4','DEX+3',}},neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Merlinic Jubbah",hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+1','"Fast Cast"+5',}},ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Perimede Cape",waist="Witful Belt",legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','CHR+4','"Mag.Atk.Bns."+11',}}}
	-- FC back

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {head="Umuthi Hat",hands="Carapacho Cuffs"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal",ear1="Barkarole Earring",body="Mallquis Saio +2",ring1="Lebeche Ring",waist="Witful Belt",feet="Mallquis clogs +1"})

    sets.precast.FC.Cure = sets.precast.FC
	
    sets.precast.FC.Curaga = sets.precast.FC

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Amar Cluster",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Petrov Ring",ring2="K'ayres Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Myrkr'] = {ammo="Hydrocera",
		head={name="Vanya Hood",augments={'MP+50','"Fast Cast"+10','Haste+2%'}},neck="Orunmila's Torque",ear1="Mendicant's Earring",ear2="Loquacious Earring",
		body="Helios Jacket",hands="Telchine Gloves",ring1="Adoulin Ring",ring2="Mephitas's Ring +1",
		back="Pahtli Cape",waist="Yamabuki-No-Obi",legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},feet={name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" Potency +4%'}}}

	sets.precast.WS['Shattersoul'] = {ammo="Plumose Sachet",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Petrov Ring",ring2="Fenrir Ring +1",back="Lugh's Cape",waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}--80% INT Base
		
	sets.precast.WS['Omniscience'] = {ammo="Amar Cluster",
		head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Levia. Ring",ring2="Rufescent Ring",back="Pahtli Cape",waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}--80% MND Base

    -- Midcast Sets

    sets.midcast.FastRecast = {
        head={ name="Merlinic Hood", augments={'Mag. Acc.+26','"Fast Cast"+4','DEX+3',}},neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Anhur Robe",hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+1','"Fast Cast"+5',}},ring1="Lebeche Ring",ring2="Prolix Ring",
		waist="Witful Belt",legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','CHR+4','"Mag.Atk.Bns."+11',}}}
	-- FC back	

	-- Main 18 + sub 3 + Head 17 + ear1 5 + ring2 3 + legs 8 + feet 10 = 64% potency
	-- Merits -5, sub -5, head -6, ear2 -3, hands -9, ring1 -7, ring2 -5, feet -10 = -50 Enmity
    sets.midcast.Cure = {main="Gada",sub="Sors Shield",ammo="Hydrocera",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},neck="Incanter's Torque",left_ear="Mendi. Earring",right_ear="Halasz Earring",
	body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},hands="Chironic Gloves",left_ring="Kuchekula Ring",right_ring="Lebeche Ring",
    back="Pahtli Cape",waist="Witful Belt",legs="Chironic Hose",feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}}
	-- Serenity m/max Augm., Academic's Pants +2, back m/-enmity

    sets.midcast.CureWithLightWeather = {ammo="Hydrocera",
    head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},neck="Incanter's Torque",left_ear="Mendi. Earring",right_ear="Beatific Earring",
	body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},hands="Chironic Gloves",left_ring="Sirona's Ring",right_ring="Lebeche Ring",
    back="Pahtli Cape",waist="Hachirin-No-Obi",legs="Chironic Hose",feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = {main="Serenity",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear2="Loquacious Earring",
		hands="Gende. Gages +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		feet="Gende. Galosh. +1"}--Malison Medallion
		-- Skal gøres færdigt

    sets.midcast['Enhancing Magic'] = {ammo="Incantor Stone",
		head="Arbatel Bonnet",neck="Incanter's Torque",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Arbatel Bracers",ring1="Lebeche Ring",ring2="Prolix Ring",
		feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}}}
		
	-- https://www.ffxiah.com/forum/topic/32145/a-scholars-education-guide/78/	
	
	-- Regen potency = 10% + 10% + 10% + 1% = 31%
	-- Regen duration = 50%
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Genmei Shield",
		head="Arbatel Bonnet",hands="Arbatel Bracers",
		back={ name="Bookworm's Cape", augments={'INT+1','Helix eff. dur. +10','"Regen" potency+10',}},legs={ name="Telchine Braconi", augments={'"Regen" potency+1',}}})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",neck="Nodens Gorget",legs="Haven Hose"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})
	--Pedagogy Loafers +1 (Will boost Stormsurge +7 to +12)

	
	sets.midcast.Klimaform = set_combine(sets.midcast['Enhancing Magic'], {feet="Arbatel Loafers +1"})
	
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],	{head="Chironic Hat", hands="Regal Cuffs", waist="Emphatikos Rope"})


    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main="Akademos",sub="Enki Strap",ammo="Hydrocera",
		head={ name="Chironic Hat", augments={'Mag. Acc.+13','AGI+10','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
		body="Mallquis Saio +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Lugh's Cape",waist="Luminary Sash",legs={ name="Chironic Hose", augments={'Mag. Acc.+30','Pet: Mag. Acc.+5','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}}}
		-- Lugh's Cape Augm. m/ Macc, FC, Macc og enten MND eller INT, Chironic Hose Augm.

    sets.midcast.IntEnfeebles = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Digni. Earring",ear2="Barkarole Earring",
		body="Mallquis Saio +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Lugh's Cape",waist="Luminary Sash",legs={ name="Chironic Hose", augments={'Mag. Acc.+30','Pet: Mag. Acc.+5','Accuracy+5 Attack+5','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},feet="Jhakri Pigaches +2"}
		-- Lugh's Cape Augm. m/ Macc, FC, Macc og enten MND eller INT, Chironic Hose Augm.
		
    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Digni. Earring",ear2="Abyssal Earring",
		body="Mallquis Saio +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Evanescence Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Luminary Sash",legs={ name="Chironic Hose", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Resist Silence"+6','Mag. Acc.+12',}},feet="Jhakri Pigaches +2"}
	
    sets.midcast.Kaustra = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Abyssal Earring",
		body="Mallquis Saio +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet="Jhakri Pigaches +2"}
	-- Skal gøres færdigt	

    sets.midcast.Drain = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Abyssal Earring",ear2="Barkarole Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Excelsis Ring",ring2="Evanescence Ring",
		back={ name="Bookworm's Cape", augments={'INT+1','Helix eff. dur. +10',}},waist="Fucho-No-Obi",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet={name="Merlinic Crackows", augments={'Mag. Acc.+18','"Mag. Atk. Bns."+2','"Drain" and "Aspir" potency +8'}}}
	
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Erra Pendant",ear1="Dignitary's Earring",ear2="Gwati Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Witful Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
	
        -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Adoulin Ring",ring2="Tamas Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet="Arbatel Loafers +1"}
	
    sets.midcast['Elemental Magic'].Resistant = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Dignitary's Earring",ear2="Gwati Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Luminary Sash",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.midcast['Elemental Magic'].MP_Back = {main="Akademos",sub="Enki Strap",ammo="Dosis Tathlum",
		head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Seidr Cotehardie",hands="Jhakri Cuffs +2",ring1="Adoulin Ring",ring2="Tamas Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Yamabuki-No-Obi",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet="Arbatel Loafers +1"}

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Adoulin Ring",ring2="Tamas Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet="Arbatel Loafers +1"})

    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Eddy Necklace",ear1="Dignitary's Earring",ear2="Gwati Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Luminary Sash",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet="Arbatel Loafers +1"})
		
	sets.midcast['Elemental Magic'].HighTierNuke.MP_Back = set_combine(sets.midcast['Elemental Magic'], {
		main="Akademos",sub="Enki Strap",ammo="Dosis Tathlum",
		head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Seidr Cotehardie",hands="Jhakri Cuffs +2",ring1="Adoulin Ring",ring2="Tamas Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Yamabuki-No-Obi",legs={ name="Merlinic Shalwar", augments={'Pet: STR+11','"Mag.Atk.Bns."+21','Accuracy+16 Attack+16','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},feet="Jhakri Pigaches +2"})

	-- Main 10 + head 9 + neck 10 + ring1 5 + legs 10 = MB1 44% + MB2 10% = 50%
	sets.magic_burst = set_combine(sets.midcast['Elemental Magic'], {main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+26','Magic burst dmg.+9%','Mag. Acc.+8',}},neck="Mizukage-no-Kubikazari",
		hands="Amalric Gages",ring1="Locus Ring",ring2="Mujin Band",
		waist="Hachirin-No-Obi",legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+13',}},feet="Arbatel Loafers +1"})
	
    sets.midcast.Impact = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=empty,neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Twilight Cloak",hands="Jhakri Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Chironic Hose", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','"Resist Silence"+6','Mag. Acc.+12',}},feet="Jhakri Pigaches +2"}

	sets.midcast.Helix = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+26','Magic burst dmg.+9%','Mag. Acc.+8',}},neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Locus Ring",ring2="Mujin Band",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+13',}},feet="Arbatel Loafers +1"}

	sets.midcast.LightHelix = {main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},sub="Enki Strap",ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+26','Magic burst dmg.+9%','Mag. Acc.+8',}},neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Locus Ring",ring2="Mujin Band",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+13',}},feet="Arbatel Loafers +1"}
		
	sets.midcast.DarkHelix  = {main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Locus Ring",ring2="Mujin Band",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+25','Magic burst dmg.+10%','MND+9','Mag. Acc.+13',}},feet="Arbatel Loafers +1"}
	
	sets.midcast.Helix.Resistant = {main={ name="Akademos", augments={'MP+80','INT+20','"Mag.Atk.Bns."+20',}},sub="Enki Strap",ammo="Plumose Sachet",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+26','Magic burst dmg.+9%','Mag. Acc.+8',}},neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Amalric Gages",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Bookworm's Cape",waist="Refoccilation Stone",legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+6%','MND+8',}},feet="Jhakri Pigaches +2"}

    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Enki Strap",ammo="Homiliary",
		head="Wivre Hairpin",neck={name="Jeweled Collar",augments={'INT+2','MP recovered while healing +3'}},
		body="Errant Houppelande",hands="Nares Cuffs",
		back="Vita Cape",waist="Austerity Belt",legs="Nisse Slacks",feet="Chelona Boots"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = {main="Akademos",sub="Enki Strap",ammo="Homiliary",
		head="Savant's Bonnet +2",neck="Twilight Torque",ear1="Barkarole Earring",ear2="Loquac. Earring",
		body="Mallquis Saio +2",hands="Amalric Gages",ring1="Prolix Ring",ring2="Defending Ring",
		back="Bookworm's Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet="Herald's Gaiters"}

    sets.idle.Field = {main="Akademos",sub="Enki Strap",ammo="Homiliary",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+26','"Fast Cast"+4','DEX+3',}},neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquac. Earring",
		body="Mallquis Saio +2",hands="Amalric Gages",ring1="Succor Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet="Herald's Gaiters"}
		
	sets.idle.Field.Refresh = {main="Akademos",sub="Enki Strap",ammo="Homiliary",
		head="Wivre Hairpin",neck="Sanctity Necklace",ear1="Infused Earring",ear2="Loquac. Earring",
		body="Jhakri Robe +2",hands="Serpentes Cuffs",ring1="Matrimony Ring",ring2="Defending Ring",
		back="Kumbira Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet={ name="Merlinic Crackows", augments={'"Blood Boon"+6','Pet: Attack+22 Pet: Rng.Atk.+22','"Refresh"+2','Accuracy+4 Attack+4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}}
		
    sets.idle.Field.PDT = {main="Earth Staff",ammo="Amar Cluster",
        head={ name="Chironic Hat", augments={'Mag. Acc.+13','AGI+10','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},neck="Twilight Torque",ear1="Ethereal Earring",ear2="Genmei Earring",
        body="Mallquis Saio +2",hands="Amalric Gages",ring1="Succor Ring",ring2="Defending Ring",
        back="Cheviot Cape",legs="Chironic Hose",feet="Battlecast Gaiters"}
		
	--	main="Akademos",sub="Niobid Strap",ammo="Homiliary",
	--	head="Wivre Hairpin",neck="Twilight Torque",ear1="Gifted Earring",ear2="Loquac. Earring",
	--	body="Jhakri Robe +1",hands="Serpentes Cuffs",ring1="Matrimony Ring",ring2="Defending Ring",
	--	waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet="Serpentes Sabots",back="Umbra Cape"}

    sets.idle.Weak = {main="Akademos",sub="Enki Strap",ammo="Homiliary",
		head="Wivre Hairpin",neck="Twilight Torque",ear1="Ethereal Earring",ear2="Loquac. Earring",
		body="Mallquis Saio +2",hands="Amalric Gages",ring1="Succor Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet={ name="Merlinic Crackows", augments={'"Blood Boon"+6','Pet: Attack+22 Pet: Rng.Atk.+22','"Refresh"+2','Accuracy+4 Attack+4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}}

    -- Defense sets

	-- -24% -damage taken
	-- -30% -Physical damage taken = -54% PDT
	-- -24% -Magic damage taken = -24% MDT
	-- Main 20% + Ear1 2% + Back 5% = -27% 
    sets.defense.PDT = {main="Earth Staff",sub="Enki Strap",ammo="Amar Cluster",
		head="Merlinic Hood",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
		body="Mallquis Saio +2",hands="Vanya Cuffs",ring1="Succor Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Emphatikos Rope",legs="Chironic Hose",feet="Mallquis Clogs +1"}
		
	-- Shell = 24% MDT - 26% nødvendig for cap
	-- -24% -damage taken
	-- head 2% = Shell 24% MDT + 24% -DT + 2% MDT = 50%
	sets.defense.MDT = {main="Earth Staff",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head={ name="Chironic Hat", augments={'Mag. Acc.+13','AGI+10','Accuracy+8 Attack+8','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},neck="Loracate Torque +1",ear1="Ethereal Earring",ear2="Psystorm Earring",
		body="Mallquis Saio +2",hands="Amalric Gages",ring1="Succor Ring",ring2="Defending Ring",
		back="Cheviot Cape",waist="Porous Rope",legs="Chironic Hose",feet="Mallquis Clogs +1"}

    sets.Kiting = {feet="Herald's Gaiters"}
	
    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {ammo="Amar Cluster",
		head="Merlinic Hood",ear1="Brutal Earring",ear2="Cessance Earring",neck="Sanctity Necklace",
		body="Jhakri Robe +1",hands="Telchine Gloves",ring1="Petrov Ring",ring2="K'ayres Ring",
		back="Umbra Cape",waist="Cetl Belt",legs="Lengo Pants",feet={ name="Merlinic Crackows", augments={'CHR+9','"Mag.Atk.Bns."+27','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}}

	sets.engaged.Refresh = {ammo="Homiliary",
		head="Wivre Hairpin",ear1="Brutal Earring",ear2="Cessance Earring",neck="Sanctity Necklace",
		body="Jhakri Robe +1",hands="Serpentes Cuffs",ring1="Petrov Ring",ring2="K'ayres Ring",
		back="Umbra Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet="Serpentes Sabots"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {head="Arbatel Bonnet"}
	sets.buff['Rapture'] = {head="Arbatel Bonnet"}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers"}
	sets.buff['Immanence'] = {hands="Arbatel Bracers",back="Lugh's Cape"}
	sets.buff['Penury'] = {legs="Arbatel Pants"}
	sets.buff['Parsimony'] = {legs="Arbatel Pants"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
	sets.buff['Alacrity'] = {feet="Pedagogy Loafers"}
	
	sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown"}
	-- Siriti

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

------------------------------------------------------------------------------------------------------------NEW CODE----------------------------------------------------
------------------------------------------------------------------------------------

-------------------------------------Aspir,Sleep/ga Nuke's refine rules (thanks Asura.Vafruvant for this code)-----------------------------------
function refine_various_spells(spell, action, spellMap, eventArgs)
    aspirs = S{'Aspir','Aspir II'}
    sleeps = S{'Sleep','Sleep II'}
 
	nukes = S{'Fire', 'Blizzard', 'Aero', 'Stone', 'Thunder', 'Water',
        'Fire II', 'Blizzard II', 'Aero II', 'Stone II', 'Thunder II', 'Water II',
        'Fire III', 'Blizzard III', 'Aero III', 'Stone III', 'Thunder III', 'Water III',
        'Fire IV', 'Blizzard IV', 'Aero IV', 'Stone IV', 'Thunder IV', 'Water IV',
        'Fire V', 'Blizzard V', 'Aero V', 'Stone V', 'Thunder V', 'Water V',
        
        
		}
 
    if not  sleeps:contains(spell.english) and not aspirs:contains(spell.english) and not nukes:contains(spell.english)then
        return
    end
 
    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
  
    if spell_recasts[spell.recast_id] > 0 then
        if aspirs:contains(spell.english) then
            if spell.english == 'Aspir' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Aspir II' then
                newSpell = 'Aspir'
            
            end         
        elseif sleeps:contains(spell.english) then
            if spell.english == 'Sleep' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Sleep II' then
                newSpell = 'Sleep'
            end
       
		elseif nukes:contains(spell.english) then	
			if spell.english == 'Fire' then
			   eventArgs.cancel = true
                return
            elseif spell.english == 'Fire V' then
                newSpell = 'Fire IV'
			elseif spell.english == 'Fire IV' then
                newSpell = 'Fire III'	
			elseif spell.english == 'Fire III' then
                newSpell = 'Fire II'
			elseif spell.english == 'Fire II' then
                newSpell = 'Fire'
            end    			
			if spell.english == 'Blizzard' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Blizzard V' then
                newSpell = 'Blizzard IV'
			elseif spell.english == 'Blizzard IV' then
                newSpell = 'Blizzard III'	
			elseif spell.english == 'Blizzard III' then 
                newSpell = 'Blizzard II'
			elseif spell.english == 'Blizzard II' then 
                newSpell = 'Blizzard'	
			end  
			if spell.english == 'Aero' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Aero V' then
                newSpell = 'Aero IV'
			elseif spell.english == 'Aero IV' then 
                newSpell = 'Aero III'	
			elseif spell.english == 'Aero III' then
                newSpell = 'Aero II'
			elseif spell.english == 'Aero II' then
                newSpell = 'Aero'
			end  	
			if spell.english == 'Stone' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Stone V' then
                newSpell = 'Stone IV'
			elseif spell.english == 'Stone IV' then
                newSpell = 'Stone III'	
			elseif spell.english == 'Stone III' then
                newSpell = 'Stone II'
			elseif spell.english == 'Stone II' then
                newSpell = 'Stone'	
			end  
			if spell.english == 'Thunder' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Thunder V' then
                newSpell = 'Thunder IV'
			elseif spell.english == 'Thunder IV' then
                newSpell = 'Thunder III'	
			elseif spell.english == 'Thunder III' then
                newSpell = 'Thunder II'
			elseif spell.english == 'Thunder II' then
                newSpell = 'Thunder'
			end  
			if spell.english == 'Water' then
			   eventArgs.cancel = true
                return
			elseif spell.english == 'Water V' then
                newSpell = 'Water IV'
			elseif spell.english == 'Water IV' then
                newSpell = 'Water III'	
			elseif spell.english == 'Water III' then
                newSpell = 'Water II'
			elseif spell.english == 'Water II' then
                newSpell = 'Water'
			end  
        end
    end
  
    if newSpell ~= spell.english then
        send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
        eventArgs.cancel = true
        return
    end
end
function job_precast(spell, action, spellMap, eventArgs)
    refine_various_spells(spell, action, spellMap, eventArgs)
	
	if spell.english == 'Sneak' and buffactive.sneak then
        send_command('@wait 1;cancel 71;')
    end
	buffWatcher.casting = true
	
end
-------------------------------------------------------------------------------------------------TEST-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Will Equip Hachirin-no-Obi when Weather or Day Matches the Element of spell

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)

    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.self_healing)
    end
    --if spell.action_type == 'Magic' then
       -- apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    --end
	if spell.skill == 'Elemental Magic'  then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip({waist="Hachirin-No-Obi"})
            --add_to_chat(8,'----- Hachirin-no-Obi Equipped. -----')
        end
    end
	if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value then
        equip(sets.magic_burst)
        end
	end
	if spell.type == "WeaponSkill" then
      if spell.element == world.weather_element or spell.element == world.day_element then
        --equip({waist="Hachirin-no-Obi"})
        --add_to_chat(8,'----- Hachirin-no-Obi Equipped. -----')
      end
    end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
  if spell.english == 'Sleep' then
        send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
    elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
        send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
    elseif spell.english == 'Break' or spell.english == 'Breakga' then
        send_command('@wait 20;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
    end
 if spell.english == 'Sleep II' then
    send_command('timers c "Sleep II" 90 down spells/00259.png')
  elseif spell.english == 'Sleep' then
    send_command('timers c "Sleep" 60 down spells/00253.png')
  elseif spell.english == 'Break' then
    send_command('timers c "Break" 30 down spells/00255.png')
  end
	buffWatcher.casting = false

function job_aftercast(spell, action, spellMap, eventArgs)

-- helix timers
  if (not spell.interrupted) then
    if info.Helix:contains(spell.english) then
        createTimerHelix(spell.english)
    end  
    if (spell.english=='Modus Veritas' or spell.english=='Stone') then
      createTimerModusVeritas()
    end
  end -- end of helix timers 
  
end -- end of the function


function job_aftercast(spell, action, spellMap, eventArgs)
-- helix timers
	if (not spell.interrupted) then
		if info.Helix:contains(spell.english) then
			createTimerHelix(spell.english)
	end 
	if (spell.english=='Modus Veritas' or spell.english=='Stone') then
		createTimerModusVeritas()
	end
	end -- end of helix timers 
end 

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
end
---------------------------------------------------------------------------------------------------------------------Auto Sublimation-----------------------------------
------------------------------------------------------------------------------------
--If MP is below 45% will auto-activate uppon using any spell 
--and 
--when it becomes "Complete" if MP is still Below 75% it will auto-activate upon using any spell.
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
        if player.mpp < 35 and abil_recasts[234] == 0 then
            send_command('@wait 2;input /ja "Sublimation" <me>')
        end
    end         
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------


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
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' then
            if info.low_nukes:contains(spell.english) then
                return 'LowTierNuke'
            elseif info.mid_nukes:contains(spell.english) then
                return 'MidTierNuke'
            elseif info.high_nukes:contains(spell.english) then
                return 'HighTierNuke'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' or spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    --cmdParams[1] == 'scholar'
    --cmdParams[2] = strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = (player.main_job_level + 10) / 20

    local fullRechargeTime = 4*60

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
end