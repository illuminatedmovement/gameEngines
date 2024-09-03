/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 6EA4DDC6
/// @DnDComment : // Checks if the player is dead
/// @DnDArgument : "expr" "current_player_state == PLAYER_STATE.DEATH"
if(current_player_state == PLAYER_STATE.DEATH)
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 19388988
	/// @DnDComment : // Sets alpha to zero to hide
	/// @DnDParent : 6EA4DDC6
	/// @DnDArgument : "alpha" "0"
	image_alpha = 0;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1622073E
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 2EF3E3A0
	/// @DnDComment : // Checks if the player is idle
	/// @DnDParent : 1622073E
	/// @DnDArgument : "expr" "current_player_state == PLAYER_STATE.IDLE"
	if(current_player_state == PLAYER_STATE.IDLE)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0BF7DE58
		/// @DnDComment : // Sets the animation to small flying state
		/// @DnDParent : 2EF3E3A0
		/// @DnDArgument : "expr" "PLAYER_STATE.FLY_SMALL"
		/// @DnDArgument : "var" "current_player_state"
		current_player_state = PLAYER_STATE.FLY_SMALL;
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 36E0E057
		/// @DnDComment : // Resets the set sprite to idle
		/// @DnDParent : 2EF3E3A0
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "spr_character_idle"
		/// @DnDSaveInfo : "spriteind" "spr_character_idle"
		sprite_index = spr_character_idle;
		image_index += 0;
	}
}