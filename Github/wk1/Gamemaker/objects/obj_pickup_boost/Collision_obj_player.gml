/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 36F36D1B
/// @DnDComment : // Sets the player to boosting
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "obj_player.is_boosting"
obj_player.is_boosting = true;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3C34E6DF
/// @DnDComment : // Adds time to the player booter cooldown
/// @DnDArgument : "expr" "5"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "obj_player.boost_cooldown"
obj_player.boost_cooldown += 5;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 43ACBE13
/// @DnDComment : // Creates and sets a new particle handler object with the power up collected particle effect attached to the player
/// @DnDArgument : "var" "_new_aura_particle"
/// @DnDArgument : "value" "instance_create_layer(other.x, other.y, "Stage", obj_particle_manager)"
var _new_aura_particle = instance_create_layer(other.x, other.y, "Stage", obj_particle_manager);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4124CFF4
/// @DnDArgument : "expr" "other"
/// @DnDArgument : "var" "_new_aura_particle.owner"
_new_aura_particle.owner = other;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 5C086A41
/// @DnDInput : 2
/// @DnDArgument : "function" "_new_aura_particle.set_particle"
/// @DnDArgument : "arg" "ps_powerup_in"
/// @DnDArgument : "arg_1" ""StageFrontEffects""
_new_aura_particle.set_particle(ps_powerup_in, "StageFrontEffects");

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 4D24FD3A
/// @DnDComment : // Plays collect sound
/// @DnDArgument : "soundid" "snd_speed_bonus_collection"
/// @DnDSaveInfo : "soundid" "snd_speed_bonus_collection"
audio_play_sound(snd_speed_bonus_collection, 0, 0, 1.0, undefined, 1.0);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 5FFA6D91
/// @DnDComment : // Destroys this pickup instance
instance_destroy();