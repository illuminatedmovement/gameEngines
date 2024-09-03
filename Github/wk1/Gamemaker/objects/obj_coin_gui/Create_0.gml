/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 653DFAA3
/// @DnDComment : // Creates a random angle plus or minus 30 degrees to move the gui coin in for variation
/// @DnDArgument : "expr" "random_range(-30, 30)"
/// @DnDArgument : "var" "image_adjust"
image_adjust = random_range(-30, 30);

/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
/// @DnDVersion : 1
/// @DnDHash : 17667237
/// @DnDComment : // Sets the direction to head left with the added variation
/// @DnDArgument : "direction" "180 + image_adjust"
direction = 180 + image_adjust;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 03FE78EF
/// @DnDComment : // Sets the gui coins current speed to the games current speed
/// @DnDArgument : "expr" "obj_game_manager.current_speed"
/// @DnDArgument : "var" "current_speed"
current_speed = obj_game_manager.current_speed;

/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 2ECC8B7D
/// @DnDComment : // Applies this variable to the speed variable for movement updates
/// @DnDArgument : "speed" "current_speed"
speed = current_speed;

/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
/// @DnDVersion : 1
/// @DnDHash : 30B3BCDF
/// @DnDComment : // Sets the sprite to be visible
image_alpha = 1;

/// @DnDAction : YoYo Games.Instances.Sprite_Scale
/// @DnDVersion : 1
/// @DnDHash : 45CF04AA
/// @DnDComment : // Sets the sprite to be at full scale
image_xscale = 1;
image_yscale = 1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2C6DE288
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "var" "child_particle"
child_particle = noone;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3AD68EED
/// @DnDComment : // Adds gold to the game managers totals
/// @DnDInput : 2
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "expr_1" "1"
/// @DnDArgument : "expr_relative_1" "1"
/// @DnDArgument : "var" "obj_game_manager.current_gold"
/// @DnDArgument : "var_1" "obj_game_manager.current_level_gold"
obj_game_manager.current_gold += 1;
obj_game_manager.current_level_gold += 1;