/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 567BAE39
/// @DnDComment : // Checks if game is paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 08C5BE94
	/// @DnDComment : // Pauses animation speed
	/// @DnDParent : 567BAE39
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1F4855E4
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 10AC3A77
	/// @DnDComment : // Plays animation speed normally
	/// @DnDParent : 1F4855E4
	image_speed = 1;
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 60E91B9C
/// @DnDComment : // Creates temp variable for blend rate
/// @DnDArgument : "var" "_blend_rate"
/// @DnDArgument : "value" "1.0"
var _blend_rate = 1.0;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2860AF26
/// @DnDComment : // Checks pulse state
/// @DnDArgument : "expr" "can_pulse"
if(can_pulse)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3FCFB97A
	/// @DnDComment : // Sets rate to vaule set by current life remaining and cos function so value goes between 0 and 1
	/// @DnDParent : 2860AF26
	/// @DnDArgument : "expr" "cos(pi / (life % 8))"
	/// @DnDArgument : "var" "_blend_rate"
	_blend_rate = cos(pi / (life % 8));
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 29BF76D0
/// @DnDComment : // Sets warn colour to near red
/// @DnDArgument : "var" "_warn_colour"
/// @DnDArgument : "value" "make_color_rgb(255, 220, 220)"
var _warn_colour = make_color_rgb(255, 220, 220);

/// @DnDAction : YoYo Games.Instances.Color_Sprite
/// @DnDVersion : 1
/// @DnDHash : 2A891A87
/// @DnDComment : // Blends the image colour to value of blend rate beween set warn colour and white
/// @DnDArgument : "colour" "merge_color(_warn_colour, c_white, _blend_rate)"
/// @DnDArgument : "alpha" "false"
image_blend = merge_color(_warn_colour, c_white, _blend_rate) & $ffffff;

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 7E6D8D8E
/// @DnDComment : // Draws shield
draw_self();