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

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 1CCA5BE2
/// @DnDComment : // Sets target function for when pressed
/// @DnDArgument : "funcName" "target_function"
function target_function() 
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 302F56B8
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "soundid" "snd_start_game_button"
	/// @DnDSaveInfo : "soundid" "snd_start_game_button"
	audio_play_sound(snd_start_game_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 367ECFF2
	/// @DnDComment : // Sends player to main room (starts game)
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "room" "rm_main"
	/// @DnDSaveInfo : "room" "rm_main"
	room_goto(rm_main);
}