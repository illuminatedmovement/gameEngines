/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7C259E54
/// @DnDComment : // Flag for knowing if hit and damaged the player$(13_10)// Walking speed variable
/// @DnDInput : 2
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "expr_1" "3"
/// @DnDArgument : "var" "has_hit"
/// @DnDArgument : "var_1" "walking_speed"
has_hit = false;
walking_speed = 3;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 764427CE
/// @DnDComment : // Variable for footstep state
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_stepped"
has_stepped = false;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 4F475CDC
/// @DnDComment : // Creates a shadow object to follow the enemy and sets up the sprite and offset
/// @DnDArgument : "var" "_shadow"
/// @DnDArgument : "value" "instance_create_layer(x, y, "StageShadows", obj_shadow)"
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 487C1B79
/// @DnDInput : 2
/// @DnDArgument : "expr" "spr_enemy_shadow"
/// @DnDArgument : "expr_1" "self"
/// @DnDArgument : "var" "_shadow.sprite_index"
/// @DnDArgument : "var_1" "_shadow.owner"
_shadow.sprite_index = spr_enemy_shadow;
_shadow.owner = self;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 33322C78
/// @DnDArgument : "function" "_shadow.set_y_offset"
/// @DnDArgument : "arg" "150"
_shadow.set_y_offset(150);

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 3B86FA54
/// @DnDComment : // Creates an alert object to the position with owner being set
/// @DnDArgument : "var" "_alert"
/// @DnDArgument : "value" "instance_create_layer(room_width - 100, y, "GUI", obj_alert)"
var _alert = instance_create_layer(room_width - 100, y, "GUI", obj_alert);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 68C3098A
/// @DnDArgument : "expr" "self"
/// @DnDArgument : "var" "_alert.owner"
_alert.owner = self;