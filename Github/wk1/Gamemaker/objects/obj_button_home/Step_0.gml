/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 649D5114
/// @DnDComment : // Temp variable for gamepad press check
/// @DnDArgument : "var" "_gamepad_press"
/// @DnDArgument : "value" "false"
var _gamepad_press = false;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 28C0B2B6
/// @DnDComment : // Checks gamepad 0 (player 1) connected
/// @DnDArgument : "expr" "gamepad_is_connected(0)"
if(gamepad_is_connected(0))
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 7F4ED78E
	/// @DnDComment : // Check select button
	/// @DnDParent : 28C0B2B6
	/// @DnDArgument : "expr" "gamepad_button_check_pressed(0, gp_select)"
	if(gamepad_button_check_pressed(0, gp_select))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6D2DAE94
		/// @DnDComment : // Set press to true
		/// @DnDParent : 7F4ED78E
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "_gamepad_press"
		_gamepad_press = true;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 53D63ED4
	/// @DnDComment : // Check top face button
	/// @DnDParent : 28C0B2B6
	/// @DnDArgument : "expr" "gamepad_button_check_pressed(0, gp_face3)"
	if(gamepad_button_check_pressed(0, gp_face3))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0EAE1CFA
		/// @DnDComment : // Set press to true
		/// @DnDParent : 53D63ED4
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "_gamepad_press"
		_gamepad_press = true;
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0B6B032B
/// @DnDComment : // Checks for press from keyboard or gamepad press
/// @DnDArgument : "expr" "keyboard_check_pressed(vk_backspace) || (instance_exists(obj_banner_gameover) && keyboard_check_pressed(vk_escape)) || _gamepad_press"
if(keyboard_check_pressed(vk_backspace) || (instance_exists(obj_banner_gameover) && keyboard_check_pressed(vk_escape)) || _gamepad_press)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 72A55EB2
	/// @DnDComment : // Sets hovered and pushed states to false
	/// @DnDInput : 2
	/// @DnDParent : 0B6B032B
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "expr_1" "false"
	/// @DnDArgument : "var" "is_hovered"
	/// @DnDArgument : "var_1" "is_pushed"
	is_hovered = false;
	is_pushed = false;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0512AEA4
	/// @DnDComment : // Sets target scale
	/// @DnDParent : 0B6B032B
	/// @DnDArgument : "expr" "1.0"
	/// @DnDArgument : "var" "target_scale"
	target_scale = 1.0;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6554C1F2
	/// @DnDComment : // Calls target function
	/// @DnDParent : 0B6B032B
	/// @DnDArgument : "function" "target_function"
	target_function();
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 71500D7D
/// @DnDComment : // Inherit the parent event
event_inherited();