/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 68A085BF
/// @DnDComment : // Checks if the chest is still in idle state and not collected
/// @DnDArgument : "expr" "is_idle"
if(is_idle)
{
	/// @DnDAction : YoYo Games.Audio.Stop_Audio
	/// @DnDVersion : 1
	/// @DnDHash : 18D9A77B
	/// @DnDComment : // Stops chest idle sound
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "soundid" "chest_sound"
	audio_stop_sound(chest_sound);

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 13646CC5
	/// @DnDComment : // Plays chest collected sound
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "soundid" "snd_coin_chest_collection"
	/// @DnDSaveInfo : "soundid" "snd_coin_chest_collection"
	audio_play_sound(snd_coin_chest_collection, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 211FCDC0
	/// @DnDComment : // Sets idle state to false since collected
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "is_idle"
	is_idle = false;

	/// @DnDAction : YoYo Games.Sequences.Sequence_Destroy
	/// @DnDVersion : 1
	/// @DnDHash : 0AE5E634
	/// @DnDComment : // Destroys the sequence associated
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "var" "sequence_body.set_sequence"
	layer_sequence_destroy(sequence_body.set_sequence);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 46C6ECA2
	/// @DnDComment : // Destroys the bodys sequence object
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "function" "instance_destroy"
	/// @DnDArgument : "arg" "sequence_body"
	instance_destroy(sequence_body);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 74D15733
	/// @DnDComment : // Creates a new sequece manager
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "expr" "instance_create_layer(x, y, "Stage", obj_sequence_manager)"
	/// @DnDArgument : "var" "sequence_body"
	sequence_body = instance_create_layer(x, y, "Stage", obj_sequence_manager);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5F4351B7
	/// @DnDComment : // Sets the owner of the manager to this object
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "expr" "self"
	/// @DnDArgument : "var" "sequence_body.owner"
	sequence_body.owner = self;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 291DF751
	/// @DnDComment : // Creates a new sequence to this chest breaking for the manager object
	/// @DnDInput : 2
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "function" "sequence_body.create_seq"
	/// @DnDArgument : "arg" "seq_chest_breaking"
	/// @DnDArgument : "arg_1" ""Stage""
	sequence_body.create_seq(seq_chest_breaking, "Stage");

	/// @DnDAction : YoYo Games.Common.Function
	/// @DnDVersion : 1
	/// @DnDHash : 4EF1E1FF
	/// @DnDComment : // New temp function to be called after the chest breaking sequence ends
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "funcName" "_new_function"
	/// @DnDArgument : "temp" "1"
	var _new_function = function() 
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 3312F2DA
		/// @DnDComment : // Destroys this object
		/// @DnDParent : 4EF1E1FF
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 68AC478C
	/// @DnDComment : // Creates new chest blast particle object
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "var" "_blast_particle"
	/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
	var _blast_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 7B66735F
	/// @DnDComment : // Sets objects particle effect and layer target
	/// @DnDInput : 2
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "function" "_blast_particle.set_particle"
	/// @DnDArgument : "arg" "ps_chest_blast"
	/// @DnDArgument : "arg_1" ""StageBackEffects""
	_blast_particle.set_particle(ps_chest_blast, "StageBackEffects");

	/// @DnDAction : YoYo Games.Loops.For_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 0A2CF671
	/// @DnDComment : // Loops through for loop for horizontal positions
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "init" "_i = 0"
	/// @DnDArgument : "init_temp" "1"
	/// @DnDArgument : "cond" "_i < 5"
	/// @DnDArgument : "expr" "_i += 1"
	for(var _i = 0; _i < 5; _i += 1) {
		/// @DnDAction : YoYo Games.Loops.For_Loop
		/// @DnDVersion : 1
		/// @DnDHash : 5722B9C0
		/// @DnDComment : // Loops through for loop for virtical positions
		/// @DnDParent : 0A2CF671
		/// @DnDArgument : "init" "_j = 0"
		/// @DnDArgument : "init_temp" "1"
		/// @DnDArgument : "cond" "_j < 2"
		/// @DnDArgument : "expr" "_j+= 1"
		for(var _j = 0; _j < 2; _j+= 1) {
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2B407B72
			/// @DnDComment : // Creates new coin gui object
			/// @DnDParent : 5722B9C0
			/// @DnDArgument : "var" "_gui_coin"
			/// @DnDArgument : "value" "instance_create_layer(x - 75 + (150 / 4) * (_i), y - 25 + _j * 50, "StageFront", obj_coin_gui)"
			var _gui_coin = instance_create_layer(x - 75 + (150 / 4) * (_i), y - 25 + _j * 50, "StageFront", obj_coin_gui);
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 41DE09E5
			/// @DnDComment : // Creates new coin particle object
			/// @DnDParent : 5722B9C0
			/// @DnDArgument : "var" "_coin_particle"
			/// @DnDArgument : "value" "instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager)"
			var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 00DB97C8
			/// @DnDComment : // Sets the particle objects parent to the gui coin
			/// @DnDParent : 5722B9C0
			/// @DnDArgument : "expr" "_gui_coin"
			/// @DnDArgument : "var" "_coin_particle.owner"
			_coin_particle.owner = _gui_coin;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 0CB9AD0C
			/// @DnDComment : // Sets objects particle effect and layer target
			/// @DnDInput : 2
			/// @DnDParent : 5722B9C0
			/// @DnDArgument : "function" "_coin_particle.set_particle"
			/// @DnDArgument : "arg" "ps_coin"
			/// @DnDArgument : "arg_1" ""StageBackEffects""
			_coin_particle.set_particle(ps_coin, "StageBackEffects");
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 732B607C
			/// @DnDComment : // Sets the gui coins child object as the new particle
			/// @DnDParent : 5722B9C0
			/// @DnDArgument : "expr" "_coin_particle"
			/// @DnDArgument : "var" "_gui_coin.child_particle"
			_gui_coin.child_particle = _coin_particle;
		}
	}

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 75F693EB
	/// @DnDComment : // Sets self as a temporary variable
	/// @DnDParent : 68A085BF
	/// @DnDArgument : "var" "_chest"
	/// @DnDArgument : "value" "self"
	var _chest = self;

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 4CE1A722
	/// @DnDComment : // Loops though the shadow objects within the room
	/// @DnDApplyTo : {obj_shadow}
	/// @DnDParent : 68A085BF
	with(obj_shadow) {
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 097E26A0
		/// @DnDComment : // Loops though the shadow objects within the room
		/// @DnDParent : 4CE1A722
		/// @DnDArgument : "expr" "owner == _chest"
		if(owner == _chest)
		{
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 233E65A1
			/// @DnDComment : // Creates a fade out for the shadow
			/// @DnDParent : 097E26A0
			/// @DnDArgument : "function" "fade_out"
			/// @DnDArgument : "arg" "0.33"
			fade_out(0.33);
		}
	}
}