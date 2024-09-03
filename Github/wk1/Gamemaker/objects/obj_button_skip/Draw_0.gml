/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 70893D63
/// @DnDComment : // Checks panel state
/// @DnDArgument : "expr" "has_panel"
if(has_panel)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 7D13049D
	/// @DnDComment : // Draws panel sprite if needed
	/// @DnDParent : 70893D63
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "15"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "alpha" "image_alpha"
	/// @DnDArgument : "sprite" "spr_button_panel"
	/// @DnDSaveInfo : "sprite" "spr_button_panel"
	draw_sprite_ext(spr_button_panel, 0, x + 0, y + 15, 1, 1, 0, $FFFFFF & $ffffff, image_alpha);
}

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 3D6D7A0B
/// @DnDComment : // Sets font
/// @DnDArgument : "font" "fnt_rowdies_34"
/// @DnDSaveInfo : "font" "fnt_rowdies_34"
draw_set_font(fnt_rowdies_34);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 79EAB89E
/// @DnDComment : // Sets colour
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 18347E6D
/// @DnDComment : // Sets alpha
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 417C7C9F
/// @DnDComment : // Sets text alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
/// @DnDVersion : 1
/// @DnDHash : 7211798F
/// @DnDComment : // Draw skip text at scale
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "20"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "xscale" "image_xscale"
/// @DnDArgument : "yscale" "image_yscale"
/// @DnDArgument : "caption" ""SKIP""
draw_text_transformed(x + 0, y + 20, string("SKIP") + "", image_xscale, image_yscale, 0);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 13496FD4
/// @DnDComment : // Reset draw values
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 24F3CE49
/// @DnDArgument : "alpha" "1.0"
draw_set_alpha(1.0);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 0AF310BF
/// @DnDComment : // Reset text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);