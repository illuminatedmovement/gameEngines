/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 0087E141
/// @DnDComment : // Draw banner sprite
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 29D69BBA
/// @DnDComment : // Set font
/// @DnDArgument : "font" "fnt_rowdies_56"
/// @DnDSaveInfo : "font" "fnt_rowdies_56"
draw_set_font(fnt_rowdies_56);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 74F2B48A
/// @DnDComment : // Create colour for header
/// @DnDArgument : "var" "_text_colour"
/// @DnDArgument : "value" "make_color_rgb(142, 214, 67)"
var _text_colour = make_color_rgb(142, 214, 67);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 15A0955B
/// @DnDComment : // Set colour
/// @DnDArgument : "color" "_text_colour"
/// @DnDArgument : "alpha" "false"
draw_set_colour(_text_colour & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 58104BC6
/// @DnDComment : // Set alpha for text from retry button alpha
/// @DnDArgument : "alpha" "obj_button_retry.image_alpha"
draw_set_alpha(obj_button_retry.image_alpha);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 79B0A071
/// @DnDComment : // Set alignment
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 5DEA3793
/// @DnDComment : // Draw game over text
/// @DnDArgument : "x" "room_width * 0.5"
/// @DnDArgument : "y" "room_height * 0.28"
/// @DnDArgument : "caption" ""GAME OVER""
draw_text(room_width * 0.5, room_height * 0.28, string("GAME OVER") + "");

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 6C44D005
/// @DnDComment : // Set up main body font
/// @DnDArgument : "font" "fnt_rowdies_34"
/// @DnDSaveInfo : "font" "fnt_rowdies_34"
draw_set_font(fnt_rowdies_34);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 69BC5716
/// @DnDComment : // Set main body text colour and alpha
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 025D2713
/// @DnDArgument : "alpha" "obj_button_retry.image_alpha"
draw_set_alpha(obj_button_retry.image_alpha);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0C1720EA
/// @DnDComment : // Check if player has set new high score
/// @DnDArgument : "expr" "obj_game_manager.current_distance == global.highscore"
if(obj_game_manager.current_distance == global.highscore)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 2A15AB30
	/// @DnDComment : // Draw text for new high score
	/// @DnDParent : 0C1720EA
	/// @DnDArgument : "x" "room_width * 0.5"
	/// @DnDArgument : "y" "room_height * 0.45"
	/// @DnDArgument : "caption" ""New Best Distance!\n" + string(floor(obj_game_manager.current_distance)) + "M!""
	draw_text(room_width * 0.5, room_height * 0.45, string("New Best Distance!\n" + string(floor(obj_game_manager.current_distance)) + "M!") + "");
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 49B160A1
else
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 7BF0188A
	/// @DnDComment : // Draw text for no new high score
	/// @DnDParent : 49B160A1
	/// @DnDArgument : "x" "room_width * 0.5"
	/// @DnDArgument : "y" "room_height * 0.45"
	/// @DnDArgument : "caption" ""You reached " + string(floor(obj_game_manager.current_distance)) + "M!\nCurrent Highscore " + string(floor(global.highscore)) + "M""
	draw_text(room_width * 0.5, room_height * 0.45, string("You reached " + string(floor(obj_game_manager.current_distance)) + "M!\nCurrent Highscore " + string(floor(global.highscore)) + "M") + "");
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 32BFB08A
/// @DnDComment : // Set text colour and alpha for well done text
/// @DnDArgument : "expr" "make_color_rgb(255, 199, 5)"
/// @DnDArgument : "var" "_text_colour"
_text_colour = make_color_rgb(255, 199, 5);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 43A6DC91
/// @DnDArgument : "color" "_text_colour"
/// @DnDArgument : "alpha" "false"
draw_set_colour(_text_colour & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 0141DB9E
/// @DnDArgument : "alpha" "obj_button_retry.image_alpha"
draw_set_alpha(obj_button_retry.image_alpha);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 7E21CE83
/// @DnDComment : // Draw well done text
/// @DnDArgument : "x" "room_width * 0.5"
/// @DnDArgument : "y" "room_height * 0.55"
/// @DnDArgument : "caption" ""WELL DONE!""
draw_text(room_width * 0.5, room_height * 0.55, string("WELL DONE!") + "");

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 34C83B50
/// @DnDComment : // Reset colour options
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 375E5E44
/// @DnDArgument : "alpha" "1.0"
draw_set_alpha(1.0);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 5FE61215
/// @DnDComment : // Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);