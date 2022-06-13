execute as @s store result score @s mob.id run data get entity @s Health 1


scoreboard players operation @s <project.name>_Health = @s mob.id
scoreboard players operation @s <project.name>_Health -= $minus mob.id


tag @s remove given