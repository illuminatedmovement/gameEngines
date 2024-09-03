/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 3EA8654E
/// @DnDComment : // Checks if the shield still has life
/// @DnDArgument : "var" "other.life"
/// @DnDArgument : "op" "2"
if(other.life > 0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 36F36D1B
	/// @DnDComment : // Adds life to the shield so it lasts longer
	/// @DnDParent : 3EA8654E
	/// @DnDArgument : "expr" "10.0"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "other.life"
	other.life += 10.0;

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 43ACBE13
	/// @DnDComment : // Creates and sets a new particle handler object with the power up collected particle effect attached to the player
	/// @DnDParent : 3EA8654E
	/// @DnDArgument : "var" "_new_aura_particle"
	/// @DnDArgument : "value" "instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager)"
	var _new_aura_particle = instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4124CFF4
	/// @DnDParent : 3EA8654E
	/// @DnDArgument : "expr" "obj_player"
	/// @DnDArgument : "var" "_new_aura_particle.owner"
	_new_aura_particle.owner = obj_player;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 5C086A41
	/// @DnDInput : 2
	/// @DnDParent : 3EA8654E
	/// @DnDArgument : "function" "_new_aura_particle.set_particle"
	/// @DnDArgument : "arg" "ps_powerup_in"
	/// @DnDArgument : "arg_1" ""StageFrontEffects""
	_new_aura_particle.set_particle(ps_powerup_in, "StageFrontEffects");

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 415ACFE0
	/// @DnDComment : // Plays collect sound
	/// @DnDParent : 3EA8654E
	/// @DnDArgument : "soundid" "snd_shield_bonus_collection"
	/// @DnDSaveInfo : "soundid" "snd_shield_bonus_collection"
	audio_play_sound(snd_shield_bonus_collection, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5FFA6D91
	/// @DnDComment : // Destroys the pickup
	/// @DnDParent : 3EA8654E
	instance_destroy();
}