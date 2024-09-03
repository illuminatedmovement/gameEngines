/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 418D7F27
/// @DnDComment : // Checks if object has hit player
/// @DnDArgument : "expr" "has_hit"
/// @DnDArgument : "not" "1"
if(!(has_hit))
{
	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 0B339DE7
	/// @DnDComment : // Plays impact sound
	/// @DnDParent : 418D7F27
	/// @DnDArgument : "soundid" "snd_dino_robot_impact"
	/// @DnDSaveInfo : "soundid" "snd_dino_robot_impact"
	audio_play_sound(snd_dino_robot_impact, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 7729835F
	/// @DnDComment : // Calls kill player function
	/// @DnDApplyTo : other
	/// @DnDParent : 418D7F27
	/// @DnDArgument : "function" "kill_player"
	with(other) {
		kill_player();
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 03C0E3B3
	/// @DnDComment : // Sets hit flag to true
	/// @DnDParent : 418D7F27
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "has_hit"
	has_hit = true;
}