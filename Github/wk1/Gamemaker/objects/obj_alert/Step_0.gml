/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 21C5E32A
/// @DnDComment : // Checks owner exists
/// @DnDArgument : "expr" "owner == noone"
/// @DnDArgument : "not" "1"
if(!(owner == noone))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 111A4ED9
	/// @DnDComment : // Checks owener is offscreen with added buffer distance
	/// @DnDParent : 21C5E32A
	/// @DnDArgument : "var" "owner.bbox_left"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "room_width + buffer"
	if(owner.bbox_left > room_width + buffer)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 34194F15
		/// @DnDComment : // Will show alert
		/// @DnDParent : 111A4ED9
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "target_alpha"
		target_alpha = 1;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 043A847E
	/// @DnDParent : 21C5E32A
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0606AA25
		/// @DnDComment : // Checks if owner is closer than the buffer
		/// @DnDParent : 043A847E
		/// @DnDArgument : "var" "owner.bbox_left"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "room_width"
		if(owner.bbox_left > room_width)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 05D7EC80
			/// @DnDComment : // Scales down the target alpha between 0 and 1
			/// @DnDParent : 0606AA25
			/// @DnDArgument : "expr" "clamp(buffer / (room_width - owner.bbox_left), 0, 1)"
			/// @DnDArgument : "var" "target_alpha"
			target_alpha = clamp(buffer / (room_width - owner.bbox_left), 0, 1);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 6143D0B8
		/// @DnDParent : 043A847E
		else
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2479A457
			/// @DnDComment : // Sets the target alpha to 0 since owner on screen and should be invisible
			/// @DnDParent : 6143D0B8
			/// @DnDArgument : "var" "target_alpha"
			target_alpha = 0;
		}
	}

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 452CE2A7
	/// @DnDComment : // Checks if the target is higher than the current alpha value
	/// @DnDParent : 21C5E32A
	/// @DnDArgument : "var" "target_alpha"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "image_alpha"
	if(target_alpha > image_alpha)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3962578C
		/// @DnDComment : // Fades in at in rate
		/// @DnDParent : 452CE2A7
		/// @DnDArgument : "expr" "lerp(image_alpha, target_alpha, fade_in_rate)"
		/// @DnDArgument : "var" "image_alpha"
		image_alpha = lerp(image_alpha, target_alpha, fade_in_rate);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 111EE139
	/// @DnDParent : 21C5E32A
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 09799DF9
		/// @DnDComment : // Fades out at out rate
		/// @DnDParent : 111EE139
		/// @DnDArgument : "expr" "lerp(image_alpha, target_alpha, fade_out_rate)"
		/// @DnDArgument : "var" "image_alpha"
		image_alpha = lerp(image_alpha, target_alpha, fade_out_rate);
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 282B5E0A
	/// @DnDComment : // Checks if game is playing
	/// @DnDParent : 21C5E32A
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
	if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5DCA65B5
		/// @DnDComment : // Creates a variable to store the gain level
		/// @DnDParent : 282B5E0A
		/// @DnDArgument : "var" "_max_volume"
		/// @DnDArgument : "value" "image_alpha"
		var _max_volume = image_alpha;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 70F2BAFD
		/// @DnDComment : // Checks through all the alerts
		/// @DnDApplyTo : {obj_alert}
		/// @DnDParent : 282B5E0A
		with(obj_alert) {
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 49FD7594
			/// @DnDComment : // Checks if the alert is more visible
			/// @DnDParent : 70F2BAFD
			/// @DnDArgument : "var" "image_alpha"
			/// @DnDArgument : "op" "4"
			/// @DnDArgument : "value" "_max_volume"
			if(image_alpha >= _max_volume)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3D44F042
				/// @DnDComment : // Sets the gain to image alpha
				/// @DnDParent : 49FD7594
				/// @DnDArgument : "expr" "image_alpha"
				/// @DnDArgument : "var" "_max_volume"
				_max_volume = image_alpha;
			}
		}
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 7CDCAB53
		/// @DnDComment : // Sets the sound gain
		/// @DnDParent : 282B5E0A
		/// @DnDArgument : "sound" "global.alert_sound"
		/// @DnDArgument : "volume" "_max_volume"
		audio_sound_gain(global.alert_sound, _max_volume, 0);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 3786346B
	/// @DnDParent : 21C5E32A
	else
	{
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 52481C5B
		/// @DnDComment : // Fades out the alert sound
		/// @DnDParent : 3786346B
		/// @DnDArgument : "sound" "global.alert_sound"
		/// @DnDArgument : "volume" "0"
		/// @DnDArgument : "time" "3000"
		audio_sound_gain(global.alert_sound, 0, 3000);
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 05BDB57D
	/// @DnDComment : // Checks if both the target and current alpha is set to zero
	/// @DnDParent : 21C5E32A
	/// @DnDArgument : "expr" "target_alpha == 0 && image_alpha == 0"
	if(target_alpha == 0 && image_alpha == 0)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 6F74326A
		/// @DnDComment : // Destroys the alert
		/// @DnDParent : 05BDB57D
		instance_destroy();
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 5C928006
else
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 642485DD
	/// @DnDComment : // Destroys the alert since no owner exists
	/// @DnDParent : 5C928006
	instance_destroy();
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1178070F
/// @DnDComment : // Checks if game is paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 02B2ED38
	/// @DnDComment : // Stops animation
	/// @DnDParent : 1178070F
	/// @DnDArgument : "var" "image_speed"
	image_speed = 0;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 13BCBDDA
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 03D88918
	/// @DnDComment : // Plays animation
	/// @DnDParent : 13BCBDDA
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "image_speed"
	image_speed = 1;
}