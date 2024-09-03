/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 72517488
/// @DnDComment : // Stores the midground sprites inside an array
/// @DnDInput : 4
/// @DnDArgument : "expr" "spr_midground_1"
/// @DnDArgument : "expr_1" "spr_midground_2"
/// @DnDArgument : "expr_2" "spr_midground_3"
/// @DnDArgument : "expr_3" "spr_midground_4"
/// @DnDArgument : "var" "sprite[0]"
/// @DnDArgument : "var_1" "sprite[1]"
/// @DnDArgument : "var_2" "sprite[2]"
/// @DnDArgument : "var_3" "sprite[3]"
sprite[0] = spr_midground_1;
sprite[1] = spr_midground_2;
sprite[2] = spr_midground_3;
sprite[3] = spr_midground_4;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 3329DF28
/// @DnDComment : // Prefeches them to prevent hanging later
/// @DnDArgument : "function" "sprite_prefetch_multi"
/// @DnDArgument : "arg" "sprite"
sprite_prefetch_multi(sprite);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2DFD6770
/// @DnDComment : // Sets before, current and after sprite from array
/// @DnDArgument : "expr" "sprite[0]"
/// @DnDArgument : "var" "before_sprite"
before_sprite = sprite[0];

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 03B7433B
/// @DnDArgument : "spriteind" "sprite[1]"
sprite_index = sprite[1];
image_index = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2A27E366
/// @DnDArgument : "expr" "sprite[2]"
/// @DnDArgument : "var" "after_sprite"
after_sprite = sprite[2];

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 72999E03
/// @DnDComment : // Sets new random x position
/// @DnDArgument : "expr" "random_range(0, sprite_width)"
/// @DnDArgument : "var" "x"
x = random_range(0, sprite_width);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0B9E0E1D
/// @DnDComment : // Sets y position
/// @DnDArgument : "var" "y"
y = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1E4B1B0C
/// @DnDComment : // Sets parallaxing move rate
/// @DnDArgument : "expr" "0.8"
/// @DnDArgument : "var" "background_move_rate"
background_move_rate = 0.8;