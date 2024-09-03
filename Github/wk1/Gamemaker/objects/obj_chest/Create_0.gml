/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1B2CE48C
/// @DnDComment : // Creates a sequence manager object for the chests idle animation
/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_sequence_manager)"
/// @DnDArgument : "var" "sequence_body"
sequence_body = instance_create_layer(x, y, "Stage", obj_sequence_manager);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3D8805A2
/// @DnDComment : // Sets the owner to the chest
/// @DnDArgument : "expr" "self"
/// @DnDArgument : "var" "sequence_body.owner"
sequence_body.owner = self;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 2FA374B6
/// @DnDComment : // Sets the object to use the idle sequence
/// @DnDInput : 2
/// @DnDArgument : "function" "sequence_body.create_seq"
/// @DnDArgument : "arg" "seq_chest_idle"
/// @DnDArgument : "arg_1" ""Stage""
sequence_body.create_seq(seq_chest_idle, "Stage");

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 5ECB1F8A
/// @DnDComment : // Creates new shadow object instance
/// @DnDArgument : "var" "_shadow"
/// @DnDArgument : "value" "instance_create_layer(x, y, "StageShadows", obj_shadow)"
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 664B31D4
/// @DnDComment : // Sets the shadow instance to chest parameters and targets self as owner of it
/// @DnDInput : 2
/// @DnDArgument : "expr" "spr_chest_shadow"
/// @DnDArgument : "expr_1" "self"
/// @DnDArgument : "var" "_shadow.sprite_index"
/// @DnDArgument : "var_1" "_shadow.owner"
_shadow.sprite_index = spr_chest_shadow;
_shadow.owner = self;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 09DB5A42
/// @DnDArgument : "function" "_shadow.set_y_offset"
/// @DnDArgument : "arg" "40"
_shadow.set_y_offset(40);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3EF9EEC7
/// @DnDComment : // State for if idle
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "is_idle"
is_idle = true;

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 43B8B26E
/// @DnDComment : // Sound effect for the chest
/// @DnDArgument : "target" "chest_sound"
/// @DnDArgument : "soundid" "snd_coin_chest"
/// @DnDArgument : "loop" "1"
/// @DnDSaveInfo : "soundid" "snd_coin_chest"
chest_sound = audio_play_sound(snd_coin_chest, 0, 1, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0E1DE876
/// @DnDComment : // Function used for creating sparkles
/// @DnDArgument : "funcName" "create_sparkles"
function create_sparkles() 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 08039BB1
	/// @DnDComment : // Creates and sets sparkle particles objects at 3 offset points setting them to the correct effects aswell
	/// @DnDParent : 0E1DE876
	/// @DnDArgument : "var" "_sparkle_particle"
	/// @DnDArgument : "value" "instance_create_layer(x - 85, y - 85, "Stage", obj_particle_manager)"
	var _sparkle_particle = instance_create_layer(x - 85, y - 85, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2A436E15
	/// @DnDInput : 2
	/// @DnDParent : 0E1DE876
	/// @DnDArgument : "function" "_sparkle_particle.set_particle"
	/// @DnDArgument : "arg" "ps_sparkle_chest"
	/// @DnDArgument : "arg_1" ""StageBackEffects""
	_sparkle_particle.set_particle(ps_sparkle_chest, "StageBackEffects");

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 617EA485
	/// @DnDParent : 0E1DE876
	/// @DnDArgument : "expr" "instance_create_layer(x, y - 85, "Stage", obj_particle_manager)"
	/// @DnDArgument : "var" "_sparkle_particle"
	_sparkle_particle = instance_create_layer(x, y - 85, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 33F22218
	/// @DnDInput : 2
	/// @DnDParent : 0E1DE876
	/// @DnDArgument : "function" "_sparkle_particle.set_particle"
	/// @DnDArgument : "arg" "ps_sparkle_chest"
	/// @DnDArgument : "arg_1" ""StageBackEffects""
	_sparkle_particle.set_particle(ps_sparkle_chest, "StageBackEffects");

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4B8B9224
	/// @DnDParent : 0E1DE876
	/// @DnDArgument : "expr" "instance_create_layer(x + 85, y - 85, "Stage", obj_particle_manager)"
	/// @DnDArgument : "var" "_sparkle_particle"
	_sparkle_particle = instance_create_layer(x + 85, y - 85, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1DC3B354
	/// @DnDInput : 2
	/// @DnDParent : 0E1DE876
	/// @DnDArgument : "function" "_sparkle_particle.set_particle"
	/// @DnDArgument : "arg" "ps_sparkle_chest"
	/// @DnDArgument : "arg_1" ""StageBackEffects""
	_sparkle_particle.set_particle(ps_sparkle_chest, "StageBackEffects");
}