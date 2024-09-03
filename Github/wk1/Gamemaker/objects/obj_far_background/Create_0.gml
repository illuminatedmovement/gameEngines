/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1BE16CE9
/// @DnDComment : // Creates an array and stores background sprites to it
/// @DnDInput : 3
/// @DnDArgument : "expr" "spr_farground_1"
/// @DnDArgument : "expr_1" "spr_farground_2"
/// @DnDArgument : "expr_2" "spr_farground_3"
/// @DnDArgument : "var" "sprites[0]"
/// @DnDArgument : "var_1" "sprites[1]"
/// @DnDArgument : "var_2" "sprites[2]"
sprites[0] = spr_farground_1;
sprites[1] = spr_farground_2;
sprites[2] = spr_farground_3;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 6A037966
/// @DnDComment : // Fetches the sprite array to load them into the system resources
/// @DnDArgument : "function" "sprite_prefetch_multi"
/// @DnDArgument : "arg" "sprites"
sprite_prefetch_multi(sprites);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5F05AF79
/// @DnDComment : // Sets sprite variables to the sprites from the array
/// @DnDArgument : "expr" "sprites[0]"
/// @DnDArgument : "var" "before_sprite"
before_sprite = sprites[0];

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 61BC75FB
/// @DnDArgument : "spriteind" "sprites[1]"
sprite_index = sprites[1];
image_index = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5EDDE7EF
/// @DnDArgument : "expr" "sprites[2]"
/// @DnDArgument : "var" "after_sprite"
after_sprite = sprites[2];

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6EAA4ACF
/// @DnDComment : // Sets coordinates to a random x value less than the sprite width moving it along
/// @DnDInput : 2
/// @DnDArgument : "expr" "random_range(0, sprite_width)"
/// @DnDArgument : "var" "x"
/// @DnDArgument : "var_1" "y"
x = random_range(0, sprite_width);
y = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 022DB283
/// @DnDComment : // Sets the move rate for parallaxing effect
/// @DnDArgument : "expr" "0.4"
/// @DnDArgument : "var" "background_move_rate"
background_move_rate = 0.4;