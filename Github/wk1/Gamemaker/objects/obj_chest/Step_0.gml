/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 16B56736
/// @DnDComment : // Checks the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2C1DE259
	/// @DnDComment : // Moves the chest at the games current move speed
	/// @DnDParent : 16B56736
	/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * 1.0)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -(obj_game_manager.current_speed * 1.0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 44925F31
	/// @DnDComment : // Calls the create sparkle function
	/// @DnDParent : 16B56736
	/// @DnDArgument : "function" "create_sparkles"
	create_sparkles();

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0E84E2E3
	/// @DnDComment : // Checks if the chest has gone off screen
	/// @DnDParent : 16B56736
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "-169"
	if(x < -169)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 77DEC7D8
		/// @DnDComment : // Sets self as a temporary variable
		/// @DnDParent : 0E84E2E3
		/// @DnDArgument : "var" "_chest"
		/// @DnDArgument : "value" "self"
		var _chest = self;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 1EEA1F74
		/// @DnDComment : // Loops though the shadow objects within the room
		/// @DnDApplyTo : {obj_shadow}
		/// @DnDParent : 0E84E2E3
		with(obj_shadow) {
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 4CD83A51
			/// @DnDComment : // Checks if the shadows owner matches the chest
			/// @DnDParent : 1EEA1F74
			/// @DnDArgument : "expr" "owner == _chest"
			if(owner == _chest)
			{
				/// @DnDAction : YoYo Games.Instances.Destroy_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 024AEE3E
				/// @DnDComment : // Destroys the shadow as no longer needed
				/// @DnDParent : 4CD83A51
				instance_destroy();
			}
		}
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 0FDC9F7E
		/// @DnDComment : // Checks idle state is still active and not collected
		/// @DnDParent : 0E84E2E3
		/// @DnDArgument : "expr" "is_idle"
		if(is_idle)
		{
			/// @DnDAction : YoYo Games.Sequences.Sequence_Destroy
			/// @DnDVersion : 1
			/// @DnDHash : 6F78319D
			/// @DnDComment : // Destroys the sequence associated
			/// @DnDParent : 0FDC9F7E
			/// @DnDArgument : "var" "sequence_body.set_sequence"
			layer_sequence_destroy(sequence_body.set_sequence);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 3B8AAC9B
			/// @DnDComment : // Destroys the bodys sequence object
			/// @DnDParent : 0FDC9F7E
			/// @DnDArgument : "function" "instance_destroy"
			/// @DnDArgument : "arg" "sequence_body"
			instance_destroy(sequence_body);
		
			/// @DnDAction : YoYo Games.Audio.Stop_Audio
			/// @DnDVersion : 1
			/// @DnDHash : 78941118
			/// @DnDComment : // Stops chest sound
			/// @DnDParent : 0FDC9F7E
			/// @DnDArgument : "soundid" "chest_sound"
			audio_stop_sound(chest_sound);
		
			/// @DnDAction : YoYo Games.Instances.Destroy_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 45C82D1C
			/// @DnDComment : // Destroys the chest as no longer needed
			/// @DnDParent : 0FDC9F7E
			instance_destroy();
		}
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 104C8F59
/// @DnDComment : // Checks chest is not collected
/// @DnDArgument : "expr" "is_idle"
if(is_idle)
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 28859472
	/// @DnDComment : // Checks the game is playing
	/// @DnDParent : 104C8F59
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
	if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7F75FBC3
		/// @DnDComment : // Checks if the chest is to the right of the player
		/// @DnDParent : 28859472
		/// @DnDArgument : "var" "x"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "obj_player.x"
		if(x > obj_player.x)
		{
			/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
			/// @DnDVersion : 1.1
			/// @DnDHash : 6A2B1C3E
			/// @DnDComment : // Scales the gain by the distance between player and chest to the room width
			/// @DnDParent : 7F75FBC3
			/// @DnDArgument : "sound" "chest_sound"
			/// @DnDArgument : "volume" "1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0)"
			audio_sound_gain(chest_sound, 1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0), 0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 311C58D1
		/// @DnDParent : 28859472
		else
		{
			/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
			/// @DnDVersion : 1.1
			/// @DnDHash : 585C9603
			/// @DnDComment : // Scales the gain by the distance between player and chest to a fraction of the room width
			/// @DnDParent : 311C58D1
			/// @DnDArgument : "sound" "chest_sound"
			/// @DnDArgument : "volume" "1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0)"
			audio_sound_gain(chest_sound, 1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0), 0);
		}
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 3785E340
	/// @DnDParent : 104C8F59
	else
	{
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 13D3DEF6
		/// @DnDComment : // Fades out the chest sounds
		/// @DnDParent : 3785E340
		/// @DnDArgument : "sound" "chest_sound"
		/// @DnDArgument : "volume" "0"
		/// @DnDArgument : "time" "3000"
		audio_sound_gain(chest_sound, 0, 3000);
	}
}