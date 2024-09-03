/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 31879FC2
/// @DnDComment : // Variable for tip type state
/// @DnDBreak : 1

/// @DnDArgument : "var" "tip_type"
tip_type = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6056E2CA
/// @DnDComment : // Variable for tip message string
/// @DnDArgument : "expr" ""Welcome to Chicken Run!\nPress any key to continue""
/// @DnDArgument : "var" "tip_message"
tip_message = "Welcome to Chicken Run!\nPress any key to continue";

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3CF7EEE9
/// @DnDComment : // Variable for knowing if gamepad is used
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "is_gamepad"
is_gamepad = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0D52EEBF
/// @DnDComment : // Used for time an action should be preformed
/// @DnDArgument : "var" "action_timer"
action_timer = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 63EC6C07
/// @DnDComment : // Used to lock the jump ability
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "can_jump"
can_jump = false;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 5CD177AC
/// @DnDComment : // Checks gamepads exist
/// @DnDArgument : "var" "_gamepad_count"
/// @DnDArgument : "value" "gamepad_get_device_count()"
var _gamepad_count = gamepad_get_device_count();

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 0D41B747
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < _gamepad_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < _gamepad_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 20FE970D
	/// @DnDComment : // If gamepad is connected
	/// @DnDParent : 0D41B747
	/// @DnDArgument : "expr" "gamepad_is_connected(_i)"
	if(gamepad_is_connected(_i))
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 012F5CD4
		/// @DnDComment : // Set gamepad state to true
		/// @DnDParent : 20FE970D
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "is_gamepad"
		is_gamepad = true;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 165619F3
		/// @DnDComment : // Change default message
		/// @DnDParent : 20FE970D
		/// @DnDArgument : "expr" ""Welcome to Chicken Run!\nPress A or Cross button to continue""
		/// @DnDArgument : "var" "tip_message"
		tip_message = "Welcome to Chicken Run!\nPress A or Cross button to continue";
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 657B8B92
/// @DnDComment : // Check if touch input
/// @DnDArgument : "expr" "global.is_touch"
if(global.is_touch)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 74BC39D1
	/// @DnDComment : // Change message
	/// @DnDParent : 657B8B92
	/// @DnDArgument : "expr" ""Welcome to Chicken Run!\nTap screen to continue""
	/// @DnDArgument : "var" "tip_message"
	tip_message = "Welcome to Chicken Run!\nTap screen to continue";
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 1E80F9C3
/// @DnDComment : // Create skip button for tutorial
/// @DnDArgument : "var" "_skip_button"
/// @DnDArgument : "value" "instance_create_layer(1740, 890, "GUI", obj_button_skip)"
var _skip_button = instance_create_layer(1740, 890, "GUI", obj_button_skip);