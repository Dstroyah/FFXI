function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','Daybreak','DualWeapons','DualClubs','DualAlmace')
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = "Toro Cape"
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = "Toro Cape"
	gear.obi_high_nuke_waist = "Refoccilation Stone"

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +1"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {	
		head		=	"Atrophy Chapeau +2",       --12
		body		=	"Taeon Tabard",		--9
        legs		=	"Psycloth Lappas",    --6
		hands		=	"Leyline Gloves", 	  --8
        neck		=	"Orunmila's Torque",     --5
		feet		=	"Carmine Greaves",		--7
        left_ring	=	"Kishar Ring",          --4
    }											--Total: 71 -- To Do: overkill need to slot DT / HP 
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
				ammo="Ginsen",
				head="Aya. Zucchetto +2",
				neck="Asperity Necklace",
				ear1="Cessance Earring",
				ear2="Brutal Earring",
				body="Ayanmo Corazza +2",
				hands="Aya. Manopolas +2",
				ring1="Petrov Ring",
				ring2="Ilabrat Ring",
				back="Bleating Mantle",
				waist="Windbuffet Belt",
				legs="Carmine Cuisses +1",
				feet="Carmine Greaves +1"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {
				neck="Fotia Gorget",
				ear1="Moonshade Earring",
				ear2="Sherida Earring",
				ring1="Begrudging Ring",
				waist="Fotia Belt",
				feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {
				ammo		=	"Ginsen",
				head		=	"Atrophy Chapeau +2",
				body		=	"Jhakri Robe +1",
				hands		=	"Atrophy Gloves +2",
				legs		=	"Jhakri Slops +2",
				feet		=	"Jhakri Pigaches +1",
				neck		=	"Fotia Gorget",
				waist		=	"Fotia Belt",
				left_ear	=	{ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
				right_ear	=	"Ishvara Earring",
				left_ring   =  	"Shukuyu Ring",
				right_ring	=	"Karieyh Ring",
				back		=	"Bleating Mantle",
	}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Archon Ring",
		back="Sucellos's Cape",waist="Refoccilation Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

	
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",hands="Amalric Gages +1",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Amalric Gages +1",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}

	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"}

    sets.midcast.Cure = {
				main		=	"Daybreak",
				ammo		=	"Homiliary",
				head		=	"Vanya Hood",
				body		=	"Gende. Bilaut +1",
				hands		=	"Telchine Gloves", 
				legs		=	"Atrophy Tights +1",
				feet		=	"Vitiation Boots +1",
				neck		=	"Nodens Gorget",
				waist		=	"Luminary Sash",
				left_ear	=	"Mendi. Earring",
				right_ear	=	"Roundel Earring",
				left_ring	=	"Sirona's Ring",
				right_ring	=	"Lebeche Ring",
				back		=	"Ghostfyre Cape",
	}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
			main		=	"Pukulatmuj +1",
			--sub			=	"Ammurapi Shield",
			ammo		=	"Homiliary",
			head		=	"Telchine Cap",
			body		=	"Vitiation Tabard +2",
			hands		=	"Atrophy Gloves +2",
			legs		=	"Telchine Braconi",
			feet		=	"Leth. Houseaux +1",
			neck		=	"Dls. Torque +1",
			waist		=	"Olympus Sash",
			left_ear	=	"Etiolation Earring",
			right_ear	=	"Andoaa Earring",
			left_ring	=	"Stikini Ring",
			right_ring	=	"Stikini Ring",
			back		=	"Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+7','"Mag.Atk.Bns."+10',},
	}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +2",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.BoostStat = {hands="Vitiation Gloves +2"}
	sets.midcast.Enspell = {head="Umuthi Hat", hands="Vitiation Gloves +2", legs="Atrophy Tights +1", neck="Incanter's Torque", back="Ghostfyre Cape"}
	sets.midcast.Temper = {head="Umuthi Hat", hands="Vitiation Gloves +2", legs="Atrophy Tights +1", neck="Incanter's Torque", back="Ghostfyre Cape"}
	
	sets.midcast['Enfeebling Magic'] = {
				main		=	"Grioavolr",
				sub			=	"Enki Strap",
				ammo		=	"Hydrocera",
				head		=	"Vitiation Chapeau +2",
				body		=	"Atrophy Tabard +2",
				hands		=	"Kaykaus Cuffs",
				legs		=	"Chironic Hose",
				feet		=	"Vitiation Boots +2",
				neck		=	"Duelist's Torque +1",
				waist		=	"Luminary Sash",
				left_ear	=	"Snotra Earring",
				right_ear	=	"Dignitary's Earring",
				left_ring	=	"Stikini Ring",
				right_ring	=	"Stikini Ring",
				back		=	"Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+7','"Mag.Atk.Bns."+10',},
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Enki Strap",ammo="Regal Gem",
		head="Befouled Crown",neck="Dls. Torque +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Atrophy Tabard +2",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Vitiation Boots +3"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",hands="Jhakri Cuffs +2",waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",hands="Leth. Gantherots +1",ring1="Stikini Ring"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",hands="Leth. Gantherots +1",ring1="Stikini Ring"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +2"})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1",waist="Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +1"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Viti. Chapeau +1"})
	
    sets.midcast['Elemental Magic'] = {
						main="Daybreak",
						sub="Beatific Shield +1",
						ammo="Hydrocera",
						head="Jhakri Coronal +2",
						body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
						hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
						legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
						feet={ name="Vitiation Boots +2", augments={'Immunobreak Chance',}},
						neck="Stoicheion Medal",
						waist="Eschan Stone",
						left_ear="Friomisi Earring",
						right_ear="Hecate's Earring",
						left_ring="Shiva Ring +1",
						right_ring="Shiva Ring +1",
						back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+7','"Mag.Atk.Bns."+10',}},
	}
		
    sets.midcast['Elemental Magic'].Resistant = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Sucellos's Cape",waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Fodder = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Sucellos's Cape",waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Helios Jacket",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ear1="Regal Earring"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {sub="Alber Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring"})
		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Regal Gem",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands="Leth. Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Atrophy Tabard +2",hands="Leth. Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet=gear.merlinic_nuke_feet}

    sets.midcast.Drain = {
						main={ name="Rubicundity", augments={'Mag. Acc.+9','"Mag.Atk.Bns."+8','Dark magic skill +9','"Conserve MP"+5',}},
						sub="Genmei Shield",
						ammo="Hydrocera",
						head="Pixie Hairpin +1",
						body="Shamash Robe",
						hands="Merlinic Dastanas",
						legs={ name="Chironic Hose", augments={'Mag. Acc.+27','"Cure" spellcasting time -3%','MND+5','"Mag.Atk.Bns."+9',}},
						feet="Merlinic Crackows",
						neck="Erra Pendant",
						waist="Fucho-no-Obi",
						left_ear="Gwati Earring",
						right_ear="Digni. Earring",
						left_ring="Excelsis Ring",
						right_ring="Stikini Ring",
						back="Perimede Cape",
	}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Witful Belt",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Stun.Resistant = {main="Serenity",sub="Enki Strap",ammo="Regal Gem",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Acuity Belt +1",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Impatiens",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Lengo Pants",feet=gear.chironic_refresh_feet}
	

	-- Idle sets
	sets.idle = {
					main		=	"Daybreak",
					sub			=	"Beatific Shield +1",
					ammo		=	"Homiliary",
					head		=	"Vitiation Chapeau +2",
					body		=	"Shamash Robe",
					hands		=	"Aya. Manopolas +2",
					--legs		=	Carm.Legs.D,
					feet		=	"Aya. Gambieras +2",
					neck		=	"Loricate Torque +1",
					waist		=	"Flume Belt +1",
					left_ear	=	"Genmei Earring",
					right_ear	=	"Ethereal Earring",
					left_ring	=	"Purity Ring",
					right_ring	=	"Defending Ring",
					back		=	"Engulfer Cape +1",
	}
		
	sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Emet Harness +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}
		
	sets.idle.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Viti. Chapeau +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}
		
	sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Lengo Pants",feet=gear.chironic_refresh_feet}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {back="Umbra Cape",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"})
	
	-- Defense sets
	sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo="Impatiens",
		head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Emet Harness +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Impatiens",
		head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}
		
    sets.defense.MEVA = {main="Terra's Staff",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=empty,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Respite Cloak",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Sucellos's Cape",waist="Luminary Sash",legs="Leth. Fuseau +1",feet="Telchine Pigaches"}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.Daybreak = {main="Daybreak",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Sequence",sub="Almace"}
	sets.weapons.DualClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.DualAlmace = {main="Almace",sub="Sequence"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {
			ammo		=	"Ginsen",
			head		=	{ name="Taeon Chapeau", augments={'Accuracy+14 Attack+14','"Triple Atk."+2',}},
			body		=	"Malignance Tabard",
			hands		=	{ name="Carmine Fin. Ga.", augments={'Rng.Atk.+15','"Mag.Atk.Bns."+10','"Store TP"+5',}},
			left_ring	=	"Hetairoi Ring",     
			legs		=	{ name="Taeon Tights", augments={'Accuracy+15','"Triple Atk."+1',}},
			feet		=	{ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
			neck		=	"Anu Torque",
			waist		=	"Windbuffet Belt",
			left_ear	=	"Telos Earring",
			right_ear	=	"Sherida Earring",
			right_ring	=	"Chirich Ring",
			back		=	"Bleating Mantle"
	}

	sets.engaged.DW = {
			ammo		=	"Ginsen",
			head		=	{ name="Taeon Chapeau", augments={'Accuracy+14 Attack+14','"Triple Atk."+2',}},
			body		=	"Malignance Tabard",
			hands		=	{ name="Carmine Fin. Ga.", augments={'Rng.Atk.+15','"Mag.Atk.Bns."+10','"Store TP"+5',}},
			left_ring	=	"Hetairoi Ring",     
			legs		=	{ name="Taeon Tights", augments={'Accuracy+15','"Triple Atk."+1',}},
			feet		=	{ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
			neck		=	"Anu Torque",
			waist		=	"Windbuffet Belt",
			left_ear	=	"Telos Earring",
			right_ear	=	"Sherida Earring",
			right_ring	=	"Chirich Ring",
			back		=	"Bleating Mantle"
	}
		
	sets.engaged.PhysicalDef = {ammo="Ginsen",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Emet Harness +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.MagicalDef = {ammo="Ginsen",
		head="Viti. Chapeau +1",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(4, 18)
	elseif player.sub_job == 'NIN' then
		set_macro_page(4, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 18)
	else
		set_macro_page(1, 18)
	end
end