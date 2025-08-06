# Initialize scoreboard for random villager names
scoreboard objectives add random dummy

tellraw @a [{"text":"working yay","color":"green"}]
tellraw @a [{"text":"Disney Villager Summoner loaded! Use ","color":"aqua"},{"text":"/function obra:summon_villager","color":"yellow","clickEvent":{"action":"suggest_command","value":"/function obra:summon_villager"}},{"text":" to summon a villager.","color":"aqua"}]