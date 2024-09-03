/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 485D51BA
/// @DnDComment : // Start object invisible
/// @DnDArgument : "var" "image_alpha"
image_alpha = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 15B31C0C
/// @DnDComment : // Set target alpha as visible
/// @DnDArgument : "expr" "1.0"
/// @DnDArgument : "var" "target_alpha"
target_alpha = 1.0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 230E44AA
/// @DnDComment : // Used to set owner object to
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "var" "owner"
owner = noone;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3BE02363
/// @DnDComment : // Distance used to show and hide alert
/// @DnDArgument : "expr" "room_width * 0.25"
/// @DnDArgument : "var" "buffer"
buffer = room_width * 0.25;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0272D67C
/// @DnDComment : // Rates for fading in and out
/// @DnDInput : 2
/// @DnDArgument : "expr" "0.1"
/// @DnDArgument : "expr_1" "0.15"
/// @DnDArgument : "var" "fade_in_rate"
/// @DnDArgument : "var_1" "fade_out_rate"
fade_in_rate = 0.1;
fade_out_rate = 0.15;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 746B96BF
/// @DnDComment : // Checks if the alert sound already exists
/// @DnDArgument : "expr" "variable_global_exists("alert_sound")"
/// @DnDArgument : "not" "1"
if(!(variable_global_exists("alert_sound")))
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 22F8BABC
	/// @DnDComment : // Plays the alert sound
	/// @DnDParent : 746B96BF
	/// @DnDArgument : "target" "global.alert_sound"
	/// @DnDArgument : "soundid" "snd_incoming_alert"
	/// @DnDArgument : "loop" "1"
	/// @DnDArgument : "gain" "image_alpha"
	/// @DnDSaveInfo : "soundid" "snd_incoming_alert"
	global.alert_sound = audio_play_sound(snd_incoming_alert, 0, 1, image_alpha, undefined, 1.0);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1098CC2D
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 04494D11
	/// @DnDComment : // Check if the audio is playing
	/// @DnDParent : 1098CC2D
	/// @DnDArgument : "expr" "audio_is_playing(global.alert_sound)"
	if(audio_is_playing(global.alert_sound))
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 315CD6D3
		/// @DnDComment : // Creates a variable to store the gain level
		/// @DnDParent : 04494D11
		/// @DnDArgument : "var" "_max_volume"
		/// @DnDArgument : "value" "image_alpha"
		var _max_volume = image_alpha;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 7D69D3B5
		/// @DnDComment : // Checks through all the alerts
		/// @DnDApplyTo : {obj_alert}
		/// @DnDParent : 04494D11
		with(obj_alert) {
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0C21C16A
			/// @DnDComment : // Checks if the alert is more visible
			/// @DnDParent : 7D69D3B5
			/// @DnDArgument : "var" "image_alpha"
			/// @DnDArgument : "op" "4"
			/// @DnDArgument : "value" "_max_volume"
			if(image_alpha >= _max_volume)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 599CE975
				/// @DnDComment : // Sets the gain to image alpha
				/// @DnDParent : 0C21C16A
				/// @DnDArgument : "expr" "image_alpha"
				/// @DnDArgument : "var" "_max_volume"
				_max_volume = image_alpha;
			}
		}
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 65F8FBC4
		/// @DnDComment : // Sets the sound gain
		/// @DnDParent : 04494D11
		/// @DnDArgument : "sound" "global.alert_sound"
		/// @DnDArgument : "volume" "_max_volume"
		audio_sound_gain(global.alert_sound, _max_volume, 0);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 062DB12B
	/// @DnDParent : 1098CC2D
	else
	{
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 48050C0C
		/// @DnDComment : // Plays the alert sound
		/// @DnDParent : 062DB12B
		/// @DnDArgument : "target" "global.alert_sound"
		/// @DnDArgument : "soundid" "snd_incoming_alert"
		/// @DnDArgument : "loop" "1"
		/// @DnDArgument : "gain" "image_alpha"
		/// @DnDSaveInfo : "soundid" "snd_incoming_alert"
		global.alert_sound = audio_play_sound(snd_incoming_alert, 0, 1, image_alpha, undefined, 1.0);
	}
}