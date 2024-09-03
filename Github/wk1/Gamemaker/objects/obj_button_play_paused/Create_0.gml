/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 709F9ABA
/// @DnDComment : // Sets was paused state since just created
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "was_paused"
was_paused = true;

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
	/// @DnDHash : 4367684A
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "soundid" "snd_button"
	/// @DnDSaveInfo : "soundid" "snd_button"
	audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 48BEC219
	/// @DnDComment : // Sets the state back to player
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "expr" "GAME_STATE.PLAYING"
	/// @DnDArgument : "var" "obj_game_manager.current_game_state"
	obj_game_manager.current_game_state = GAME_STATE.PLAYING;

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5BFCA657
	/// @DnDComment : // Destroys the paused menu banner
	/// @DnDApplyTo : {obj_banner_paused}
	/// @DnDParent : 077AC74A
	with(obj_banner_paused) instance_destroy();
}