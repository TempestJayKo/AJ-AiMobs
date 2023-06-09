
#if the base is moving away from the root add tag moving
execute as @e[tag=<project_name>.base] at @s unless entity @e[tag=aj.<project_name>.root,distance=..0.01,limit=1] run tag @s add moving
execute as @e[tag=<project_name>.base] at @s if entity @e[tag=aj.<project_name>.root,distance=..0.01,limit=1] run tag @s remove moving

#if the base has the tag "moving" tp root to base
execute as @e[tag=<project_name>.base,tag=moving,tag=linked] at @s run function animated_java:<project_name>/aimob/private/link

#<walk_animation> Animation
execute as @e[tag=<project_name>.base,tag=moving] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project_name>.animation.<walk_animation>,tag=!aj.<project_name>.animation.<attack_animation>] run function animated_java:<project_name>/animations/<walk_animation>/play
execute as @e[tag=<project_name>.base,tag=!moving] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project_name>.animation.<walk_animation>] run function animated_java:<project_name>/animations/<walk_animation>/pause

#<idle_animation> Animation
execute as @e[tag=<project_name>.base,tag=!moving] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] if entity @s[tag=!aj.<project_name>.animation.<walk_animation>,tag=!aj.<project_name>.animation.<idle_animation>] run function animated_java:<project_name>/animations/<idle_animation>/play
execute as @e[tag=<project_name>.base,tag=moving] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project_name>.animation.<walk_animation>,tag=aj.<project_name>.animation.<idle_animation>] run function animated_java:<project_name>/animations/<idle_animation>/pause



#<attack_animation> Animation
execute as @e[tag=<project_name>.base] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] unless entity @s[tag=aj.<project_name>.animation.<attack_animation>] if entity @a[distance=..1.5,gamemode=!creative,gamemode=!spectator] run function animated_java:<project_name>/animations/<attack_animation>/play
execute as @e[tag=<project_name>.base] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project_name>.animation.<attack_animation>] if entity @a[distance=1.8..] run function animated_java:<project_name>/animations/<attack_animation>/stop
execute as @e[tag=<project_name>.base] at @s as @e[tag=aj.<project_name>.root,limit=1,sort=nearest] if entity @s[tag=aj.<project_name>.animation.<attack_animation>] run function animated_java:<project_name>/animations/<idle_animation>/pause





#get [Health]
execute as @e[tag=<project_name>.base,limit=1,tag=given] run function animated_java:<project_name>/aimob/private/get
execute unless entity @e[tag=<project_name>.base,tag=given] run tag @e[tag=<project_name>.base] add given 



#kill functions
execute as @e[tag=aj.<project_name>.root] at @s run function animated_java:<project_name>/aimob/private/link.death


#loop
# This is slow add ``` animated_java:<project_name>/aimob/aimobloop ``` to your tick.json for better results
execute if entity @e[tag=<project_name>.base] run schedule function animated_java:<project_name>/aimob/aimobloop 1t
execute if entity @e[tag=aj.<project_name>.root] unless entity @e[tag=<project_name>.base] run schedule function animated_java:<project_name>/aimob/aimobloop 3s


## Enable if you are not using a mob and disable the top loop ^

#execute if entity @e[tag=aj.<project_name>.root] run schedule function animated_java:<project_name>/aimob/aimobloop 1t

