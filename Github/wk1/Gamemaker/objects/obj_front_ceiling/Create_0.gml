/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1FDC2A27
/// @DnDComment : // Keeps count of how many vines can be created
/// @DnDArgument : "expr" "2"
/// @DnDArgument : "var" "fauna_count"
fauna_count = 2;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 17B3EF38
/// @DnDComment : // Creates an empty array of x positions
/// @DnDArgument : "expr" "array_create(fauna_count, 0)"
/// @DnDArgument : "var" "x_coords"
x_coords = array_create(fauna_count, 0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2388353D
/// @DnDComment : // Creates an empty array of unset sprites
/// @DnDArgument : "expr" "array_create(fauna_count, -1)"
/// @DnDArgument : "var" "set_sprites"
set_sprites = array_create(fauna_count, -1);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 036797AB
/// @DnDComment : // Creates an empty array of alpha values
/// @DnDArgument : "expr" "array_create(fauna_count, 1.0)"
/// @DnDArgument : "var" "set_alphas"
set_alphas = array_create(fauna_count, 1.0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 059FDE5F
/// @DnDComment : // Sets the inital sprite in a sprite array to vine sprite
/// @DnDArgument : "expr" "spr_foreground_celing_1"
/// @DnDArgument : "var" "sprite[0]"
sprite[0] = spr_foreground_celing_1;

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 6B3BC86E
/// @DnDComment : // Loops through the vines
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < fauna_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < fauna_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 707047F8
	/// @DnDComment : // Sets the sprite (Array and choose function used since you may want to add more vines later!)
	/// @DnDParent : 6B3BC86E
	/// @DnDArgument : "expr" "sprite[0]"
	/// @DnDArgument : "var" "set_sprites[_i]"
	set_sprites[_i] = sprite[0];

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 58B9FEC5
	/// @DnDComment : // Temp variables for checking if the position has been set and how many attempts have been made
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
	/// @DnDComment : // Checks position hasnt been set
	/// @DnDParent : 6B3BC86E
	/// @DnDArgument : "var" "_pos_set"
	/// @DnDArgument : "not" "1"
	/// @DnDArgument : "value" "true"
	while (!(_pos_set == true)) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4288C31A
		/// @DnDComment : // Sets position with added offset of attempts
		/// @DnDParent : 066BC88F
		/// @DnDArgument : "expr" "random_range(0, room_width * (2 + 1 * _attempts))"
		/// @DnDArgument : "var" "x_coords[_i]"
		x_coords[_i] = random_range(0, room_width * (2 + 1 * _attempts));
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 722B2441
		/// @DnDComment : // Adjusts the temp variables
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
		/// @DnDComment : // Loops through the existing vines
		/// @DnDParent : 066BC88F
		/// @DnDArgument : "init" "_j = 0"
		/// @DnDArgument : "init_temp" "1"
		/// @DnDArgument : "cond" "_j < fauna_count"
		/// @DnDArgument : "expr" "_j += 1"
		for(var _j = 0; _j < fauna_count; _j += 1) {
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 4238D12C
			/// @DnDComment : // Checks they are not the same as the current fauna being set
			/// @DnDParent : 57E7DEC0
			/// @DnDArgument : "expr" "_i == _j"
			/// @DnDArgument : "not" "1"
			if(!(_i == _j))
			{
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 75143438
				/// @DnDComment : // Checks if the sprites would be overlapping
				/// @DnDParent : 4238D12C
				/// @DnDArgument : "expr" "x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j])"
				if(x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 20756620
					/// @DnDComment : // Changes the set flag to false
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
/// @DnDComment : // Sets the y position value to origin
/// @DnDArgument : "var" "y"
y = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 67CA0FA9
/// @DnDComment : // Sets default move rate
/// @DnDArgument : "expr" "1.1"
/// @DnDArgument : "var" "move_rate"
move_rate = 1.1;