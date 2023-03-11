scoreboard objectives add Lclick dummy
scoreboard objectives add Rclick dummy
scoreboard objectives add lifetime dummy
scoreboard objectives add lifetimePlaceholder dummy
scoreboard objectives add FireballCD dummy
scoreboard objectives add DragonBreathCD dummy
scoreboard objectives add DragonBreathCDseconds dummy
scoreboard objectives add DragonBreathCharge dummy
scoreboard objectives add RetainDragonBreathCharge dummy
scoreboard objectives add UnloadDragonBreathCharge dummy
scoreboard objectives add Burning dummy
scoreboard objectives add BurningCopy dummy
scoreboard objectives add BurningResultInDamage dummy
scoreboard objectives add 20 dummy
scoreboard players set storeScore 20 20
scoreboard objectives add 40 dummy
scoreboard players set storeScore 40 40
scoreboard objectives add FriendlyEvokerCD dummy
scoreboard objectives add Attack minecraft.custom:minecraft.damage_dealt
scoreboard objectives add AccumilatedAttack dummy
scoreboard objectives add AttackResetCD dummy
scoreboard objectives add flappingBounce dummy
scoreboard objectives add AttackCharge dummy
scoreboard objectives add Health dummy
scoreboard objectives add DeathAnimation dummy
scoreboard objectives add operationSuccess dummy
scoreboard objectives add playsoundTimer dummy
scoreboard objectives add shift custom:sneak_time
scoreboard objectives add rumbleCooldownPlayer dummy
scoreboard objectives add rumbleCooldownPlayerSeconds dummy

scoreboard objectives add upgradeFireWand crafted:blaze_rod
scoreboard objectives add FireWandLVL dummy
scoreboard objectives add FireWandUpgradedLVL dummy

scoreboard objectives add EmberaxAttackCycle dummy
scoreboard objectives add EmberaxAttackType dummy
scoreboard objectives add EmberaxAimedFireAttack dummy
scoreboard objectives add EmberaxSweepFireAttack dummy
scoreboard objectives add EmberaxSummonAttack dummy
scoreboard objectives add EmberaxRumbleAttack dummy
scoreboard objectives add EmberaxYlevel dummy


scoreboard objectives add CutsceneTriggerLevel dummy


bossbar add emberaxhealth {"text":"Emberax, the Dragon of the Fire-Scourge","color":"dark_red"}
bossbar set emberaxhealth name {"text":"Emberax, the Dragon of the Fire-Scourge","color":"dark_red"}
bossbar set emberaxhealth max 750
bossbar set emberaxhealth color red

bossbar add nazarhealth {"text":"Nazar, Dragon of the Soul Flame","color":"aqua"}
bossbar set nazarhealth name {"text":"Nazar, Dragon of the Soul Flame","color":"aqua"}
bossbar set nazarhealth max 1000
bossbar set nazarhealth color purple

bossbar add dragonbreathcharge {"text":"Dragonbreath Charge","color":"gold"}
bossbar set dragonbreathcharge name {"text":"Dragonbreath Charge","color":"gold"}
bossbar set dragonbreathcharge max 500
bossbar set dragonbreathcharge color yellow