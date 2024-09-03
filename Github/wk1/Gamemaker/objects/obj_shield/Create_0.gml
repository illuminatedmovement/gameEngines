/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
/// @DnDVersion : 1
/// @DnDHash : 4808BC24
/// @DnDComment : // Sets the shield to initally be invisible
/// @DnDArgument : "alpha" "0"
image_alpha = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 17D70544
/// @DnDComment : // Life variable for shield counts down till it should end
/// @DnDArgument : "var" "life"
life = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4D614B75
/// @DnDComment : // State for if shield can have pulse effect when dying
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "can_pulse"
can_pulse = false;

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 018CC52A
/// @DnDComment : // Plays shield sound
/// @DnDArgument : "target" "shield_sound"
/// @DnDArgument : "soundid" "snd_shield_effect"
/// @DnDArgument : "loop" "1"
/// @DnDSaveInfo : "soundid" "snd_shield_effect"
shield_sound = audio_play_sound(snd_shield_effect, 0, 1, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 76E22207
/// @DnDComment : // Checks if the game is not playing (collected after player dealth)
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PLAYING))
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 4697E847
	/// @DnDComment : // Sets the sprite into the off state to kill immediately
	/// @DnDParent : 76E22207
	/// @DnDArgument : "imageind_relative" "1"
	/// @DnDArgument : "spriteind" "spr_shield_off"
	/// @DnDSaveInfo : "spriteind" "spr_shield_off"
	sprite_index = spr_shield_off;
	image_index += 0;
}