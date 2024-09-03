/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 43EC11C9
/// @DnDComment : // Checks if beam has already hit the player
/// @DnDArgument : "expr" "has_hit"
/// @DnDArgument : "not" "1"
if(!(has_hit))
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 6D2D4B9C
	/// @DnDComment : // Plays impact sound
	/// @DnDParent : 43EC11C9
	/// @DnDArgument : "soundid" "snd_force_field_impact"
	/// @DnDSaveInfo : "soundid" "snd_force_field_impact"
	audio_play_sound(snd_force_field_impact, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 411D12CE
	/// @DnDComment : // Calls the players kill function
	/// @DnDApplyTo : other
	/// @DnDParent : 43EC11C9
	/// @DnDArgument : "function" "kill_player"
	with(other) {
		kill_player();
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 690D346C
	/// @DnDComment : // Sets the hit flag to true
	/// @DnDParent : 43EC11C9
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "has_hit"
	has_hit = true;
}