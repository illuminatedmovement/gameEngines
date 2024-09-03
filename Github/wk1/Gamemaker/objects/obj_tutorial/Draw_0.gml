/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 1EB9E31B
/// @DnDComment : // Draws the banner
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 4269A4D7
/// @DnDComment : // Sets up the font
/// @DnDArgument : "font" "fnt_rowdies_56"
/// @DnDSaveInfo : "font" "fnt_rowdies_56"
draw_set_font(fnt_rowdies_56);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 145A21FF
/// @DnDComment : // Sets up the text colour
/// @DnDArgument : "var" "_text_colour"
/// @DnDArgument : "value" "make_color_rgb(142, 214, 67)"
var _text_colour = make_color_rgb(142, 214, 67);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 018FB4A7
/// @DnDArgument : "color" "_text_colour"
/// @DnDArgument : "alpha" "false"
draw_set_colour(_text_colour & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 24CFA5DA
/// @DnDComment : // Sets up the text alpha
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 6A9FCF02
/// @DnDComment : // Sets up the text alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 2B19C979
/// @DnDComment : // Draws the text heading
/// @DnDArgument : "x" "room_width * 0.5"
/// @DnDArgument : "y" "room_height * 0.28"
/// @DnDArgument : "caption" ""HOW TO PLAY""
draw_text(room_width * 0.5, room_height * 0.28, string("HOW TO PLAY") + "");

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 63DD9339
/// @DnDComment : // Setup for the tips body text
/// @DnDArgument : "font" "fnt_rowdies_34"
/// @DnDSaveInfo : "font" "fnt_rowdies_34"
draw_set_font(fnt_rowdies_34);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 57B6904B
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 63F02EB0
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 6953EE4C
/// @DnDComment : // Draws the body message
/// @DnDArgument : "x" "room_width * 0.5"
/// @DnDArgument : "y" "room_height * 0.56"
/// @DnDArgument : "caption" """ + tip_message"
draw_text(room_width * 0.5, room_height * 0.56, string("" + tip_message) + "");

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 73A0A714
/// @DnDComment : // Resets alighnment
draw_set_halign(fa_left);
draw_set_valign(fa_top);