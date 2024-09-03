/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 0C150119
/// @DnDComment : // Set delta time for movements that are time based.
/// @DnDArgument : "var" "_delta_time"
/// @DnDArgument : "value" "delta_time * 0.000001"
var _delta_time = delta_time * 0.000001;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 7EDBDEFC
/// @DnDComment : // Checks if prefetch flag has not been met
/// @DnDArgument : "expr" "has_prefetched"
/// @DnDArgument : "not" "1"
if(!(has_prefetched))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6CCD5C47
	/// @DnDComment : // Sets delta time back to zero as game is still loading certain objects
	/// @DnDParent : 7EDBDEFC
	/// @DnDArgument : "var" "_delta_time"
	_delta_time = 0;
}

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 2DCD1CD0
/// @DnDComment : // Change logic depending on the current game state.
/// @DnDArgument : "expr" "current_game_state"
var l2DCD1CD0_0 = current_game_state;
switch(l2DCD1CD0_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3DE9F46A
	/// @DnDComment : // Logic for while the game is playing.
	/// @DnDParent : 2DCD1CD0
	/// @DnDArgument : "const" "GAME_STATE.PLAYING"
	case GAME_STATE.PLAYING:
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6E2138AE
		/// @DnDComment : // Calls the update speed function passing though the delta time parameter
		/// @DnDParent : 3DE9F46A
		/// @DnDArgument : "function" "update_speed"
		/// @DnDArgument : "arg" "_delta_time"
		update_speed(_delta_time);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 04CB57A1
		/// @DnDComment : // Decreases the background cooldown timer by the current speed and time passed
		/// @DnDParent : 3DE9F46A
		/// @DnDArgument : "expr" "-(current_speed * _delta_time)"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "background_cooldown"
		background_cooldown += -(current_speed * _delta_time);
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 19E8BE4A
		/// @DnDComment : // Checks if the background cooldown has finished
		/// @DnDParent : 3DE9F46A
		/// @DnDArgument : "var" "background_cooldown"
		/// @DnDArgument : "op" "3"
		if(background_cooldown <= 0)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 7024F343
			/// @DnDComment : // Calls the change state function for the backgrounds
			/// @DnDParent : 19E8BE4A
			/// @DnDArgument : "function" "obj_interior_background.change_interior_state"
			obj_interior_background.change_interior_state();
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 32FBB8A6
			/// @DnDComment : // Resets the cooldown to a random value increasing the higher cap by the current level since faster speeds may mean backgrounds apear for less time
			/// @DnDParent : 19E8BE4A
			/// @DnDArgument : "expr" "random_range(100, 100 + 50 * current_level)"
			/// @DnDArgument : "var" "background_cooldown"
			background_cooldown = random_range(100, 100 + 50 * current_level);
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 3A2C89DD
	/// @DnDComment : // Logic for when the player is dying
	/// @DnDParent : 2DCD1CD0
	/// @DnDArgument : "const" "GAME_STATE.DYING"
	case GAME_STATE.DYING:
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7A2B78CA
		/// @DnDComment : // Calls the update speed function
		/// @DnDParent : 3A2C89DD
		/// @DnDArgument : "function" "update_speed"
		/// @DnDArgument : "arg" "_delta_time"
		update_speed(_delta_time);
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 3C59FEC1
		/// @DnDComment : // Checks if the speed is currently zero and the player is now insvisible
		/// @DnDParent : 3A2C89DD
		/// @DnDArgument : "expr" "current_speed == 0 && obj_player.image_alpha == 0"
		if(current_speed == 0 && obj_player.image_alpha == 0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 4B04D78F
			/// @DnDComment : // Sets the games current state to end
			/// @DnDParent : 3C59FEC1
			/// @DnDArgument : "expr" "GAME_STATE.ENDED"
			/// @DnDArgument : "var" "current_game_state"
			current_game_state = GAME_STATE.ENDED;
		
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6FF9AE44
			/// @DnDComment : // Checks if the current distance has passed the previously set high score
			/// @DnDParent : 3C59FEC1
			/// @DnDArgument : "var" "current_distance"
			/// @DnDArgument : "op" "2"
			/// @DnDArgument : "value" "global.highscore"
			if(current_distance > global.highscore)
			{
				/// @DnDAction : YoYo Games.Common.Temp_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 595ACE14
				/// @DnDComment : // Makes a new flag over the players position that will drop into the level and has its distance set
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "var" "_flag"
				/// @DnDArgument : "value" "instance_create_layer(obj_player.x, -200, "Stage", obj_flag_marker)"
				var _flag = instance_create_layer(obj_player.x, -200, "Stage", obj_flag_marker);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 072052D7
				/// @DnDInput : 3
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "expr" "false"
				/// @DnDArgument : "expr_1" "true"
				/// @DnDArgument : "expr_2" "current_distance"
				/// @DnDArgument : "var" "_flag.has_dropped"
				/// @DnDArgument : "var_1" "_flag.has_passed"
				/// @DnDArgument : "var_2" "_flag.flag_distance"
				_flag.has_dropped = false;
				_flag.has_passed = true;
				_flag.flag_distance = current_distance;
			
				/// @DnDAction : YoYo Games.Common.Set_Global
				/// @DnDVersion : 1
				/// @DnDHash : 53A83222
				/// @DnDComment : // Sets the global highscore variable to the current distance
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "value" "current_distance"
				/// @DnDArgument : "var" "global.highscore"
				global.highscore = current_distance;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 19B8F7D2
				/// @DnDComment : // Loads buffer for highscore
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "expr" "buffer_load("ENDLESS_RUNNER_HS.sav")"
				/// @DnDArgument : "var" "highscore_buffer"
				highscore_buffer = buffer_load("ENDLESS_RUNNER_HS.sav");
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 28AC265D
				/// @DnDComment : // Checks if buffer exists
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "expr" "buffer_exists(highscore_buffer)"
				/// @DnDArgument : "not" "1"
				if(!(buffer_exists(highscore_buffer)))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 4D19F0D1
					/// @DnDComment : // Creates highscore buffer
					/// @DnDParent : 28AC265D
					/// @DnDArgument : "expr" "buffer_create(16384, buffer_fixed, 2)"
					/// @DnDArgument : "var" "highscore_buffer"
					highscore_buffer = buffer_create(16384, buffer_fixed, 2);
				}
			
				/// @DnDAction : YoYo Games.Buffers.Buffer_Seek
				/// @DnDVersion : 1.1
				/// @DnDHash : 113CE621
				/// @DnDComment : // Goes to the start of the buffer
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "buffer" "highscore_buffer"
				/// @DnDArgument : "seek" "0"
				buffer_seek(highscore_buffer, buffer_seek_start, 0);
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 7BC207AC
				/// @DnDComment : // Writes highscore value to the buffer
				/// @DnDInput : 3
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "function" "buffer_write"
				/// @DnDArgument : "arg" "highscore_buffer"
				/// @DnDArgument : "arg_1" "buffer_u64"
				/// @DnDArgument : "arg_2" "global.highscore"
				buffer_write(highscore_buffer, buffer_u64, global.highscore);
			
				/// @DnDAction : YoYo Games.Files.Buffer_Save
				/// @DnDVersion : 1
				/// @DnDHash : 7EB95CD0
				/// @DnDComment : // Saves the new highscore buffer
				/// @DnDParent : 6FF9AE44
				/// @DnDArgument : "buffer" "highscore_buffer"
				/// @DnDArgument : "filename" ""ENDLESS_RUNNER_HS.sav""
				buffer_save(highscore_buffer, "ENDLESS_RUNNER_HS.sav");
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 6412EF46
			/// @DnDParent : 3C59FEC1
			else
			{
				/// @DnDAction : YoYo Games.Audio.Stop_Audio
				/// @DnDVersion : 1
				/// @DnDHash : 3E6104F9
				/// @DnDComment : // Stops the current music
				/// @DnDParent : 6412EF46
				/// @DnDArgument : "soundid" "global.music"
				audio_stop_sound(global.music);
			
				/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 0F9D9CB1
				/// @DnDParent : 6412EF46
				/// @DnDArgument : "soundid" "snd_game_over_popup"
				/// @DnDSaveInfo : "soundid" "snd_game_over_popup"
				audio_play_sound(snd_game_over_popup, 0, 0, 1.0, undefined, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Set_Global
				/// @DnDVersion : 1
				/// @DnDHash : 664C0CB7
				/// @DnDComment : // Plays game over sound effect and changes the global music to ambience
				/// @DnDParent : 6412EF46
				/// @DnDArgument : "value" "audio_play_sound(snd_ambience, 100, true, 1.0)"
				/// @DnDArgument : "var" "global.music"
				global.music = audio_play_sound(snd_ambience, 100, true, 1.0);
			
				/// @DnDAction : YoYo Games.Common.Temp_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 7EAB6459
				/// @DnDComment : // Plays the game over sequence that creates the gameover menu
				/// @DnDParent : 6412EF46
				/// @DnDArgument : "var" "_gameover_seq"
				/// @DnDArgument : "value" "layer_sequence_create("GUI", 0, 0, seq_gameover)"
				var _gameover_seq = layer_sequence_create("GUI", 0, 0, seq_gameover);
			}
		}
		break;
}