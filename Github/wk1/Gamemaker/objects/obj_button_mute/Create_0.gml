/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 02D8E513
/// @DnDComment : // Inherited from parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6231D0D2
/// @DnDComment : // Sets panel state to true to draw panel behind sprite
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "has_panel"
has_panel = true;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 151C864E
/// @DnDComment : // Checks if global variable for muted state exists
/// @DnDArgument : "expr" "variable_global_exists("is_muted")"
/// @DnDArgument : "not" "1"
if(!(variable_global_exists("is_muted")))
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 5B8C9EAF
	/// @DnDComment : // Sets state to false so it can be used
	/// @DnDParent : 151C864E
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "global.is_muted"
	global.is_muted = false;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0E2A0813
/// @DnDComment : // Checks muted state
/// @DnDArgument : "expr" "global.is_muted"
if(global.is_muted)
{
	/// @DnDAction : YoYo Games.Audio.Audo_Set_Master_Volume
	/// @DnDVersion : 1
	/// @DnDHash : 29561E5B
	/// @DnDComment : // Sets master gain to zero (no sounds at all)
	/// @DnDParent : 0E2A0813
	/// @DnDArgument : "volume" "0"
	audio_set_master_gain(0, 0);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 588E68F5
	/// @DnDComment : // Shows mute icon
	/// @DnDParent : 0E2A0813
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "image_index"
	image_index = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 25CA606D
else
{
	/// @DnDAction : YoYo Games.Audio.Audo_Set_Master_Volume
	/// @DnDVersion : 1
	/// @DnDHash : 3856577E
	/// @DnDComment : // Sets master gain to one (all sounds play normally)
	/// @DnDParent : 25CA606D
	audio_set_master_gain(0, 1);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3270FEF4
	/// @DnDComment : // Shows sound icon
	/// @DnDParent : 25CA606D
	/// @DnDArgument : "var" "image_index"
	image_index = 0;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1CCA5BE2
/// @DnDComment : // Sets target function for when pressed
/// @DnDArgument : "funcName" "target_function"
function target_function() 
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 0E4D8BE8
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "soundid" "snd_button"
	/// @DnDSaveInfo : "soundid" "snd_button"
	audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 2C284F7A
	/// @DnDComment : // Swaps muted state
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "value" "!global.is_muted"
	/// @DnDArgument : "var" "global.is_muted"
	global.is_muted = !global.is_muted;

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 3AC09856
	/// @DnDComment : // Checks muted stare
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "expr" "global.is_muted"
	if(global.is_muted)
	{
		/// @DnDAction : YoYo Games.Audio.Audo_Set_Master_Volume
		/// @DnDVersion : 1
		/// @DnDHash : 0BB3C2B2
		/// @DnDComment : // Sets master gain to zero (no sounds at all)
		/// @DnDParent : 3AC09856
		/// @DnDArgument : "volume" "0"
		audio_set_master_gain(0, 0);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6550C1E6
		/// @DnDComment : // Shows mute icon
		/// @DnDParent : 3AC09856
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "image_index"
		image_index = 1;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 1BC3369F
	/// @DnDParent : 1CCA5BE2
	else
	{
		/// @DnDAction : YoYo Games.Audio.Audo_Set_Master_Volume
		/// @DnDVersion : 1
		/// @DnDHash : 732E653A
		/// @DnDComment : // Sets master gain to one (all sounds play normally)
		/// @DnDParent : 1BC3369F
		audio_set_master_gain(0, 1);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1B5F38D1
		/// @DnDComment : // Shows sound icon
		/// @DnDParent : 1BC3369F
		/// @DnDArgument : "var" "image_index"
		image_index = 0;
	}
}