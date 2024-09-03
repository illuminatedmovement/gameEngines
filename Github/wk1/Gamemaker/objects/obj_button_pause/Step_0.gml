/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 592A8B2F
/// @DnDComment : // Checks the game is playing
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 649D5114
	/// @DnDComment : // Temp variable for gamepad press check
	/// @DnDParent : 592A8B2F
	/// @DnDArgument : "var" "_gamepad_pause"
	/// @DnDArgument : "value" "false"
	var _gamepad_pause = false;

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 28C0B2B6
	/// @DnDComment : // Checks gamepad 0 (player 1) connected
	/// @DnDParent : 592A8B2F
	/// @DnDArgument : "expr" "gamepad_is_connected(0)"
	if(gamepad_is_connected(0))
	{
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 7F4ED78E
		/// @DnDComment : // Check start button
		/// @DnDParent : 28C0B2B6
		/// @DnDArgument : "expr" "gamepad_button_check_pressed(0, gp_start)"
		if(gamepad_button_check_pressed(0, gp_start))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6D2DAE94
			/// @DnDComment : // Set press to true
			/// @DnDParent : 7F4ED78E
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "_gamepad_pause"
			_gamepad_pause = true;
		}
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 0B6B032B
	/// @DnDComment : // Checks for press from keyboard or gamepad press and wasnt just paused
	/// @DnDParent : 592A8B2F
	/// @DnDArgument : "expr" "(keyboard_check_pressed(vk_escape) || _gamepad_pause) && !was_paused"
	if((keyboard_check_pressed(vk_escape) || _gamepad_pause) && !was_paused)
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
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 123AB67F
		/// @DnDComment : // Sets was paused state to true
		/// @DnDParent : 0B6B032B
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "was_paused"
		was_paused = true;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 475E855A
	/// @DnDParent : 592A8B2F
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 10441450
		/// @DnDComment : // Unsets was paused state
		/// @DnDParent : 475E855A
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "var" "was_paused"
		was_paused = false;
	}
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 71500D7D
/// @DnDComment : // Inherit the parent event
event_inherited();