/**********************Miner Lockers**************************/

/obj/structure/closet/secure_closet/personal/miner
	name = "miner's equipment"
	icon_state = "mining"
	req_access = list(access_merchant)
	access_occupy = list(access_mining)

/obj/structure/closet/secure_closet/personal/miner/populate_contents()

	new /obj/item/storage/backpack/industrial(src)
	new /obj/item/storage/backpack/satchel/industrial(src)
	new /obj/item/device/radio/headset/headset_cargo(src)
	new /obj/item/clothing/under/rank/miner(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/cell/medium(src)
	new /obj/item/cell/medium(src)
	new /obj/item/cell/small(src)
	new /obj/item/tool_upgrade/augment/fuel_tank(src)
	new /obj/item/device/scanner/gas(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/device/lighting/toggleable/flashlight/heavy(src)
	new /obj/item/tool/shovel(src)
	new /obj/item/tool/pickaxe(src)
	new /obj/item/tool/pickaxe/drill(src)
	new /obj/item/device/t_scanner(src)
	new /obj/item/gun/projectile/boltgun/flare_gun(src)
	new /obj/item/ammo_casing/flare(src)
	new /obj/item/device/ore_sonar(src)
	new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
	new /obj/item/clothing/accessory/job/cape/mining(src) // ROCK AND STONE, BRUDDAH!
	new /obj/item/gun/projectile/shotgun/pump(src)
	new /obj/item/ammo_magazine/ammobox/shotgun/buckshot(src)
	new /obj/item/ammo_magazine/ammobox/shotgun/buckshot(src)
	new /obj/item/storage/firstaid/ifak(src)

/******************************Lantern*******************************/

/obj/item/device/lighting/toggleable/lantern
	name = "lantern"
	icon_state = "lantern"
	item_state = "lantern"
	desc = "A mining lantern."
	brightness_on = 4			// luminosity when on

/obj/item/device/lighting/toggleable/lantern/censer
	name = "censer"
	icon_state = "censer"
	item_state = "censer"
	desc = "A silver-gold incense burner that releases a sweet, comforting perfume. Sometimes used in consecration ceremonies by the Church, where the incense is said to clean and purify the air so prayers may better reach the Absolute."
	brightness_on = 3			// luminosity when on
	turn_on_sound = 'sound/effects/Custom_flare.ogg'

/*****************************Pickaxe********************************/




/**********************Mining car (Crate like thing, not the rail car)**************************/

/obj/structure/closet/crate/miningcar
	desc = "A mining car. This one doesn't work on rails, but has to be dragged."
	name = "Mining car (not for rails)"
	icon = 'icons/obj/storage.dmi'
	icon_state = "miningcar"
	density = 1

// Flags.

/obj/item/stack/flag
	name = "flags"
	desc = "Some colourful flags."
	singular_name = "flag"
	amount = 10
	max_amount = 10
	icon = 'icons/obj/mining.dmi'
	var/upright = 0
	var/base_state

/obj/item/stack/flag/New()
	..()
	base_state = icon_state

/obj/item/stack/flag/red
	name = "red flags"
	singular_name = "red flag"
	icon_state = "redflag"

/obj/item/stack/flag/yellow
	name = "yellow flags"
	singular_name = "yellow flag"
	icon_state = "yellowflag"

/obj/item/stack/flag/green
	name = "green flags"
	singular_name = "green flag"
	icon_state = "greenflag"

/obj/item/stack/flag/attackby(obj/item/W as obj, mob/user as mob)
	if(upright && istype(W,src.type))
		src.attack_hand(user)
	else
		..()

/obj/item/stack/flag/attack_hand(user as mob)
	if(upright)
		upright = 0
		icon_state = base_state
		anchored = 0
		src.visible_message("<b>[user]</b> knocks down [src].")
	else
		..()

/obj/item/stack/flag/attack_self(mob/user as mob)

	var/obj/item/stack/flag/F = locate() in get_turf(src)

	var/turf/T = get_turf(src)
	if(!T || !istype(T,/turf/simulated/floor/asteroid))
		to_chat(user, "The flag won't stand up in this terrain.")
		return

	if(F && F.upright)
		to_chat(user, "There is already a flag here.")
		return

	var/obj/item/stack/flag/newflag = new src.type(T)
	newflag.amount = 1
	newflag.upright = 1
	anchored = 1
	newflag.name = newflag.singular_name
	newflag.icon_state = "[newflag.base_state]_open"
	newflag.visible_message("<b>[user]</b> plants [newflag] firmly in the ground.")
	src.use(1)
