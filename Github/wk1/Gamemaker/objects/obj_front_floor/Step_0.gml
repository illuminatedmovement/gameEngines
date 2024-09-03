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
	/// @DnDComment : // Loops through the bushes
	/// @DnDParent : 63DC0BE5
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "cond" "_i < fauna_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(_i = 0; _i < fauna_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3FCD49F3
		/// @DnDComment : // Moves the x positions based on the current speed and parallaxing move rate
		/// @DnDParent : 482301CA
		/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * move_rate)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "x_coords[_i]"
		x_coords[_i] += -(obj_game_manager.current_speed * move_rate);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 66A6C7E4
		/// @DnDComment : // Checks if the bush has left the left side of the screen
		/// @DnDParent : 482301CA
		/// @DnDArgument : "var" "x_coords[_i] + sprite_get_width(set_sprites[_i])"
		/// @DnDArgument : "op" "1"
		if(x_coords[_i] + sprite_get_width(set_sprites[_i]) < 0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1532C6E9
			/// @DnDComment : // Changes the bushes sprite
			/// @DnDParent : 66A6C7E4
			/// @DnDArgument : "expr" "choose(sprite[0], sprite[1], sprite[2], sprite[3])"
			/// @DnDArgument : "var" "set_sprites[_i]"
			set_sprites[_i] = choose(sprite[0], sprite[1], sprite[2], sprite[3]);
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1652C8F7
			/// @DnDComment : // Creates temp values for placement checking
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
			/// @DnDComment : // Loops when not set
			/// @DnDParent : 66A6C7E4
			/// @DnDArgument : "var" "_pos_set"
			/// @DnDArgument : "not" "1"
			/// @DnDArgument : "value" "true"
			while (!(_pos_set == true)) {
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 348FEEB8
				/// @DnDComment : // Sets x position at random with attempt count adding to help hanging here
				/// @DnDParent : 1AD55093
				/// @DnDArgument : "expr" "room_width + sprite_get_width(set_sprites[_i]) + random_range(0, room_width * (1 + 1 * _attempts))"
				/// @DnDArgument : "var" "x_coords[_i]"
				x_coords[_i] = room_width + sprite_get_width(set_sprites[_i]) + random_range(0, room_width * (1 + 1 * _attempts));
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 0A39917B
				/// @DnDComment : // Changes the values since now set
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
				/// @DnDComment : // Loops through the bushes again
				/// @DnDParent : 1AD55093
				/// @DnDArgument : "init" "_j = 0"
				/// @DnDArgument : "init_temp" "1"
				/// @DnDArgument : "cond" "_j < fauna_count"
				/// @DnDArgument : "expr" "_j += 1"
				for(var _j = 0; _j < fauna_count; _j += 1) {
					/// @DnDAction : YoYo Games.Common.If_Expression
					/// @DnDVersion : 1
					/// @DnDHash : 7A35616A
					/// @DnDComment : // Checks they are not the same
					/// @DnDParent : 4A7A421B
					/// @DnDArgument : "expr" "_i == _j"
					/// @DnDArgument : "not" "1"
					if(!(_i == _j))
					{
						/// @DnDAction : YoYo Games.Common.If_Expression
						/// @DnDVersion : 1
						/// @DnDHash : 7E081D8A
						/// @DnDComment : // Checks the sprites are not intersecting
						/// @DnDParent : 7A35616A
						/// @DnDArgument : "expr" "x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j])"
						if(x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
						{
							/// @DnDAction : YoYo Games.Common.Variable
							/// @DnDVersion : 1
							/// @DnDHash : 63118F5B
							/// @DnDComment : // Unsets flag so loop will reattempt placement
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
		/// @DnDComment : // Checks when bush hasnt entered room yet
		/// @DnDParent : 482301CA
		/// @DnDArgument : "var" "x_coords[_i]"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "room_width"
		if(x_coords[_i] > room_width)
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 423BEA76
			/// @DnDComment : // Checks if game is inside or outside
			/// @DnDParent : 7E76B10D
			/// @DnDArgument : "expr" "obj_interior_background.current_pipe_state == INTERIOR_STATE.OUTSIDE"
			if(obj_interior_background.current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 78E58AC1
				/// @DnDComment : // Sets to visible bush since outside
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
				/// @DnDComment : // Hides bush since inside
				/// @DnDParent : 03BC8F6C
				/// @DnDArgument : "expr" "0.0"
				/// @DnDArgument : "var" "set_alphas[_i]"
				set_alphas[_i] = 0.0;
			}
		}
	}
}