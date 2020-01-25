function user_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry','Lionheart','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+25','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	--send_command('bind ^delete input /ja "Provoke" <stnpc>')
	--send_command('bind !delete input /ma "Cure IV" <stal>')
	--send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {	ammo="Aqreqaq Bomblet", --2
					head="Halitus Helm", --8
					body="Emet Harness", --10
					hands="Kurys Gloves", --9
					legs="Eri. Leg Guards +1", --7
					feet="Ahosi Leggings",--7
					neck="Unmoving Collar", --10
					ear1="Odnowa Earring +1", --4
					ear2="Friomisi Earring", --5
					ring1="Provocare Ring", --5
					ring2="Supershear Ring", --5
					back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, --10
					waist="Kasiri Belt", --3
		}
		 
    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
		head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Trux Earring",
		body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonbeam Ring",
		back=gear.enmity_jse_back,waist="Rumination Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}

    sets.Enmity.DT = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +2"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +2"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
								head={ name="Herculean Helm", augments={'Attack+25','Weapon skill damage +4%','Accuracy+5',}},
								body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
								hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
								legs={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}},
								feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+3','DEX+8',}},
								neck="Atzintli Necklace",
								waist="Salire Belt",
								ear1="Hecate's Earring",
								ear2="Friomisi Earring",
								ring1="Acumen Ring",
								back="Toro Cape",}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.element.Earth = {neck="Quanpur Necklace"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {	ammo="Aqreqaq Bomblet", 
						head="Rune. Bandeau +2", --12%
						body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},  --9%
						hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},  --8%
						legs="Aya. Cosciales +2",  --6%
						feet="Carmine Greaves",  --7%
						neck="Orunmila's Torque",  --5%
						waist="Kasiri Belt",
						ear2="Eabani Earring",
						ear1="Odnowa Earring +1", 
						ring1="Meridian Ring",
						ring2="Moonbeam Ring",
						back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},} --10%
			
	sets.precast.FC.DT = {	ammo="Aqreqaq Bomblet", 
						head="Rune. Bandeau +2", --12%
						body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},  --9%
						hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},  --8%
						legs="Aya. Cosciales +2",  --6%
						feet="Carmine Greaves",  --7%
						neck="Orunmila's Torque",  --5%
						waist="Kasiri Belt",
						ear2="Eabani Earring",
						ear1="Odnowa Earring +1", 
						ring1="Meridian Ring",
						ring2="Moonbeam Ring",
						back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},} --10%
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {	ammo="Knobkierrie",
						head={ name="Herculean Helm", augments={'Attack+25','Weapon skill damage +4%','Accuracy+5',}},
						body={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}},
						hands="Meg. Gloves +2",
						legs={ name="Herculean Trousers", augments={'Attack+28','Weapon skill damage +3%','DEX+8',}},
						feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+3','DEX+8',}},
						neck="Fotia Gorget",
						waist="Fotia Belt",
						ear1="Cessance Earring",
						ear2="Moonshade Earring",
						ring1="Epona's Ring",
						ring2="Ilabrat Ring",
						back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',},}}
	sets.precast.WS.SomeAcc = {ammo="Seeth. Bomblet +1",
            head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {ammo="Seeth. Bomblet +1",
            head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.precast.WS.HighAcc = {ammo="Seeth. Bomblet +1",
            head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back=gear.da_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.precast.WS.FullAcc = {ammo="Seeth. Bomblet +1",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Zennaroi Earring",
            body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{
						head={ name="Lustratio Cap +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
						ring2="Niqmaddu Ring",
						ear1="Sherida Earring",
						hands={ name="Herculean Gloves", augments={'Accuracy+24 Attack+24','"Triple Atk."+3','DEX+4',}},
						legs="Meg. Chausses +2",
						feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
						back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+5','"Dbl.Atk."+10',}},
	})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
						body={ name="Herculean Vest", augments={'Accuracy+20','Weapon skill damage +4%','STR+5','Attack+14',}},
						legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
						feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
						ring1="Niqmaddu Ring",
						ear1="Sherida Earring",
						back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Impatiens",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
						head="Erilaz Galea +1",
						neck="Incanter's Torque",
						ear1="Andoaa earring",
						ear2="Augment. earring",
						body="Manasa chasuble",
						hands="Runeist mitons +1",
						ring1="Stikini ring",
						ring2="Stikini ring",
						back="Merciful cape",
						waist="Olympus sash",
						legs="Carmine cuisses +1",
						feet="Erilaz Greaves +1"
	})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
						head="Fu. Bandeau +2",
						neck="Incanter's Torque",
						ear1="Andoaa earring",
						ear2="Augment. earring",
						body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
						hands={ name="Taeon Gloves", augments={'Spell interruption rate down -8%','Phalanx +3',}},
						ring1="Stikini ring",
						ring2="Stikini ring",
						back="Merciful cape",
						waist="Olympus sash",
						legs={ name="Taeon Tights", augments={'Spell interruption rate down -1%','Phalanx +3',}},
						feet={ name="Taeon Boots", augments={'Spell interruption rate down -8%','Phalanx +3',}},
	})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +2"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {	ammo="Homiliary",
					head="Fu. Bandeau +2",
					body="Runeist's Coat +3",
					hands="Turms Mittens +1",
					legs="Carmine Cuisses +1",
					feet="Turms Leggings +1",
					neck="Futhark Torque +1",
					ear2="Infused Earring",
					ear1="Genmei Earring",
					ring1="Defending Ring",
					ring2="Gelatinous Ring +1",
					back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
					waist="Ioskeha Belt",
	}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {
					ammo="Staunch Tathlum +1",
					head={ name="Fu. Bandeau +2", augments={'Enhances "Battuta" effect',}},
					body={ name="Futhark Coat +3", augments={'Enhances "Elemental Sforzo" effect',}},
					hands={ name="Herculean Gloves", augments={'Accuracy+24 Attack+24','"Triple Atk."+3','DEX+4',}},
					legs="Carmine Cuisses +1",
					feet="Erilaz Greaves +1",		
					neck="Futhark Torque +1",
					waist="Flume Belt +1 +1",
					ear1="Odnowa Earring +1",
					ear2="Genmei Earring",
					ring1="Defending Ring",
					ring2="Gelatinous Ring +1",
					back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Vim Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.idle.Weak = {ammo='Homiliary',
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's Coat +3",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet=gear.herculean_refresh_feet}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {	ammo="Staunch Tathlum +1",
							head="Turms Cap +1",
							body="Ashera Harness",
							hands="Turms Mittens +1",
							legs="Eri. Leg Guards +1",
							feet="Turms Leggings +1",
							neck="Futhark Torque +1",
							waist="Flume Belt +1",
							ear1="Odnowa Earring +1",
							ear2="Eabani Earring",
							ring1="Defending Ring",
							ring2="Moonbeam Ring",
							back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}
	sets.defense.PDT_HP = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.defense.MDT = {	ammo="Staunch Tathlum +1",
							head="Turms Cap +1",
							body="Runeist's Coat +3",
							hands="Turms Mittens +1",
							legs="Eri. Leg Guards +1",
							feet="Turms Leggings +1",
							neck="Futhark Torque +1",
							waist="Flume Belt +1",
							ear1="Hearty Earring",
							ear2="Odnowa Earring +1",
							ring1="Defending Ring",
							ring2="Gelatinous Ring +1",
							back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	
	}
	sets.defense.MDT_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.BDT = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	sets.defense.BDT_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
	sets.defense.MEVA_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {	ammo="Yamarang",
						head="Aya. Zucchetto +2",
						body="Ashera Harness",
						hands={ name="Adhemar Wristbands +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
						legs="Meg. Chausses +2",
						feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+3','DEX+8',}},
						neck="Anu Torque",
						waist="Ioskeha Belt",
						ear1="Telos Earring",
						ear2="Sherida Earring",
						ring1="Defending Ring",
						ring2="Niqmaddu Ring",
						back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
	
	}
    sets.engaged.SomeAcc = {ammo="Yamarang",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {ammo="Falcon Eye",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	sets.engaged.HighAcc = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	sets.engaged.FullAcc = {ammo="Falcon Eye",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Zennaroi Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
    sets.engaged.DTLite = {ammo="Yamarang",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
    sets.engaged.SomeAcc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.Acc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.HighAcc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.FullAcc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Zennaroi Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	
    sets.engaged.Tank = {	ammo="Staunch Tathlum +1",
							head="Turms Cap +1",
							body="Ashera Harness",
							hands="Turms Mittens +1",
							legs="Eri. Leg Guards +1",
							feet="Turms Leggings +1",
							neck="Futhark Torque +1",
							waist="Flume Belt +1",
							ear1="Odnowa Earring +1",
							ear2="Genmei Earring",
							ring1="Defending Ring",
							ring2="Gelatinous Ring +1",
							back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	
	}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(4, 12)
	elseif player.sub_job == 'RDM' then
		set_macro_page(5, 12)
	elseif player.sub_job == 'SCH' then
		set_macro_page(5, 12)
	elseif player.sub_job == 'BLU' then
		set_macro_page(3, 12)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 12)
	elseif player.sub_job == 'SAM' then
		set_macro_page(8, 12)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 12)
	else
		set_macro_page(5, 12)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end