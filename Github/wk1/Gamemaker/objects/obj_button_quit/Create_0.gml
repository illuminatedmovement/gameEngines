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
	/// @DnDHash : 03290A77
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "soundid" "snd_button"
	/// @DnDSaveInfo : "soundid" "snd_button"
	audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 5D4D7F73
	/// @DnDComment : // Checks if the game is able to quit on the current platform
	/// @DnDParent : 1CCA5BE2
	/// @DnDArgument : "expr" "os_type == os_android || os_type == os_windows || os_type == os_macosx || os_type == os_linux"
	if(os_type == os_android || os_type == os_windows || os_type == os_macosx || os_type == os_linux)
	{
		/// @DnDAction : YoYo Games.Game.End_Game
		/// @DnDVersion : 1
		/// @DnDHash : 56A32C66
		/// @DnDComment : // End the current game
		/// @DnDParent : 5D4D7F73
		game_end();
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 655BF9B5
	/// @DnDParent : 1CCA5BE2
	else
	{
		/// @DnDAction : YoYo Games.Game.Restart_Game
		/// @DnDVersion : 1
		/// @DnDHash : 13BF4695
		/// @DnDComment : // Restarts the current game as calling game end might cause issue on platform
		/// @DnDParent : 655BF9B5
		game_restart();
	}
}