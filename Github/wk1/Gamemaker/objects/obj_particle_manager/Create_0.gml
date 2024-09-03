/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 425704E9
/// @DnDComment : // Empty variable for setting the particle system to
/// @DnDArgument : "expr" "-1"
/// @DnDArgument : "var" "particle_sys"
particle_sys = -1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 06020394
/// @DnDComment : // Variable used for if follows owner
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "var" "owner"
owner = noone;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1547F014
/// @DnDComment : // Variables used for if effected by world speed
/// @DnDInput : 3
/// @DnDArgument : "expr" "1.0"
/// @DnDArgument : "expr_1" "1.0"
/// @DnDArgument : "expr_2" "0.0"
/// @DnDArgument : "var" "move_rate"
/// @DnDArgument : "var_1" "move_rate_target"
/// @DnDArgument : "var_2" "drag_rate"
move_rate = 1.0;
move_rate_target = 1.0;
drag_rate = 0.0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1850B14B
/// @DnDComment : // Variable used offsets
/// @DnDInput : 3
/// @DnDArgument : "var" "angle_offset"
/// @DnDArgument : "var_1" "x_offset"
/// @DnDArgument : "var_2" "y_offset"
angle_offset = 0;
x_offset = 0;
y_offset = 0;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 7B69046C
/// @DnDComment : // Function used for setting particle systems angle
/// @DnDArgument : "funcName" "set_angle"
/// @DnDArgument : "arg" "_new_angle"
function set_angle(_new_angle) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 11E46EFF
	/// @DnDComment : // Sets angle offset
	/// @DnDParent : 7B69046C
	/// @DnDArgument : "expr" "_new_angle"
	/// @DnDArgument : "var" "angle_offset"
	angle_offset = _new_angle;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3C6B2CB9
	/// @DnDComment : // Updates particle systems angle
	/// @DnDInput : 2
	/// @DnDParent : 7B69046C
	/// @DnDArgument : "function" "part_system_angle"
	/// @DnDArgument : "arg" "particle_sys"
	/// @DnDArgument : "arg_1" "angle_offset"
	part_system_angle(particle_sys, angle_offset);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4BCB5364
/// @DnDComment : // Function used for setting particle systems offset position
/// @DnDInput : 2
/// @DnDArgument : "funcName" "set_offset"
/// @DnDArgument : "arg" "_x_offset"
/// @DnDArgument : "arg_1" "_y_offset"
function set_offset(_x_offset, _y_offset) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 019F2FC5
	/// @DnDComment : // Offset variables set to new temp variables passed in
	/// @DnDInput : 2
	/// @DnDParent : 4BCB5364
	/// @DnDArgument : "expr" "_x_offset"
	/// @DnDArgument : "expr_1" "_y_offset"
	/// @DnDArgument : "var" "x_offset"
	/// @DnDArgument : "var_1" "y_offset"
	x_offset = _x_offset;
	y_offset = _y_offset;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 097220DC
	/// @DnDComment : // Positions adjusted by offsets
	/// @DnDInput : 2
	/// @DnDParent : 4BCB5364
	/// @DnDArgument : "expr" "x_offset"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "expr_1" "y_offset"
	/// @DnDArgument : "expr_relative_1" "1"
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "var_1" "y"
	x += x_offset;
	y += y_offset;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4DC770F2
	/// @DnDComment : // Particle position repositioned
	/// @DnDInput : 3
	/// @DnDParent : 4BCB5364
	/// @DnDArgument : "function" "part_system_position"
	/// @DnDArgument : "arg" "particle_sys"
	/// @DnDArgument : "arg_1" "x"
	/// @DnDArgument : "arg_2" "y"
	part_system_position(particle_sys, x, y);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 430B55A4
/// @DnDComment : // Function used for setting particle system
/// @DnDInput : 2
/// @DnDArgument : "funcName" "set_particle"
/// @DnDArgument : "arg" "_new_ps"
/// @DnDArgument : "arg_1" "_layer"
function set_particle(_new_ps, _layer) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 005376EC
	/// @DnDComment : // Creates smoke particle system
	/// @DnDParent : 430B55A4
	/// @DnDArgument : "expr" "part_system_create_layer(_layer, false, _new_ps)"
	/// @DnDArgument : "var" "particle_sys"
	particle_sys = part_system_create_layer(_layer, false, _new_ps);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 43A6AFF7
	/// @DnDComment : // Updates particle system position
	/// @DnDInput : 3
	/// @DnDParent : 430B55A4
	/// @DnDArgument : "function" "part_system_position"
	/// @DnDArgument : "arg" "particle_sys"
	/// @DnDArgument : "arg_1" "x"
	/// @DnDArgument : "arg_2" "y"
	part_system_position(particle_sys, x, y);
}