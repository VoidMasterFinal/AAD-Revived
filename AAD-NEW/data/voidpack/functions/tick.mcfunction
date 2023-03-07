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
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches ..0 run summon armor_stand ~ ~1 ~ {Tags:["fireball","fireballLVL1","custom"],Invisible:1,Marker:1}
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches 1..2 run summon armor_stand ~ ~1 ~ {Tags:["fireball","fireballLVL2","custom"],Invisible:1,Marker:1}
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches 3..5 run summon armor_stand ~ ~1 ~ {Tags:["fireball","fireballLVL3","custom"],Invisible:1,Marker:1}
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches 6..7 run summon armor_stand ~ ~1 ~ {Tags:["fireball","fireballLVL4","custom"],Invisible:1,Marker:1}
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches 8.. run summon armor_stand ~ ~1 ~ {Tags:["fireball","fireballLVL5","custom"],Invisible:1,Marker:1}
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 run playsound minecraft:item.firecharge.use ambient @a ~ ~1 ~ 6 1
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches ..1 run scoreboard players set @s FireballCD 100
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches 2..3 run scoreboard players set @s FireballCD 80
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. if score @s FireballCD matches ..0 if score @s FireWandLVL matches 4.. run scoreboard players set @s FireballCD 60
    # Fireball Mechanics
scoreboard players add @e[type=armor_stand,tag=fireball] lifetime 1
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 1 run tp @s @p
execute as @e[type=armor_stand,tag=fireballLVL1] at @s run tp @s ^ ^ ^0.3
execute as @e[type=armor_stand,tag=fireballLVL2] at @s run tp @s ^ ^ ^0.45
execute as @e[type=armor_stand,tag=fireballLVL3] at @s run tp @s ^ ^ ^0.6
execute as @e[type=armor_stand,tag=fireballLVL4] at @s run tp @s ^ ^ ^0.75
execute as @e[type=armor_stand,tag=fireballLVL5] at @s run tp @s ^ ^ ^0.9
execute as @e[type=armor_stand,tag=fireballLVL1] at @s run particle flame ~ ~1 ~ 0.1 0.1 0.1 0.01 1 force
execute as @e[type=armor_stand,tag=fireballLVL1] at @s run particle dust_color_transition 1 0.8 0 1 0.7 0 0 ~ ~1 ~ 0 0 0 0 3 force
execute as @e[type=armor_stand,tag=fireballLVL2] at @s run particle flame ~ ~1 ~ 0.15 0.15 0.15 0.0125 2 force
execute as @e[type=armor_stand,tag=fireballLVL2] at @s run particle dust_color_transition 1 0.8 0 1 0.7 0 0 ~ ~1 ~ 0.15 0.15 0.15 0.025 7 force
execute as @e[type=armor_stand,tag=fireballLVL3] at @s run particle flame ~ ~1 ~ 0.2 0.2 0.2 0.015 3 force
execute as @e[type=armor_stand,tag=fireballLVL3] at @s run particle dust_color_transition 1 0.8 0 1 0.7 0 0 ~ ~1 ~ 0.15 0.15 0.15 0.05 15 force
execute as @e[type=armor_stand,tag=fireballLVL4] at @s run particle flame ~ ~1 ~ 0.25 0.25 0.25 0.0175 4 force
execute as @e[type=armor_stand,tag=fireballLVL4] at @s run particle dust_color_transition 1 0.8 0 1 0.7 0 0 ~ ~1 ~ 0.15 0.15 0.15 0.075 30 force
execute as @e[type=armor_stand,tag=fireballLVL5] at @s run particle flame ~ ~1 ~ 0.3 0.3 0.3 0.02 5 force
execute as @e[type=armor_stand,tag=fireballLVL5] at @s run particle dust_color_transition 1 0.8 0 1 0.7 0 0 ~ ~1 ~ 0.25 0.25 0.25 0.1 45 force
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 150.. run particle end_rod ~ ~1 ~ 0.1 0.1 0.1 0.4 40 force
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 150.. run playsound block.redstone_torch.burnout ambient @a ~ ~1 ~ 4 0.7
execute as @e[type=armor_stand,tag=fireball] at @s if score @s lifetime matches 150.. run kill @s
execute as @e[type=armor_stand,tag=fireball] at @s unless block ~ ~1 ~ air run particle lava ~ ~1.2 ~ 0.1 0.1 0.1 0.4 40 force
execute as @e[type=armor_stand,tag=fireball] at @s unless block ~ ~1 ~ air run playsound block.redstone_torch.burnout ambient @a ~ ~1 ~ 4 0.7
execute as @e[type=armor_stand,tag=fireball] at @s unless block ~ ~1 ~ air run kill @s
execute as @e[type=armor_stand,tag=fireball] at @s if entity @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] run tag @s add fireballhit
execute as @e[type=armor_stand,tag=fireballhit] at @s run particle lava ~ ~1.2 ~ 0.1 0.1 0.1 0.4 40 force
execute as @e[type=armor_stand,tag=fireballhit] at @s run playsound block.redstone_torch.burnout ambient @a ~ ~1 ~ 4 0.7

execute as @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display] at @s if entity @e[type=armor_stand,tag=fireballLVL1,distance=..1.5] run damage @s 6 minecraft:in_fire
execute as @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display] at @s if entity @e[type=armor_stand,tag=fireballLVL2,distance=..1.5] run damage @s 8 minecraft:in_fire
execute as @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display] at @s if entity @e[type=armor_stand,tag=fireballLVL3,distance=..1.5] run damage @s 12 minecraft:in_fire
execute as @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display] at @s if entity @e[type=armor_stand,tag=fireballLVL4,distance=..1.5] run damage @s 14 minecraft:in_fire
execute as @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display] at @s if entity @e[type=armor_stand,tag=fireballLVL5,distance=..1.5] run damage @s 18 minecraft:in_fire
execute as @e[type=armor_stand,tag=fireballhit] at @s run scoreboard players add @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] Burning 100
execute as @e[type=armor_stand,tag=fireballhit] at @s if entity @a[scores={FireWandLVL=5..}] run scoreboard players add @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] Burning 80
execute as @e[type=armor_stand,tag=fireballhit] at @s if entity @a[scores={FireWandLVL=7..}] run scoreboard players add @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] Burning 40
execute as @e[type=armor_stand,tag=fireballhit] at @s if entity @a[scores={FireWandLVL=9..}] run scoreboard players add @e[type=!player,type=!armor_stand,type=!interaction,type=!item,type=!block_display,distance=..1.5] Burning 60
execute as @e[type=armor_stand,tag=fireballhit] at @s run kill @s
    # Fireball Cooldown
execute as @e[type=interaction,tag=firewandhitbox] on attacker if score @s FireWandLVL matches 10.. run scoreboard players add @s Lclick 1
execute as @e[type=interaction,tag=firewandhitbox] on attacker if score @s FireWandLVL matches 10.. if score @s Lclick matches 1.. run scoreboard players remove @s FireballCD 20
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches ..1 if score @s FireballCD matches ..0 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":". . . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches ..1 if score @s FireballCD matches 1..20 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I . . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches ..1 if score @s FireballCD matches 21..40 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches ..1 if score @s FireballCD matches 41..60 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches ..1 if score @s FireballCD matches 61..80 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I I .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches ..1 if score @s FireballCD matches 81.. run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I I I","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 2..3 if score @s FireballCD matches ..0 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":". . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 2..3 if score @s FireballCD matches 1..20 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I . . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 2..3 if score @s FireballCD matches 21..40 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 2..3 if score @s FireballCD matches 41..60 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 2..3 if score @s FireballCD matches 61..80 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I I","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 4.. if score @s FireballCD matches ..0 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":". . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 4.. if score @s FireballCD matches 1..20 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I . .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 4.. if score @s FireballCD matches 21..40 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I .","color":"green"},{"text":" ]","color":"gold"}]
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] at @s if score @s FireWandLVL matches 4.. if score @s FireballCD matches 41..60 run title @s actionbar [{"text":"Fireball Cooldown: [ ","color":"gold"},{"text":"I I I","color":"green"},{"text":" ]","color":"gold"}]
execute as @a at @s if score @s FireballCD matches 1.. run scoreboard players remove @s FireballCD 1
    # Fireball Score Cleanup
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. run kill @e[type=interaction,tag=firewandhitbox]
execute as @e[type=interaction,tag=firewandhitbox] on target if score @s Rclick matches 1.. run scoreboard players set @s Rclick 0
execute as @e[type=interaction,tag=firewandhitbox] on attacker if score @s Lclick matches 1.. run kill @e[type=interaction,tag=firewandhitbox]
execute as @e[type=interaction,tag=firewandhitbox] on attacker if score @s Lclick matches 1.. run scoreboard players set @s Lclick 0
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
execute as @a at @s if entity @e[type=armor_stand,tag=fireTrail,distance=..1.7] run damage @s 3 minecraft:hot_floor
execute as @e[type=armor_stand,tag=fireTrail] at @s if score @s lifetime matches 200.. run kill @s
execute as @a at @s if entity @e[tag=emberaxFire,type=armor_stand,distance=..2] run damage @s 6.5 minecraft:in_fire
execute as @e[tag=emberaxFire,type=armor_stand] at @s if score @s lifetime matches 45.. run kill @s
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


    # Wand Upgrader
scoreboard players add @e[type=armor_stand,tag=wandupgrader] lifetime 1
execute as @e[type=armor_stand,tag=wandupgrader] at @s if score @s lifetime matches 1 run setblock ~ ~ ~ smithing_table
execute as @e[type=armor_stand,tag=wandupgrader] at @s unless entity @e[type=block_display,tag=wandupgradervisuals,distance=..0.781] run summon block_display ~-0.55 ~ ~-0.55 {Tags:["wandupgradervisuals"],block_state:{Name:"sculk_shrieker"},transformation:[1.1f,0f,0f,0f,0f,1.1f,0f,0f,0f,0f,1.1f,0f,0f,0f,0f,1f],brightness:{sky:15,block:15}}
execute as @e[type=armor_stand,tag=wandupgrader] at @s unless entity @e[type=block_display,tag=wandupgradervisuals2,distance=..0.781] run summon block_display ~-0.3 ~0.55 ~-0.3 {Tags:["wandupgradervisuals2"],block_state:{Name:"amethyst_block"},transformation:[0.6f,0f,0f,0f,0f,0.6f,0f,0f,0f,0f,0.6f,0f,0f,0f,0f,1f],brightness:{sky:15,block:15}}
execute as @e[type=armor_stand,tag=wandupgrader] at @s unless entity @e[type=block_display,tag=wandupgradervisuals3,distance=..0.781] run summon block_display ~-0.525 ~ ~-0.525 {Tags:["wandupgradervisuals3"],block_state:{Name:"spawner"},transformation:[1.05f,0f,0f,0f,0f,1.01f,0f,0f,0f,0f,1.05f,0f,0f,0f,0f,1f],brightness:{sky:15,block:15}}
execute as @e[type=armor_stand,tag=wandupgrader] at @s if block ~ ~ ~ air run kill @e[type=block_display,tag=wandupgradervisuals,distance=..0.781]
execute as @e[type=armor_stand,tag=wandupgrader] at @s if block ~ ~ ~ air run kill @e[type=block_display,tag=wandupgradervisuals2,distance=..0.781]
execute as @e[type=armor_stand,tag=wandupgrader] at @s if block ~ ~ ~ air run kill @e[type=block_display,tag=wandupgradervisuals3,distance=..0.781]
execute as @e[type=armor_stand,tag=wandupgrader] at @s if block ~ ~ ~ air run particle smoke ~ ~0.5 ~ 0.5 0.5 0.5 0.01 100 force
execute as @e[type=armor_stand,tag=wandupgrader] at @s if block ~ ~ ~ air run kill @s
    # Fire Wand
execute as @a at @s unless score @s FireWandLVL matches 0.. run scoreboard players set @s FireWandLVL 0
scoreboard players set @a FireWandUpgradedLVL 1
execute as @a at @s run scoreboard players operation @s FireWandUpgradedLVL += @s FireWandLVL
execute as @a at @s if score @s upgradeFireWand matches 1.. run stopsound @a * block.smithing_table.use
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 1..8 run tellraw @a [{"text":"Player ","color":"gold"},{"selector":"@s","color":"#AFFF24"},{"text":" upgraded ","color":"gold"},{"text":"Fire Wand lvl.","color":"aqua"},{"score":{"name":"@s","objective":"FireWandLVL"},"color":"aqua"},{"text":" -> ","color":"green"},{"text":"Fire Wand lvl.","color":"aqua"},{"score":{"name":"@s","objective":"FireWandUpgradedLVL"},"color":"aqua"}]
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 9 run tellraw @a [{"text":"Player ","color":"gold"},{"selector":"@s","color":"#AFFF24"},{"text":" upgraded ","color":"gold"},{"text":"Fire Wand lvl.","color":"aqua"},{"score":{"name":"@s","objective":"FireWandLVL"},"color":"aqua"},{"text":" -> ","color":"green"},{"text":"Fire Wand lvl.Max","color":"dark_purple"}]
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 10.. run tellraw @a {"text":"Canceled upgrade, item already max level!","color":"red"}
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 10.. run give @s amethyst_shard{display:{Name:'{"text":"Upgrade Crystal","color":"purple","italic":false}'},Enchantments:[{}]}
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches ..9 run playsound minecraft:item.trident.thunder ambient @a ~ ~1 ~ 4 1.5 1
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 10.. run playsound minecraft:block.note_block.didgeridoo ambient @a ~ ~1 ~ 3 0
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 10.. run playsound minecraft:block.note_block.didgeridoo ambient @a ~ ~1 ~ 3 0
execute as @a at @s if score @s upgradeFireWand matches 1.. if score @s FireWandLVL matches 1..9 run scoreboard players add @s FireWandLVL 1
execute as @a at @s if score @s upgradeFireWand matches 1.. run scoreboard players set @s upgradeFireWand 0
execute as @a at @s if entity @s[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] if score @s FireWandLVL matches 10.. run tp @e[type=armor_stand,tag=maxFireVisuals,distance=..2] ~ ~ ~
execute as @a at @s if entity @s[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}}] if score @s FireWandLVL matches 10.. unless entity @e[type=armor_stand,tag=maxFireVisuals,distance=..2] run summon armor_stand ~ ~ ~ {Tags:["maxFireVisuals"],Invisible:1,Marker:1}
execute as @e[type=armor_stand,tag=maxFireVisuals] at @s unless entity @a[nbt={SelectedItem:{id:"minecraft:blaze_rod",tag:{CustomModelData:firewand}}},scores={FireWandLVL=10..},distance=..2] run kill @s
execute as @e[type=armor_stand,tag=maxFireVisuals] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[type=armor_stand,tag=maxFireVisuals] at @s run particle flame ^ ^1 ^2 0 0 0 0.01 5 force
execute as @e[type=armor_stand,tag=maxFireVisuals] at @s run particle flame ^ ^1 ^-2 0 0 0 0.01 5 force


    # Undead Mage
execute as @e[type=armor_stand,tag=summonundeadmage] at @s run summon skeleton ~ ~ ~ {OnGround:1b,NoGravity:0b,DeathLootTable:"minecraft:empty",LeftHanded:0b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Health:30f,Tags:["undeadmage","custom"],HandItems:[{id:"minecraft:stick",Count:1b,tag:{Enchantments:[{}]}},{id:"minecraft:amethyst_shard",Count:1b,tag:{display:{Name:'{"text":"Upgrade Crystal","color":"light_purple","italic":false}'},Enchantments:[{}]}}],HandDropChances:[0.000F,0.200F],ArmorItems:[{id:"minecraft:netherite_boots",Count:1b},{id:"minecraft:netherite_leggings",Count:1b},{id:"minecraft:netherite_chestplate",Count:1b},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-2090969427,-1858058365,-1425762194,836113187],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjQ3MjZkOTQxMGJiNGJjODMwNjg3ZjA2MjhjZDdjNGVjMTU4YWNmNmI1NzQwM2E1NzYwZDE3NDc3Yjg0Njg2YSJ9fX0="}]}}}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],Attributes:[{Name:generic.max_health,Base:30}]}
execute as @e[type=armor_stand,tag=summonundeadmage] at @s run playsound entity.blaze.ambient hostile @a ~ ~1 ~ 4 0
execute as @e[type=armor_stand,tag=summonundeadmage] at @s run kill @s
execute as @e[type=skeleton,tag=undeadmage] at @s run particle smoke ~ ~1 ~ 0.3 0.4 0.3 0 1 force
execute as @e[type=skeleton,tag=undeadmage] at @s run playsound minecraft:particle.soul_escape ambient @a ~ ~1 ~ 1 0.7
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=12..16] unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..12] unless block ~ ~-0.4 ~ air if block ^ ^1.5 ^0.6 air run tp @s ^ ^ ^0.05 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=16..20] unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..12] unless block ~ ~-0.4 ~ air if block ^ ^1.5 ^0.6 air run tp @s ^ ^ ^0.1 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=20..25] unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..12] unless block ~ ~-0.4 ~ air if block ^ ^1.5 ^0.6 air run tp @s ^ ^ ^0.2 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=8..12] unless block ~ ~-0.4 ~ air if block ^ ^1.2 ^-0.56 air run tp @s ^ ^ ^-0.05 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=5..8] unless block ~ ~-0.4 ~ air if block ^ ^1.2 ^-0.56 air run tp @s ^ ^ ^-0.1 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air if block ^ ^1.2 ^-0.56 air run tp @s ^ ^ ^-0.2 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air unless block ^ ^1.2 ^-0.56 air run particle squid_ink ~ ~1 ~ 0.5 0.7 0.5 0.05 100 force
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air unless block ^ ^1.2 ^-0.56 air run tp @s ^ ^ ^6 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=skeleton,tag=undeadmage] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..20] run scoreboard players add @s AttackCharge 1
execute as @e[type=skeleton,tag=undeadmage] at @s unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..20] if score @s AttackCharge matches 1.. run scoreboard players remove @s AttackCharge 1
execute as @e[type=skeleton,tag=undeadmage] at @s unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..20] if score @s AttackCharge matches 1.. run scoreboard players remove @s AttackCharge 1
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 1.. run particle soul_fire_flame ~ ~1 ~ 0.3 0.4 0.3 0 1 force
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 20.. run particle soul_fire_flame ~ ~1 ~ 0.4 0.5 0.4 0 3 force
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 40.. run particle soul_fire_flame ~ ~1 ~ 0.5 0.6 0.5 0 5 force
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 60.. run particle soul_fire_flame ~ ~1 ~ 0.6 0.7 0.6 0 8 force
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 80.. run particle soul_fire_flame ~ ~1 ~ 0.7 0.8 0.7 0 10 force
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 100.. run particle soul_fire_flame ~ ~1 ~ 0.5 0.6 0.5 0.3 60 force
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 100.. run summon armor_stand ~ ~ ~ {Tags:["soulReach","custom"],Invisible:1,Marker:1,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-535237157,1476087147,-1761214431,-148423983],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZWUwNjkwMmIyNGFiMDUyODRlZDEzMmM1ZDg1MTAxMDk2NDAwMjI2MGE2NTY1MzRhYTQyMGU0YTY4ZGQzMjdiMiJ9fX0="}]}}}}]}
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 100.. run playsound minecraft:entity.elder_guardian.curse ambient @a ~ ~1.7 ~ 5 0.7
execute as @e[type=skeleton,tag=undeadmage] at @s if score @s AttackCharge matches 100.. run scoreboard players set @s AttackCharge -100
execute as @e[type=skeleton,tag=undeadmage] at @s unless block ~ ~0.1 ~ air run tp @s ~ ~0.2 ~
execute as @e[type=skeleton,tag=undeadmage] at @s unless block ~ ~0.2 ~ air run tp @s ~ ~0.2 ~
execute as @e[type=skeleton,tag=undeadmage] at @s if block ~ ~-0.1 ~ air run tp @s ~ ~-0.1 ~
execute as @e[type=skeleton,tag=undeadmage] at @s if block ~ ~-0.4 ~ air run tp @s ~ ~-0.4 ~
    # Soulreach
scoreboard players add @e[type=armor_stand,tag=soulReach] lifetime 1
execute as @e[type=armor_stand,tag=soulReach] at @s store result score @s lifetimePlaceholder run scoreboard players get @s lifetime
execute as @e[type=armor_stand,tag=soulReach] at @s if score @s lifetime matches 1 run tp @s ^ ^ ^ facing entity @p[gamemode=!creative,gamemode=!spectator,distance=..25] feet
execute as @e[type=armor_stand,tag=soulReach] at @s store result score @s operationSuccess run scoreboard players operation @s lifetimePlaceholder %= storeScore 40
execute as @e[type=armor_stand,tag=soulReach] at @s if score @s operationSuccess matches 0 run tp @s ^ ^ ^ facing entity @p[gamemode=!creative,gamemode=!spectator,distance=..25] feet
execute as @e[type=armor_stand,tag=soulReach] at @s run tp @s ^ ^ ^0.34
execute as @e[type=armor_stand,tag=soulReach] at @s run particle soul ^ ^1.7 ^-1.1 0.12 0.12 0.12 0.001 25 force
execute as @e[type=armor_stand,tag=soulReach] at @s run particle soul_fire_flame ^ ^1.7 ^-1.1 0.12 0.12 0.12 0.001 25 force
execute as @e[type=armor_stand,tag=soulReach] at @s if score @s lifetime matches 350.. run kill @s
execute as @e[type=armor_stand,tag=soulReach] at @s unless block ^ ^1.5 ^1 air run tp @s ~ ~ ~ ~130 ~
execute as @e[type=armor_stand,tag=soulReach] at @s run playsound entity.stray.ambient hostile @a ~ ~1.5 ~ 0.7 0
execute as @a[gamemode=!creative,gamemode=!spectator] at @s if entity @e[type=armor_stand,tag=soulReach,distance=..1] run damage @s 3 minecraft:freeze


    # Undead Samurai
execute as @e[type=armor_stand,tag=summonundeadsamurai] at @s run summon wither_skeleton ~ ~ ~ {OnGround:1b,NoGravity:0b,DeathLootTable:"minecraft:empty",LeftHanded:0b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Health:40f,Tags:["undeadsamurai","custom"],HandItems:[{id:"minecraft:netherite_sword",Count:1b,tag:{Enchantments:[{}]}},{}],HandDropChances:[0.000F,0.200F],ArmorItems:[{id:"minecraft:netherite_boots",Count:1b},{id:"minecraft:netherite_leggings",Count:1b},{id:"minecraft:netherite_chestplate",Count:1b},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1575331611,-1735503954,-1422396401,1047965453],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDhkNTk2M2VmNjBkZDU2NTk2NWNkM2ZkYmY5MTIwMDkyYzQ5MmUxMDU5M2IyNjZhMTk2OTU2YjRhNjRhNWI5ZCJ9fX0="}]}}}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],Attributes:[{Name:generic.max_health,Base:40}]}
execute as @e[type=armor_stand,tag=summonundeadsamurai] at @s run playsound minecraft:music_disc.ward ambient @a ~ ~1 ~ 3 0
execute as @e[type=armor_stand,tag=summonundeadsamurai] at @s run kill @s
scoreboard players add @e[type=wither_skeleton,tag=undeadsamurai] lifetime 1
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s lifetime matches 130 run stopsound @a * music_disc.ward
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s run particle smoke ~ ~1 ~ 0.3 0.4 0.3 0 1 force
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=5..25] unless entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air if block ^ ^1.5 ^0.6 air run tp @s ^ ^ ^0.2 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air if block ^ ^1.2 ^-0.56 air run tp @s ^ ^ ^-0.16 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air unless block ^ ^1.2 ^-0.56 air if block ^ ^1.2 ^6 air run particle squid_ink ~ ~1 ~ 0.5 0.7 0.5 0.05 100 force
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..5] unless block ~ ~-0.4 ~ air unless block ^ ^1.2 ^-0.56 air if block ^ ^1.2 ^6 air run tp @s ^ ^ ^6 facing entity @p[gamemode=!creative,gamemode=!spectator] feet
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] run scoreboard players add @s AttackCharge 1
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s unless entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] if score @s AttackCharge matches 1.. run scoreboard players remove @s AttackCharge 1
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] run scoreboard players add @s flappingBounce 1
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] unless block ~ ~-0.4 ~ air if score @s flappingBounce matches 5..100 if block ^-0.67 ^1.2 ^ air run tp @s ^-0.07 ^ ^
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] unless block ~ ~-0.4 ~ air if score @s flappingBounce matches 5..100 unless block ^-0.67 ^1.2 ^ air run scoreboard players set @s flappingBounce 100
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] unless block ~ ~-0.4 ~ air if score @s flappingBounce matches 105..200 if block ^0.67 ^1.2 ^ air run tp @s ^0.07 ^ ^
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=4..6] unless block ~ ~-0.4 ~ air if score @s flappingBounce matches 105..200 unless block ^0.67 ^1.2 ^ air run scoreboard players set @s flappingBounce 0
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if entity @p[gamemode=!creative,gamemode=!spectator,distance=..2.5] run effect give @s resistance 1 2 true
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s flappingBounce matches 200.. run scoreboard players set @s flappingBounce 0
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60 run particle soul ~ ~1 ~ 0.35 0.5 0.35 0.1 30 force
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60 run playsound minecraft:entity.camel.dash_ready ambient @a ~ ~1 ~ 4 0.9
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60.. run tp @s ^ ^ ^3.7
# execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60.. run playsound 
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60.. run particle sweep_attack ^ ^1 ^1 0.3 0.3 0.3 1 3 force
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60.. run damage @p[gamemode=!creative,gamemode=!spectator,distance=..1.6] 4 minecraft:mob_attack
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if score @s AttackCharge matches 60.. run scoreboard players set @s AttackCharge 0

execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s unless block ~ ~0.1 ~ air run tp @s ~ ~0.2 ~
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s unless block ~ ~0.2 ~ air run tp @s ~ ~0.2 ~
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if block ~ ~-0.1 ~ air run tp @s ~ ~-0.1 ~
execute as @e[type=wither_skeleton,tag=undeadsamurai] at @s if block ~ ~-0.4 ~ air run tp @s ~ ~-0.4 ~





    # Overall Score Cleanup
scoreboard players set @a Attack 0


# TODO: Improve Death Sound Desing of Emberax

# playsound minecraft:item.trident.thunder hostile @a ~ ~1 ~ 1 1.6          Smite Spell Sound
# playsound minecraft:item.trident.return hostile @a ~ ~1 ~ 1 0             Crystal Sound
# playsound minecraft:block.respawn_anchor.charge hostile @a ~ ~1 ~ 5 0     Crystal Sound 2
# playsound minecraft:entity.camel.eat ambient @a ~ ~1 ~ 3 0                flesh monster sound???
# Use goat horn for item??