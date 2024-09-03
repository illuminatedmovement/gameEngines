/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 3172288E
/// @DnDComment : // Draw banner sprite
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 21511445
/// @DnDComment : // Setup heading font
/// @DnDArgument : "font" "fnt_rowdies_56"
/// @DnDSaveInfo : "font" "fnt_rowdies_56"
draw_set_font(fnt_rowdies_56);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 5BE25741
/// @DnDComment : // Set heading colour
/// @DnDArgument : "var" "_text_colour"
/// @DnDArgument : "value" "make_color_rgb(142, 214, 67)"
var _text_colour = make_color_rgb(142, 214, 67);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 7BADECB5
/// @DnDArgument : "color" "_text_colour"
/// @DnDArgument : "alpha" "false"
draw_set_colour(_text_colour & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 0C2BED1E
/// @DnDComment : // Set heading alpha
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 72C8B0CA
/// @DnDComment : // Set alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 1D70B5C1
/// @DnDArgument : "x" "room_width * 0.5"
/// @DnDArgument : "y" "room_height * 0.28"
/// @DnDArgument : "caption" ""PAUSED""
draw_text(room_width * 0.5, room_height * 0.28, string("PAUSED") + "");

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 1783A51A
/// @DnDComment : // Reset draw values
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 7B046DF8
/// @DnDArgument : "alpha" "1.0"
draw_set_alpha(1.0);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 5EB1A6BC
/// @DnDComment : // Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);