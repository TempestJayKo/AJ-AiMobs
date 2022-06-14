
#if the base is moving away from the root add tag moving
execute as @e[tag=<project.name>.base] at @s unless entity @e[tag=aj.<project.name>.root,distance=..0.01,limit=1] run tag @s add moving
execute as @e[tag=<project.name>.base] at @s if entity @e[tag=aj.<project.name>.root,distance=..0.01,limit=1] run tag @s remove moving

#if the base has the tag "moving" tp root to base
execute as @e[tag=<project.name>.base,tag=moving,tag=linked] at @s run function <project.name>:aimob/private/link

#<walk_animation> Animation
execute as @e[tag=<project.name>.base,tag=moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project.name>.anim.<walk_animation>] run function <project.name>:animations/<walk_animation>/play
execute as @e[tag=<project.name>.base,tag=!moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<walk_animation>] run function <project.name>:animations/<walk_animation>/pause

#<idle_animation> Animation
execute as @e[tag=<project.name>.base,tag=!moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project.name>.anim.<walk_animation>] if entity @s[tag=!aj.<project.name>.anim.<idle_animation>] if entity @s[tag=!aj.<project.name>.anim.<attack_animation>] run function <project.name>:animations/<idle_animation>/play
execute as @e[tag=<project.name>.base,tag=moving] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<walk_animation>] if entity @s[tag=aj.<project.name>.anim.<idle_animation>] run function <project.name>:animations/<idle_animation>/stop

#<attack_animation> Animation
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest,tag=!aj.<project.name>.anim.<idle_animation>] if entity @s[tag=!aj.<project.name>.anim.<attack_animation>] if entity @a[distance=..1.2] run function <project.name>:animations/<attack_animation>/play
execute as @e[tag=<project.name>.base] at @s as @e[tag=aj.<project.name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project.name>.anim.<attack_animation>] if entity @a[distance=1.2..] run function <project.name>:animations/<attack_animation>/stop


#get [Health]
execute as @e[tag=<project.name>.base,limit=1,tag=given] run function <project.name>:aimob/private/get
execute unless entity @e[tag=<project.name>.base,tag=given] run tag @e[tag=<project.name>.base] add given 


#execute as @a[tag=god,limit=1] run say hi

execute as @e[tag=aj.<project.name>.root] at @s run function <project.name>:aimob/private/link.death 


#loop
execute if entity @e[tag=<project.name>.base] run schedule function <project.name>:aimob/aimobloop 1t


#kill function
execute if entity @e[tag=aj.<project.name>.root] unless entity @e[tag=<project.name>.base] run schedule function <project.name>:aimob/aimobloop 3s


## Enable if you are not using a mob for whatever reason (Like why are you using this??) and disable the top loop ^

#execute if entity @e[tag=aj.<project.name>.root] run schedule function <project.name>:aimob/aimobloop 1t

