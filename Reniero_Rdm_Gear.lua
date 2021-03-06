function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal', 'EnSpell')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','DTHippo')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Vitiation','Naegling','Daybreak','Maxentius','DualEnspell','DualWeapons','DualClubs','DualAlmace')
	
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
	
	send_command('wait 6;input /lockstyleset 11')
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Vitiation Tabard +1"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {	
				head="Atrophy Chapeau +2",       --14
				body="Vitiation Tabard +2",		--14
				legs="Psycloth Lappas",    --6
				hands="Leyline Gloves", 	  --8
				neck="Orunmila's Torque",     --5
				feet="Carmine Greaves",		--7
				left_ring="Kishar Ring",          --4
				back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}}, --10
    }											--Total: 71 -- To Do: overkill need to slot DT / HP 
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
       
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
				back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
				waist="Windbuffet Belt",
				legs="Carmine Cuisses +1",
				feet="Carmine Greaves +1"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	-- Sword WS Sets
	
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = {
				ammo="Yetshila",
				head="Aya. Zucchetto +2",
				neck="Fotia Gorget",
				ear1="Mache Earring",
				ear2="Sherida Earring",
				body="Ayanmo Corazza +2",
				ring1="Begrudging Ring",
				ring1="Ilabrat Ring",
				waist="Fotia Belt",
				legs="Carmine Cuisses +1",
				feet="Thereoid Greaves",
				back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	}

	sets.precast.WS['Savage Blade'] = {
				ammo="Ginsen",
				head="Vitiation Chapeau +2",
				body="Vitiation Tabard +2",
				hands="Atrophy Gloves +3",
				legs="Jhakri Slops +2",
				feet={ name="Chironic Slippers", augments={'"Mag.Atk.Bns."+12','DEX+1','Weapon skill damage +8%','Accuracy+15 Attack+15','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
				neck="Dls. Torque +1",
				waist="Sailfi Belt +1",
				left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
				right_ear="Ishvara Earring",
				left_ring = "Shukuyu Ring",
				right_ring="Karieyh Ring",
				back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.precast.WS['Death Blossom'] = {
				ammo="Ginsen",
				head="Vitiation Chapeau +2",
				body="Vitiation Tabard +2",
				hands="Atrophy Gloves +3",
				legs="Jhakri Slops +2",
				feet="Jhakri Pigaches +1",
				neck="Dls. Torque +1",
				waist="Sailfi Belt +1",
				left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
				right_ear="Ishvara Earring",
				left_ring = "Shukuyu Ring",
				right_ring="Karieyh Ring",
				back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
		
	sets.precast.WS['Sanguine Blade'] = {
				ammo="Pemphredo Tathlum",
				head="Pixie Hairpin +1",
				body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				hands="Jhakri Cuffs +2",
				legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
				neck="Sanctity Necklace",
				waist="Eschan Stone",
				left_ear="Friomisi Earring",
				right_ear="Hecate's Earring",
				left_ring="Shiva Ring +1",
				right_ring="Freke Ring",
				back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.precast.WS['Seraph Blade'] = {
				ammo="Pemphredo Tathlum",
				head="Pixie Hairpin +1",
				body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				hands="Jhakri Cuffs +2",
				legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
				neck="Sanctity Necklace",
				waist="Eschan Stone",
				left_ear="Friomisi Earring",
				right_ear="Hecate's Earring",
				left_ring="Shiva Ring +1",
				right_ring="Freke Ring",
				back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	-- Club WS Sets
	
	sets.precast.WS['Black Halo'] = {
				ammo="Ginsen",
				head="Vitiation Chapeau +2",
				body="Vitiation Tabard +2",
				hands="Atrophy Gloves +3",
				legs="Jhakri Slops +2",
				feet="Ayanmo Gambieras +2",
				neck="Dls. Torque +1",
				waist="Sailfi Belt +1",
				left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
				right_ear="Sherida Earring",
				left_ring = "Shukuyu Ring",
				right_ring="Karieyh Ring",
				back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	-- Dagger WS Sets
	
	sets.precast.WS['Aeolian Edge'] = {
				ammo="Pemphredo Tathlum",
				head="Jhakri Coronal +2",
				body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				hands="Jhakri Cuffs +2",
				legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
				neck="Sanctity Necklace",
				waist="Eschan Stone",
				left_ear="Friomisi Earring",
				right_ear="Hecate's Earring",
				left_ring="Shiva Ring +1",
				right_ring="Freke Ring",
				back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	sets.precast.WS['Evisceration'] = {
				ammo="Yetshila",
				head="Aya. Zucchetto +2",
				neck="Fotia Gorget",
				ear1="Mache Earring",
				ear2="Sherida Earring",
				body="Ayanmo Corazza +2",
				ring1="Begrudging Ring",
				ring1="Ilabrat Ring",
				waist="Fotia Belt",
				legs="Carmine Cuisses +1",
				feet="Thereoid Greaves",
				back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
				head="Ea Hat",
				neck="Mizu. Kubikazari",
				body="Ea Houppelande",
				hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				ring2="Mujin Band",
				legs="Ea Slops",
				feet="Ea Pigaches"
	}
	sets.RecoverBurst = {
				head="Ea Hat",
				neck="Mizu. Kubikazari",
				body="Seidr Cotehardie",
				hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
				ring1="Mujin Band",
				legs="Ea Slops",
				feet="Ea Pigaches"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"}

    sets.midcast.Cure = {
				main="Daybreak",
				sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','Spell interruption rate down -6%',}},
				ammo="Regal Gem",
				head="Kaykaus Mitra",
				body={ name="Vitiation Tabard +2", augments={'Enhances "Chainspell" effect',}},
				hands={ name="Kaykaus Cuffs +1", augments={'MP+60','MND+10','Mag. Acc.+15',}},
				legs="Atrophy Tights +2",
				feet="Kaykaus Boots",
				neck="Incanter's Torque",
				waist="Bishop's Sash",
				left_ear="Beatific Earring",
				right_ear="Roundel Earring",
				left_ring="Sirona's Ring",
				right_ring="Lebeche Ring",
				back="Altruistic Cape",
	}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs +1",ring1="Janniston Ring",ring2="Menelaus's Ring",
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
			sub			=	"Ammurapi Shield",
			ammo		=	"Staunch Tathlum +1",
			head		=	{name="Telchine Cap", augments={'Enh. Mag. eff. dur. +8',}},
			body		=	"Vitiation Tabard +2",
			hands		=	"Atrophy Gloves +3",
			legs		=	{name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
			feet		=	"Lethargy Houseaux +1",
			neck		=	"Dls. Torque +1",
			waist		=	"Embla Sash",
			left_ear	=	"Mimir Earring",
			right_ear	=	"Andoaa Earring",
			left_ring	=	"Stikini Ring",
			right_ring	=	"Stikini Ring",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
			head="Lethargy Chappel +1",
			body="Lethargy Sayon +1",
			legs="Lethargy Fuseau +1",
			feet="Lethargy Houseaux +1"
	}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {
			head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
			body="Atrophy Tabard +3",
			legs="Lethargy Fuseau +1",
			feet="Lethargy Houseaux +1",
	}
	sets.midcast.Aquaveil = {head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.BoostStat = {hands="Vitiation Gloves +2"}
	sets.midcast.Enspell = {head="Umuthi Hat", hands="Vitiation Gloves +2", legs="Atrophy Tights +2", neck="Incanter's Torque", waist="Olympus Sash", back="Ghostfyre Cape"}
	sets.midcast.Temper = {head="Umuthi Hat", hands="Vitiation Gloves +2", legs="Atrophy Tights +2", neck="Incanter's Torque", waist="Olympus Sash", back="Ghostfyre Cape"}
	
	sets.midcast['Enfeebling Magic'] = {
				main		=	"Grioavolr",
				sub			=	"Mephitis Grip",
				ammo		=	"Regal Gem",
				head		=	"Vitiation Chapeau +2",
				body		=	"Lethargy Sayon +1",
				hands		=	"Kaykaus Cuffs +1",
				legs		=	{ name="Chironic Hose", augments={'Mag. Acc.+30','MND+12','"Mag.Atk.Bns."+3',}},
				feet		=	"Vitiation Boots +3",
				neck		=	"Duelist's Torque +1",
				waist		=	"Luminary Sash",
				left_ear	=	"Snotra Earring",
				right_ear	=	"Dignitary's Earring",
				left_ring	=	"Stikini Ring",
				right_ring	=	"Stikini Ring",
				back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
	}
		
	sets.midcast['Enfeebling Magic'].Resistant = {
				main="Oranyan",
				sub="Enki Strap",
				ammo="Regal Gem",
				head="Atrophy Chapeau +2",
				neck="Dls. Torque +1",
				ear1="Regal Earring",
				ear2="Digni. Earring",
				body="Atrophy Tabard +3",
				hands="Kaykaus Cuffs +1",
				ring1="Stikini Ring",
				ring2="Stikini Ring",
				back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10',}},
				waist="Luminary Sash",
				legs={ name="Chironic Hose", augments={'Mag. Acc.+30','MND+12','"Mag.Atk.Bns."+3',}},
				feet="Vitiation Boots +3"
	}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
				head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
				head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
				head="Amalric Coif",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
				head="Amalric Coif",hands="Jhakri Cuffs +2",waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {body="Lethargy Sayon +1"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",hands="Lethargy Gantherots +1",body="Lethargy Sayon +1"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +2",waist="Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +2",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitiation Chapeau +2"})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Vitiation Chapeau +2"})
	
    sets.midcast['Elemental Magic'] = {
						main="Maxentius",
						sub="Ammurapi Shield",
						ammo="Pemphredo Tathlum",
						head="Jhakri Coronal +2",
						body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
						hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
						legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
						feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
						neck="Stoicheion Medal",
						waist="Eschan Stone",
						left_ear="Friomisi Earring",
						right_ear="Malignance Earring",
						left_ring="Freke Ring",
						right_ring="Shiva Ring +1",
						back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
		
    sets.midcast['Elemental Magic'].Resistant = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Freke",ring2="Shiva Ring +1",
        back="Sucellos's Cape",waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Fodder = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Freke",ring2="Shiva Ring +1",
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
		body="Twilight Cloak",hands="Lethargy Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Regal Gem",
		head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Atrophy Tabard +3",hands="Lethargy Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet=gear.merlinic_nuke_feet}

    sets.midcast.Drain = {
						main={ name="Rubicundity", augments={'Mag. Acc.+9','"Mag.Atk.Bns."+8','Dark magic skill +9','"Conserve MP"+5',}},
						sub="Ammurapi Shield",
						ammo="Pemphredo Tathlum",
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
		head="Amalric Coif",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Acuity Belt +1",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Impatiens",
		head="Vitiation Chapeau +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
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
					back		=	{ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
		
	sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
		head="Vitiation Chapeau +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Emet Harness +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}
		
	sets.idle.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Vitiation Chapeau +2",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs="Hagondes Pants +1",feet="Gende. Galosh. +1"}
		
	sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
		head="Vitiation Chapeau +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
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
        back="Sucellos's Cape",waist="Luminary Sash",legs="Lethargy Fuseau +1",feet="Telchine Pigaches"}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Vitiation = {main="Vitiation Sword",sub="Beatific Shield +1"}
	sets.weapons.Naegling = {main="Naegling",sub="Beatific Shield +1"}
	sets.weapons.Daybreak = {main="Daybreak",sub="Beatific Shield +1"}
	sets.weapons.Maxentius= {main="Maxentius",sub="Beatific Shield +1"}
	sets.weapons.DualEnspell = {main="Vitiation Sword",sub="Daybreak"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Tauret"}
	sets.weapons.DualClubs = {main="Maxentius",sub="Tauret"}
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
			head		=	{name="Taeon Chapeau", augments={'Accuracy+14 Attack+14','"Triple Atk."+2',}},
			body		=	"Malignance Tabard",
			hands		=	"Carmine Fin. Ga.",
			left_ring	=	"Hetairoi Ring",     
			legs		=	{name="Taeon Tights", augments={'Accuracy+15','"Triple Atk."+1',}},
			feet		=	{name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
			neck		=	"Anu Torque",
			waist		=	"Windbuffet Belt",
			left_ear	=	"Telos Earring",
			right_ear	=	"Sherida Earring",
			right_ring	=	"Chirich Ring",
			back		=	{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.DW = {
			ammo		=	"Ginsen",
			head		=	"Aya. Zucchetto +2",
			body		=	"Malignance Tabard",
			hands		=	"Atrophy Gloves +3",
			legs		=	"Carmine Cuisses +1",
			feet		=	"Ayanmo Gambieras +2",
			neck		=	"Anu Torque",
			waist		=	"Reiki Yotai",
			left_ear	=	"Telos Earring",
			right_ear	=	"Sherida Earring",
			left_ring	=	"Hetairoi Ring",
			right_ring	=	"Chirich Ring",
			back		=	{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
	
	sets.engaged.EnSpell = {
			ammo		=	"Hasty Pinion +1",
			head		=	"Aya. Zucchetto +2",
			body		=	"Malignance Tabard",
			hands		=	"Ayanmo Manopolas +2",
			legs		=	"Carmine Cuisses +1",
			feet		=	"Ayanmo Gambieras +2",
			neck		=	"Sanctity Necklace",
			waist		=	"Reiki Yotai",
			left_ear	=	"Telos Earring",
			right_ear	=	"Suppanomimi",
			left_ring	=	"Chirich Ring",
			right_ring	=	"Chirich Ring",
			back		=	{name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
		
	sets.engaged.PhysicalDef = {ammo="Ginsen",
		head="Vitiation Chapeau +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Emet Harness +1",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.MagicalDef = {ammo="Ginsen",
		head="Vitiation Chapeau +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
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
		set_macro_page(2, 18)
	end
end