
#if the base is moving away from the root add tag moving
execute as @e[tag=<project.name>.base] at @s unless entity @e[tag=aj.<project.name>.root,distance=..0.01,limit=1] run tag @s add moving
execute as @e[tag=<project.name>.base] at @s if entity @e[tag=aj.<project.name>.root,distance=..0.01,limit=1] run tag @s remove moving

#if the base has the tag "moving" tp root to base
execute as @e[tag=<project.name>.base,tag=moving,tag=linked] at @s run function <project.name>:aimob/private/link

#<walk_animation> Animation
execute as @e[tag=<project.name>.base,tag=moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project.name>.anim.<walk_animation>,tag=!aj.<project.name>.anim.<attack_animation>] run function <project.name>:animations/<walk_animation>/play
execute as @e[tag=<project.name>.base,tag=!moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<walk_animation>] run function <project.name>:animations/<walk_animation>/pause

#<idle_animation> Animation
execute as @e[tag=<project.name>.base,tag=!moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project.name>.anim.<walk_animation>,tag=!aj.<project.name>.anim.<idle_animation>] run function <project.name>:animations/<idle_animation>/play
execute as @e[tag=<project.name>.base,tag=moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<walk_animation>,tag=aj.<project.name>.anim.<idle_animation>] run function <project.name>:animations/<idle_animation>/pause



#<attack_animation> Animation
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] unless entity @s[tag=aj.<project.name>.anim.<attack_animation>] if entity @a[distance=..1.5] run function <project.name>:animations/<attack_animation>/play
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<attack_animation>] if entity @a[distance=1.8..] run function <project.name>:animations/<attack_animation>/stop
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<attack_animation>] run function <project.name>:animations/<idle_animation>/pause



execute as @e[type=minecraft:warden,limit=1] at @s store result score @s dig run data get entity @e[type=minecraft:warden,limit=1] Brain{memories:{"minecraft:dig_cooldown":},value:{},ttl:{}}

#get [Health]
execute as @e[tag=<project.name>.base,limit=1,tag=given] run function <project.name>:aimob/private/get
execute unless entity @e[tag=<project.name>.base,tag=given] run tag @e[tag=<project.name>.base] add given 



#kill functions
execute as @e[tag=aj.<project.name>.root] at @s run function <project.name>:aimob/private/link.death


#loop
execute if entity @e[tag=<project.name>.base] run schedule function <project.name>:aimob/aimobloop 1t
execute if entity @e[tag=aj.<project.name>.root] unless entity @e[tag=<project.name>.base] run schedule function <project.name>:aimob/aimobloop 3s
## Enable if you are not using a mob and disable the top loop ^

#execute if entity @e[tag=aj.<project.name>.root] run schedule function <project.name>:aimob/aimobloop 1t

