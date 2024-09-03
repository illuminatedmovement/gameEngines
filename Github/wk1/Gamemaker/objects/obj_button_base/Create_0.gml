/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 46DAD327
/// @DnDComment : // States for button
/// @DnDInput : 2
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "expr_1" "false"
/// @DnDArgument : "var" "is_hovered"
/// @DnDArgument : "var_1" "is_pushed"
is_hovered = false;
is_pushed = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 12D3C075
/// @DnDComment : // Scale button is targeting
/// @DnDArgument : "expr" "1.0"
/// @DnDArgument : "var" "target_scale"
target_scale = 1.0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 2B935089
/// @DnDComment : // State for if button has snap scaling or not
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "can_scale_at_rate"
can_scale_at_rate = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5ED85601
/// @DnDComment : // Set rates for scaling up and down
/// @DnDInput : 2
/// @DnDArgument : "expr" "0.1"
/// @DnDArgument : "expr_1" "0.5"
/// @DnDArgument : "var" "scale_up_rate"
/// @DnDArgument : "var_1" "scale_down_rate"
scale_up_rate = 0.1;
scale_down_rate = 0.5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 518E43E5
/// @DnDComment : // Values for scale sizes
/// @DnDInput : 3
/// @DnDArgument : "expr" "1.05"
/// @DnDArgument : "expr_1" "0.95"
/// @DnDArgument : "expr_2" "1.00"
/// @DnDArgument : "var" "scale_highlighted"
/// @DnDArgument : "var_1" "scale_pressed"
/// @DnDArgument : "var_2" "scale_default"
scale_highlighted = 1.05;
scale_pressed = 0.95;
scale_default = 1.00;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 717AA780
/// @DnDComment : // State for if panel sprite should be drawn behind the button object
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_panel"
has_panel = false;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 40ACFD99
/// @DnDComment : // Function to be set that will changed the functionality of the button when activated
/// @DnDArgument : "funcName" "target_function"
function target_function() 
{
	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 516D5FDB
	/// @DnDComment : // Do nothing for now
	/// @DnDParent : 40ACFD99
	return;
}