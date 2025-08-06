# Summon a villager with a random Disney character name
# First, create a random score from 1-20 for name selection
scoreboard players set @s random 0
execute store result score @s random run random value 1..20

# Summon villager with random Disney character name based on score
execute if score @s random matches 1 run summon villager ~ ~ ~ {CustomName:'{"text":"Mickey","color":"red"}',NoAI:0b,VillagerData:{profession:"minecraft:librarian",level:1,type:"minecraft:plains"}}
execute if score @s random matches 2 run summon villager ~ ~ ~ {CustomName:'{"text":"Minnie","color":"pink"}',NoAI:0b,VillagerData:{profession:"minecraft:farmer",level:1,type:"minecraft:plains"}}
execute if score @s random matches 3 run summon villager ~ ~ ~ {CustomName:'{"text":"Donald","color":"blue"}',NoAI:0b,VillagerData:{profession:"minecraft:fisherman",level:1,type:"minecraft:plains"}}
execute if score @s random matches 4 run summon villager ~ ~ ~ {CustomName:'{"text":"Goofy","color":"green"}',NoAI:0b,VillagerData:{profession:"minecraft:shepherd",level:1,type:"minecraft:plains"}}
execute if score @s random matches 5 run summon villager ~ ~ ~ {CustomName:'{"text":"Pluto","color":"yellow"}',NoAI:0b,VillagerData:{profession:"minecraft:leatherworker",level:1,type:"minecraft:plains"}}
execute if score @s random matches 6 run summon villager ~ ~ ~ {CustomName:'{"text":"Belle","color":"gold"}',NoAI:0b,VillagerData:{profession:"minecraft:librarian",level:1,type:"minecraft:plains"}}
execute if score @s random matches 7 run summon villager ~ ~ ~ {CustomName:'{"text":"Beast","color":"dark_blue"}',NoAI:0b,VillagerData:{profession:"minecraft:toolsmith",level:1,type:"minecraft:plains"}}
execute if score @s random matches 8 run summon villager ~ ~ ~ {CustomName:'{"text":"Ariel","color":"aqua"}',NoAI:0b,VillagerData:{profession:"minecraft:fisherman",level:1,type:"minecraft:plains"}}
execute if score @s random matches 9 run summon villager ~ ~ ~ {CustomName:'{"text":"Elsa","color":"light_blue"}',NoAI:0b,VillagerData:{profession:"minecraft:cleric",level:1,type:"minecraft:snow"}}
execute if score @s random matches 10 run summon villager ~ ~ ~ {CustomName:'{"text":"Anna","color":"red"}',NoAI:0b,VillagerData:{profession:"minecraft:farmer",level:1,type:"minecraft:snow"}}
execute if score @s random matches 11 run summon villager ~ ~ ~ {CustomName:'{"text":"Simba","color":"gold"}',NoAI:0b,VillagerData:{profession:"minecraft:butcher",level:1,type:"minecraft:savanna"}}
execute if score @s random matches 12 run summon villager ~ ~ ~ {CustomName:'{"text":"Nala","color":"yellow"}',NoAI:0b,VillagerData:{profession:"minecraft:butcher",level:1,type:"minecraft:savanna"}}
execute if score @s random matches 13 run summon villager ~ ~ ~ {CustomName:'{"text":"Aladdin","color":"purple"}',NoAI:0b,VillagerData:{profession:"minecraft:cartographer",level:1,type:"minecraft:desert"}}
execute if score @s random matches 14 run summon villager ~ ~ ~ {CustomName:'{"text":"Jasmine","color":"dark_purple"}',NoAI:0b,VillagerData:{profession:"minecraft:librarian",level:1,type:"minecraft:desert"}}
execute if score @s random matches 15 run summon villager ~ ~ ~ {CustomName:'{"text":"Pocahontas","color":"dark_green"}',NoAI:0b,VillagerData:{profession:"minecraft:fletcher",level:1,type:"minecraft:taiga"}}
execute if score @s random matches 16 run summon villager ~ ~ ~ {CustomName:'{"text":"Mulan","color":"red"}',NoAI:0b,VillagerData:{profession:"minecraft:weaponsmith",level:1,type:"minecraft:plains"}}
execute if score @s random matches 17 run summon villager ~ ~ ~ {CustomName:'{"text":"Tiana","color":"green"}',NoAI:0b,VillagerData:{profession:"minecraft:farmer",level:1,type:"minecraft:swamp"}}
execute if score @s random matches 18 run summon villager ~ ~ ~ {CustomName:'{"text":"Rapunzel","color":"yellow"}',NoAI:0b,VillagerData:{profession:"minecraft:mason",level:1,type:"minecraft:plains"}}
execute if score @s random matches 19 run summon villager ~ ~ ~ {CustomName:'{"text":"Moana","color":"aqua"}',NoAI:0b,VillagerData:{profession:"minecraft:fisherman",level:1,type:"minecraft:jungle"}}
execute if score @s random matches 20 run summon villager ~ ~ ~ {CustomName:'{"text":"Olaf","color":"white"}',NoAI:0b,VillagerData:{profession:"minecraft:cleric",level:1,type:"minecraft:snow"}}

# Announce the summoning
tellraw @a [{"text":"A Disney villager has been summoned! ","color":"gold"},{"text":"✨","color":"yellow"}]