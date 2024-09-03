/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 4008D26F
/// @DnDComment : // Creates variables to check alert status
/// @DnDInput : 2
/// @DnDArgument : "var" "_self"
/// @DnDArgument : "value" "self"
/// @DnDArgument : "var_1" "_has_alert"
/// @DnDArgument : "value_1" "false"
var _self = self;
var _has_alert = false;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 3983B51E
/// @DnDComment : // Checks through all the alerts
/// @DnDApplyTo : {obj_alert}
with(obj_alert) {
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 6D358CED
	/// @DnDComment : // Checks if the alert is the same one
	/// @DnDParent : 3983B51E
	/// @DnDArgument : "expr" "self != _self"
	if(self != _self)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 67B89D3D
		/// @DnDComment : // Sets the has alert flag to true
		/// @DnDParent : 6D358CED
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "_has_alert"
		_has_alert = true;
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 382C3F00
/// @DnDComment : // Checks if no other alerts exist
/// @DnDArgument : "expr" "_has_alert"
/// @DnDArgument : "not" "1"
if(!(_has_alert))
{
	/// @DnDAction : YoYo Games.Audio.Stop_Audio
	/// @DnDVersion : 1
	/// @DnDHash : 5A6999D8
	/// @DnDComment : // Stops the sound
	/// @DnDParent : 382C3F00
	/// @DnDArgument : "soundid" "global.alert_sound"
	audio_stop_sound(global.alert_sound);
}