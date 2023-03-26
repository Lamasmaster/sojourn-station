/*
 * Baseline Helmets
 */

//Regular Helmets
/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard operator gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD | EARS
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 5, bio = 0, rad = 0)//Intentionally worse than the actual armors, keep it that way or I swear on god. - Lamasmaster
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1

/obj/item/clothing/head/helmet/generic_full
	name = "full helmet"
	desc = "A generic non-branded full cover helmet with decent all round protection."
	icon_state = "helmet_full"
	armor_list = list(melee = 20, bullet = 20, energy = 20, bomb = 5, bio = 10, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/tanker
	name = "tanker helmet"
	desc = "Protects the head from damage while you are in a mech or joy riding the cargo trolley."
	icon_state = "tanker_helmet"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR
	siemens_coefficient = 1
	price_tag = 160
	armor_list = list(
		melee = 10,
		bullet = 10,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/tanker/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "tanker_helmet"
	options["Green"] = "tanker_helmet_green"
	options["Brown"] = "tanker_helmet_brown"
	options["Gray"] = "tanker_helmet_gray"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/biker
	name = "biker helmet"
	desc = "A helmet usually worn by bikers to protect their heads. This one comes in black."
	icon_state = "celty" // Durarara reference
	item_state = "celty"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR|HIDEEYES|BLOCKFACEHAIR|HIDEFACE //Speaking with one on should be muffled
	obscuration = HEAVY_OBSCURATION
	price_tag = 150
	armor_list = list(
		melee = 10,
		bullet = 0,
		energy = 0,
		bomb = 10, // Shock-absorbent
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/biker/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "celty"
	options["White"] = "celty_white"
	options["Red"] = "celty_red"
	options["Green"] = "celty_green"
	options["Blue"] = "celty_blue"
	options["Purple"] = "celty_purple"
	options["Pink"] = "celty_pink"
	options["Yellow"] = "celty_yellow"
	options["Rugby"] = "rugby"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "hm_helmet"
	obscuration = MEDIUM_OBSCURATION
	armor_list = list(
		melee = 10,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)//It's a piece of scrap, stop pretending it's not - Lamasmaster
	price_tag = 75

/obj/item/clothing/head/helmet/handmade/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Handmade"] = "hm_helmet"
	options["Greathelm"] = "hm_greathelm"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	obscuration = LIGHT_OBSCURATION
	armor_list = list(
		melee = 5,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/visor/cyberpunkgoggle
	name = "\improper Type-34C Semi-Enclosed Head Wear"
	desc = "Civilian model of a popular helmet used by certain law enforcement agencies. It does not have any armor plating, but has a neo-laminated fabric lining."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	siemens_coefficient = 0.9	//More conductive than most helmets
	armor_list = list(
		melee = 5,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/ballistic
	name = "ballistic helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel."
	icon_state = "helmet_mil"
	armor_list = list(melee = 30, bullet = 40, energy = 15, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/ballistic/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "helmet_mil_alt"
	options["Green"] = "helmet_green"
	options["Tan"] = "helmet_tan"
	options["Steelpot"] = "steelpot" //remember, no serbian

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/mercenary
	name = "mercenary helmet"
	desc = "What happens when someone combines ablative, melee, and bullet plating in the form of a fetching tan and visor. Not as singularly powerful as each individually but the best all round protection one can get."
	icon_state = "merchelm"
	armor_list = list(melee = 55, bullet = 55, energy = 55, bomb = 45, bio = 0, rad = 0) // best what you can get / Actually keeps same stats as armor for reasons of being top of the line
	obscuration = LIGHT_OBSCURATION

/*
 * Factions
 */

//Blackshield helmets
/obj/item/clothing/head/helmet/ballistic/militia
	name = "blackshield helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			This one bears the IFF stripes of the Blackshield."
	icon_state = "helmet_mil_alt"

/obj/item/clothing/head/helmet/ballistic/militia/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Colours"] = "helmet_mil_alt"
	options["Desert Combat"] = "helmet_tan_mil"
	options["Woodlands Blackshield Combat"] = "helmet_green_mil"
	options["Anthromorphic Blackshield Helmet"] = "helmet_mil_anthro"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/ballistic/militia/sergeant
	name = "sergeant's ballistic gorget"
	desc = "Standard military gear. A somewhat uncommon piece of equipment, despite its unusual appearance\n this piece of headgear provides much-needed protection to oft-neglected locations while not interfering unduly\
	with the user's range of motion or ability to communicate."
	icon_state = "sergeanthelm"
	item_state = "sergeanthelm"
	flags_inv = HIDEMASK

/obj/item/clothing/head/helmet/ballistic/militia/sergeant/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["gorget in standard mode"] = ""
	options["goggles on"] = "_goggle"
	options["cap on"] = "_cap"
	options["beret on"] = "_beret"
	options["head-strap on"] = "_bane"
	var/choice = input(M,"What do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You put your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/ballistic/militia/full
	name = "blackshield full helm"
	desc = "Standard military gear. A full-faced variant of the common ballistic helmet. This one bears a few\
	key upgrades, notably the inclusion of a face-protecting plate and lit eyeshield."
	icon_state = "bs_fullhelm"
	item_state = "bs_fullhelm"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "bsfullhelm_light"

/obj/item/clothing/head/helmet/ballistic/militia/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Standard fullhelm"] = ""
	options["Tan fullhelm"] = "_tan"
	options["Green fullhelm"] = "_green"
	options["Grey hooded fullhelm"] = "_gp"
	options["Green hooeded fullhelm"] = "_grp"
	options["Tan hooded fullhelm"] = "_tp"
	options["Camo hooded fullhelm"] = "_cp"
	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You adjust to the [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/ballistic/militia/full/corpsman
	name = "corpsman full helm"
	desc = "Standard military gear. A full-faced variant of the common ballistic helmet. This one bears a few\
	key upgrades, including sterile materials and contaminant resistant sealing."
	armor_list = list(melee = 30, bullet = 40, energy = 15, bomb = 30, bio = 75, rad = 0)
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "corpsmanfullhelm_light"

//Marshals
/obj/item/clothing/head/helmet/marshal
	name = "marshal helmet"
	desc = "Standard operator gear. Protects the head from impacts. Painted in marshal colors and features an eye shield"
	icon_state = "helmet_ironhammer"
	icon_state = "helmet_ironhammer"
	body_parts_covered = HEAD|EYES|EARS

/obj/item/clothing/head/helmet/marshal_full
	name = "marshal full helmet"
	desc = "A full helmet with a built in glow visor. While a weak light its better than nothing and the full cover design makes it ideal for general protection."
	icon_state = "ironhammer_full"
	item_state = "ironhammer_full"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	obscuration = LIGHT_OBSCURATION
	body_parts_covered = HEAD|FACE|EARS
	action_button_name = "Toggle Headlamp"
	brightness_on = 4

/obj/item/clothing/head/helmet/marshal_full/update_icon()
	if(on)
		icon_state = "ironhammer_full_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	else
		icon_state = "ironhammer_full"
		set_light(0, 0)
	update_wear_icon()
	..()

/obj/item/clothing/head/helmet/warrant_officer
	name = "warrant officer full helmet"
	desc = "A full helmet with a built in glow visor. This one appears to be fitted with new visor servos internally to protect from flashes as well as a bullet-proof reinforced mouth guard!"
	icon_state = "ironhammer_wo_full"
	item_state = "ironhammer_wo_full"
	flash_protection = FLASH_PROTECTION_MODERATE
	obscuration = LIGHT_OBSCURATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	armor_list = list(melee = 35, bullet = 45, energy = 25, bomb = 10, bio = 100, rad = 0)

/obj/item/clothing/head/helmet/warrant_officer/update_icon()
	if(on)
		icon_state = "ironhammer_wo_full_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	else
		icon_state = "ironhammer_wo_full"
		set_light(0, 0)
	update_wear_icon()
	..()

//Prospectors
/obj/item/clothing/head/helmet/foreman
	name = "salvaged helmet"
	desc = "A helmet patched together by Prospector Salvagers, light and easy to breath in, \
	the helmet has a few bells and whistles, a set of inbuilt goggles to keep dust and blood out of ones eyes, \
	salvaged Greyson material coating it's outside it offer superb protection, and even a inbuilt radio. \
	Tragically the scav in charge of the radio was unable to tune it or turn it on."
	icon_state = "forehead_helmet"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 30, MATERIAL_SILVER = 12) //worth stealing
	price_tag = 1200
	armor_list = list(melee = 35, bullet = 25, energy = 25, bomb = 65, bio = 100, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 5 //Slightly better do to the sear costs
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/helmet/foreman/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["salvaged helmet"] = "forehead_helmet"
	options["Rust"] = "alt_scavenger_helmet"
	options["Ranger"] = "quak" // Due to popular demand
	options["Rust Radio"] = "Scavrust_helm"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/handmade/scavengerhelmet
	name = "scavenger helmet"
	desc = "A sturdy, handcrafted helmet. It's well balanced and sits low on your head, with padding on the inside."
	icon_state = "scav_helmet"
	armor_list = list(melee = 35, bullet = 5, energy = 15, bomb = 5, bio = 0, rad = 0)
	price_tag = 200
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/helmet/handmade/scavengerhelmet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger grey"] = "scav_helmet"
	options["scavenger brown"] = "quak" // Quad damage!

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] colors.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/scav_heavy
	name = "scavenger plate helmet"
	desc = "A heavy helmet equipped with layers of metal and a reinforced glass visor, ideal for protection and headbutts. It even protects your eyes from welding flares!"
	icon_state = "scav_heavy"
	armor_list = list(melee = 40, bullet = 20, energy = 30, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MODERATE
	obscuration = MEDIUM_OBSCURATION
	price_tag = 150

/obj/item/clothing/head/helmet/scav_heavy/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger plate"] = "scav_heavy"
	options["alt scavenger plate"] = "scav_heavy_alt" // Quad damage!

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] colors.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Racial / Lore
 */

/obj/item/clothing/head/armor/helmet/penance
	name = "penance helmet"
	desc = "An old iron-wrought helmet upon a chainmail coif. These were resurrected from the time of castle retinues to serve again upon the heads of terrified conscripts and penal soldiers in the battle of Krios when the surplus of kevlar dwindled to a luxury; now only a distant piece of trash on a disconnected world. Among Kriosians, wearing this is a sign of penance and military ritual. Among Men, it is poverty and desperation interchanged."
	icon_state = "helmet_kriosanpenace"
	flags_inv = BLOCKHAIR
	armor_list = list(
		melee = 15,
		bullet = 15,
		energy = 0,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/frog
	name = "mar'qua helmet"
	desc = "A very old helmet from times of the first mar'qua spacefarers. It is beaten around the edges and made out of metal instead of polymer and alloys like the modern ones. Still for the mar'qua in the colony this is probably the best they have."
	icon_state = "helmet_frog"
	flags_inv = BLOCKHAIR
	armor_list = list(
		melee = 20,
		bullet = 20,
		energy = 5,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/frog/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Base Helmet"] = "helmet_frog"
	options["Blackshield Helmet"] = "helmet_frog_mil"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your mask's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Special helmets
 */
//Bulletproof
/obj/item/clothing/head/helmet/bulletproof
	name = "bulletproof helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	body_parts_covered = HEAD | EARS | FACE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	armor_list = list(melee = 25, bullet = 60, energy = 5, bomb = 10, bio = 0, rad = 0)
	price_tag = 250

/obj/item/clothing/head/helmet/ballistic/bulletproof/militia
	name = "blackshield bulletproof helmet"
	icon_state = "bulletproof_bs"
	desc = "Standard military gear. Protects exceptionally well from high-velocity solid projectiles \
	This one bears the IFF stripes of the Blackshield."
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "bs_bulletproof"

//Ablatives
/obj/item/clothing/head/helmet/laserproof
	name = "ablative helmet"
	desc = "A helmet that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	armor_list = list(melee = 5, bullet = 20, energy = 60, bomb = 10, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/laserproof/marshal
	icon_state = "ablative_ironhammer"
	item_state = "ablative_ironhammer"

/obj/item/clothing/head/helmet/laserproof/militia
	name = "blackshield ablative helmet"
	icon_state = "ablative_bs"
	desc = "An outdated, energy resistant helmet in a distinctive style. Loved by politicians, loathed by taxpayers and tolerated by the \
			local forces so often outfitted with it."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "bs_ablative"

/obj/item/clothing/head/helmet/laserproof/iron_lock_security
	name = "outdated ablative helmet"
	desc = "A \"Iron Lock Security\" helmet that excels in protecting the wearer against energy projectiles this even after all these years still is the base of ablative helmet design. Produced by Greyson Positronic"
	icon_state = "ablative"
	armor_list = list(melee = 10, bullet = 10, energy = 55, bomb = 5, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	obscuration = LIGHT_OBSCURATION
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_PLATINUM = 2) //cheaper
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

//Thunderdome
/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/*
 * Special helmets with HUDs
 */

//Security
/obj/item/clothing/head/helmet/riot_hud
	name = "marshal riot helmet"
	desc = "Standard-issue marshal helmet with a basic HUD and targeting system included, produced by Seinemetall Defense GmbH after more classic riot helmets were not able to handle the day to day riots."
	icon_state = "light_riot"
	flags_inv = HIDEEARS|BLOCKHAIR
	obscuration = MEDIUM_OBSCURATION
	body_parts_covered = HEAD|FACE|EARS
	armor_list = list(
		melee = 60,
		bullet = 15,
		energy = 0,
		bomb = 20,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MODERATE
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 300

/obj/item/clothing/head/helmet/riot_hud/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/riot_hud/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/riot_hud/verb/toggle()
	set name = "Toggle Riot HUD"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] HUD goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)//Turns the goggles on
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)//Turns the goggles off so they won't drain power while retracted
			to_chat(user, "You flip up [src] HUD goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/riot_hud/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/riot_hud/update_icon()
	if(hud in src)
		icon_state = "light_riot"
		set_light(0, 0)
	else
		icon_state = "light_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

//Nightvision
/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg
	name = "marshal tactical bulletproof helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt nightvision HUD."
	icon_state = "bulletproof_ironhammer"
	body_parts_covered = HEAD | EARS
	flags_inv = NONE
	action_button_name = "Toggle Night Vision"
	var/obj/item/clothing/glasses/powered/nightvision_helmet/hud
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	price_tag = 600

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/verb/toggle()
	set name = "Toggle Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] night vision goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)
			to_chat(user, "You flip up [src] night vision goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/update_icon()
	if(hud in src)
		icon_state = "bulletproof_ironhammer"
		set_light(0, 0)
	else
		icon_state = "bulletproof_ironhammer_on"
		set_light(1, 1, COLOR_LIGHTING_GREEN_MACHINERY)
	update_wear_icon()
	..()

//Thermal
/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal
	name = "marshal thermo-nightvision helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt thermal imaging HUD."
	icon_state = "bulletproof_ironhammer_thermal"
	body_parts_covered = HEAD|EARS
	flags_inv = NONE
	action_button_name = "Toggle Thermal Night Vision HUD"
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	var/obj/item/clothing/glasses/powered/thermal/thermal_helmet/hud
	price_tag = 2000

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/verb/toggle()
	set name = "Toggle Thermal Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] thermal imaging goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)
			to_chat(user, "You flip up [src] thermal imaging goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/update_icon()
	if(hud in src)
		icon_state = "bulletproof_ironhammer_thermal"
		set_light(0, 0)
	else
		icon_state = "bulletproof_ironhammer_thermal_on"
		set_light(1, 1, COLOR_LIGHTING_RED_BRIGHT)
	update_wear_icon()
	..()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * Faceshield Helmets
 */


// toggleable face guard
/obj/item/clothing/head/helmet/faceshield
	//We cant just use the armor var to store the original since initial(armor) will return a null pointer
	var/tint_down = TINT_LOW
	var/tint_up = TINT_NONE
	var/obscuration_down = HEAVY_OBSCURATION //This is equal to peaking throught a peephole
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHEADHAIR
	var/flags_inv_up = HIDEEARS
	body_parts_covered = HEAD|EARS|EYES|FACE
	var/body_parts_covered_up = HEAD|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	var/flash_protection_up = FLASH_PROTECTION_NONE
	action_button_name = "Flip Face Shield"
	tool_qualities = list()
	max_upgrades = 0
	var/list/armor_up = list()
	var/up = FALSE
	var/base_state

/obj/item/clothing/head/helmet/faceshield/riot
	name = "riot helmet"
	desc = "It's a outdated helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	armor_up = list(melee = 20, bullet = 0, energy = 0, bomb = 20, bio = 0, rad = 0)
	armor_list = list(melee = 45, bullet = 0, energy = 0, bomb = 35, bio = 0, rad = 0) //Close range attacks, doesn't mean bullets or lasers learn the difference.
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	price_tag = 150

/obj/item/clothing/head/helmet/faceshield/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()

/obj/item/clothing/head/helmet/faceshield/update_icon()
	if(!base_state)
		base_state = icon_state
	if(up)
		icon_state = "[base_state]_up"
	else
		icon_state = "[base_state]"

/obj/item/clothing/head/helmet/faceshield/refresh_upgrades()
	. = ..()
	if(!base_state)
		base_state = icon_state
	if(up)
		armor = getArmor(arglist(armor_up))
		flash_protection = flash_protection_up
		tint = tint_up
		obscuration = initial(obscuration)
		flags_inv = flags_inv_up
		body_parts_covered = body_parts_covered_up
	else
		flash_protection = initial(flash_protection)
		tint = initial(tint)
		obscuration = initial(obscuration)
		flags_inv = initial(flags_inv)
		body_parts_covered = initial(body_parts_covered)

//I wanted to name it set_up() but some how I thought that would be misleading
/obj/item/clothing/head/helmet/faceshield/proc/set_is_up(is_up)
	if(up == is_up) return
	up = is_up

	refresh_upgrades()

	update_icon()
	update_wear_icon()	//update our mob overlays

/obj/item/clothing/head/helmet/faceshield/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(usr, "You push the [src] up out of your face.")
		else
			to_chat(usr, "You flip the [src] down to protect your face.")

		usr.update_action_buttons()

// S E R B I A //

/obj/item/clothing/head/helmet/faceshield/altyn
	name = "altyn helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "altyn"
	armor_up = list(melee = 20, bullet = 30, energy = 0, bomb = 0, bio = 0, rad = 0)
	armor_list = list(melee = 40, bullet = 50, energy = 0, bomb = 10, bio = 0, rad = 0) //This thing actually sucks IRL
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/faceshield/altyn/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "altyn"
	options["Brown"] = "altyn_brown"
	options["Black"] = "altyn_black"
	options["maska"] = "maska"
	options["maska killa"] = "maska_killa"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/altyn/ironhammer
	icon_state = "ironhammer_altyn"
	item_state = "ironhammer_altyn"

/obj/item/clothing/head/helmet/faceshield/altyn/milisha
	name = "blackshield maska helmet"
	desc = "A maska helmet like any other but with nice camo options"
	icon_state = "maska_bs"

/obj/item/clothing/head/helmet/faceshield/altyn/milisha/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["maska dark camo"] = "maska_bs"
	options["maska forest camo"] = "maska_bs_green"
	options["maska red rock camo"] = "maska_bs_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
* Factions *
*/

//Lonestar
/obj/item/clothing/head/helmet/custodian
	name = "custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee = 25, bullet = 0, energy = 0, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = MEDIUM_OBSCURATION

//Church
/obj/item/clothing/head/helmet/acolyte
	name = "vector hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee = 35, bullet = 0, energy = 15, bomb = 15, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/helmet/acolyte/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["vector default"] = "acolyte"
	options["tangent ridge helmet"] = "tangent_ridge_helmet_switched"
	options["tangent ridge helmet open"] = "tangent_ridge_helmet"
	options["greater heart helmet"] = "greater_heart"
	options["tessellate helmet"] = "tessellate_helmet"
	options["factorial armor"] = "factorial_helmet"
	options["lemniscate helmet"] = "lemniscate_helmet"
	options["divisor helmet"] = "divisor_helmet"
	options["monomial helmet"] = "monomial_helmet"
	options["botanist default"] = "botanist"
	options["cosine men yoroi lens"] = "cosine_men_yoroi"
	options["cosine men yoroi lensless"] = "cosine_men_yoroi_switched"
	options["cosine men yoroi round lens"] = "cosine_men_yoroi_weeaboomode"
	options["sine cornette"] = "sine_cornette"
	options["sine cornette switched"] = "sine_cornette_switched"
	options["sine cornette switched alternative"] = "sine_cornette_switched_alternative"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/head/helmet/path //No path ?
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee = 35, bullet = 0, energy = 15, bomb = 15, bio = 100, rad = 80)
	body_parts_covered = HEAD|EARS
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/helmet/path/divisor
	name = "Divisor Plate Greathelm"
	desc = "An great helm with large red wings with latin engravings that lets it know the user is an enlightened Vector with it's vibrant colours. The openings of the helmet are an lie - there is biomatter-imbued, temperate silica glass that does not create shards when broken by harm, avoiding potential ways to be blinded while keeping the eyes protected from dust."
	icon_state = "divisor_plate_greathelm"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/divisor2
	name = "Divisor's Guardsmen Helmet"
	desc = "AThe armour of the church arms force of old. It's an efficiently made armour previously made only to be used by humans - now adjusted to fit all races with it's flexible biomatter properties. The helmet allows that the force of impact of a bullet or laser would be transferred towards the entirety of the equipment, what'd ensured the survival of guardsmen from New Byzantine during the invasion of Solfed until it was conquered by nuclear power by the year 2643."
	icon_state = "divisor_guardsmen_helmet"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/tessallate
	name = "Tessellate Veil"
	desc = "The Tesselate Veil keeps the user's face protected from the sun and sweat while performing surgeries or healing to avoid such problems from causing issues, and the same goes to avoid hair from falling into open wounds. It is possible to keep the eyes completely veiled with metal layer - so the tessellate shall guide itself with faith alone."
	icon_state = "tessellate_veil"
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/path/tessallate2
	name = "Tessellate Headgear"
	desc = "The rather curious hat of old design set by the church during their years as an small presence in New Byzantine. The doctors received this mask to perform surgeries in very dangerous areas away from the eyes of authority, many times in places which toxic waste from mining operations was common if not everywhere. Ever after the Church became an strong political entity the masks was still being used entirely because of the population's respect for the doctors - the masks an symbol of their presence."
	icon_state = "tessellate_maskheadgear"
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/path/lemniscate
	name = "Lemniscate Hat"
	desc = "The incredibly wide hat of Lemniscates only ensures it's fanciness- at it is the biggest among the other hats there is, this design follows the need to prevent sunburns while staying well suited on the head. There is the presence of inner layer of chain-mail and an slim, yet sturdy bowl-like amount of steel protecting the skull, hidden under the layers of smooth silk."
	icon_state = "lemniscate_hat"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/lemniscate2
	name = "Lemniscate Grenadier Hat"
	desc = "The fancy yet protective hat of the Lemniscate ecclesiastical members of New Byzantine, painted red and with new golden lines that lets an cruciform visible on it's middle. There is engraving which says, 'The death of heros can never be fully repaid, yet their sacrifice shall be honored for an eternity.' well visible both on the front and on the back. It honors the fallen ones and their sacrifice during the war against Solfed."
	icon_state = "lemniscate_grenadier_bearskin"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/monomial
	name = "Monomial Kabuto"
	desc = "An old helmet piece with minor plates overlapping and keeping the skull of it's user completely secure from damage. It allows attacks to glance down and spread the impact across the entire helmet instead of only one point, providing the capacity of survival of whoever keeps it on it's head. There is an rather demonic mask with angry expression well visible for intimidation tactics. The mask seems to be staring at the viewer's soul. At second glance, it becomes possible to notice the helmet was bend into shape with welding tool and hammers alone."
	icon_state = "monomial_kabuto"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/monomial2
	name = "Monomial Ajirogasa"
	desc = "Ajirogasa was before made with shaven bamboo or wood, used to protect the eyes from the sun. Now it's a sturdy helmet made out of secrets, that somehow folds the steel like straw in a manner that science still gags to understand. For years one could tell it was possible to sharpen the edges just to use these Ajirogasa as a throwing weapon, probably some kind of running gag that only hermits understands"
	icon_state = "monomial_ajirogasa"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/factorial
	name = "Factorial Powerhood"
	desc = "The Powerhoods are essentially the hollow facial structure of an golem that consented into becoming part of an factorial, always on watch and protecting the factorial, communicating with the factorial itself and providing guidance and vice-versa as some type of mutualism almost as if the Factorial armor itself possess an AI. Any time the helmet is removed from the user's face, the golem falls into an coma until it is equipped once again."
	icon_state = "factorial_powerhood"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/factorial2
	name = "Factorial Vesselcrew skullcap"
	desc = "An indespensable headwear of any combat behicle operator, well used by the mechanics who served under the banner of the New Byzantine and even to this day, it's design is used for pilots. Their protection is reliable to protect effectively the user's skull without letting too much force to be spread towards the user's neck, avoiding permanent injuries or death. After the extermination of the Mechanics after their sacrifice, the newly formed Factorials took to themselves to continue their glorious lineage out of honour."
	icon_state = "factorial_vesselcrew_shlemofon"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/rosaria
	name = "rosaria great helm"
	desc = "The rosaria protects. Deus Vult."
	icon_state = "rosaria_helm"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee = 55, bullet = 15, energy = 15, bomb = 50, bio = 100, rad = 100)
	obscuration = MEDIUM_OBSCURATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/head/helmet/rosaria/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["rosaria default"] = "rosaria_helm"
	options["rosaria alt"] = "rosaria_alt_helmet"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/prime
	name = "prime hood"
	desc = "A visored helmet with a cloth hood covering it."
	icon_state = "prime"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee = 35, bullet = 35, energy = 35, bomb = 10, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = MEDIUM_OBSCURATION
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/head/helmet/prime/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["prime dark"] = "prime"
	options["prime royal"] = "prime_alt"
	options["prime royal claric"] = "prime_alt2"
	options["prime royal doctor"] = "prime_alt3"
	options["prime saint"] = "prime_saint"
	options["prime paladin"] = "prime_paladin"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		if(choice == "prime saint")
			flags_inv = HIDEEARS
		else
			flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Hunter's Lodge
/obj/item/clothing/head/helmet/huntmaster_helmet
	name = "huntmaster nomad helm"
	desc = "Made from the hide of a render patriarch, this visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes. \
			There is a small chimera etched into the bone on the rear of the helmet."
	item_state = "huntmaster_helmet"
	icon_state = "huntmaster_helmet"
	armor_list = list(
		melee = 60,
		bullet = 20,
		energy = 15,
		bomb = 15,
		bio = 15,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/huntmaster_helmet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["huntmaster horned nomad helm"] = "huntmaster_helmet"
	options["huntmaster horned helm long snout"] = "huntmaster_helmet_alt"
	options["huntmaster hornless nomad helm"] = "huntmaster_helmet_hornless"
	options["huntmaster hornless helm long snout"] = "huntmaster_helmet_hornless_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/hunter
	name = "hunter's hood"
	desc = "A visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes."
	item_state = "hunter_helmet"
	icon_state = "hunter_helmet"
	armor_list = list(
		melee = 60,
		bullet = 10,
		energy = 5,
		bomb = 0,
		bio = 10,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/hunter/stalker
	item_state = "hunter_helmet_stalker"
	icon_state = "hunter_helmet_stalker"

/obj/item/clothing/head/helmet/hunter/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["combat helmet"] = "hunter_helmet"
	options["stalker hood"] = "hunter_helmet_stalker"
	options["visored helmet"] = "hunter_helmet_visor"
	options["nomad hooded-helm"] = "hunter_helmet_nomad"
	options["nomad helm long snout"] = "hunter_helmet_nomad_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Guild
/obj/item/clothing/head/helmet/technomancersuit
	name = "'Mark V' environmental protection helmet"
	desc = "You feel like this helmet is rare, for some reason."
	icon_state = "technohelmet"
	armor_list = list(melee = 40, bullet = 30, energy = 30, bomb = 50, bio = 100, rad = 100) //Expensive
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 4
	max_upgrades = 2
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/technomancersuit/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Environmental Default Helmet"] = "technohelmet"
	options["Anthro Helmet"] = "technohelmet_anthro"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your mask's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1
