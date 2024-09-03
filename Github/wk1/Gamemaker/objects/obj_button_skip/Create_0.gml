/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 14BA3B54
/// @DnDComment : // Inherited from parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7E03F97C
/// @DnDComment : // Sets panel state to true to draw panel behind sprite
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "has_panel"
has_panel = true;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 077AC74A
/// @DnDComment : // Sets target function
/// @DnDArgument : "funcName" "target_function"
function target_function() 
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 14EC11AF
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "soundid" "snd_button"
	/// @DnDSaveInfo : "soundid" "snd_button"
	audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3192E45A
	/// @DnDComment : // Sets the tutorial object to tip type 4 (end tutorial)
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "expr" "4"
	/// @DnDArgument : "var" "obj_tutorial.tip_type"
	obj_tutorial.tip_type = 4;
}