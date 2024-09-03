/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 0606B3BB
/// @DnDComment : // Temp variable for gamepad press check
/// @DnDArgument : "var" "_gamepad_press"
/// @DnDArgument : "value" "false"
var _gamepad_press = false;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2A5F86C9
/// @DnDComment : // Checks gamepad 0 (player 1) connected
/// @DnDArgument : "expr" "gamepad_is_connected(0)"
if(gamepad_is_connected(0))
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 0CAE2FA1
	/// @DnDComment : // Check face button
	/// @DnDParent : 2A5F86C9
	/// @DnDArgument : "expr" "gamepad_button_check_pressed(0, gp_face2)"
	if(gamepad_button_check_pressed(0, gp_face2))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0EAF4AFB
		/// @DnDComment : // Set press to true
		/// @DnDParent : 0CAE2FA1
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "_gamepad_press"
		_gamepad_press = true;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 625772B4
	/// @DnDComment : // Check select button
	/// @DnDParent : 2A5F86C9
	/// @DnDArgument : "expr" "gamepad_button_check_pressed(0, gp_select)"
	if(gamepad_button_check_pressed(0, gp_select))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6305AA1A
		/// @DnDComment : // Set press to true
		/// @DnDParent : 625772B4
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "_gamepad_press"
		_gamepad_press = true;
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1CB1D923
/// @DnDComment : // Checks for press from keyboard or gamepad press
/// @DnDArgument : "expr" "keyboard_check_pressed(vk_escape)|| _gamepad_press"
if(keyboard_check_pressed(vk_escape)|| _gamepad_press)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 62B72409
	/// @DnDComment : // Sets hovered and pushed states to false
	/// @DnDInput : 2
	/// @DnDParent : 1CB1D923
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "expr_1" "false"
	/// @DnDArgument : "var" "is_hovered"
	/// @DnDArgument : "var_1" "is_pushed"
	is_hovered = false;
	is_pushed = false;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 37776081
	/// @DnDComment : // Sets target scale
	/// @DnDParent : 1CB1D923
	/// @DnDArgument : "expr" "1.0"
	/// @DnDArgument : "var" "target_scale"
	target_scale = 1.0;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 30483272
	/// @DnDComment : // Calls target function
	/// @DnDParent : 1CB1D923
	/// @DnDArgument : "function" "target_function"
	target_function();
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 22F5BC5C
/// @DnDComment : // Inherit the parent event
event_inherited();