
--[[
        Custom commands:

        Becasue /sch can be a thing... I've opted to keep this part 

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
                                        Light Arts              Dark Arts
        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar addendum           Addendum: White         Addendum: Black
    
        Toggle Function: 
        gs c toggle melee               Toggle Melee mode on / off for locking of weapons
        gs c toggle idlemode            Toggles between Refresh, DT and MDT idle mode.
        gs c toggle nukemode            Toggles between Normal and Accuracy mode for midcast Nuking sets (MB included)  
        gs c toggle mainweapon			cycles main weapons in the list you defined below
		gs c toggle subweapon			cycles main weapons in the list you defined below

        Casting functions:
        these are to set fewer macros (1 cycle, 5 cast) to save macro space when playing lazily with controler
        
        gs c nuke cycle                 Cycles element type for nuking
        gs c nuke cycledown             Cycles element type for nuking in reverse order    
	gs c nuke enspellup             Cycles element type for enspell
	gs c nuke enspelldown		Cycles element type for enspell in reverse order 

        gs c nuke t1                    Cast tier 1 nuke of saved element 
        gs c nuke t2                    Cast tier 2 nuke of saved element 
        gs c nuke t3                    Cast tier 3 nuke of saved element 
        gs c nuke t4                    Cast tier 4 nuke of saved element 
        gs c nuke t5                    Cast tier 5 nuke of saved element 
        gs c nuke helix                 Cast helix2 nuke of saved element 
        gs c nuke storm                 Cast Storm buff of saved element  if /sch
		gs c nuke enspell		Cast enspell of saved enspell element		

        HUD Functions:
        gs c hud hide                   Toggles the Hud entirely on or off
        gs c hud hidemode               Toggles the Modes section of the HUD on or off
        gs c hud hidejob		Toggles the Job section of the HUD on or off
        gs c hud lite			Toggles the HUD in lightweight style for less screen estate usage. Also on ALT-END
        gs c hud keybinds               Toggles Display of the HUD keybindings (my defaults) You can change just under the binds in the Gearsets file. Also on CTRL-END

        // OPTIONAL IF YOU WANT / NEED to skip the cycles...  
        gs c nuke Ice                   Set Element Type to Ice DO NOTE the Element needs a Capital letter. 
        gs c nuke Air                   Set Element Type to Air DO NOTE the Element needs a Capital letter. 
        gs c nuke Dark                  Set Element Type to Dark DO NOTE the Element needs a Capital letter. 
        gs c nuke Light                 Set Element Type to Light DO NOTE the Element needs a Capital letter. 
        gs c nuke Earth                 Set Element Type to Earth DO NOTE the Element needs a Capital letter. 
        gs c nuke Lightning             Set Element Type to Lightning DO NOTE the Element needs a Capital letter. 
        gs c nuke Water                 Set Element Type to Water DO NOTE the Element needs a Capital letter. 
        gs c nuke Fire                  Set Element Type to Fire DO NOTE the Element needs a Capital letter. 
--]]

include('organizer-lib') -- optional
res = require('resources')
texts = require('texts')
include('Modes.lua')

-- Define your modes: 
-- You can add or remove modes in the table below, they will get picked up in the cycle automatically. 
-- to define sets for idle if you add more modes, name them: sets.me.idle.mymode and add 'mymode' in the group.
-- Same idea for nuke modes. 
idleModes = M('refresh', 'dt', 'mdt')
meleeModes = M('normal', 'acc', 'dt', 'mdt')
nukeModes = M('normal', 'acc')

------------------------------------------------------------------------------------------------------
-- Important to read!
------------------------------------------------------------------------------------------------------
-- This will be used later down for weapon combos, here's mine for example, you can add your REMA+offhand of choice in there
-- Add you weapons in the Main list and/or sub list.
-- Don't put any weapons / sub in your IDLE and ENGAGED sets'
-- You can put specific weapons in the midcasts and precast sets for spells, but after a spell is 
-- cast and we revert to idle or engaged sets, we'll be checking the following for weapon selection. 
-- Defaults are the first in each list

mainWeapon = M('Crocea Mors', 'Maxentius', 'Daybreak', 'Egeking', 'Naegling')
subWeapon = M('Ammurapi Shield', 'Machaera +3', 'Kaja Knife', 'Genmei Shield', 'Daybreak', 'Colada')
------------------------------------------------------------------------------------------------------

----------------------------------------------------------
-- Auto CP Cape: Will put on CP cape automatically when
-- fighting Apex mobs and job is not mastered
----------------------------------------------------------
CP_CAPE = "Mecisto. Mantle" -- Put your CP cape here
----------------------------------------------------------

-- Setting this to true will stop the text spam, and instead display modes in a UI.
-- Currently in construction.
use_UI = true
hud_x_pos = 1400    --important to update these if you have a smaller screen
hud_y_pos = 200     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 200 -- a value of 0 (invisible) to 255 (no transparency at all)
hud_font = 'Impact'


-- Setup your Key Bindings here:
	windower.send_command('bind insert gs c nuke cycle')        -- insert to Cycles Nuke element
	windower.send_command('bind delete gs c nuke cycledown')    -- delete to Cycles Nuke element in reverse order   
	windower.send_command('bind f9 gs c toggle idlemode')       -- F9 to change Idle Mode    
	windower.send_command('bind f8 gs c toggle meleemode')      -- F8 to change Melee Mode  
	windower.send_command('bind !f9 gs c toggle melee') 		-- Alt-F9 Toggle Melee mode on / off, locking of weapons
	windower.send_command('bind !f8 gs c toggle mainweapon')	-- Alt-F8 Toggle Main Weapon
	windower.send_command('bind ^f8 gs c toggle subweapon')		-- CTRL-F8 Toggle sub Weapon.
	windower.send_command('bind !` input /ma Stun <t>') 		-- Alt-` Quick Stun Shortcut.
	windower.send_command('bind home gs c nuke enspellup')		-- Home Cycle Enspell Up
	windower.send_command('bind PAGEUP gs c nuke enspelldown')  -- PgUP Cycle Enspell Down
	windower.send_command('bind ^f10 gs c toggle mb')           -- F10 toggles Magic Burst Mode on / off.
	windower.send_command('bind !f10 gs c toggle nukemode')		-- Alt-F10 to change Nuking Mode
	windower.send_command('bind F10 gs c toggle matchsc')		-- CTRL-F10 to change Match SC Mode      	
	windower.send_command('bind !end gs c hud lite')            -- Alt-End to toggle light hud version       
	windower.send_command('bind ^end gs c hud keybinds')        -- CTRL-End to toggle Keybinds  

--[[
    This gets passed in when the Keybinds is turned on.
    IF YOU CHANGED ANY OF THE KEYBINDS ABOVE, edit the ones below so it can be reflected in the hud using the "//gs c hud keybinds" command
]]
keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F7)'
keybinds_on['key_bind_casting'] = '(ALT-F10)'
keybinds_on['key_bind_mainweapon'] = '(ALT-F8)'
keybinds_on['key_bind_subweapon'] = '(CTRL-F8)'
keybinds_on['key_bind_element_cycle'] = '(INS + DEL)'
keybinds_on['key_bind_enspell_cycle'] = '(HOME + PgUP)'
keybinds_on['key_bind_lock_weapon'] = '(ALT-F9)'
keybinds_on['key_bind_matchsc'] = '(F10)'

-- Remember to unbind your keybinds on job change.
function user_unload()
    send_command('unbind insert')
    send_command('unbind delete')	
    send_command('unbind f9')
    send_command('unbind !f9')
    send_command('unbind f7')
    send_command('unbind !f8')
    send_command('unbind ^f8')
    send_command('unbind f10')
    send_command('unbind f12')
    send_command('unbind !`')
    send_command('unbind home')
    send_command('unbind !f10')	
    send_command('unbind `f10')
    send_command('unbind !end')  
    send_command('unbind ^end')  	
end

include('RDM_Lib.lua')

-- Optional. Swap to your sch macro sheet / book
set_macros(1,18) -- Sheet, Book

refreshType = idleModes[1] -- leave this as is     

-- Setup your Gear Sets below:
function get_sets()
    
    -- JSE
    AF = {}         -- leave this empty
    RELIC = {}      -- leave this empty
    EMPY = {}       -- leave this empty


	-- Fill this with your own JSE. 
    --Atrophy
    AF.Head		=	"Atrophy Chapeau +1"
    AF.Body		=	"Atrophy Tabard +1"
    AF.Hands	=	"Atrophy Gloves +1"
    AF.Legs		=	"Atrophy Tights +1"
    AF.Feet		=	"Atrophy Boots +1"

    --Vitiation
    RELIC.Head		=	"Vitiation Chapeau +1"
    RELIC.Body		=	"Vitiation Tabard +1"
    RELIC.Hands 	=	"Vitiation Gloves +1"
    RELIC.Legs		=	"Vitiation Tights +1"
    RELIC.Feet		=	"Vitiation Boots +1"

    --Lethargy
    EMPY.Head		=	"Lethargy Chappel"
    EMPY.Body		=	"Lethargy Sayon"
    EMPY.Hands		=	"Lethargy Gantherots"
    EMPY.Legs		=	"Lethargy Fuseau"
    EMPY.Feet		=	"Lethargy Houseaux"

    -- Capes:
    -- Sucellos's And such, add your own.
    RDMCape = {}
    RDMCape.TP		=	{ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
    RDMCape.MACC	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}

	-- SETS
     
    sets.me = {}        		-- leave this empty
    sets.buff = {} 			-- leave this empty
    sets.me.idle = {}			-- leave this empty
    sets.me.melee = {}          	-- leave this empty
    sets.weapons = {}			-- leave this empty
	
    -- Optional 
    --include('AugGear.lua') -- I list all my Augmented gears in a sidecar file since it's shared across many jobs. 

    -- Leave weapons out of the idles and melee sets. You can/should add weapons to the casting sets though
    -- Your idle set
    sets.me.idle.refresh = {
        ammo		=	"Homiliary",
        head		=	RELIC.Head,
        body		=	"Shamash Robe",
        hands		=	"Aya. Manopolas +2",
        --legs		=	Carm.Legs.D,
        feet		=	"Aya. Gambieras +2",
        neck		=	"Loricate Torque +1",
        waist		=	"Flume Belt",
        left_ear	=	"Genmei Earring",
        right_ear	=	"Ethereal Earring",
        left_ring	=	"Purity Ring",
        right_ring	=	"Defending Ring",
        back		=	"Engulfer Cape +1",
    }

    -- Your idle DT set
    sets.me.idle.dt = set_combine(sets.me.idle.refresh,{
        neck		=	"Loricate Torque +1",
        head		=	"Aya. Zucchetto +2",
        body		=	"Malignance Tabard",
        hands		=	"Aya. Manopolas +2",
        legs		=	RELIC.Legs,
        feet		=	"Aya. Gambieras +2",
		left_ring	=	"Ayanmo Ring",
        right_ring	=	"Defending Ring",
    })  
    sets.me.idle.mdt = set_combine(sets.me.idle.refresh,{

    })  
	-- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 

    }
    
    sets.me.latent_refresh = {waist="Fucho-no-obi"}     
    
	-- Combat Related Sets
	------------------------------------------------------------------------------------------------------
	-- Dual Wield sets
	------------------------------------------------------------------------------------------------------
    sets.me.melee.normaldw = set_combine(sets.me.idle.normal,{   
        ammo		=	"Ginsen",
        head		=	"Taeon Chapeau",
        body		=	"Malignance Tabard",
        hands		=	"Aya. Manopolas +2",
        left_ring	=	"Hetairoi Ring",     
        legs		=	"Ayanmo Cosciales +2",
        feet		=	"Aya. Gambieras +2",
        neck		=	"Anu Torque",
        waist		=	"Windbuffet Belt",
        left_ear	=	"Cessance Earring",
        right_ear	=	"Sherida Earring",
        right_ring	=	"Chirich Ring",
        back		=	"Bleating Mantle",   
    })
    sets.me.melee.accdw = set_combine(sets.me.melee.normal,{
        --head		=	Carm.Head.D,
        neck		=	"Sanctity Necklace",
        right_ear	=	"Mache Earring",
        waist		=	"Grunfeld Rope",
    })
    sets.me.melee.dtdw = set_combine(sets.me.melee.normal,{
        neck		=	"Loricate Torque +1",
        head		=	"Aya. Zucchetto +2",
        body		=	"Ayanmo Corazza +2",
        hands		=	"Aya. Manopolas +2",
        legs		=	RELIC.Legs,
        feet		=	"Aya. Gambieras +2",
		left_ring	=	"Ayanmo Ring",
        right_ring	=	"Defending Ring",
    })
    sets.me.melee.mdtdw = set_combine(sets.me.melee.normal,{

    })
	------------------------------------------------------------------------------------------------------
	-- Single Wield sets. -- combines from DW sets
	-- So canjust put what will be changing when off hand is a shield
 	------------------------------------------------------------------------------------------------------   
    sets.me.melee.normalsw = set_combine(sets.me.idle.normaldw,{   
        legs		=	RELIC.Legs,
    })
    sets.me.melee.accsw = set_combine(sets.me.melee.accdw,{

    })
    sets.me.melee.dtsw = set_combine(sets.me.melee.dtdw,{

    })
    sets.me.melee.mdtsw = set_combine(sets.me.melee.mdtdw,{

    })
	
	------------------------------------------------------------------------------------------------------
    -- Weapon Skills sets just add them by name.
	------------------------------------------------------------------------------------------------------
    sets.me["Savage Blade"] = {
        ammo		=	"Ginsen",
        head		=	"Jhakri Coronal +2",
        body		=	"Jhakri Robe +1",
        hands		=	"Jhakri Cuffs +1",
        legs		=	"Jhakri Slops +1",
        feet		=	"Jhakri Pigaches +1",
        neck		=	"Fotia Gorget",
        waist		=	"Fotia Belt",
        left_ear	=	{ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear	=	"Ishvara Earring",
        left_ring   =  	"Shukuyu Ring",
        right_ring	=	"Karieyh Ring",
        back		=	"Bleating Mantle",
	}
    sets.me["Black Halo"] = {
        ammo        =   "Regal Gem",
        head        =   RELIC.Head,
        body        =   RELIC.Body,
        hands       =   AF.Hands,
        legs        =   RELIC.Legs,
        feet        =   "Jhakri Pigaches +1",
        neck        =   "Dls. Torque +2",
        waist       =   "Prosilio Belt +1",
        left_ear    =   { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear   =   "Ishvara Earring",
        left_ring   =   "Stikini Ring",
        right_ring  =   "Rufescent Ring",
        back        =   RDMCape.MACC,
    }
    sets.me["Requiescat"] = {
        ammo        =   "Ginsen",
        --head      =   Taeon.Head.TP,
        body        =   "Ayanmo Corazza +2",
        hands       =   "Jhakri Cuffs +1",
        legs        =   RELIC.Legs,
        --feet      =   Carm.Feet.B,
        neck        =   "Fotia Gorget",
        waist       =   "Fotia Belt",
        left_ear    =   "Mache Earring",
        right_ear   =   "Sherida Earring",
        left_ring   =   "Begrudging Ring",
        right_ring  =   "Rufescent Ring",
        back        =   RDMCape.TP,
    }
    sets.me["Chant du Cygne"] = {
        ammo		=	"Ginsen",
        --head		=	Taeon.Head.TP,
        body		=	"Ayanmo Corazza +2",
        hands		=	"Jhakri Cuffs +1",
        legs		=	RELIC.Legs,
        --feet		=	Carm.Feet.B,
        neck		=	"Fotia Gorget",
        waist		=	"Fotia Belt",
        left_ear	=	"Mache Earring",
        right_ear	=	"Sherida Earring",
        left_ring	=	"Begrudging Ring",
        right_ring	=	"Rufescent Ring",
        back		=	RDMCape.TP,
    }
    sets.me["Sanguine Blade"] = {
        ammo		=	"Pemphredo Tathlum",
        head		=	"Pixie Hairpin +1",
        --body		=	Amal.Body.A,
        hands		=	"Jhakri Cuffs +1",
        --legs		=	Amal.Legs.A,
        feet		=	RELIC.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Refoccilation Stone",
        left_ear	=	"Ishvara Earring",
        right_ear	=	"Friomisi Earring",
        left_ring	=	"Archon Ring",
        right_ring	=	"Freke Ring",
        back		=	RDMCape.MACC,
    }
    sets.me["Red Lotus Blade"] = {
        ammo		=	"Pemphredo Tathlum",
        head		=	RELIC.Head,
        --body		=	Amal.Body.A,
        hands		=	"Jhakri Cuffs +1",
        --legs		=	Amal.Legs.A,
        feet		=	RELIC.Feet,
        neck		=	"Fotia Gorget",
        waist		=	"Fotia Belt",
        left_ear	=	"Ishvara Earring",
        right_ear	=	"Friomisi Earring",
        left_ring	=	"Freke Ring",
        right_ring	=	"Rufescent Ring",
        back		=	RDMCape.MACC,
    }
    sets.me["Seraph Blade"] = {
        ammo		=	"Pemphredo Tathlum",
        head		=	"Jhakri Coronal +2",
        body		=	"Amalric Doublet",
        hands		=	"Jhakri Cuffs +1",
        legs		=	"Jhakri Slops +1",
        feet		=	"Jhakri Pigaches +1",
        neck		=	"Fotia Gorget",
        waist		=	"Fotia Belt",
        left_ear	=	"Ishvara Earring",
        right_ear	=	"Friomisi Earring",
        left_ring	=	"Strendu Ring",
        right_ring	=	"Acumen Ring",
        back		=	RDMCape.MACC,
    }

    -- Feel free to add new weapon skills, make sure you spell it the same as in game. These are the only two I ever use though 
	
	
    ---------------
    -- Casting Sets
    ---------------
    sets.precast = {}   		-- Leave this empty  
    sets.midcast = {}    		-- Leave this empty  
    sets.aftercast = {}  		-- Leave this empty  
    sets.midcast.nuking = {}		-- leave this empty
    sets.midcast.MB	= {}		-- leave this empty   
    sets.midcast.enhancing = {} 	-- leave this empty   
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast RDM need 50 pre JP 42 at master
    sets.precast.casting = {
		head		=	AF.Head,       --12
		body		=	"Taeon Tabard",		--10
        legs		=	"Psycloth Lappas",    --6
		hands		=	"Leyline Gloves", 	  --8
        neck		=	"Orunmila's Torque",     --5
        left_ear	=	"Loquacious Earring",   --2
		feet		=	"Carmine Greaves",		--7
        left_ring	=	"Kishar Ring",          --4
        right_ring	=	"Rahab Ring",        --2
    }											--Total: 71 -- To Do: overkill need to slot DT / HP 

    sets.precast["Stun"] = set_combine(sets.precast.casting,{

    })

    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{

    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{
		waist		=	"Siegel Sash",
		neck		=	"Nodens Gorget",
		head		=	"Umuthi Hat",
		legs		=	"Haven Hose",
    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
	back		=	"Pahtli Cape",
    feet		=	"Telchine Pigaches",
	left_ring	=	"Lebeche Ring",		
    })
      
    ---------------------
    -- Ability Precasting
    ---------------------

    sets.precast["Chainspell"] = {body = RELIC.Body}
	 

	
	----------
    -- Midcast
    ----------
	
    -- Just go make it, inventory will thank you and making rules for each is meh.
    sets.midcast.Obi = {
    	waist="Hachirin-no-Obi",
    }
    sets.midcast.Orpheus = {
        --waist="Orpheus's Sash", -- Commented cause I dont have one yet
    }  
	-----------------------------------------------------------------------------------------------
	-- Helix sets automatically derives from casting sets. SO DONT PUT ANYTHING IN THEM other than:
	-- Pixie in DarkHelix
	-- Belt that isn't Obi.
	-----------------------------------------------------------------------------------------------
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.DarkHelix = {
	head		=	"Pixie Hairpin +1",
	waist		=	"Refoccilation Stone",
    left_ring	=	"Archon Ring",
    }
    -- Make sure you have a non weather obi in this set. Helix get bonus naturally no need Obi.	
    sets.midcast.Helix = {
	waist		=	"Refoccilation Stone",
    }	

    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = {
        left_ring	=	"Prolix Ring",    
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Pemphredo Tathlum",
        head		=	"Jhakri Coronal +2",
        body		=	"Shamash Robe",
        hands		=	"Amalric Gages",
        legs		=	"Jhakri Slops +1",
        feet		=	"Jhakri Pigaches +1",
        neck		=	"Stoicheion Medal",
        waist		=	"Eschan Stone",
        left_ear	=	"Friomisi Earring",
        right_ear	=	"Hecate's Earring",
        back		=	"Toro Cape",
        right_ring	=	"Acumen Ring",
    }

    sets.midcast.nuking.normal = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        left_ring	=	"Prolix Ring",    
        ammo		=	"Pemphredo Tathlum",
        --head		=	Merl.Head.ACC,
        --body		=	Amal.Body.A,
        --hands		=	Amal.Hands.D,
        --legs		=	Amal.Legs.A,
        --feet		=	Amal.Feet.A,
        neck		=	"Stoicheion Medal",
        waist		=	"Eschan Stone",
        left_ear	=	"Friomisi Earring",
        right_ear	=	"Hecate's Earring",
        back		=	"Toro Cape",
        right_ring	=	"Acumen Ring",
    }
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.normal = set_combine(sets.midcast.nuking.normal, {
        left_ring	=	"Mujin Band",    
        --head		=	Merl.Head.MB,
        --body		=	Merl.Body.MB,
        neck		=	"Mizu. Kubikazari",
        right_ring	=	"Locus Ring",
    })
	
    sets.midcast.nuking.acc = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        left_ring	=	"Shiva Ring",    
        ammo		=	"Pemphredo Tathlum",
        --head		=	Merl.Head.ACC,
        --body		=	Amal.Body.A,
        --hands		=	Amal.Hands.D,
        --legs		=	Amal.Legs.A,
        --feet		=	Amal.Feet.A,
        neck		=	"Dls. Torque +2",
        waist		=	"Refoccilation Stone",
        left_ear	=	"Friomisi Earring",
        right_ear	=	"Enchntr. Earring +1",
        back		=	RDMCape.MACC,
        right_ring	=	"Freke Ring",
    }
    -- used with toggle, default: F10
    -- Pieces to swap from freen nuke to Magic Burst
    sets.midcast.MB.acc = set_combine(sets.midcast.nuking.acc, {
        left_ring	=	"Mujin Band",    
        --head		=	Merl.Head.MB,
        --body		=	Merl.Body.MB,
        neck		=	"Mizu. Kubikazari",
        right_ring	=	"Locus Ring",
    })	
	
    -- Enfeebling

	sets.midcast.Enfeebling = {} -- leave Empty
	--Type A-pure macc no potency mod
    sets.midcast.Enfeebling.macc = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Hydrocera",
        head		=	"Jhakri Coronal +2",
        body		=	"Shamash Robe",
        hands		=	"Leyline Gloves",
        legs		=	"Chironic Hose",
        feet		=	"Ayanmo Gambieras +2",
        neck		=	"Erra Pendant",
        waist		=	"Luminary Sash",
        left_ear	=	"Gwati Earring",
        right_ear	=	"Dignitary's Earring",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	RDMCape.MACC
    }
	sets.midcast["Stun"] = set_combine(sets.midcast.Enfeebling.macc, {

	})
	--Type B-potency from: Mnd & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.mndpot = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Regal Gem",
        head		=	RELIC.Head,
        --body		=	Amal.Body.A,
        --hands		=	Kayk.Hands.A,
        legs		=	"Chironic Hose",
        feet		=	RELIC.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Porous Rope",
        left_ear	=	"Odnowa Earring +1",
        right_ear	=	"Enchntr. Earring +1",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	RDMCape.MACC
    }
	-- Type C-potency from: Int & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.intpot = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Regal Gem",
        head		=	RELIC.Head,
        --body		=	Amal.Body.A,
        --hands		=	Kayk.Hands.A,
        legs		=	"Chironic Hose",
        feet		=	RELIC.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Porous Rope",
        left_ear	=	"Odnowa Earring +1",
        right_ear	=	"Enchntr. Earring +1",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Freke Ring",
        back		=	RDMCape.MACC
    }
	--Type D-potency from: Enfeeb Skill & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillpot = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Regal Gem",
        head		=	RELIC.Head,
        --body		=	Amal.Body.A,
        --hands		=	Kayk.Hands.A,
        legs		=	"Chironic Hose",
        feet		=	RELIC.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Porous Rope",
        left_ear	=	"Odnowa Earring +1",
        right_ear	=	"Enchntr. Earring +1",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	RDMCape.MACC
    }
	-- Tpe E-potency from: Enfeeb skill, Mnd, & "Enfeeb Potency" gear
    sets.midcast.Enfeebling.skillmndpot = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Regal Gem",
        head		=	RELIC.Head,
        --body		=	Amal.Body.A,
        --hands		=	Kayk.Hands.A,
        legs		=	"Chironic Hose",
        feet		=	RELIC.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Porous Rope",
        left_ear	=	"Odnowa Earring +1",
        right_ear	=	"Enchntr. Earring +1",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	RDMCape.MACC
    }
	-- Type F-potency from "Enfeebling potency" gear only
    sets.midcast.Enfeebling.skillmndpot = {
        main		=	"Daybreak",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Regal Gem",
        head		=	RELIC.Head,
        --body		=	Amal.Body.A,
        --hands		=	Kayk.Hands.A,
        legs		=	"Chironic Hose",
        feet		=	RELIC.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Porous Rope",
        left_ear	=	"Odnowa Earring +1",
        right_ear	=	"Enchntr. Earring +1",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	RDMCape.MACC
    }
	
    -- Enhancing yourself 
    sets.midcast.enhancing.duration = {
        main		=	"Pukulatmuj +1",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Homiliary",
        head		=	"Telchine Cap",
        body		=	RELIC.Body,
        hands		=	AF.Hands,
        legs		=	"Telchine Braconi",
        feet		=	EMPY.Feet,
        neck		=	"Dls. Torque +2",
        waist		=	"Olympus Sash",
        left_ear	=	"Etiolation Earring",
        right_ear	=	"Andoaa Earring",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
		back		=	"Ghostfyre Cape",
        --back		=	RDMCape.MACC,
    }
    -- For Potency spells like Temper and Enspells
    sets.midcast.enhancing.potency = set_combine(sets.midcast.enhancing.duration, {
        main		=	"Pukulatmuj +1",
        --sub			=	"Ammurapi Shield",
        ammo		=	"Homiliary",
        head		=	"Umuthi Hat",
        body		=	RELIC.Body,
        hands		=	RELIC.Hands,
        legs		=	AF.Legs,
        feet		=	EMPY.Feet,
        neck		=	"Incanter's Torque",
        waist		=	"Olympus Sash",
        left_ear	=	"Etiolation Earring",
        right_ear	=	"Andoaa Earring",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	"Ghostfyre Cape",
    }) 

    -- This is used when casting under Composure but enhancing someone else other than yourself. 
    sets.midcast.enhancing.composure = set_combine(sets.midcast.enhancing.duration, {
        head		=	EMPY.Head,
        hands		=	AF.Hands,
        legs		=	EMPY.Legs,
        back		=	RDMCape.MACC,
    })  


    -- Phalanx
    sets.midcast.phalanx =  set_combine(sets.midcast.enhancing.duration, {
        body		=	"Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',},
        hands		=	"Taeon Gloves", augments={'Spell interruption rate down -8%','Phalanx +3',},
        legs		=	"Taeon Tights", augments={'Spell interruption rate down -1%','Phalanx +3',},
        feet		=	"Taeon Boots", augments={'Spell interruption rate down -8%','Phalanx +3',},
		neck		=	"Incanter's Torque",
        waist		=	"Olympus Sash",
        right_ear	=	"Andoaa Earring",
        left_ring	=	"Stikini Ring",
        right_ring	=	"Stikini Ring",
        back		=	"Merciful Cape",
    })

    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing.duration, {
	waist		=	"Siegel Sash",
    })
    sets.midcast.refresh = set_combine(sets.midcast.enhancing.duration, {
	--head		=	Amal.Head.A,
    })

    sets.midcast.aquaveil = set_combine(sets.midcast.refresh, {
	
	})
	
    sets.midcast["Drain"] = set_combine(sets.midcast.nuking, {
    main		=	"Rubicundity",
	head		=	"Pixie Hairpin +1",
	neck		=	"Erra Pendant",
	waist		=	"Fucho-no-obi",
	feet		=	"Merlinic Crackows",
	left_ring	=	"Excelsis Ring",
	back		=	"Perimede Cape",
    })
    sets.midcast["Aspir"] = sets.midcast["Drain"]
 	
    sets.midcast.cure = {} -- Leave This Empty
    -- Cure Potency
    sets.midcast.cure.normal = set_combine(sets.midcast.casting,{
        main		=	"Daybreak",
        ammo		=	"Homiliary",
        head		=	"Vanya Hood",
        body		=	"Gende. Bilaut +1",
        hands		=	"Telchine Gloves", 
        legs		=	AF.Legs,
        feet		=	RELIC.Feet,
        neck		=	"Nodens Gorget",
        waist		=	"Luminary Sash",
        left_ear	=	"Mendi. Earring",
        right_ear	=	"Roundel Earring",
        left_ring	=	"Sirona's Ring",
        right_ring	=	"Lebeche Ring",
        back		=	"Ghostfyre Cape",
    })
    sets.midcast.cure.weather = set_combine(sets.midcast.cure.normal,{

    })    

    ------------
    -- Regen
    ------------	
	sets.midcast.regen = set_combine(sets.midcast.enhancing.duration, {

    })

	
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function.
	
end
