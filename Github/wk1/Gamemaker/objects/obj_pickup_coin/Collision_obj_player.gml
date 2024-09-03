/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 625D587D
/// @DnDComment : // Checks if the coins current sprite not collected
/// @DnDArgument : "expr" "sprite_index == spr_coin_idle"
if(sprite_index == spr_coin_idle)
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0CC25608
	/// @DnDComment : // Creates a new gui coin object
	/// @DnDParent : 625D587D
	/// @DnDArgument : "var" "_gui_coin"
	/// @DnDArgument : "value" "instance_create_layer(x, y, "StageFront", obj_coin_gui)"
	var _gui_coin = instance_create_layer(x, y, "StageFront", obj_coin_gui);

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 05FDC17F
	/// @DnDComment : // Creates a new coin particle object
	/// @DnDParent : 625D587D
	/// @DnDArgument : "var" "_coin_particle"
	/// @DnDArgument : "value" "instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager)"
	var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7FFBEFA3
	/// @DnDComment : // Sets the gui coin as the particle objects owner
	/// @DnDParent : 625D587D
	/// @DnDArgument : "expr" "_gui_coin"
	/// @DnDArgument : "var" "_coin_particle.owner"
	_coin_particle.owner = _gui_coin;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6C35D575
	/// @DnDComment : // Sets the particle object to use the coin particle effect on the layer specified
	/// @DnDInput : 2
	/// @DnDParent : 625D587D
	/// @DnDArgument : "function" "_coin_particle.set_particle"
	/// @DnDArgument : "arg" "ps_coin"
	/// @DnDArgument : "arg_1" ""StageFrontEffects""
	_coin_particle.set_particle(ps_coin, "StageFrontEffects");

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 477A2CB2
	/// @DnDComment : // Sets the gui coin object to store the particle object it is attached to
	/// @DnDParent : 625D587D
	/// @DnDArgument : "expr" "_coin_particle"
	/// @DnDArgument : "var" "_gui_coin.child_particle"
	_gui_coin.child_particle = _coin_particle;

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 04DDB29B
	/// @DnDComment : // Plays collect sound
	/// @DnDParent : 625D587D
	/// @DnDArgument : "soundid" "snd_coin_collection"
	/// @DnDSaveInfo : "soundid" "snd_coin_collection"
	audio_play_sound(snd_coin_collection, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 2977C263
	/// @DnDComment : // Destroys this coin since it was collected
	/// @DnDParent : 625D587D
	instance_destroy();
}