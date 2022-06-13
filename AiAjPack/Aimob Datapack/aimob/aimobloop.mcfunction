
#if the base is moving away from the root add tag moving
execute as @e[tag=<project.name>.base] at @s unless entity @e[tag=aj.<project.name>.root,distance=..0.01,limit=1] run tag @s add moving
execute as @e[tag=<project.name>.base] at @s if entity @e[tag=aj.<project.name>.root,distance=..0.01,limit=1] run tag @s remove moving

#if the base has the tag "moving" tp root to base
execute as @e[tag=<project.name>.base,tag=moving,tag=linked] at @s run function <project.name>:aimob/private/link

#<walking_animation>
execute as @e[tag=<project.name>.base,tag=moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project.name>.anim.<walking_animation>] run function <project.name>:animations/<walking_animation>/play
execute as @e[tag=<project.name>.base,tag=!moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<walking_animation>] run function <project.name>:reset

#<idle_animation> Animation
execute as @e[tag=<project.name>.base,tag=!moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project.name>.anim.<walking_animation>] if entity @s[tag=!aj.<project.name>.anim.<idle_animation>] if entity @s[tag=!aj.<project.name>.anim.<attack_animation>] run function <project.name>:animations/<idle_animation>/play
execute as @e[tag=<project.name>.base,tag=moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<walking_animation>] if entity @s[tag=aj.<project.name>.anim.<idle_animation>] run function <project.name>:animations/<idle_animation>/stop

#<attack_animation> Animation
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest,tag=!aj.<project.name>.anim.<idle_animation>] if entity @s[tag=!aj.<project.name>.anim.<attack_animation>] if entity @a[distance=..1.5] run function <project.name>:animations/<attack_animation>/play
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<attack_animation>] if entity @a[distance=1.5..] run function <project.name>:animations/<attack_animation>/stop


#kill functions


### If mobs health is below 10 the mob will die 

execute as @e[tag=<project.name>.base,limit=1,tag=given] run function <project.name>:aimob/private/get
execute unless entity @e[tag=<project.name>.base,tag=given] run tag @e[tag=<project.name>.base] add given 
execute as @e[tag=<project.name>.base] at @s if score @s mob.id matches ..10 run function <project.name>:aimob/remove_this


#loop
execute if entity @e[tag=<project.name>.base] run schedule function <project.name>:aimob/aimobloop 1t

execute if entity @e[tag=aj.<project.name>.root] run schedule function <project.name>:aimob/aimobloop 1t

