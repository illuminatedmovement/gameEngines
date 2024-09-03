/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 63DC0BE5
/// @DnDComment : // Checks if the game is currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 482301CA
	/// @DnDComment : // Loops through the current fauna
	/// @DnDParent : 63DC0BE5
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "cond" "_i < fauna_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(_i = 0; _i < fauna_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3FCD49F3
		/// @DnDComment : // Moves the x position by the speed and set rate
		/// @DnDParent : 482301CA
		/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * move_rate)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "x_coords[_i]"
		x_coords[_i] += -(obj_game_manager.current_speed * move_rate);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 66A6C7E4
		/// @DnDComment : // Checks if the fauna has left the left of the screen
		/// @DnDParent : 482301CA
		/// @DnDArgument : "var" "x_coords[_i] + sprite_get_width(set_sprites[_i])"
		/// @DnDArgument : "op" "1"
		if(x_coords[_i] + sprite_get_width(set_sprites[_i]) < 0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 30C28A38
			/// @DnDComment : // Sets the sprite (Array and choose function used since you may want to add more vines later!)
			/// @DnDParent : 66A6C7E4
			/// @DnDArgument : "expr" "sprite[0]"
			/// @DnDArgument : "var" "set_sprites[_i]"
			set_sprites[_i] = sprite[0];
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1652C8F7
			/// @DnDComment : // Sets the temp variables
			/// @DnDInput : 2
			/// @DnDParent : 66A6C7E4
			/// @DnDArgument : "var" "_pos_set"
			/// @DnDArgument : "value" "false"
			/// @DnDArgument : "var_1" "_attempts"
			/// @DnDArgument : "value_1" "0"
			var _pos_set = false;
			var _attempts = 0;
		
			/// @DnDAction : YoYo Games.Loops.While_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 1AD55093
			/// @DnDComment : // Checks if not set
			/// @DnDParent : 66A6C7E4
			/// @DnDArgument : "var" "_pos_set"
			/// @DnDArgument : "not" "1"
			/// @DnDArgument : "value" "true"
			while (!(_pos_set == true)) {
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 348FEEB8
				/// @DnDComment : // Sets position with added offset of attempts
				/// @DnDParent : 1AD55093
				/// @DnDArgument : "expr" "room_width + sprite_get_width(set_sprites[_i]) + room_width * (1 + 1 * _attempts)"
				/// @DnDArgument : "var" "x_coords[_i]"
				x_coords[_i] = room_width + sprite_get_width(set_sprites[_i]) + room_width * (1 + 1 * _attempts);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 53144FA4
				/// @DnDComment : // Changes the set temp values
				/// @DnDInput : 2
				/// @DnDParent : 1AD55093
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "expr_1" "1"
				/// @DnDArgument : "expr_relative_1" "1"
				/// @DnDArgument : "var" "_pos_set"
				/// @DnDArgument : "var_1" "_attempts"
				_pos_set = true;
				_attempts += 1;
			
				/// @DnDAction : YoYo Games.Loops.For_Loop
				/// @DnDVersion : 1
				/// @DnDHash : 4A7A421B
				/// @DnDComment : // Loops through the fauna
				/// @DnDParent : 1AD55093
				/// @DnDArgument : "init" "_j = 0"
				/// @DnDArgument : "init_temp" "1"
				/// @DnDArgument : "cond" "_j < fauna_count"
				/// @DnDArgument : "expr" "_j += 1"
				for(var _j = 0; _j < fauna_count; _j += 1) {
					/// @DnDAction : YoYo Games.Common.If_Expression
					/// @DnDVersion : 1
					/// @DnDHash : 7A35616A
					/// @DnDComment : // Checks new fauna dosen't match one being set
					/// @DnDParent : 4A7A421B
					/// @DnDArgument : "expr" "_i == _j"
					/// @DnDArgument : "not" "1"
					if(!(_i == _j))
					{
						/// @DnDAction : YoYo Games.Common.If_Expression
						/// @DnDVersion : 1
						/// @DnDHash : 7E081D8A
						/// @DnDComment : // Calculates if the spites would be intersecting
						/// @DnDParent : 7A35616A
						/// @DnDArgument : "expr" "x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j])"
						if(x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
						{
							/// @DnDAction : YoYo Games.Common.Variable
							/// @DnDVersion : 1
							/// @DnDHash : 63118F5B
							/// @DnDComment : // Changes the set flag to false
							/// @DnDParent : 7E081D8A
							/// @DnDArgument : "expr" "false"
							/// @DnDArgument : "var" "_pos_set"
							_pos_set = false;
						}
					}
				}
			}
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7E76B10D
		/// @DnDComment : // Checks if the x postion is greater than the rooms width (aka offscreen)
		/// @DnDParent : 482301CA
		/// @DnDArgument : "var" "x_coords[_i]"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "room_width"
		if(x_coords[_i] > room_width)
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 423BEA76
			/// @DnDComment : // Checks if the level is currently inside or out
			/// @DnDParent : 7E76B10D
			/// @DnDArgument : "expr" "obj_interior_background.current_pipe_state == INTERIOR_STATE.OUTSIDE"
			if(obj_interior_background.current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 78E58AC1
				/// @DnDComment : // Shows the vines if outside
				/// @DnDParent : 423BEA76
				/// @DnDArgument : "expr" "1.0"
				/// @DnDArgument : "var" "set_alphas[_i]"
				set_alphas[_i] = 1.0;
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 03BC8F6C
			/// @DnDParent : 7E76B10D
			else
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 36D47297
				/// @DnDComment : // Hides the vines if inside
				/// @DnDParent : 03BC8F6C
				/// @DnDArgument : "expr" "0.0"
				/// @DnDArgument : "var" "set_alphas[_i]"
				set_alphas[_i] = 0.0;
			}
		}
	}
}