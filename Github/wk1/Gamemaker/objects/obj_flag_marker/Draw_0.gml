/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 4EDE9516
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 5E69E751
/// @DnDArgument : "font" "fnt_rowdies_22"
/// @DnDSaveInfo : "font" "fnt_rowdies_22"
draw_set_font(fnt_rowdies_22);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 1E61526F
/// @DnDArgument : "var" "_text_colour"
/// @DnDArgument : "value" "make_color_rgb(142, 214, 67)"
var _text_colour = make_color_rgb(142, 214, 67);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 2A9CF0B3
/// @DnDArgument : "color" "_text_colour"
/// @DnDArgument : "alpha" "false"
draw_set_colour(_text_colour & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 66EDAD80
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 632A6662
/// @DnDArgument : "expr" "!is_warping && has_dropped"
if(!is_warping && has_dropped)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 077550D5
	/// @DnDParent : 632A6662
	/// @DnDArgument : "expr" "lerp(text_alpha, 1.0, 0.01)"
	/// @DnDArgument : "var" "text_alpha"
	text_alpha = lerp(text_alpha, 1.0, 0.01);

	/// @DnDAction : YoYo Games.Drawing.Set_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 4D65DC35
	/// @DnDParent : 632A6662
	/// @DnDArgument : "alpha" "text_alpha"
	draw_set_alpha(text_alpha);

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 64C5826C
	/// @DnDInput : 2
	/// @DnDParent : 632A6662
	/// @DnDArgument : "var" "_string"
	/// @DnDArgument : "value" "parse_value(flag_distance) + "M""
	/// @DnDArgument : "var_1" "_text_scale"
	/// @DnDArgument : "value_1" "clamp(80 / string_width(_string), 0.5, 1.0)"
	var _string = parse_value(flag_distance) + "M";
	var _text_scale = clamp(80 / string_width(_string), 0.5, 1.0);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 041FA342
	/// @DnDParent : 632A6662
	/// @DnDArgument : "x" "50"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-180"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "xscale" "_text_scale"
	/// @DnDArgument : "yscale" "_text_scale"
	/// @DnDArgument : "caption" """"
	/// @DnDArgument : "text" "_string"
	draw_text_transformed(x + 50, y + -180, string("") + string(_string), _text_scale, _text_scale, 0);
}

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 495BA3AA
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 213C3DEE
draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 1F867A04
draw_set_halign(fa_left);
draw_set_valign(fa_top);