/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1FDC2A27
/// @DnDComment : // Variable for how many bushes can exist at once
/// @DnDArgument : "expr" "5"
/// @DnDArgument : "var" "fauna_count"
fauna_count = 5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 17B3EF38
/// @DnDComment : // Creates array for the x positions
/// @DnDArgument : "expr" "array_create(fauna_count, 0)"
/// @DnDArgument : "var" "x_coords"
x_coords = array_create(fauna_count, 0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2388353D
/// @DnDComment : // Creates array for the sprites to be used
/// @DnDArgument : "expr" "array_create(fauna_count, -1)"
/// @DnDArgument : "var" "set_sprites"
set_sprites = array_create(fauna_count, -1);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 036797AB
/// @DnDComment : // Creates array for the alpha values (hide/show)
/// @DnDArgument : "expr" "array_create(fauna_count, 1.0)"
/// @DnDArgument : "var" "set_alphas"
set_alphas = array_create(fauna_count, 1.0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 059FDE5F
/// @DnDComment : // Fill the sprite array with the sprites created
/// @DnDInput : 4
/// @DnDArgument : "expr" "spr_foreground_floor_1"
/// @DnDArgument : "expr_1" "spr_foreground_floor_2"
/// @DnDArgument : "expr_2" "spr_foreground_floor_3"
/// @DnDArgument : "expr_3" "spr_foreground_floor_4"
/// @DnDArgument : "var" "sprite[0]"
/// @DnDArgument : "var_1" "sprite[1]"
/// @DnDArgument : "var_2" "sprite[2]"
/// @DnDArgument : "var_3" "sprite[3]"
sprite[0] = spr_foreground_floor_1;
sprite[1] = spr_foreground_floor_2;
sprite[2] = spr_foreground_floor_3;
sprite[3] = spr_foreground_floor_4;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 2FA783B6
/// @DnDComment : // Calls prefetch function to call the sprites into system resources
/// @DnDArgument : "function" "sprite_prefetch_multi"
/// @DnDArgument : "arg" "sprite"
sprite_prefetch_multi(sprite);

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 6B3BC86E
/// @DnDComment : // Loops through the array of bushes
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < fauna_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < fauna_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 147BD10A
	/// @DnDComment : // Sets bush up with random sprite
	/// @DnDParent : 6B3BC86E
	/// @DnDArgument : "expr" "choose(sprite[0], sprite[1], sprite[2], sprite[3])"
	/// @DnDArgument : "var" "set_sprites[_i]"
	set_sprites[_i] = choose(sprite[0], sprite[1], sprite[2], sprite[3]);

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 58B9FEC5
	/// @DnDComment : // Creates temp variables for placement checking
	/// @DnDInput : 2
	/// @DnDParent : 6B3BC86E
	/// @DnDArgument : "var" "_pos_set"
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var_1" "_attempts"
	/// @DnDArgument : "value_1" "0"
	var _pos_set = false;
	var _attempts = 0;

	/// @DnDAction : YoYo Games.Loops.While_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 066BC88F
	/// @DnDComment : // Loops when not set
	/// @DnDParent : 6B3BC86E
	/// @DnDArgument : "var" "_pos_set"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	while (!(_pos_set == true)) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4288C31A
		/// @DnDComment : // Sets at random coordinates with offset added for failed attempts
		/// @DnDParent : 066BC88F
		/// @DnDArgument : "expr" "random_range(0, room_width * (2 + 1 * _attempts))"
		/// @DnDArgument : "var" "x_coords[_i]"
		x_coords[_i] = random_range(0, room_width * (2 + 1 * _attempts));
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0688304C
		/// @DnDComment : // Changes the temp values
		/// @DnDInput : 2
		/// @DnDParent : 066BC88F
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "expr_1" "1"
		/// @DnDArgument : "expr_relative_1" "1"
		/// @DnDArgument : "var" "_pos_set"
		/// @DnDArgument : "var_1" "_attempts"
		_pos_set = true;
		_attempts += 1;
	
		/// @DnDAction : YoYo Games.Loops.For_Loop
		/// @DnDVersion : 1
		/// @DnDHash : 57E7DEC0
		/// @DnDComment : // Loops through the existing bushes
		/// @DnDParent : 066BC88F
		/// @DnDArgument : "init" "_j = 0"
		/// @DnDArgument : "init_temp" "1"
		/// @DnDArgument : "cond" "_j < fauna_count"
		/// @DnDArgument : "expr" "_j += 1"
		for(var _j = 0; _j < fauna_count; _j += 1) {
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 4238D12C
			/// @DnDComment : // Checks bush is not the same
			/// @DnDParent : 57E7DEC0
			/// @DnDArgument : "expr" "_i == _j"
			/// @DnDArgument : "not" "1"
			if(!(_i == _j))
			{
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 75143438
				/// @DnDComment : // Checks if the sprites are overlapping
				/// @DnDParent : 4238D12C
				/// @DnDArgument : "expr" "x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j])"
				if(x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 20756620
					/// @DnDComment : // Changes flag to not set
					/// @DnDParent : 75143438
					/// @DnDArgument : "expr" "false"
					/// @DnDArgument : "var" "_pos_set"
					_pos_set = false;
				}
			}
		}
	}
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 24F90358
/// @DnDComment : // Sets the y position to room height
/// @DnDArgument : "expr" "room_height"
/// @DnDArgument : "var" "y"
y = room_height;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 67CA0FA9
/// @DnDComment : // Sets the move rate for parallaxing
/// @DnDArgument : "expr" "1.1"
/// @DnDArgument : "var" "move_rate"
move_rate = 1.1;