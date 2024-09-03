/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 4F3A3AB2
/// @DnDComment : // Checks if the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 19A2A31D
	/// @DnDComment : // Sets the shield position to the players positions
	/// @DnDInput : 2
	/// @DnDParent : 4F3A3AB2
	/// @DnDArgument : "expr" "obj_player.x"
	/// @DnDArgument : "expr_1" "obj_player.y"
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "var_1" "y"
	x = obj_player.x;
	y = obj_player.y;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 27D7D8DB
	/// @DnDComment : // Reduce the shields life by time passed
	/// @DnDParent : 4F3A3AB2
	/// @DnDArgument : "expr" "-(delta_time * 0.000001)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "life"
	life += -(delta_time * 0.000001);

	/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 4FF819AA
	/// @DnDComment : // Sets the image to lerp towards visible state
	/// @DnDParent : 4F3A3AB2
	/// @DnDArgument : "alpha" "lerp(image_alpha, 1.0, 0.1)"
	image_alpha = lerp(image_alpha, 1.0, 0.1);

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 303DCDF1
	/// @DnDComment : // Checks the life values to know if pulsing should be enabled
	/// @DnDParent : 4F3A3AB2
	/// @DnDArgument : "expr" "life > 0 && life < 2"
	if(life > 0 && life < 2)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 28185B5F
		/// @DnDComment : // Sets pulsing state
		/// @DnDParent : 303DCDF1
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "can_pulse"
		can_pulse = true;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 143E9041
	/// @DnDParent : 4F3A3AB2
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 79C5A583
		/// @DnDComment : // Unsets pulsing state as more life may have been added
		/// @DnDParent : 143E9041
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "var" "can_pulse"
		can_pulse = false;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 1701C23B
	/// @DnDComment : // Checks if shield is dead but not set to dead yet
	/// @DnDParent : 4F3A3AB2
	/// @DnDArgument : "expr" "life <= 0 && sprite_index != spr_shield_off"
	if(life <= 0 && sprite_index != spr_shield_off)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1FAD71EB
		/// @DnDComment : // Creates power up out effect
		/// @DnDParent : 1701C23B
		/// @DnDArgument : "var" "_new_aura_particle"
		/// @DnDArgument : "value" "instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager)"
		var _new_aura_particle = instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6DB57E16
		/// @DnDParent : 1701C23B
		/// @DnDArgument : "expr" "obj_player"
		/// @DnDArgument : "var" "_new_aura_particle.owner"
		_new_aura_particle.owner = obj_player;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 20B33FF6
		/// @DnDInput : 2
		/// @DnDParent : 1701C23B
		/// @DnDArgument : "function" "_new_aura_particle.set_particle"
		/// @DnDArgument : "arg" "ps_powerup_out"
		/// @DnDArgument : "arg_1" ""StageFrontEffects""
		_new_aura_particle.set_particle(ps_powerup_out, "StageFrontEffects");
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 45ECC261
		/// @DnDComment : // Sets sprite to off sprite
		/// @DnDParent : 1701C23B
		/// @DnDArgument : "spriteind" "spr_shield_off"
		/// @DnDSaveInfo : "spriteind" "spr_shield_off"
		sprite_index = spr_shield_off;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 3C4B760E
		/// @DnDComment : // Sets the gain of shield sound to off
		/// @DnDParent : 1701C23B
		/// @DnDArgument : "sound" "shield_sound"
		/// @DnDArgument : "volume" "0"
		audio_sound_gain(shield_sound, 0, 0);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 1DB39AE9
		/// @DnDComment : // Plays shield break sound
		/// @DnDParent : 1701C23B
		/// @DnDArgument : "soundid" "snd_shield_deactivated"
		/// @DnDSaveInfo : "soundid" "snd_shield_deactivated"
		audio_play_sound(snd_shield_deactivated, 0, 0, 1.0, undefined, 1.0);
	}

	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1538D7DB
	/// @DnDComment : // Plays animation speed normally
	/// @DnDParent : 4F3A3AB2
	image_speed = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 6DB0D011
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 3F85B8B9
	/// @DnDComment : // Pauses animation speed
	/// @DnDParent : 6DB0D011
	/// @DnDArgument : "speed" "0"
	image_speed = 0;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 31E07E74
/// @DnDArgument : "expr" "sprite_index != spr_shield_off"
if(sprite_index != spr_shield_off)
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 3AD391EB
	/// @DnDParent : 31E07E74
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
	if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 068F227A
		/// @DnDComment : // Sets the gain of shield sound to on
		/// @DnDParent : 3AD391EB
		/// @DnDArgument : "sound" "shield_sound"
		audio_sound_gain(shield_sound, 1, 0);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 33AFA9E8
	/// @DnDParent : 31E07E74
	else
	{
		/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
		/// @DnDVersion : 1.1
		/// @DnDHash : 729ED91E
		/// @DnDComment : // Sets the gain of shield sound to off
		/// @DnDParent : 33AFA9E8
		/// @DnDArgument : "sound" "shield_sound"
		/// @DnDArgument : "volume" "0"
		audio_sound_gain(shield_sound, 0, 0);
	}
}