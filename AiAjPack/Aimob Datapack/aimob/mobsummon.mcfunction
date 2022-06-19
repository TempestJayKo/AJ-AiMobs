


### vvv if you wish to summon multiple zombies disable this function

function <project.name>:aimob/private/reset



#add objectives
scoreboard objectives add mob.id dummy
scoreboard objectives add ids dummy

#add one to global score in ids
scoreboard players add $global ids 1



#execute at @s run summon armor_stand ~ ~ ~ {Tags:["<project.name>.base","new"],Marker:1b,NoBasePlate:1b,Invisible:1b,Invulnerable:1b}
#^ Armorstand summon
#v Mob summon
execute at @s run summon zombie ~ ~ ~ {Tags:["<project.name>.base","given","new"],Silent:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:999999,ShowParticles:0b,}]}
execute at @e[tag=<project.name>.base,tag=new] run function <project.name>:summon/default
execute as @e[tag=aj.<project.name>.root,sort=nearest,tag=!linked] run tag @e[tag=aj.<project.name>.root,sort=nearest,tag=!linked] add new


#set ids to entities
scoreboard players operation @e[tag=new,limit=1,tag=<project.name>.base] ids = $global ids
scoreboard players operation @e[limit=1,tag=aj.<project.name>.root,tag=new] ids = $global ids



#add linked tag
tag @e[tag=new] add linked
tag @e[tag=new] remove new




#run loop function
function <project.name>:aimob/aimobloop








