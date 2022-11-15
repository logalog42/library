    --override_table is a table with the following fields:
        --speed: multiplier to default walking speed value (default: 1)
        --jump: multiplier to default jump value (default: 1)
        --gravity: multiplier to default gravity value (default: 1)
        --sneak: whether player can sneak (default: true)
        --sneak_glitch: whether player can use the new move code replications of the old sneak side-effects: sneak ladders and 2 node sneak jump (default: false)
        --new_move: use new move/sneak code. When false the exact old code is used for the specific old sneak behavior (default: true)
override_table = {}

override_table["speed"] = 1
override_table["jump"] = 1
override_table["gravity"] = 1
override_table["sneak"] = true
override_table["sneak_glitch"] = false
override_table["new_move"] = true

haste2 = 2
haste3 = 3

slow = .75
slow2 = .5
slow3 = .25

jump2 = 2
jump3 = 3
jump4 = 4



set_physics_override(override_table)
get_physics_override()  --: returns the table given to set_physics_override

get_hp()  --: returns number of health points
set_hp(hp, reason)  --: set number of health points

    --See reason in register_on_player_hpchange
    --Is limited to the range of 0 ... 65535 (2^16 - 1)
    --For players: HP are also limited by hp_max specified in object properties
