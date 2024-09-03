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
	/// @DnDHash : 31A5F7C2
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "soundid" "snd_start_game_button"
	/// @DnDSaveInfo : "soundid" "snd_start_game_button"
	audio_play_sound(snd_start_game_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Rooms.Restart_Room
	/// @DnDVersion : 1
	/// @DnDHash : 63E33E81
	/// @DnDComment : // Restarts the room
	/// @DnDParent : 077AC74A
	room_restart();
}