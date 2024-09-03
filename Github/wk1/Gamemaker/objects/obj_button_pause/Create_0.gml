/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 591A1BE6
/// @DnDComment : // State for checking if the game was just paused
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "was_paused"
was_paused = false;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 29ABD8CD
/// @DnDComment : // Check global touch state for if touch controls
/// @DnDArgument : "expr" "global.is_touch"
if(global.is_touch)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 11F8E537
	/// @DnDComment : // Set sprite to larger paused sprite
	/// @DnDParent : 29ABD8CD
	/// @DnDArgument : "spriteind" "spr_button_pause_mobile"
	/// @DnDSaveInfo : "spriteind" "spr_button_pause_mobile"
	sprite_index = spr_button_pause_mobile;
	image_index = 0;
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 14BA3B54
/// @DnDComment : // Inherited from parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 077AC74A
/// @DnDComment : // Sets target function
/// @DnDArgument : "funcName" "target_function"
function target_function() 
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 2A2DAF67
	/// @DnDComment : // Plays button sound
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "soundid" "snd_button"
	/// @DnDSaveInfo : "soundid" "snd_button"
	audio_play_sound(snd_button, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 7B74D40B
	/// @DnDComment : // Check if the game was playing
	/// @DnDParent : 077AC74A
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
	if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1585DED9
		/// @DnDComment : // Sets the game to paused
		/// @DnDParent : 7B74D40B
		/// @DnDArgument : "expr" "GAME_STATE.PAUSED"
		/// @DnDArgument : "var" "obj_game_manager.current_game_state"
		obj_game_manager.current_game_state = GAME_STATE.PAUSED;
	
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4430F57B
		/// @DnDComment : // Play pause sequence for menu UI
		/// @DnDParent : 7B74D40B
		/// @DnDArgument : "var" "_pause_seq"
		/// @DnDArgument : "value" "layer_sequence_create("GUI", 0, 0, seq_pause)"
		var _pause_seq = layer_sequence_create("GUI", 0, 0, seq_pause);
	}
}