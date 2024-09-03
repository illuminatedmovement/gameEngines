/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3D05A9A5
/// @DnDComment : // Variables set up for firework to use after being set
/// @DnDInput : 3
/// @DnDArgument : "var" "life"
/// @DnDArgument : "var_1" "delay"
/// @DnDArgument : "var_2" "death"
life = 0;
delay = 0;
death = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 78CB5E23
/// @DnDComment : // Tilt variable set to random swing of 10 degrees either way
/// @DnDArgument : "expr" "random_range(-10, 10)"
/// @DnDArgument : "var" "tilt"
tilt = random_range(-10, 10);

/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
/// @DnDVersion : 1
/// @DnDHash : 3ABA233A
/// @DnDComment : // Direction set to face up with added tilt
/// @DnDArgument : "direction" "90 + tilt"
direction = 90 + tilt;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 323E28B8
/// @DnDComment : // Sets the inital fire speed
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "var" "fire_speed"
fire_speed = 1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 537A8FB2
/// @DnDComment : // Particle effects to be used for the firework
/// @DnDInput : 2
/// @DnDArgument : "expr" "ps_firework_trail"
/// @DnDArgument : "expr_1" "ps_firework"
/// @DnDArgument : "var" "trail_ps"
/// @DnDArgument : "var_1" "head_ps"
trail_ps = ps_firework_trail;
head_ps = ps_firework;

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 7188C37D
/// @DnDComment : // Plays firework trail sound
/// @DnDArgument : "target" "_sfx_trail"
/// @DnDArgument : "target_temp" "1"
/// @DnDArgument : "soundid" "snd_celebration_firework"
/// @DnDArgument : "gain" "0.25"
/// @DnDArgument : "offset" "0.0"
/// @DnDArgument : "pitch" "random_range(0.95, 1.05)"
/// @DnDSaveInfo : "soundid" "snd_celebration_firework"
var _sfx_trail = audio_play_sound(snd_celebration_firework, 0, 0, 0.25, 0.0, random_range(0.95, 1.05));

/// @DnDAction : YoYo Games.Audio.Audio_Set_Position
/// @DnDVersion : 1
/// @DnDHash : 5228B83A
/// @DnDArgument : "sound" "_sfx_trail"
/// @DnDArgument : "time" "3.0"
audio_sound_set_track_position(_sfx_trail, 3.0);

/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
/// @DnDVersion : 1.1
/// @DnDHash : 2DF62AEE
/// @DnDArgument : "sound" "_sfx_trail"
/// @DnDArgument : "volume" "0.0"
/// @DnDArgument : "time" "1750"
audio_sound_gain(_sfx_trail, 0.0, 1750);

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 01B92604
/// @DnDComment : // Create ps function called to create new particle effect later
/// @DnDArgument : "funcName" "create_ps"
/// @DnDArgument : "arg" "_type"
function create_ps(_type) 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1728DDF8
	/// @DnDParent : 01B92604
	/// @DnDArgument : "var" "_new_particle"
	/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
	var _new_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3E274014
	/// @DnDInput : 2
	/// @DnDParent : 01B92604
	/// @DnDArgument : "function" "_new_particle.set_particle"
	/// @DnDArgument : "arg" "_type"
	/// @DnDArgument : "arg_1" ""StageBackEffects""
	_new_particle.set_particle(_type, "StageBackEffects");

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 72C9D947
	/// @DnDParent : 01B92604
	/// @DnDArgument : "function" "_new_particle.set_angle"
	/// @DnDArgument : "arg" "tilt"
	_new_particle.set_angle(tilt);
}