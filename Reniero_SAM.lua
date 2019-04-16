function get_sets()

	send_command('bind f9 gs c toggle MTP set')
	send_command('bind f10 gs c toggle Idle set')
	send_command('bind f11 gs c toggle Shoha set')
	send_command('bind f12 gs c toggle Fudo set')
	send_command('bind ^f11 gs c toggle Apex set')
	send_command('bind ^f12 gs c toggle Kaiten set')
	
	
	
	function file_unload()
      
 
        send_command('unbind ^f9')
        send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
		send_command('unbind !f11')
        send_command('unbind !f12')
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
 
       
 
	end
	

		--Idle Sets--
		sets.Idle = {}		

		sets.Idle.index = {'Standard', 'Town'}
		
		Idle_ind = 1
		
		sets.Idle.Standard = {	ammo="Staunch Tathlum",
								head="Valorous Mask",
								body="Flamma Korazin +2",
								hands="Sakonji Kote",
								legs="Valor. Hose",
								feet="Danzo Sune-Ate",
								neck="Loricate Torque +1",
								waist="Flume Belt",
								left_ear="Genmei Earring",
								right_ear="Thureous Earring",
								left_ring="Defending Ring",
								right_ring="Vocane Ring",
								back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
							  
		sets.Idle.Town = {	ammo="Ginsen",
							head="Flam. Zucchetto +2",
							body="Kasuga Domaru +1",
							hands="Wakido Kote +2",
							legs="Hiza. Hizayoroi +2",
							feet="Danzo Sune-Ate",
							neck="Samurai's Nodowa",
							waist="Ioskeha Belt",
							left_ear="Cessance Earring",
							right_ear="Brutal Earring",
							left_ring="Flamma Ring",
							right_ring="Petrov Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
		
				
				
				
				
		--TP Sets--
		sets.TP = {}

		sets.TP.index = {'Standard', 'Accuracy', 'DT'}
		--1=Standard, 2=Accuracy, 3=DT--
		TP_ind = 1
	
		sets.TP.Standard = {ammo="Ginsen",
							head="Flam. Zucchetto +2",
							body="Kasuga Domaru +1",
							hands="Wakido Kote +2",
							legs="Ryuo Hakama",
							feet="Ryuo Sune-Ate",
							neck="Samurai's Nodowa",
							waist="Ioskeha Belt",
							left_ear="Cessance Earring",
							right_ear="Brutal Earring",
							left_ring="Flamma Ring",
							right_ring="Petrov Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
							
		sets.TP.Accuracy = {ammo="Ginsen",
							head="Flam. Zucchetto +2",
							body="Kendatsuba Samue",
							hands="Wakido Kote +2",
							legs="Kendatsuba Hakama",
							feet="Flam. Gambieras +2",
							neck="Samurai's Nodowa",
							waist="Ioskeha Belt",
							left_ear="Cessance Earring",
							right_ear="Digni. Earring",
							left_ring="Flamma Ring",
							right_ring="Petrov Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
							
		sets.TP.DT = {ammo="Ginsen",
					  head="Yaoyotl helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",
					  body="Miki. breastplate",hands="Wakido Kote +2",ring1="K'ayres ring",ring2="Rajas ring",
					  back="Takaha mantle",waist="Cetl belt",legs="Otronif brais",feet="Waki. Sune-Ate +1"}							  
							  
		sets.RangedTP = {}

		sets.RangedTP.index = {'Standard', 'AccuracyLite', 'AccuracyFull'}
		--1=Standard, 2=AccuracyLite, 3=AccuracyFull--
		TP_ind = 1
	
		sets.RangedTP.Standard = {range="Cibitshavore",ammo="Tulfaire arrow",
			  	          head="Otomi helm",neck="Iqabi necklace", ear1="Steelflash earring", ear2="Bladeborn earring", 			          
						  body="Sakonji domaru +1",hands="Umuthi gloves",ring1="K'ayres ring",ring2="Rajas ring",
				          back="Takaha mantle",waist="Cetl belt",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
							
		sets.RangedTP.AccuracyLite = {range="Cibitshavore",ammo="Tulfaire arrow",
					      head="Otomi helm",neck="Asperity necklace", ear1="Steelflash earring", ear2="Bladeborn earring",				      
						  body="Sakonji domaru +1",hands="Otronif gloves",ring1="K'ayres ring",ring2="Rajas ring",
					      back="Takaha mantle",waist="Dynamic belt +1",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
	
		sets.RangedTP.AccuracyFull = {range="Cibitshavore",ammo="Tulfaire arrow",
					      head="Yaoyotl helm",neck="Iqabi necklace", ear1="Steelflash earring", ear2="Bladeborn earring", 				      
						  body="Sakonji domaru +1",hands="Umuthi gloves",ring1="K'ayres ring",ring2="Rajas ring",
					      back="Takaha mantle",waist="Dynamic belt +1",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
							  
							  
							  
							  
							  
							  
		--Weaponskill Sets--
		sets.WS = {}
	
		sets.Shoha = {}
	
		sets.Shoha.index = {'Attack','Accuracy'}
		Shoha_ind = 1
	
		sets.Shoha.Attack = {	ammo="Knobkierrie",
								head="Flamma Zucchetto +2",
								body="Flamma Korazin +2",
								hands="Valorous mitts",
								legs="Hiza. Hizayoroi +2",
								feet="Flamma Gambieras +2",
								neck="Samurai's Nodowa",
								waist="Fotia Belt",
								left_ear="Moonshade Earring",
								right_ear="Ishvara Earring",
								left_ring="Flamma Ring",
								right_ring="Apate Ring",
								back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Damage taken-1%',}},}
								  
		sets.Shoha.Accuracy = {range="Cibitshavore",ammo="Tulfaire arrow",
					 		   head="Yaoyotl helm",neck="Shadow gorget",ear1="Brutal earring",ear2="Moonshade earring",
							   body="Phorcys korazin",hands="Umuthi gloves",ring1="Vulcan's ring",ring2="Pyrosoul ring",
							   back="Buquwik cape",waist="Dynamic belt +1",legs="Wakido haidate +1",feet="Sakonji sune-ate"}
							 
		sets.Fudo = {}
	
		sets.Fudo.index = {'Attack','Accuracy'}
		Fudo_ind = 1
	
		sets.Fudo.Attack = {ammo="Knobkierrie",
							head="Valorous Mask",
							body="Flamma Korazin +2",
							hands="Valorous mitts",
							legs="Hiza. Hizayoroi +2",
							feet="Valorous Greaves",
							neck="Samurai's Nodowa",
							waist="Fotia Belt",
							left_ear="Moonshade Earring",
							right_ear="Ishvara Earring",
							left_ring="Shukuyu Ring",
							right_ring="Apate Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Damage taken-1%',}},}
							   
		sets.Fudo.Accuracy = {range="Cibitshavore",ammo="Tulfaire arrow",
					 		  head="Yaoyotl helm",neck="Light gorget",ear1="Brutal earring",ear2="Moonshade earring",
							  body="Phorcys korazin",hands="Phorcys mitts",ring1="Pyrosoul ring",ring2="Rajas ring",
							  back="Buquwik cape",waist="Prosilio belt",legs="Wakido haidate +1",feet="Sakonji sune-ate"}
							  
		sets.Kaiten = {}
		
		sets.Kaiten.index = {'Attack','Accuracy'}
		Kaiten_ind = 1
	
		sets.Kaiten.Attack = {ammo="Knobkierrie",
							head="Valorous Mask",
							body="Flamma Korazin +2",
							hands="Valorous mitts",
							legs="Hiza. Hizayoroi +2",
							feet="Valorous Greaves",
							neck="Samurai's Nodowa",
							waist="Fotia Belt",
							left_ear="Moonshade Earring",
							right_ear="Ishvara Earring",
							left_ring="Shukuyu Ring",
							right_ring="Apate Ring",
							back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Damage taken-1%',}},}
							   
		sets.Kaiten.Accuracy = {range="Cibitshavore",ammo="Tulfaire arrow",
					  		    head="Yaoyotl helm",neck="Light gorget",ear1="Steelflash earring", ear2="Bladeborn earring",
							    body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Pyrosoul ring",
							    back="Buquwik cape",waist="Light belt",legs="Wakido haidate +1",feet="Sakonji sune-ate"}		
		sets.Jinpu = {}
		
		sets.Jinpu = {
				 	  head="Yaoyotl helm",neck="Soil gorget",ear1="Friomisi earring",ear2="Moonshade earring",							  
					  body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Pyrosoul ring",
					  back="Buquwik cape",waist="Soil belt",legs="Wakido haidate +1",feet="Sakonji sune-ate"}
					  
		
		sets.Ageha = {	ammo="Knobkierrie",
						head="Flam. Zucchetto +2",
						body="Flamma Korazin +2",
						hands="Flam. Manopolas +2",
						legs="Hiza. Hizayoroi +2",
						feet="Flam. Gambieras +2",
						neck="Samurai's Nodowa",
						waist="Fotia Belt",
						left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
						right_ear="Digni. Earring",
						left_ring="Flamma Ring",
						right_ring="Stikini Ring",
						back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%','Damage taken-1%',}},}

		sets.Apex = {}
	
		sets.Apex.index = {'Attack','Accuracy', 'Accuracy Max'}
		Apex_ind = 1
	
		sets.Apex.Attack = {range="Cibitshavore",ammo="Tulfaire arrow",
							head="Sakonji kabuto +1",neck="Light gorget",ear1="Matanki earring",ear2="Moonshade earring",
							body="Phorcys korazin",hands="Unkai kote +2",ring1="Stormsoul ring",ring2="Auster's ring",
							back="Buquwik cape",waist="Light belt",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
							
		sets.Apex.Accuracy = {range="Cibitshavore",ammo="Tulfaire arrow",
						  	  head="Sakonji kabuto +1",neck="Light gorget",ear1="Matanki earring",ear2="Moonshade earring",
						 	  body="Phorcys korazin",hands="Buremte gloves",ring1="Hajduk ring",ring2="Longshot ring",
							  back="Thall Mantle",waist="Light belt",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
							   
		sets.Apex.MaxAccuracy = {range="Cibitshavore",ammo="Tulfaire arrow",
					 	  	     head="Sakonji kabuto +1",neck="Light gorget",ear1="Matanki earring",ear2="Clearview earring",
						 	     body="Aetosaur Jerkin",hands="Buremte gloves",ring1="Hajduk ring",ring2="Longshot ring",
							     back="Thall Mantle",waist="Light belt",legs="Aeto. Trousers",feet="Waki. Sune-Ate +1"}

        sets.Namas = {}
	
		sets.Namas.index = {'Attack','Accuracy'}
		Namas_ind = 1
	
		sets.Namas.Attack = {range="Cibitshavore",ammo="Tulfaire arrow",
							 head="Otomi helm",neck="Flame gorget",ear1="Brutal earring",ear2="Moonshade earring",
							 body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
							 back="Buquwik cape",waist="Light belt",legs="Wakido haidate",feet="Gor. sollerets +1"}
							   
		sets.Namas.Accuracy = {range="Cibitshavore",ammo="Tulfaire arrow",
							   head="Yaoyotl helm",neck="Flame gorget",ear1="Brutal earring",ear2="Moonshade earring",
							   body="Phorcys korazin",hands="Phorcys mitts",ring1="Vulcan's ring",ring2="Rajas ring",
							   back="Buquwik cape",waist="Light belt",legs="Wakido haidate",feet="Gor. sollerets +1"}								
									  
									  
									  
									  
									  
		--Utility Sets--
		sets.Utility = {}
		
		sets.Utility.PDT = {head="Otronif mask",neck="Twilight torque",
							body="Miki. breastplate",hands="Otronif gloves",ring1="Dark ring",ring2="Dark ring",
							back="Mollusca mantle",waist="Flume belt",legs="Otronif brais",feet="Otronif boots"}
						
		sets.Utility.MDT = {head="Ogier's helm",neck="Twilight torque",
							body="Nocturnus mail",hands="Umuthi gloves",ring1="Dark ring",ring2="Dark ring",
						    back="Mollusca mantle",legs="Wakido haidate +1",feet="Waki. Sune-Ate +1"}
							
				
				
				
				
				
		--Job Ability Sets--
		sets.JA = {}
	
		sets.JA.Meditate = {head="Wakido kabuto",
							hands="Sakonji Kote",
							back="Takaha Mantle"}
							
		sets.JA.Meikyo = {feet="Sakonji sune-ate"}
end

		
		
function precast(spell)
	if spell.english == 'Meditate' then
		equip(sets.JA.Meditate)
	end
	
	if spell.english == 'Meikyo Shisui' then
		equip(sets.JA.Meikyo)
	end
		
	if spell.english == 'Tachi: Shoha' or spell.english == 'Tachi: Gekko' or spell.english == 'Tachi: Yukikaze' or spell.english == 'Tachi: Kasha' then
		equip(sets.Shoha[sets.Shoha.index[Shoha_ind]])
	end
	
	if spell.english == 'Tachi: Fudo' or spell.english == 'Tachi: Rana' then
        equip(sets.Fudo[sets.Fudo.index[Fudo_ind]])
    end
 
    if spell.english == 'Tachi: Kaiten' then
        equip(sets.Kaiten[sets.Kaiten.index[Kaiten_ind]])
    end
	
	 if spell.english == 'Tachi: Jinpu' then
        equip(sets.Jinpu)
    end
	
	if spell.english == 'Tachi: Ageha' then
        equip(sets.Ageha)
    end
	
	if spell.english == 'Vorpal Thrust' or spell.english == 'Wheeling Thrust' or spell.english == 'Impulse Drive' or spell.english == 'Stardiver' then
		equip(sets.Fudo[sets.Fudo.index[Fudo_ind]])
	end
	
	if spell.english == 'Apex Arrow' then
		equip(sets.Apex[sets.Apex.index[Apex_ind]])
	end

    if spell.english == 'Namas Arrow' then
		equip(sets.Namas[sets.Namas.index[Namas_ind]])
	end

    if spell.name == "Ranged" then
        equip(sets.Utility.Snapshot)
    end
	
	if spell.name == "Hasso" then
		equip(sets.TP[sets.TP.index[TP_ind]])
	end
end		

function midcast(spell,act)
    if spell.name == "Ranged" then
        equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
    end
end

function aftercast(spell,act)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function self_command(command)
	if command == 'toggle MTP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
    elseif command == 'toggle RTP set' then
		RangedTP_ind = RangedTP_ind +1
		if RangedTP_ind > #sets.RangedTP.index then RangedTP_ind = 1 end
		send_command('@input /echo <----- Ranged TP Set changed to '..sets.RangedTP.index[RangedTP_ind]..' ----->')
		equip(sets.RangedTP[sets.RangedTP.index[RangedTP_ind]])
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind +1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'toggle Shoha set' then
		Shoha_ind = Shoha_ind +1
		if Shoha_ind > #sets.Shoha.index then Shoha_ind = 1 end
		send_command('@input /echo <----- Tachi: Shoha Set changed to '..sets.Shoha.index[Shoha_ind]..' ----->')
    elseif command == 'toggle Fudo set' then
		Fudo_ind = Fudo_ind +1
		if Fudo_ind > #sets.Fudo.index then Fudo_ind = 1 end
		send_command('@input /echo <----- Tachi: Fudo Set changed to '..sets.Fudo.index[Fudo_ind]..' ----->')
    elseif command == 'toggle Kaiten set' then
		Kaiten_ind = Kaiten_ind +1
		if Kaiten_ind > #sets.Kaiten.index then Kaiten_ind = 1 end
		send_command('@input /echo <----- Tachi: Kaiten Set changed to '..sets.Kaiten.index[Kaiten_ind]..' ----->')
    elseif command == 'toggle Apex set' then
		Apex_ind = Apex_ind +1
		if Apex_ind > #sets.Apex.index then Apex_ind = 1 end
		send_command('@input /echo <----- Apex Arrow Set changed to '..sets.Apex.index[Apex_ind]..' ----->')
    elseif command == 'toggle Namas set' then
		Namas_ind = Namas_ind +1
		if Namas_ind > #sets.Namas.index then Namas_ind = 1 end
		send_command('@input /echo <----- Namas Arrow Set changed to '..sets.Namas.index[Namas_ind]..' ----->')
	elseif command == 'equip TP set' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'equip Idle set' then
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end