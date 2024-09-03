/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1BFC5935
/// @DnDComment : // Checks if the game is currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 155C1421
	/// @DnDComment : // Checks what state the game should be
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "expr" "current_interior_state"
	var l155C1421_0 = current_interior_state;
	switch(l155C1421_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 5DA53B1B
		/// @DnDComment : // When entering
		/// @DnDParent : 155C1421
		/// @DnDArgument : "const" "INTERIOR_STATE.ENTER"
		case INTERIOR_STATE.ENTER:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6AC741C6
			/// @DnDComment : // Sets walls and pipes to enter and pushes overall state to inside
			/// @DnDInput : 3
			/// @DnDParent : 5DA53B1B
			/// @DnDArgument : "expr" "INTERIOR_STATE.ENTER"
			/// @DnDArgument : "expr_1" "INTERIOR_STATE.ENTER"
			/// @DnDArgument : "expr_2" "INTERIOR_STATE.INSIDE"
			/// @DnDArgument : "var" "current_wall_state"
			/// @DnDArgument : "var_1" "current_pipe_state"
			/// @DnDArgument : "var_2" "current_interior_state"
			current_wall_state = INTERIOR_STATE.ENTER;
			current_pipe_state = INTERIOR_STATE.ENTER;
			current_interior_state = INTERIOR_STATE.INSIDE;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 39E9D2AC
		/// @DnDComment : // When exiting
		/// @DnDParent : 155C1421
		/// @DnDArgument : "const" "INTERIOR_STATE.EXIT"
		case INTERIOR_STATE.EXIT:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 45CA77C6
			/// @DnDComment : // Sets a flag for the walls to change and its state to exit
			/// @DnDInput : 2
			/// @DnDParent : 39E9D2AC
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "expr_1" "INTERIOR_STATE.EXIT"
			/// @DnDArgument : "var" "has_wall_changed"
			/// @DnDArgument : "var_1" "current_wall_state"
			has_wall_changed = true;
			current_wall_state = INTERIOR_STATE.EXIT;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1BC1930E
			/// @DnDComment : // Pushes overall state to outside
			/// @DnDParent : 39E9D2AC
			/// @DnDArgument : "expr" "INTERIOR_STATE.OUTSIDE"
			/// @DnDArgument : "var" "current_interior_state"
			current_interior_state = INTERIOR_STATE.OUTSIDE;
			break;
	}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 5D531D66
	/// @DnDComment : // Loops through all wall segments
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < wall_segment_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < wall_segment_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7DB29537
		/// @DnDComment : // Changes the x positions based on speed and parallaxing rate
		/// @DnDParent : 5D531D66
		/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * background_move_rate)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "wall_x_coords[_i]"
		wall_x_coords[_i] += -(obj_game_manager.current_speed * background_move_rate);
	}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 7F6B3C68
	/// @DnDComment : // Loops through all the wall segements again
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < wall_segment_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < wall_segment_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2E82E808
		/// @DnDComment : // Creates a value to store width of the walls
		/// @DnDParent : 7F6B3C68
		/// @DnDArgument : "var" "_width"
		/// @DnDArgument : "value" "0"
		var _width = 0;
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 4ED0DE02
		/// @DnDComment : // Checks sprite exists
		/// @DnDParent : 7F6B3C68
		/// @DnDArgument : "expr" "set_wall_sprites[_i] != -1"
		if(set_wall_sprites[_i] != -1)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3EFB4309
			/// @DnDComment : // Sets value to sprites width (Not always the same)
			/// @DnDParent : 4ED0DE02
			/// @DnDArgument : "expr" "sprite_get_width(set_wall_sprites[_i])"
			/// @DnDArgument : "var" "_width"
			_width = sprite_get_width(set_wall_sprites[_i]);
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 040482AC
		/// @DnDComment : // Checks if the current wall is offscreen
		/// @DnDParent : 7F6B3C68
		/// @DnDArgument : "var" "wall_x_coords[_i]"
		/// @DnDArgument : "op" "1"
		/// @DnDArgument : "value" "-_width"
		if(wall_x_coords[_i] < -_width)
		{
			/// @DnDAction : YoYo Games.Switch.Switch
			/// @DnDVersion : 1
			/// @DnDHash : 78D57F2B
			/// @DnDComment : // Checks the walls current state
			/// @DnDParent : 040482AC
			/// @DnDArgument : "expr" "current_wall_state"
			var l78D57F2B_0 = current_wall_state;
			switch(l78D57F2B_0)
			{
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 555FDF73
				/// @DnDComment : // When entering
				/// @DnDParent : 78D57F2B
				/// @DnDArgument : "const" "INTERIOR_STATE.ENTER"
				case INTERIOR_STATE.ENTER:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 340689C1
					/// @DnDComment : // Sets enter wall
					/// @DnDParent : 555FDF73
					/// @DnDArgument : "expr" "wall_sprite[3]"
					/// @DnDArgument : "var" "set_wall_sprites[_i]"
					set_wall_sprites[_i] = wall_sprite[3];
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 6E11FA94
					/// @DnDComment : // Changes the wall state to inside
					/// @DnDParent : 555FDF73
					/// @DnDArgument : "expr" "INTERIOR_STATE.INSIDE"
					/// @DnDArgument : "var" "current_wall_state"
					current_wall_state = INTERIOR_STATE.INSIDE;
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 2BCCDA94
					/// @DnDComment : // Changes the ground state to enter (so dirt path ends only when inside)
					/// @DnDParent : 555FDF73
					/// @DnDArgument : "expr" "INTERIOR_STATE.ENTER"
					/// @DnDArgument : "var" "current_ground_state"
					current_ground_state = INTERIOR_STATE.ENTER;
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 21656143
				/// @DnDComment : // When inside
				/// @DnDParent : 78D57F2B
				/// @DnDArgument : "const" "INTERIOR_STATE.INSIDE"
				case INTERIOR_STATE.INSIDE:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 6A454D6A
					/// @DnDComment : // Change sprite to a random interior wall
					/// @DnDParent : 21656143
					/// @DnDArgument : "expr" "choose(wall_sprite[0], wall_sprite[1], wall_sprite[2])"
					/// @DnDArgument : "var" "set_wall_sprites[_i]"
					set_wall_sprites[_i] = choose(wall_sprite[0], wall_sprite[1], wall_sprite[2]);
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 3DE899DE
				/// @DnDComment : // When exiting
				/// @DnDParent : 78D57F2B
				/// @DnDArgument : "const" "INTERIOR_STATE.EXIT"
				case INTERIOR_STATE.EXIT:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 57133980
					/// @DnDComment : // Sets the exit wall sprite
					/// @DnDParent : 3DE899DE
					/// @DnDArgument : "expr" "wall_sprite[4]"
					/// @DnDArgument : "var" "set_wall_sprites[_i]"
					set_wall_sprites[_i] = wall_sprite[4];
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 5D0D8461
					/// @DnDComment : // Changes the wall state
					/// @DnDParent : 3DE899DE
					/// @DnDArgument : "expr" "INTERIOR_STATE.OUTSIDE"
					/// @DnDArgument : "var" "current_wall_state"
					current_wall_state = INTERIOR_STATE.OUTSIDE;
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 1F4B8C23
				/// @DnDComment : // When outside
				/// @DnDParent : 78D57F2B
				/// @DnDArgument : "const" "INTERIOR_STATE.OUTSIDE"
				case INTERIOR_STATE.OUTSIDE:
					/// @DnDAction : YoYo Games.Common.If_Expression
					/// @DnDVersion : 1
					/// @DnDHash : 1618029A
					/// @DnDComment : // Checks the wall has changed
					/// @DnDParent : 1F4B8C23
					/// @DnDArgument : "expr" "has_wall_changed"
					if(has_wall_changed)
					{
						/// @DnDAction : YoYo Games.Common.Variable
						/// @DnDVersion : 1
						/// @DnDHash : 00CA490F
						/// @DnDComment : // Changes the ground state to exit
						/// @DnDParent : 1618029A
						/// @DnDArgument : "expr" "INTERIOR_STATE.EXIT"
						/// @DnDArgument : "var" "current_ground_state"
						current_ground_state = INTERIOR_STATE.EXIT;
					
						/// @DnDAction : YoYo Games.Common.Variable
						/// @DnDVersion : 1
						/// @DnDHash : 3FFC66D6
						/// @DnDComment : // Changes wall has changed state flag back to false
						/// @DnDParent : 1618029A
						/// @DnDArgument : "expr" "false"
						/// @DnDArgument : "var" "has_wall_changed"
						has_wall_changed = false;
					}
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 582A7668
					/// @DnDComment : // Unsets sprite since the are walls outside
					/// @DnDParent : 1F4B8C23
					/// @DnDArgument : "expr" "-1"
					/// @DnDArgument : "var" "set_wall_sprites[_i]"
					set_wall_sprites[_i] = -1;
					break;
			}
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 29CB01D1
			/// @DnDComment : // Creates minimum room width variable (used to set where the final x position should be when placed)
			/// @DnDParent : 040482AC
			/// @DnDArgument : "var" "_min_x"
			/// @DnDArgument : "value" "room_width"
			var _min_x = room_width;
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 6013C672
			/// @DnDComment : // Loops all the wall segements again
			/// @DnDParent : 040482AC
			/// @DnDArgument : "init" "_j = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_j < wall_segment_count"
			/// @DnDArgument : "expr" "_j += 1"
			for(var _j = 0; _j < wall_segment_count; _j += 1) {
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 03509C1B
				/// @DnDComment : // Checks the wall segment isnt the same and has been set
				/// @DnDParent : 6013C672
				/// @DnDArgument : "expr" "_i != _j && set_wall_sprites[_j] != -1"
				if(_i != _j && set_wall_sprites[_j] != -1)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 429CDE9E
					/// @DnDComment : // Sets the wall segment to the highest value (itself or the other sprite coordinate plus its width
					/// @DnDParent : 03509C1B
					/// @DnDArgument : "expr" "max(_min_x, wall_x_coords[_j] + sprite_get_width(set_wall_sprites[_j]))"
					/// @DnDArgument : "var" "_min_x"
					_min_x = max(_min_x, wall_x_coords[_j] + sprite_get_width(set_wall_sprites[_j]));
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 34CD377F
			/// @DnDComment : // Sets the new x position
			/// @DnDParent : 040482AC
			/// @DnDArgument : "expr" "_min_x"
			/// @DnDArgument : "var" "wall_x_coords[_i]"
			wall_x_coords[_i] = _min_x;
		}
	}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 06F634E7
	/// @DnDComment : // Loops through all the pipe segments
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < pipe_segment_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < pipe_segment_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1DA091D8
		/// @DnDComment : // Moves their x coordinates by speed and parallaxing rate
		/// @DnDParent : 06F634E7
		/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * background_move_rate)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "pipe_x_coords[_i]"
		pipe_x_coords[_i] += -(obj_game_manager.current_speed * background_move_rate);
	}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 63C7243F
	/// @DnDComment : // Loops through all the pipes again now their positions have been changed
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < pipe_segment_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < pipe_segment_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2884D01D
		/// @DnDComment : // Sets a width variable
		/// @DnDParent : 63C7243F
		/// @DnDArgument : "var" "_width"
		/// @DnDArgument : "value" "0"
		var _width = 0;
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 276AFBB5
		/// @DnDComment : // Checks the pipe sprite exists
		/// @DnDParent : 63C7243F
		/// @DnDArgument : "expr" "set_pipe_sprites[_i] != -1"
		if(set_pipe_sprites[_i] != -1)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3FA6CB4D
			/// @DnDComment : // Sets the width to the sprite width
			/// @DnDParent : 276AFBB5
			/// @DnDArgument : "expr" "sprite_get_width(set_pipe_sprites[_i])"
			/// @DnDArgument : "var" "_width"
			_width = sprite_get_width(set_pipe_sprites[_i]);
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2CB27238
		/// @DnDComment : // Checks if the pipe is now off screen
		/// @DnDParent : 63C7243F
		/// @DnDArgument : "var" "pipe_x_coords[_i]"
		/// @DnDArgument : "op" "1"
		/// @DnDArgument : "value" "-_width"
		if(pipe_x_coords[_i] < -_width)
		{
			/// @DnDAction : YoYo Games.Switch.Switch
			/// @DnDVersion : 1
			/// @DnDHash : 10E36D46
			/// @DnDComment : // Check what state pipes are currently
			/// @DnDParent : 2CB27238
			/// @DnDArgument : "expr" "current_pipe_state"
			var l10E36D46_0 = current_pipe_state;
			switch(l10E36D46_0)
			{
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 77018131
				/// @DnDComment : // When enter
				/// @DnDParent : 10E36D46
				/// @DnDArgument : "const" "INTERIOR_STATE.ENTER"
				case INTERIOR_STATE.ENTER:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 34C67623
					/// @DnDComment : // Set enter sprite
					/// @DnDParent : 77018131
					/// @DnDArgument : "expr" "pipe_sprite[0]"
					/// @DnDArgument : "var" "set_pipe_sprites[_i]"
					set_pipe_sprites[_i] = pipe_sprite[0];
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 49EC459B
					/// @DnDComment : // Change state to inside
					/// @DnDParent : 77018131
					/// @DnDArgument : "expr" "INTERIOR_STATE.INSIDE"
					/// @DnDArgument : "var" "current_pipe_state"
					current_pipe_state = INTERIOR_STATE.INSIDE;
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 537D7B4F
				/// @DnDComment : // When inside
				/// @DnDParent : 10E36D46
				/// @DnDArgument : "const" "INTERIOR_STATE.INSIDE"
				case INTERIOR_STATE.INSIDE:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 7E251F5F
					/// @DnDComment : // Set to inside sprite
					/// @DnDParent : 537D7B4F
					/// @DnDArgument : "expr" "pipe_sprite[1]"
					/// @DnDArgument : "var" "set_pipe_sprites[_i]"
					set_pipe_sprites[_i] = pipe_sprite[1];
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 341CE009
				/// @DnDComment : // When exit
				/// @DnDParent : 10E36D46
				/// @DnDArgument : "const" "INTERIOR_STATE.EXIT"
				case INTERIOR_STATE.EXIT:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 75D720E1
					/// @DnDComment : // Set to exit sprite
					/// @DnDParent : 341CE009
					/// @DnDArgument : "expr" "pipe_sprite[2]"
					/// @DnDArgument : "var" "set_pipe_sprites[_i]"
					set_pipe_sprites[_i] = pipe_sprite[2];
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 7AABCADB
					/// @DnDComment : // Change state to outside
					/// @DnDParent : 341CE009
					/// @DnDArgument : "expr" "INTERIOR_STATE.OUTSIDE"
					/// @DnDArgument : "var" "current_pipe_state"
					current_pipe_state = INTERIOR_STATE.OUTSIDE;
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 502A198F
				/// @DnDComment : // When outside
				/// @DnDParent : 10E36D46
				/// @DnDArgument : "const" "INTERIOR_STATE.OUTSIDE"
				case INTERIOR_STATE.OUTSIDE:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 5EEB4D83
					/// @DnDComment : // Unset sprite since no pipes when outside
					/// @DnDParent : 502A198F
					/// @DnDArgument : "expr" "-1"
					/// @DnDArgument : "var" "set_pipe_sprites[_i]"
					set_pipe_sprites[_i] = -1;
					break;
			}
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 36F1549A
			/// @DnDComment : // Variable for minimum x spawn position
			/// @DnDParent : 2CB27238
			/// @DnDArgument : "var" "_min_x"
			/// @DnDArgument : "value" "room_width"
			var _min_x = room_width;
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 2BB4B69E
			/// @DnDComment : // Loop through the pipe segments again
			/// @DnDParent : 2CB27238
			/// @DnDArgument : "init" "_j = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_j < pipe_segment_count"
			/// @DnDArgument : "expr" "_j += 1"
			for(var _j = 0; _j < pipe_segment_count; _j += 1) {
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 5047FB98
				/// @DnDComment : // Check pipes are not the same and has been set
				/// @DnDParent : 2BB4B69E
				/// @DnDArgument : "expr" "_i != _j && set_pipe_sprites[_j] != -1"
				if(_i != _j && set_pipe_sprites[_j] != -1)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 51305E99
					/// @DnDComment : // Adjust the minimum x coordinate possible again checking for the highest value of itself or the other cordinate and width
					/// @DnDParent : 5047FB98
					/// @DnDArgument : "expr" "max(_min_x, pipe_x_coords[_j] + sprite_get_width(set_pipe_sprites[_j]))"
					/// @DnDArgument : "var" "_min_x"
					_min_x = max(_min_x, pipe_x_coords[_j] + sprite_get_width(set_pipe_sprites[_j]));
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 06ABB915
			/// @DnDComment : // Sets the pipes new x position
			/// @DnDParent : 2CB27238
			/// @DnDArgument : "expr" "_min_x"
			/// @DnDArgument : "var" "pipe_x_coords[_i]"
			pipe_x_coords[_i] = _min_x;
		}
	}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 75C3A8DA
	/// @DnDComment : // Loop throught the ground segments
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < ground_segment_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < ground_segment_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0BC012D0
		/// @DnDComment : // Adjust the positions by the speed and parallaxing rate
		/// @DnDParent : 75C3A8DA
		/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * background_move_rate)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "ground_x_coords[_i]"
		ground_x_coords[_i] += -(obj_game_manager.current_speed * background_move_rate);
	}

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 4CE88F5A
	/// @DnDComment : // Loops throught the group segements again not they have moved
	/// @DnDParent : 1BFC5935
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < ground_segment_count"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < ground_segment_count; _i += 1) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0E745F10
		/// @DnDComment : // Check if the segement is off screen to the left
		/// @DnDParent : 4CE88F5A
		/// @DnDArgument : "var" "ground_x_coords[_i]"
		/// @DnDArgument : "op" "1"
		/// @DnDArgument : "value" "-512"
		if(ground_x_coords[_i] < -512)
		{
			/// @DnDAction : YoYo Games.Switch.Switch
			/// @DnDVersion : 1
			/// @DnDHash : 56F99D17
			/// @DnDComment : // Check what the current ground state is
			/// @DnDParent : 0E745F10
			/// @DnDArgument : "expr" "current_ground_state"
			var l56F99D17_0 = current_ground_state;
			switch(l56F99D17_0)
			{
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 380679A6
				/// @DnDComment : // When entering
				/// @DnDParent : 56F99D17
				/// @DnDArgument : "const" "INTERIOR_STATE.ENTER"
				case INTERIOR_STATE.ENTER:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 17051E1A
					/// @DnDComment : // Set ground sprite to enter
					/// @DnDParent : 380679A6
					/// @DnDArgument : "expr" "ground_sprite[0]"
					/// @DnDArgument : "var" "set_ground_sprites[_i]"
					set_ground_sprites[_i] = ground_sprite[0];
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 00968190
					/// @DnDComment : // Change state to inside
					/// @DnDParent : 380679A6
					/// @DnDArgument : "expr" "INTERIOR_STATE.INSIDE"
					/// @DnDArgument : "var" "current_ground_state"
					current_ground_state = INTERIOR_STATE.INSIDE;
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 1223C4DB
				/// @DnDComment : // When inside
				/// @DnDParent : 56F99D17
				/// @DnDArgument : "const" "INTERIOR_STATE.INSIDE"
				case INTERIOR_STATE.INSIDE:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 7FD1BCE9
					/// @DnDComment : // Change sprite to inside sprite
					/// @DnDParent : 1223C4DB
					/// @DnDArgument : "expr" "ground_sprite[1]"
					/// @DnDArgument : "var" "set_ground_sprites[_i]"
					set_ground_sprites[_i] = ground_sprite[1];
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 6762A6A8
				/// @DnDComment : // When exit
				/// @DnDParent : 56F99D17
				/// @DnDArgument : "const" "INTERIOR_STATE.EXIT"
				case INTERIOR_STATE.EXIT:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 29CFB72A
					/// @DnDComment : // Set ground to exit
					/// @DnDParent : 6762A6A8
					/// @DnDArgument : "expr" "ground_sprite[2]"
					/// @DnDArgument : "var" "set_ground_sprites[_i]"
					set_ground_sprites[_i] = ground_sprite[2];
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 4A1731BA
					/// @DnDComment : // Sets state to outside
					/// @DnDParent : 6762A6A8
					/// @DnDArgument : "expr" "INTERIOR_STATE.OUTSIDE"
					/// @DnDArgument : "var" "current_ground_state"
					current_ground_state = INTERIOR_STATE.OUTSIDE;
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 0F5725EB
					/// @DnDComment : // Also sets the pipe to exit since the ground is changing
					/// @DnDParent : 6762A6A8
					/// @DnDArgument : "expr" "INTERIOR_STATE.EXIT"
					/// @DnDArgument : "var" "current_pipe_state"
					current_pipe_state = INTERIOR_STATE.EXIT;
					break;
			
				/// @DnDAction : YoYo Games.Switch.Case
				/// @DnDVersion : 1
				/// @DnDHash : 0353079B
				/// @DnDComment : // When outside
				/// @DnDParent : 56F99D17
				/// @DnDArgument : "const" "INTERIOR_STATE.OUTSIDE"
				case INTERIOR_STATE.OUTSIDE:
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 502F736A
					/// @DnDComment : // Sets the ground sprite to outside in the pattern it follows (last 3 in array in order looping)
					/// @DnDParent : 0353079B
					/// @DnDArgument : "expr" "ground_sprite[3 + (_i % 3)]"
					/// @DnDArgument : "var" "set_ground_sprites[_i]"
					set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
				
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 397D7AC7
					/// @DnDComment : // Sets a random flower create function
					/// @DnDParent : 0353079B
					/// @DnDArgument : "var" "_handle"
					/// @DnDArgument : "value" "choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4)"
					var _handle = choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4);
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 61B90EAF
					/// @DnDComment : // Calls the chosen function for making flowers at new location
					/// @DnDInput : 2
					/// @DnDParent : 0353079B
					/// @DnDArgument : "function" "_handle"
					/// @DnDArgument : "arg" "ground_x_coords[_i] + 512 * ground_segment_count"
					/// @DnDArgument : "arg_1" "ground_y_coords"
					_handle(ground_x_coords[_i] + 512 * ground_segment_count, ground_y_coords);
					break;
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 3012B330
			/// @DnDComment : // Sets new x position for ground sprite
			/// @DnDParent : 0E745F10
			/// @DnDArgument : "expr" "512 * ground_segment_count"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "ground_x_coords[_i]"
			ground_x_coords[_i] += 512 * ground_segment_count;
		}
	}
}