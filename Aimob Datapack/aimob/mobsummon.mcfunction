


### vvv if you wish to summon multiple husks disable this function

execute as @e[tag=<project_name>.base,type=husk] run function animated_java:<project_name>/aimob/private/reset



#add objectives
scoreboard objectives add mob.id dummy
scoreboard objectives add ids dummy

#add one to global score in ids
scoreboard players add $global ids 1



#execute at @s run summon armor_stand ~ ~ ~ {Tags:["<project_name>.base","new"],Marker:1b,NoBasePlate:1b,Invisible:1b,Invulnerable:1b}
#^ Armorstand summon
#v Mob summon
execute at @s run summon husk ~ ~ ~ {Tags:["<project_name>.base","given","new"],NoGravity:0b,Silent:1,NoAI:0b,Invulnerable:0b,ActiveEffects:[{Id:14,Amplifier:0,Duration:999999,ShowParticles:1b,PersistenceRequired:1b}]}
#map this to any animation pose
execute at @e[tag=<project_name>.base,tag=new] run function animated_java:<project_name>/summon/pose
execute as @e[tag=aj.<project_name>.root,sort=nearest,tag=!linked] run tag @e[tag=aj.<project_name>.root,sort=nearest,tag=!linked] add new


#set ids to entities
scoreboard players operation @e[tag=new,limit=1,tag=<project_name>.base] ids = $global ids
scoreboard players operation @e[limit=1,tag=aj.<project_name>.root,tag=new] ids = $global ids



#add linked tag
tag @e[tag=new] add linked
tag @e[tag=new] remove new




#run loop function
function animated_java:<project_name>/aimob/aimobloop

### Or add animated_java:<project_name>/aimob/aimobloop to your tick.json








