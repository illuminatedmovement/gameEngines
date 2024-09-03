/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5A37046B
/// @DnDComment : // Check for knowing if object has hit the player
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_hit	"
has_hit	 = false;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 2D4E8EE9
/// @DnDComment : // Creates an alert object at its high point with itself as owner
/// @DnDArgument : "var" "_alert_high"
/// @DnDArgument : "value" "instance_create_layer(room_width - 100, y - 100, "GUI", obj_alert)"
var _alert_high = instance_create_layer(room_width - 100, y - 100, "GUI", obj_alert);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 27A1B454
/// @DnDArgument : "expr" "self"
/// @DnDArgument : "var" "_alert_high.owner"
_alert_high.owner = self;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 133BD8F3
/// @DnDComment : // Creates an alert object at its low point with itself as owner
/// @DnDArgument : "var" "_alert_low"
/// @DnDArgument : "value" "instance_create_layer(room_width - 100, y + 100, "GUI", obj_alert)"
var _alert_low = instance_create_layer(room_width - 100, y + 100, "GUI", obj_alert);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 41816ED2
/// @DnDArgument : "expr" "self"
/// @DnDArgument : "var" "_alert_low.owner"
_alert_low.owner = self;

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 7258F2E3
/// @DnDComment : // Beam sound effect
/// @DnDArgument : "target" "beam_sound"
/// @DnDArgument : "soundid" "snd_force_field"
/// @DnDSaveInfo : "soundid" "snd_force_field"
beam_sound = audio_play_sound(snd_force_field, 0, 0, 1.0, undefined, 1.0);