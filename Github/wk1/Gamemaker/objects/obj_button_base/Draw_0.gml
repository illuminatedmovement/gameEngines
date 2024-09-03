/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 3FDCA618
/// @DnDComment : // Checks panel state
/// @DnDArgument : "expr" "has_panel"
if(has_panel)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 1781B622
	/// @DnDComment : // Draws panel sprite
	/// @DnDParent : 3FDCA618
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "15"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "alpha" "image_alpha"
	/// @DnDArgument : "sprite" "spr_button_panel"
	/// @DnDSaveInfo : "sprite" "spr_button_panel"
	draw_sprite_ext(spr_button_panel, 0, x + 0, y + 15, 1, 1, 0, $FFFFFF & $ffffff, image_alpha);
}

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 58C94F28
/// @DnDComment : // Draws button sprite
draw_self();