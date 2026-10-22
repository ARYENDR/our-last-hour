extends Node

var gravity = 20.0

var collectedUpgrades: Array
var collectedEnemies: Array
var collectedCurses: Array
var collectedWeapons: Array

enum Upgrades {
	Swiftness_Ring, # 20% speed, -10% jump height. (20 Souls)
	Jump_Boots, # 20% jump height, -10% speed.
}

enum Enemies {
	Void, # Random points on the map will have explosions, don't get in them.
	Bloom, # Chases you around before exploding, stay away.
	Anxiety, # Perfectly tracks your movement and chases you, don't stay put, don't turn back.
	Oneshot, # Places a delayed crosshair on you before shooting, keep moving.
	Fear, # Appears randomly near a player, don't touch him.
	Snail, # Slowly but surely chases you, kills on impacct.
}

enum Hostiles {
	Tripmine, # Tripmines appear throughout the level, don't touch it.
	Tripwire, # Tripwires appear throughout the level, don't set it.
	Bomb, # Bombs drop from the sky, dodge.
	Laser, # Lasers spawn from outside the room, dodge.
}

enum Curses {
	Faster_Enemies, # Makes every moving enemy faster.
}

enum Weapons {
	Fist, # Punches a punchable enemy, kills instantly.
	Gun, # Shoots a bullet with a short range. 4 Bullets, long reload time.
}

enum Pedestals { # Pedestals appear at the top of the level, effect can take place during the second half.
	Gamble, # A random attribute will spawn. Check Gamble_Attributes enum.
	Destruction, # Level will get destroyed. You cannot fall back down.
	Hellscape, # Spawns one of every enemy in the game if the enemy isn't already on the round. Triple souls.
	NULL, # Sets every upgrade, enemy, curse, and weapon back to zero.	Protection, # Gives everybody a one-time shield for a price (0-300 R).
	Bloom, # Kills every enemy and ally in a specified radius. Radius can be controlled with souls.
	
}

enum Gambles {
	Double_Souls, # Double the collected souls since activation.
	More_Enemies, # More enemies spawn across the tower.
	Active_Hostiles, # Hostiles attack more often.
	So_Livid, # Void blows up 50% of the map.
	Hello_There, # Three random enemies spawn.
}
