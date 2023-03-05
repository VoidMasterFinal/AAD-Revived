# Overall Setup
execute unless entity @e[tag=basebarrel,type=armor_stand] run summon armor_stand ~ ~ ~ {Tags:["basebarrel"],Invisible:1,Marker:1,Small:1}
execute as @e[tag=basebarrel,type=armor_stand] at @s run setblock ~ ~ ~ barrel[]{Lock:"Do not remove"} keep
execute as @e[tag=basebarrel,type=armor_stand] at @s run item replace block ~ ~ ~ container.26 with netherite_sword{display:{Name:'{"text":"Arcane Sword","color":"#03A2FF","italic":false}',Lore:['{"text":"On hit gain +1 damage, resets after 5 sec","color":"aqua","italic":false}']},HideFlags:5,Unbreakable:1b,CustomModelData:arcanesword,Enchantments:[{id:"minecraft:sharpness",lvl:13s}]}


# Fireball
    # Fireball Summon
execute as @a at @s unless score @s FireballCD matches 0.. run scoreboard players set @s FireballCD 0
execute as @a at @s if entity @s[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] unless entity @e[type=interaction,tag=firewandhitbox,distance=..3] run summon interaction ~ ~0.5 ~ {Tags:["firewandhitbox"],response:1b,height:2,width:2}
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s FireballCD matches ..0 run scoreboard players add @s Rclick 1
execute as @a at @s if entity @s[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] if entity @e[type=interaction,tag=firewandhitbox,distance=..3] run tp @e[type=interaction,tag=firewandhitbox,limit=1,sort=nearest] ~ ~0.5 ~ facing ^ ^1 ^20
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 run summon armor_stand ~ ~1 ~ {Tags:["fireball","custom"],Invisible:1,Marker:1}
# execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 run summon armor_stand ~ ~1 ~ {Tags:["fireball","custom"],Invisible:1,Marker:1} add fireball levels
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 run playsound minecraft:item.firecharge.use ambient @a ~ ~1 ~ 6 1
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 run scoreboard players set @s FireballCD 100
    # Fireball Mechanics
scoreboard players add @e[type=armor_stand,tag=fireball] lifetime 1
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 1 run tp @s @p
execute as @e[type=armor_stand,tag=fireball] at @s run tp @s ^ ^ ^0.4
execute as @e[type=armor_stand,tag=fireball] at @s run particle flame ~ ~1 ~ 0.2 0.2 0.2 0.01 5 force
execute as @e[type=armor_stand,tag=fireball] at @s run particle dust_color_transition 1 0.8 0 1 0.7 0 0 ~ ~1 ~ 0.15 0.15 0.15 0.05 30 force
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 150.. run particle end_rod ~ ~1 ~ 0.1 0.1 0.1 0.4 40 force
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 150.. run playsound block.redstone_torch.burnout ambient @a ~ ~1 ~ 4 0.7
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 150.. run kill @s
execute as @e[type=armor_stand,tag=fireball] at @s unless block ~ ~1 ~ air run particle lava ~ ~1.2 ~ 0.1 0.1 0.1 0.4 40 force
execute as @e[type=armor_stand,tag=fireball] at @s unless block ~ ~1 ~ air run playsound block.redstone_torch.burnout ambient @a ~ ~1 ~ 4 0.7
execute as @e[type=armor_stand,tag=fireball] at @s unless block ~ ~1 ~ air run kill @s
execute as @e[type=armor_stand,tag=fireball] at @s if entity @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] run tag @s add fireballhit
execute as @e[type=armor_stand,tag=fireballhit] at @s run particle lava ~ ~1.2 ~ 0.1 0.1 0.1 0.4 40 force
execute as @e[type=armor_stand,tag=fireballhit] at @s run playsound block.redstone_torch.burnout ambient @a ~ ~1 ~ 4 0.7
execute as @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display] if entity @e[type=armor_stand,tag=fireballhit,distance=..1.5] run damage @s 6 minecraft:in_fire by @s
execute as @e[type=armor_stand,tag=fireballhit] at @s run scoreboard players add @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] Burning 100
execute as @e[type=armor_stand,tag=fireballhit] at @s run kill @s
    # Fireball Cooldown
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireballCD matches ..0 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":". . . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireballCD matches 1..20 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I . . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireballCD matches 21..40 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireballCD matches 41..60 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireballCD matches 61..80 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I I .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireballCD matches 81.. run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I I I","color":"green"},{"text":" ]","color":"gold"}]
execute as @a at @s if score @s FireballCD matches 1.. run scoreboard players remove @s FireballCD 1
    # Fireball Score Cleanup
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. run kill @e[type=interaction,tag=firewandhitbox]
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. run scoreboard players set @s Rclick 0
execute as @a at @s unless entity @p[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}},distance=..3] run kill @e[type=interaction,tag=firewandhitbox,distance=..3]


    # Burn Status Effect
execute as @e at @s run scoreboard players operation @s BurningCopy = @s Burning
execute as @e at @s if score @s Burning matches 1.. store result score @s BurningResultInDamage run scoreboard players operation @s BurningCopy %= storeScore 20
execute as @e at @s if score @s BurningResultInDamage matches 0 run particle flame ~ ~1 ~ 0.5 0.5 0.5 0 40 force
execute as @e at @s if score @s BurningResultInDamage matches 0 run damage @s 2 minecraft:on_fire
execute as @e at @s if score @s Burning matches 1.. run scoreboard players remove @s Burning 1


    # Friendly Evoker
execute as @e[tag=friendlyevoker,type=evoker] at @s run tp @s ~ ~ ~ facing entity @p[distance=..15] feet
execute as @e[tag=friendlyevoker,type=evoker] at @s unless entity @e[type=interaction,distance=..1,tag=friendlyevokerpoint] run summon interaction ~ ~ ~ {Tags:["friendlyevokerpoint"],response:1b,height:2,width:1.2}
execute as @e[tag=friendlyevokerpoint,type=interaction] at @s unless entity @e[type=evoker,distance=..2,tag=friendlyevoker] run kill @s
execute as @e[type=interaction,tag=friendlyevokerpoint] on target unless score @s FriendlyEvokerCD matches 1.. run scoreboard players add @s Rclick 1
execute as @e[type=interaction,tag=friendlyevokerpoint] on target if score @s Rclick matches 1.. unless score @s FriendlyEvokerCD matches 1.. run effect give @s minecraft:saturation 5 4 true
execute as @e[type=interaction,tag=friendlyevokerpoint] on target if score @s Rclick matches 1.. unless score @s FriendlyEvokerCD matches 1.. run effect give @s minecraft:regeneration 5 4 true
execute as @e[type=interaction,tag=friendlyevokerpoint] on target at @s if score @s Rclick matches 1.. unless score @s FriendlyEvokerCD matches 1.. run playsound minecraft:block.beacon.power_select ambient @a ~ ~1 ~ 5 1.2
execute as @e[type=interaction,tag=friendlyevokerpoint] on target at @s if score @s Rclick matches 1.. unless score @s FriendlyEvokerCD matches 1.. run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 30 force
execute as @e[type=interaction,tag=friendlyevokerpoint] on target at @s if score @s Rclick matches 1.. unless score @s FriendlyEvokerCD matches 1.. run spawnpoint @s ~ ~ ~
execute as @e[type=interaction,tag=friendlyevokerpoint] on target at @s if score @s Rclick matches 1.. unless score @s FriendlyEvokerCD matches 1.. run scoreboard players set @s FriendlyEvokerCD 40
execute as @a at @s if score @s FriendlyEvokerCD matches 1.. run scoreboard players remove @s FriendlyEvokerCD 1
execute as @e[type=interaction,tag=friendlyevokerpoint] on target if score @s Rclick matches 1.. run scoreboard players set @s Rclick 0
execute as @e[type=interaction,tag=friendlyevokerpoint] on target run kill @e[type=interaction,tag=friendlyevokerpoint]


    # Remove Custom Entity
execute as @e[type=armor_stand,tag=remcustom] at @s run kill @e[tag=custom,distance=..5,limit=1,sort=nearest]
execute as @e[type=armor_stand,tag=remcustom] at @s run kill @s


    # Arcane Sword
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s Attack matches 1.. run scoreboard players set @s AttackResetCD 100
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s Attack matches 1.. at @e[tag=basebarrel,type=armor_stand] run item replace block ~ ~ ~ container.0 from entity @s weapon.mainhand
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s Attack matches 1.. store result score @s AccumilatedAttack at @e[tag=basebarrel,type=armor_stand] run data get block ~ ~ ~ Items[0].tag.Enchantments[{id:"minecraft:sharpness"}].lvl
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s Attack matches 1.. run scoreboard players add @s AccumilatedAttack 2
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s Attack matches 1.. at @e[tag=basebarrel,type=armor_stand] store result block ~ ~ ~ Items[0].tag.Enchantments[{id:"minecraft:sharpness"}].lvl short 1 at @s run scoreboard players get @s AccumilatedAttack
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s Attack matches 1.. at @e[tag=basebarrel,type=armor_stand] run item replace entity @s weapon.mainhand from block ~ ~ ~ container.0
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches ..0 at @e[tag=basebarrel,type=armor_stand] run item replace entity @s weapon.mainhand from block ~ ~ ~ container.26
    # Arcane Sword Buff Reset Display
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches ..0 run title @s actionbar [{"text":"Attack Growth Reset Timer: [ ","color":"blue"},{"text":". . . . .","color":"gold"},{"text":" ]","color":"blue"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches 1..20 run title @s actionbar [{"text":"Attack Growth Reset Timer: [ ","color":"blue"},{"text":"I . . . .","color":"gold"},{"text":" ]","color":"blue"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches 21..40 run title @s actionbar [{"text":"Attack Growth Reset Timer: [ ","color":"blue"},{"text":"I I . . .","color":"gold"},{"text":" ]","color":"blue"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches 41..60 run title @s actionbar [{"text":"Attack Growth Reset Timer: [ ","color":"blue"},{"text":"I I I . .","color":"gold"},{"text":" ]","color":"blue"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches 61..80 run title @s actionbar [{"text":"Attack Growth Reset Timer: [ ","color":"blue"},{"text":"I I I I .","color":"gold"},{"text":" ]","color":"blue"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword",tag:{CustomModelData:arcanesword}}}] at @s if score @s AttackResetCD matches 81.. run title @s actionbar [{"text":"Attack Growth Reset Timer: [ ","color":"blue"},{"text":"I I I I I","color":"gold"},{"text":" ]","color":"blue"}]
execute as @a at @s if score @s AttackResetCD matches 1.. run scoreboard players remove @s AttackResetCD 1


    # Emberax, the Dragon of the Fire-Scourge
scoreboard players add @e[type=armor_stand,tag=emberax] lifetime 1
scoreboard players add @e[type=armor_stand,tag=deadEmberax] DeathAnimation 1
execute as @e[tag=emberax,type=armor_stand] at @s unless entity @e[type=giant,tag=emberaxhitbox,distance=..10] if score @s lifetime matches 20.. run tag @s add deadEmberax
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1..100 run particle flash ~ ~1 ~ 2 2 2 1 1 force
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1..100 run particle campfire_cosy_smoke ~ ~1 ~ 0 0 0 0.3 3 force
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1..100 run particle soul ~ ~1 ~ 0 0 0 0.3 3 force
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1 run playsound minecraft:entity.wither.death hostile @a ~ ~1 ~ 5 0
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1 run playsound minecraft:block.beacon.deactivate hostile @a ~ ~1 ~ 5 0.6
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1 run playsound minecraft:block.beacon.deactivate hostile @a ~ ~1 ~ 5 0.6
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1 run playsound minecraft:block.beacon.deactivate hostile @a ~ ~1 ~ 5 0.6
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 1 run bossbar set emberaxhealth players 0
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 95.. run particle lava ~ ~1 ~ 2 2 2 1 200 force
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 95 run playsound
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 100.. run kill @e[tag=emberaxpart,distance=..10]
execute as @e[tag=deadEmberax,type=armor_stand] at @s if score @s DeathAnimation matches 100.. run kill @s
execute as @e[tag=emberax,type=armor_stand] at @s run fill ~-1 ~1 ~-1 ~1 ~3 ~1 air replace light
execute as @e[tag=emberax,type=armor_stand] at @s run setblock ~ ~2 ~ light keep
execute as @e[tag=emberax,type=armor_stand,tag=!deadEmberax] at @s unless entity @e[type=block_display,tag=emberaxhead1,distance=..10] run summon block_display ^-0.5 ^0.5 ^-0.5 {Tags:["emberaxhead1","emberaxpart"],block_state:{Name:"minecraft:white_concrete"}}
execute as @e[tag=emberax,type=armor_stand,tag=!deadEmberax] at @s unless entity @e[type=giant,tag=emberaxhitbox,distance=..10] run summon giant ~ ~ ~ {NoGravity:1b,Silent:1b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Health:750f,Tags:["emberaxhitbox"],ActiveEffects:[{Id:14,Amplifier:1b,Duration:100000000,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:750}]}
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if score @s lifetime matches 1 run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0.65
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if score @s lifetime matches 1 run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if score @s lifetime matches 1 run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0.8
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if score @s lifetime matches 1 run particle flame ~ ~1 ~ 0.2 0.2 0.2 0.3 30 force
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if score @s lifetime matches 1 run particle small_flame ~ ~1 ~ 0.2 0.2 0.2 0.3 30 force
execute as @e[tag=emberax,type=armor_stand] at @s run tp @e[tag=emberaxhead1,type=block_display] ~-0.5 ~0.5 ~-0.5
execute as @e[tag=emberax,type=armor_stand] at @s run tp @e[tag=emberaxhitbox,type=giant] ~ ~ ~
execute as @e[tag=emberaxhitbox,type=giant] at @s store result bossbar emberaxhealth value run data get entity @s Health
execute as @e[tag=emberax,type=armor_stand,tag=!deadEmberax] at @s run bossbar set emberaxhealth players @a[distance=..25]
execute as @e[tag=emberaxActive,type=armor_stand] at @s run tp @s ~ ~ ~ facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[tag=emberax,type=armor_stand] at @s unless score @s EmberaxAttackType matches 0.. run scoreboard players set @s EmberaxAttackType 0
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if entity @p[distance=..25,gamemode=!creative,gamemode=!spectator] run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0.65
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if entity @p[distance=..25,gamemode=!creative,gamemode=!spectator] run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if entity @p[distance=..25,gamemode=!creative,gamemode=!spectator] run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0.8
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if entity @p[distance=..25,gamemode=!creative,gamemode=!spectator] run particle flame ~ ~1 ~ 0.2 0.2 0.2 0.3 30 force
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s if entity @p[distance=..25,gamemode=!creative,gamemode=!spectator] run particle small_flame ~ ~1 ~ 0.2 0.2 0.2 0.3 30 force
execute as @e[type=armor_stand,tag=emberax] at @s if entity @p[distance=..25,gamemode=!creative,gamemode=!spectator] run tag @s add emberaxActive
execute as @e[type=armor_stand,tag=emberax] at @s unless entity @p[distance=..35,gamemode=!creative,gamemode=!spectator] run scoreboard players set @s EmberaxAimedFireAttack 0
execute as @e[type=armor_stand,tag=emberax] at @s unless entity @p[distance=..35,gamemode=!creative,gamemode=!spectator] run scoreboard players set @s EmberaxSweepFireAttack 0
execute as @e[type=armor_stand,tag=emberax] at @s unless entity @p[distance=..35,gamemode=!creative,gamemode=!spectator] run scoreboard players set @s EmberaxAttackType 0
execute as @e[type=armor_stand,tag=emberax] at @s unless entity @p[distance=..35,gamemode=!creative,gamemode=!spectator] run scoreboard players set @s EmberaxRumbleAttack 0
execute as @e[type=armor_stand,tag=emberax] at @s unless entity @p[distance=..35,gamemode=!creative,gamemode=!spectator] run scoreboard players set @s EmberaxSummonAttack 0
execute as @e[type=armor_stand,tag=emberax] at @s unless entity @p[distance=..35,gamemode=!creative,gamemode=!spectator] run tag @s remove emberaxActive
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxActive] at @s run scoreboard players set @s EmberaxAttackCycle 0
execute as @e[type=armor_stand,tag=emberaxActive,tag=!deadEmberax] at @s run scoreboard players add @s EmberaxAttackCycle 1
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAttackCycle matches 300.. run summon armor_stand ~ ~ ~ {Tags:["emberaxrandom","emberaxrandom1","emberaxpart"],Invisible:1,Marker:1}
# execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAttackCycle matches 300.. run summon armor_stand ~ ~ ~ {Tags:["emberaxrandom","emberaxrandom2","emberaxpart"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAttackCycle matches 300.. run summon armor_stand ~ ~ ~ {Tags:["emberaxrandom","emberaxrandom3","emberaxpart"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAttackCycle matches 300.. run summon armor_stand ~ ~ ~ {Tags:["emberaxrandom","emberaxrandom4","emberaxpart"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=emberax] at @s run tag @e[tag=emberaxrandom,limit=1,sort=random,distance=..10] add emberaxrandomCHOSEN
kill @e[type=armor_stand,tag=emberaxrandom,tag=!emberaxrandomCHOSEN]
execute as @e[type=armor_stand,tag=emberaxrandom1,tag=!deadEmberax] at @s run scoreboard players set @e[type=armor_stand,tag=emberax,distance=..10,limit=1,sort=nearest] EmberaxAttackType 1
execute as @e[type=armor_stand,tag=emberaxrandom2,tag=!deadEmberax] at @s run scoreboard players set @e[type=armor_stand,tag=emberax,distance=..10,limit=1,sort=nearest] EmberaxAttackType 2
execute as @e[type=armor_stand,tag=emberaxrandom3,tag=!deadEmberax] at @s run scoreboard players set @e[type=armor_stand,tag=emberax,distance=..10,limit=1,sort=nearest] EmberaxAttackType 3
execute as @e[type=armor_stand,tag=emberaxrandom4,tag=!deadEmberax] at @s run scoreboard players set @e[type=armor_stand,tag=emberax,distance=..10,limit=1,sort=nearest] EmberaxAttackType 4
kill @e[type=armor_stand,tag=emberaxrandom]
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAttackCycle matches 300.. run scoreboard players set @s EmberaxAttackCycle 0
    # Emberax Attack 1: Aimed Fire Breath
execute as @e[type=armor_stand,tag=emberaxActive,tag=!deadEmberax] at @s if score @s EmberaxAttackType matches 1 run scoreboard players add @s EmberaxAimedFireAttack 1
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 1 run playsound entity.warden.sonic_charge hostile @a ~ ~1 ~ 10 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 1 run playsound block.beacon.activate hostile @a ~ ~1 ~ 10 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 1..35 run particle flame ^ ^1 ^1 0.1 0.1 0.1 0.01 10 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 20..35 run particle flame ^ ^1 ^1 0.2 0.2 0.2 0.1 10 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 30..35 run particle soul ^ ^1 ^1 0.15 0.15 0.15 0.1 10 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 30..35 run particle lava ^ ^1 ^1 0.2 0.2 0.2 0.1 10 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 35..100 run particle lava ^ ^1 ^1 0.2 0.2 0.2 0.1 10 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 35..100 run summon armor_stand ~ ~ ~ {Tags:["emberaxFire","custom"],Invisible:1,Marker:1}
scoreboard players add @e[tag=emberaxFire,type=armor_stand] lifetime 1
execute as @e[tag=emberaxFire,type=armor_stand] at @s if score @s lifetime matches 1 run tp @s ^ ^ ^ facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[tag=emberaxFire,type=armor_stand] at @s if score @s lifetime matches 2.. run tp @s ^ ^ ^1
execute as @e[tag=emberaxFire,type=armor_stand] at @s run particle flame ~ ~1 ~ 0.5 0.33 0.5 0.07 30 force
execute as @e[tag=emberaxFire,type=armor_stand] at @s run playsound minecraft:block.fire.ambient ambient @a ~ ~1 ~ 10 0.7
execute as @e[tag=emberaxFire,type=armor_stand] at @s run playsound minecraft:block.redstone_torch.burnout ambient @a ~ ~1 ~ 0.7 0
execute as @e[tag=emberaxFire,type=armor_stand] at @s unless block ~ ~ ~ air run particle lava ~ ~1 ~ 0.2 0.2 0.2 1 20 force
execute as @e[tag=emberaxFire,type=armor_stand] at @s unless block ~ ~ ~ air run kill @s
execute as @e[tag=emberaxFire,type=armor_stand] at @s unless block ~ ~-1 ~ air unless entity @e[type=armor_stand,tag=fireTrail,distance=..2] run summon armor_stand ~ ~-1.5 ~ {Tags:["fireTrail"],Marker:1,Invisible:1}
scoreboard players add @e[type=armor_stand,tag=fireTrail] lifetime 1
execute as @e[type=armor_stand,tag=fireTrail] at @s run particle smoke ~ ~1 ~ 0.3 0.1 0.3 0 4 force
execute as @e[type=armor_stand,tag=fireTrail] at @s run particle small_flame ~ ~1 ~ 0.3 0.1 0.3 0.05 4 force
execute as @a at @s if entity @e[type=armor_stand,tag=fireTrail,distance=..1.7] run damage @s 3 minecraft:in_fire 
execute as @e[type=armor_stand,tag=fireTrail] at @s if score @s lifetime matches 200.. run kill @s
execute as @a at @s if entity @e[tag=emberaxFire,type=armor_stand,distance=..2] run damage @s 6.5 minecraft:in_fire
execute as @e[tag=emberaxFire,type=armor_stand] at @s if score @s lifetime matches 70.. run kill @s
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 100.. run scoreboard players set @s EmberaxAttackType 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxAimedFireAttack matches 100.. run scoreboard players set @s EmberaxAimedFireAttack 0
    # Emberax Attack 2: Moving Fire Breath
execute as @e[type=armor_stand,tag=emberaxActive,tag=!deadEmberax] at @s if score @s EmberaxAttackType matches 2 run scoreboard players add @s EmberaxSweepFireAttack 1
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSweepFireAttack matches 100.. run scoreboard players set @s EmberaxAttackType 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSweepFireAttack matches 100.. run scoreboard players set @s EmberaxSweepFireAttack 0
    # Emberax Attack 3: Summon Dragonoids
execute as @e[type=armor_stand,tag=emberaxActive,tag=!deadEmberax] at @s if score @s EmberaxAttackType matches 3 run scoreboard players add @s EmberaxSummonAttack 1
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 1..40 run particle portal ~ ~1 ~ 0 0 0 2 50 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 60 run particle dragon_breath ~ ~1 ~ 0 0 0 0.25 200 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 60 run particle soul ~ ~1 ~ 0 0 0 0.25 50 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 1 run playsound minecraft:entity.warden.sonic_charge hostile @a ~ ~1 ~ 7 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 60 run playsound minecraft:entity.evoker.prepare_summon hostile @a ~ ~1 ~ 8 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 60 run playsound minecraft:entity.elder_guardian.curse hostile @a ~ ~1 ~ 5 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 60 run playsound minecraft:block.beacon.power_select hostile @a ~ ~1 ~ 8 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 60 run summon armor_stand ~ ~1 ~ {Tags:["dragonoidSoul1","dragonoidSoul"],Invisible:1,Marker:1}
scoreboard players add @e[type=armor_stand,tag=dragonoidSoul] lifetime 1
execute as @e[type=armor_stand,tag=dragonoidSoul1] at @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] if score @s lifetime matches 1 run tp @s ~ ~ ~ facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoidSoul1] at @s if score @s lifetime matches 2.. run tp @s ^-0.15 ^0.07 ^0.1
execute as @e[type=armor_stand,tag=dragonoidSoul1] at @s run particle soul_fire_flame ~ ~1 ~ 0.1 0.1 0.1 0 5 force
execute as @e[type=armor_stand,tag=dragonoidSoul1] at @s run particle soul ~ ~1 ~ 0.1 0.1 0.1 0 5 force
execute as @e[type=armor_stand,tag=dragonoidSoul1] at @s if score @s lifetime matches 40.. run summon armor_stand ~ ~-0.5 ~ {Tags:["dragonoidSummon"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=dragonoidSoul1] at @s if score @s lifetime matches 40.. run kill @s
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 100 run summon armor_stand ~ ~1 ~ {Tags:["dragonoidSoul2","dragonoidSoul"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=dragonoidSoul2] at @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] if score @s lifetime matches 1 run tp @s ~ ~ ~ facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoidSoul2] at @s if score @s lifetime matches 2.. run tp @s ^ ^0.07 ^0.1
execute as @e[type=armor_stand,tag=dragonoidSoul2] at @s run particle soul_fire_flame ~ ~1 ~ 0.1 0.1 0.1 0 5 force
execute as @e[type=armor_stand,tag=dragonoidSoul2] at @s run particle soul ~ ~1 ~ 0.1 0.1 0.1 0 5 force
execute as @e[type=armor_stand,tag=dragonoidSoul2] at @s if score @s lifetime matches 40.. run summon armor_stand ~ ~-0.5 ~ {Tags:["dragonoidSummon"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=dragonoidSoul2] at @s if score @s lifetime matches 40.. run kill @s
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 140 run summon armor_stand ~ ~1 ~ {Tags:["dragonoidSoul3","dragonoidSoul"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=dragonoidSoul3] at @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] if score @s lifetime matches 1 run tp @s ~ ~ ~ facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoidSoul3] at @s if score @s lifetime matches 2.. run tp @s ^0.15 ^0.07 ^0.1
execute as @e[type=armor_stand,tag=dragonoidSoul3] at @s run particle soul_fire_flame ~ ~1 ~ 0.1 0.1 0.1 0 5 force
execute as @e[type=armor_stand,tag=dragonoidSoul3] at @s run particle soul ~ ~1 ~ 0.1 0.1 0.1 0 5 force
execute as @e[type=armor_stand,tag=dragonoidSoul3] at @s if score @s lifetime matches 40.. run summon armor_stand ~ ~-0.5 ~ {Tags:["dragonoidSummon"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=dragonoidSoul3] at @s if score @s lifetime matches 40.. run kill @s
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 200.. run scoreboard players set @s EmberaxAttackType 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxSummonAttack matches 200.. run scoreboard players set @s EmberaxSummonAttack 0
    # Emberax Attack 4: Rumble
execute as @e[type=armor_stand,tag=emberax] at @s store result score @s EmberaxYlevel run data get entity @s Pos[1]
execute as @e[type=armor_stand,tag=emberaxActive,tag=!deadEmberax] at @s if score @s EmberaxAttackType matches 4 run scoreboard players add @s EmberaxRumbleAttack 1
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 1 run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0.65
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 1 run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 1 run playsound entity.warden.roar hostile @a ~ ~1 ~ 10 0.8
execute as @a at @s if score @e[type=armor_stand,tag=emberaxActive,limit=1,sort=nearest,distance=..40] EmberaxRumbleAttack matches 40..140 run playsound block.composter.fill ambient @a ~ ~4 ~ 7 0
execute as @a at @s if score @e[type=armor_stand,tag=emberaxActive,limit=1,sort=nearest,distance=..40] EmberaxRumbleAttack matches 20..160 run playsound minecraft:item.armor.equip_leather ambient @a ~ ~4 ~ 7 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 30..160 run particle smoke ~ ~6 ~ 10 10 10 0 50 normal
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 1..25 run summon armor_stand ~ ~ ~ {Tags:["rumble","custom"],Invisible:1,Marker:1}
scoreboard players add @e[type=armor_stand,tag=rumble] lifetime 1
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 26 at @p[gamemode=!creative,gamemode=!spectator,distance=..35] run spreadplayers ~ ~ 1 15 false @e[type=armor_stand,tag=rumble]
execute as @e[type=armor_stand,tag=rumble] at @s store result score @s EmberaxYlevel run data get entity @s Pos[1]
execute as @e[type=armor_stand,tag=rumble,tag=!rumbleActive] at @s if score @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] EmberaxRumbleAttack matches 27.. if score @s EmberaxYlevel = @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] EmberaxYlevel run tag @s add rumbleActive
execute as @e[type=armor_stand,tag=rumble,tag=!rumbleActive] at @s if score @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] EmberaxRumbleAttack matches 27.. unless score @s EmberaxYlevel = @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] EmberaxYlevel run tp @s ~ ~-1 ~
execute as @e[type=armor_stand,tag=rumbleActive,tag=!rumbleAIR] at @s if block ~ ~ ~ air run tag @s add rumbleAIR
execute as @e[type=armor_stand,tag=rumbleActive,tag=!rumbleAIR] at @s run tp @s ~ ~1 ~
execute as @e[type=armor_stand,tag=rumbleAIR,tag=!rumbleGROUND] at @s unless block ~ ~1 ~ air run tag @s add rumbleGROUND
execute as @e[type=armor_stand,tag=rumbleAIR,tag=!rumbleGROUND] at @s unless block ~ ~ ~ air run tag @s add rumbleGROUND
execute as @e[type=armor_stand,tag=rumbleAIR,tag=!rumbleGROUND] at @s run tp @s ~ ~1 ~
execute as @e[type=armor_stand,tag=rumble,tag=!rumbleGROUND] at @s if score @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] EmberaxRumbleAttack matches 260.. run kill @s
execute as @e[type=armor_stand,tag=rumble] at @s if score @s lifetime matches 260.. run kill @s
execute as @e[type=armor_stand,tag=!FallingRumble,tag=rumbleGROUND] at @s run particle dust 0.5 0.5 0.5 4 ~ ~1 ~ 2 0.2 2 0 60 force
execute if score @e[type=armor_stand,tag=emberax,limit=1,sort=nearest] EmberaxRumbleAttack matches 28.. run tag @e[type=armor_stand,tag=rumbleGROUND,limit=1,sort=random] add FallingRumble
execute as @e[type=armor_stand,tag=FallingRumble] at @s run tp @s ~ ~-1 ~
execute as @e[type=armor_stand,tag=FallingRumble] at @s unless block ~ ~ ~ air run summon block_display ~-0.5 ~0.5 ~-0.5 {Tags:["fallenStone"],block_state:{Name:"minecraft:cobblestone"},brightness:{sky:15,block:15}}
scoreboard players add @e[tag=fallenStone,type=block_display] lifetime 1
execute as @e[type=armor_stand,tag=FallingRumble] at @s unless block ~ ~ ~ air run playsound entity.generic.explode ambient @a ~ ~ ~ 3 0
execute as @e[type=armor_stand,tag=FallingRumble] at @s unless block ~ ~ ~ air run kill @s
execute as @a at @s if entity @e[type=armor_stand,tag=FallingRumble,distance=..2.5] run damage @s 13 minecraft:falling_block by @e[type=armor_stand,tag=FallingRumble,limit=1,sort=nearest]
execute as @e[tag=fallenStone,type=block_display] at @s if score @s lifetime matches 100.. run particle poof ~ ~0.5 ~ 0.3 0.3 0.3 0 20 force
execute as @e[tag=fallenStone,type=block_display] at @s if score @s lifetime matches 100.. run playsound minecraft:entity.iron_golem.damage ambient @a ~ ~1 ~ 0.5 0.55
execute as @e[tag=fallenStone,type=block_display] at @s if score @s lifetime matches 100.. run kill @s
execute as @e[type=armor_stand,tag=rumbleGROUND] at @s run particle dust 0.5 0.5 0.5 4 ~ ~1 ~ 0.4 0.4 0.4 0 20 force
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 200.. run scoreboard players set @s EmberaxAttackType 0
execute as @e[type=armor_stand,tag=emberaxActive] at @s if score @s EmberaxRumbleAttack matches 200.. run scoreboard players set @s EmberaxRumbleAttack 0
    # Enrage
execute as @e[type=armor_stand,tag=emberax] at @s store result score @s Health run data get entity @e[type=giant,tag=emberaxhitbox,limit=1,sort=nearest] Health
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxEnraged] at @s if score @s Health matches ..200 run playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~1 ~ 10 1.6
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxEnraged] at @s if score @s Health matches ..200 run playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~1 ~ 10 1.6
execute as @e[type=armor_stand,tag=emberax,tag=!emberaxEnraged] at @s if score @s Health matches ..200 run tag @s add emberaxEnraged
execute as @e[type=armor_stand,tag=emberaxEnraged] at @s if score @s Health matches 201.. run tag @s remove emberaxEnraged
execute as @e[type=armor_stand,tag=emberaxEnraged,tag=!deadEmberax] at @s run scoreboard players add @s EmberaxAttackCycle 1
execute as @e[type=armor_stand,tag=emberaxEnraged] at @s run particle angry_villager ~ ~1 ~ 1 1 1 0 1 force


    # Dragonoid
execute as @e[type=armor_stand,tag=dragonoid] at @s unless entity @e[type=armor_stand,tag=emberaxActive,limit=1,sort=nearest,distance=..40] run kill @s
execute as @e[type=armor_stand,tag=dragonoid] at @s run fill ~-1 ~1 ~-1 ~1 ~3 ~1 air replace light
execute as @e[type=armor_stand,tag=dragonoid] at @s run setblock ~ ~2 ~ light keep
execute as @e[type=armor_stand,tag=dragonoidSummon] at @s run summon armor_stand ~ ~ ~ {Tags:["dragonoid","custom"],Marker:1b,Invisible:1b,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-26142344,-1290910511,-1698333806,1311502884],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWI2ZTVjZDYxMmM3M2NkOGU2YzdhNzIwYzI2MjgzZTc1NDhjYTcyOGQ4YjMwNjAxODQwZjdkYTVkNDMzZDgzYiJ9fX0="}]}}}}]}
execute as @e[type=armor_stand,tag=dragonoidSummon] at @s run tp @e[type=armor_stand,tag=dragonoid,limit=1,sort=nearest,distance=..2] ~ ~ ~ facing entity @p[gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoidSummon] at @s run summon wolf ~ ~ ~ {Tags:["dragonoidHitbox"],NoAI:1,Silent:1,NoGravity:1,ActiveEffects:[{Id:14,Amplifier:1b,Duration:100000000,ShowParticles:0b}]}
execute as @e[type=armor_stand,tag=dragonoidSummon] at @s run playsound minecraft:block.note_block.imitate.ender_dragon hostile @a ~ ~1 ~ 3 1.5
execute as @e[type=armor_stand,tag=dragonoidSummon] at @s run particle smoke ~ ~1.25 ~ 0.3 0.3 0.3 0.1 40 force
execute as @e[type=armor_stand,tag=dragonoidSummon] at @s run kill @s
execute as @e[type=armor_stand,tag=dragonoid] at @s run tp @e[type=wolf,tag=dragonoidHitbox,limit=1,sort=nearest,distance=..2] ~ ~1.3 ~
execute as @e[type=armor_stand,tag=dragonoid] at @s unless entity @e[type=wolf,tag=dragonoidHitbox,distance=..2] run playsound minecraft:entity.phantom.death hostile @a ~ ~1.7 ~ 5 1.6
execute as @e[type=armor_stand,tag=dragonoid] at @s unless entity @e[type=wolf,tag=dragonoidHitbox,distance=..2] run particle soul ~ ~1.7 ~ 0.2 0.2 0.2 0.3 30 force
execute as @e[type=armor_stand,tag=dragonoid] at @s unless entity @e[type=wolf,tag=dragonoidHitbox,distance=..2] run fill ~-1 ~1 ~-1 ~1 ~3 ~1 air replace light
execute as @e[type=armor_stand,tag=dragonoid] at @s unless entity @e[type=wolf,tag=dragonoidHitbox,distance=..2] run kill @s
execute as @e[type=wolf,tag=dragonoidHitbox] at @s unless entity @e[type=armor_stand,tag=dragonoid,distance=..2] run kill @s
execute as @e[type=armor_stand,tag=dragonoid] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..6] run tp @s ^ ^ ^-0.1 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoid] at @s unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..6] if entity @p[gamemode=!creative,gamemode=!spectator,distance=7..30] run tp @s ^ ^ ^0.1 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoid] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..7] run tp @s ^ ^ ^ facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoid] at @s run particle soul_fire_flame ~ ~1.7 ~ 0.2 0.2 0.2 0.05 1 force
execute as @e[type=armor_stand,tag=dragonoid] at @s run particle smoke ~ ~1.7 ~ 0.2 0.2 0.2 0.01 10 force
scoreboard players add @e[type=armor_stand,tag=dragonoid] flappingBounce 1
execute as @e[type=armor_stand,tag=dragonoid] at @s if score @s flappingBounce matches 1..5 run tp @s ~ ~0.07 ~
execute as @e[type=armor_stand,tag=dragonoid] at @s if score @s flappingBounce matches 6..10 run tp @s ~ ~-0.07 ~
execute as @e[type=armor_stand,tag=dragonoid] at @s if score @s flappingBounce matches 10.. run scoreboard players set @s flappingBounce 0
    #attack
execute as @e[type=armor_stand,tag=dragonoid] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..7] run scoreboard players add @s AttackCharge 1
execute as @e[type=armor_stand,tag=dragonoid] at @s if score @s AttackCharge matches 40.. run playsound entity.blaze.hurt hostile @a ~ ~1.7 ~ 3.5 2
execute as @e[type=armor_stand,tag=dragonoid] at @s if score @s AttackCharge matches 40.. run summon armor_stand ~ ~1 ~ {Tags:["dragonoidfirebreath"],Invisible:1,Small:1,Marker:1}
execute as @e[type=armor_stand,tag=dragonoid] at @s if score @s AttackCharge matches 40.. run scoreboard players set @s AttackCharge 0
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s run particle small_flame ~ ~0.6 ~ 0.05 0.05 0.05 0 10 force
scoreboard players add @e[type=armor_stand,tag=dragonoidfirebreath] lifetime 1
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s if score @s lifetime matches 100.. run particle smoke ~ ~0.6 ~ 0.1 0.1 0.1 0.1 30
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s if score @s lifetime matches 100.. run playsound block.redstone_torch.burnout ambient @a ~ ~0.6 ~ 2 1.6
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s if score @s lifetime matches 100.. run kill @s
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s unless block ~ ~0.6 ~ air run particle smoke ~ ~0.6 ~ 0.1 0.1 0.1 0.1 30
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s unless block ~ ~0.6 ~ air run playsound block.redstone_torch.burnout ambient @a ~ ~0.6 ~ 2 1.6
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s unless block ~ ~0.6 ~ air run kill @s
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s if entity @p[distance=..1,gamemode=!spectator,gamemode=!creative] run particle smoke ~ ~0.6 ~ 0.1 0.1 0.1 0.1 30
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s if entity @p[distance=..1,gamemode=!spectator,gamemode=!creative] run playsound block.redstone_torch.burnout ambient @a ~ ~0.6 ~ 2 1.6
execute as @a[gamemode=!spectator,gamemode=!creative] at @s if entity @e[type=armor_stand,tag=dragonoidfirebreath,limit=1,sort=nearest,distance=..1] run damage @s 2.5 minecraft:in_fire by @e[type=armor_stand,tag=dragonoidfirebreath,limit=1,sort=nearest,distance=..1]
execute as @a[gamemode=!spectator,gamemode=!creative] at @s if entity @e[type=armor_stand,tag=dragonoidfirebreath,limit=1,sort=nearest,distance=..1] run kill @e[type=armor_stand,tag=dragonoidfirebreath,limit=1,sort=nearest,distance=..1]
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s if score @s lifetime matches 1 run tp @s ^ ^ ^0.1 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=armor_stand,tag=dragonoidfirebreath] at @s run tp @s ^ ^ ^0.3


    # Overall Score Cleanup
scoreboard players set @a Attack 0



# execute as @e[type=interaction,tag=firewandhitbox] on attacker run scoreboard players add @s Lclick 1
# playsound minecraft:item.trident.thunder hostile @a ~ ~1 ~ 1 1.6          Smite Spell Sound
# playsound minecraft:item.trident.return hostile @a ~ ~1 ~ 1 0             Crystal Sound
# playsound minecraft:block.respawn_anchor.charge hostile @a ~ ~1 ~ 5 0     Crystal Sound 2