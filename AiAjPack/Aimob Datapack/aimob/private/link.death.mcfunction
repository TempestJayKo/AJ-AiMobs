scoreboard players operation $temp ids = @s ids
scoreboard players set .end ids 1
execute as @e[tag=<project.name>.base] if score @s ids = $temp ids run scoreboard players set .end ids 0
execute if score .end ids matches 1 at @s run function <project.name>:aimob/remove_this
scoreboard players set .end ids 0


