/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 30E54CBA
/// @DnDComment : // Checks the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 23E661E1
	/// @DnDComment : // Set delta time for movements that are time based.
	/// @DnDParent : 30E54CBA
	/// @DnDArgument : "var" "_delta_time"
	/// @DnDArgument : "value" "delta_time * 0.000001"
	var _delta_time = delta_time * 0.000001;

	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 11177C85
	/// @DnDComment : // Change logic depending on the current game state.
	/// @DnDParent : 30E54CBA
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state"
	var l11177C85_0 = obj_game_manager.current_game_state;
	switch(l11177C85_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 5656B3D8
		/// @DnDComment : // Logic for while the game is playing.
		/// @DnDParent : 11177C85
		/// @DnDArgument : "const" "GAME_STATE.PLAYING"
		case GAME_STATE.PLAYING:
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 64182E77
			/// @DnDComment : // Sets up temp variable for gamepad jump state
			/// @DnDParent : 5656B3D8
			/// @DnDArgument : "var" "_gamepad_jump"
			/// @DnDArgument : "value" "false"
			var _gamepad_jump = false;
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 4A1780B0
			/// @DnDComment : // Checks when gamepad with id 0 (player 1) is connected
			/// @DnDParent : 5656B3D8
			/// @DnDArgument : "expr" "gamepad_is_connected(0)"
			if(gamepad_is_connected(0))
			{
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 61B5BB6C
				/// @DnDComment : // Checks for jump button press
				/// @DnDParent : 4A1780B0
				/// @DnDArgument : "expr" "gamepad_button_check(0, gp_face1)"
				if(gamepad_button_check(0, gp_face1))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 33A285B4
					/// @DnDComment : // Sets variable to true
					/// @DnDParent : 61B5BB6C
					/// @DnDArgument : "expr" "true"
					/// @DnDArgument : "var" "_gamepad_jump"
					_gamepad_jump = true;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 0F434918
			/// @DnDComment : // Checks for jump inputs
			/// @DnDParent : 5656B3D8
			/// @DnDArgument : "expr" "keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump"
			if(keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3437EAC0
				/// @DnDComment : // Sets has jumped state to true
				/// @DnDParent : 0F434918
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "has_jumped"
				has_jumped = true;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 1D5FD0C6
				/// @DnDComment : // Addes jump values to y velocity
				/// @DnDParent : 0F434918
				/// @DnDArgument : "expr" "jump_strength * _delta_time"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "y_velo"
				y_velo += jump_strength * _delta_time;
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 6529D951
				/// @DnDComment : // Checks the player is curretly running
				/// @DnDParent : 0F434918
				/// @DnDArgument : "expr" "current_player_state == PLAYER_STATE.RUN"
				if(current_player_state == PLAYER_STATE.RUN)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 70652506
					/// @DnDComment : // Sets the player to idle state
					/// @DnDParent : 6529D951
					/// @DnDArgument : "expr" "PLAYER_STATE.IDLE"
					/// @DnDArgument : "var" "current_player_state"
					current_player_state = PLAYER_STATE.IDLE;
				
					/// @DnDAction : YoYo Games.Instances.Set_Sprite
					/// @DnDVersion : 1
					/// @DnDHash : 08320168
					/// @DnDComment : // Changes the sprite and image index
					/// @DnDParent : 6529D951
					/// @DnDArgument : "spriteind" "spr_character_idle"
					/// @DnDSaveInfo : "spriteind" "spr_character_idle"
					sprite_index = spr_character_idle;
					image_index = 0;
				
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 77A191EF
					/// @DnDComment : // Creates and sets up particle object for inital jump flame
					/// @DnDParent : 6529D951
					/// @DnDArgument : "var" "_new_flame_particle"
					/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
					var _new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 14D897F0
					/// @DnDInput : 2
					/// @DnDParent : 6529D951
					/// @DnDArgument : "function" "_new_flame_particle.set_particle"
					/// @DnDArgument : "arg" "ps_inital_jump_flame"
					/// @DnDArgument : "arg_1" ""StageBackEffects""
					_new_flame_particle.set_particle(ps_inital_jump_flame, "StageBackEffects");
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 44C05537
					/// @DnDInput : 2
					/// @DnDParent : 6529D951
					/// @DnDArgument : "function" "_new_flame_particle.set_offset"
					/// @DnDArgument : "arg" "0"
					/// @DnDArgument : "arg_1" "100"
					_new_flame_particle.set_offset(0, 100);
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 1CD01CB5
					/// @DnDInput : 2
					/// @DnDParent : 6529D951
					/// @DnDArgument : "expr_1" "0.05"
					/// @DnDArgument : "var" "_new_flame_particle.move_rate"
					/// @DnDArgument : "var_1" "_new_flame_particle.drag_rate"
					_new_flame_particle.move_rate = 0;
					_new_flame_particle.drag_rate = 0.05;
				
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 37333319
					/// @DnDComment : // Creates and sets up particle effect for intial jump dust cloud effect
					/// @DnDParent : 6529D951
					/// @DnDArgument : "var" "_dust_particle"
					/// @DnDArgument : "value" "instance_create_layer(x, y + 80, "Stage", obj_particle_manager)"
					var _dust_particle = instance_create_layer(x, y + 80, "Stage", obj_particle_manager);
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 663759DE
					/// @DnDInput : 2
					/// @DnDParent : 6529D951
					/// @DnDArgument : "function" "_dust_particle.set_particle"
					/// @DnDArgument : "arg" "ps_dust_small"
					/// @DnDArgument : "arg_1" ""StageFrontEffects""
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 7D1B7137
					/// @DnDInput : 2
					/// @DnDParent : 6529D951
					/// @DnDArgument : "expr_1" "0.05"
					/// @DnDArgument : "var" "_dust_particle.move_rate"
					/// @DnDArgument : "var_1" "_dust_particle.drag_rate"
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.05;
				}
			
				/// @DnDAction : YoYo Games.Common.Else
				/// @DnDVersion : 1
				/// @DnDHash : 7B7B7A6B
				/// @DnDParent : 0F434918
				else
				{
					/// @DnDAction : YoYo Games.Common.If_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 7F5C0A9F
					/// @DnDComment : // Checks if the y velocity is greater than the jump threshold (Stronger jump effect)
					/// @DnDParent : 7B7B7A6B
					/// @DnDArgument : "var" "y_velo"
					/// @DnDArgument : "op" "2"
					/// @DnDArgument : "value" "jump_threshold"
					if(y_velo > jump_threshold)
					{
						/// @DnDAction : YoYo Games.Common.Variable
						/// @DnDVersion : 1
						/// @DnDHash : 0BE16822
						/// @DnDComment : // Sets the state to fly big
						/// @DnDParent : 7F5C0A9F
						/// @DnDArgument : "expr" "PLAYER_STATE.FLY_BIG"
						/// @DnDArgument : "var" "current_player_state"
						current_player_state = PLAYER_STATE.FLY_BIG;
					
						/// @DnDAction : YoYo Games.Instances.Set_Sprite
						/// @DnDVersion : 1
						/// @DnDHash : 544AE7EE
						/// @DnDComment : // Resets the player sprite
						/// @DnDParent : 7F5C0A9F
						/// @DnDArgument : "imageind_relative" "1"
						/// @DnDArgument : "spriteind" "spr_character_idle"
						/// @DnDSaveInfo : "spriteind" "spr_character_idle"
						sprite_index = spr_character_idle;
						image_index += 0;
					}
				
					/// @DnDAction : YoYo Games.Common.Else
					/// @DnDVersion : 1
					/// @DnDHash : 221DA706
					/// @DnDParent : 7B7B7A6B
					else
					{
						/// @DnDAction : YoYo Games.Common.Variable
						/// @DnDVersion : 1
						/// @DnDHash : 1928DAAA
						/// @DnDComment : // Sets the state to fly small
						/// @DnDParent : 221DA706
						/// @DnDArgument : "expr" "PLAYER_STATE.FLY_SMALL"
						/// @DnDArgument : "var" "current_player_state"
						current_player_state = PLAYER_STATE.FLY_SMALL;
					
						/// @DnDAction : YoYo Games.Instances.Set_Sprite
						/// @DnDVersion : 1
						/// @DnDHash : 1FA0B3DE
						/// @DnDComment : // Resets the player sprite
						/// @DnDParent : 221DA706
						/// @DnDArgument : "imageind_relative" "1"
						/// @DnDArgument : "spriteind" "spr_character_idle"
						/// @DnDSaveInfo : "spriteind" "spr_character_idle"
						sprite_index = spr_character_idle;
						image_index += 0;
					}
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 3FF8C32F
			/// @DnDParent : 5656B3D8
			else
			{
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 70ADEF20
				/// @DnDComment : // Checks if the player is in air
				/// @DnDParent : 3FF8C32F
				/// @DnDArgument : "var" "y"
				/// @DnDArgument : "op" "1"
				/// @DnDArgument : "value" "ystart"
				if(y < ystart)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 2EF72A3D
					/// @DnDComment : // Sets the state to released (falling)
					/// @DnDParent : 70ADEF20
					/// @DnDArgument : "expr" "PLAYER_STATE.FLY_RELEASED"
					/// @DnDArgument : "var" "current_player_state"
					current_player_state = PLAYER_STATE.FLY_RELEASED;
				
					/// @DnDAction : YoYo Games.Instances.Set_Sprite
					/// @DnDVersion : 1
					/// @DnDHash : 736BC024
					/// @DnDComment : // Resets the player sprite
					/// @DnDParent : 70ADEF20
					/// @DnDArgument : "imageind_relative" "1"
					/// @DnDArgument : "spriteind" "spr_character_idle"
					/// @DnDSaveInfo : "spriteind" "spr_character_idle"
					sprite_index = spr_character_idle;
					image_index += 0;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 6098710F
			/// @DnDComment : // Checks if the player is boosting
			/// @DnDParent : 5656B3D8
			/// @DnDArgument : "expr" "is_boosting"
			if(is_boosting)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 52600A07
				/// @DnDComment : // Sets the games target speed to 100%
				/// @DnDParent : 6098710F
				/// @DnDArgument : "expr" "1.0"
				/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
				obj_game_manager.target_speed_percentage = 1.0;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 66F53A71
				/// @DnDComment : // Reduces booster cooldown
				/// @DnDParent : 6098710F
				/// @DnDArgument : "expr" "-_delta_time"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "boost_cooldown"
				boost_cooldown += -_delta_time;
			
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3B493B47
				/// @DnDComment : // Checks if cooldown has expired
				/// @DnDParent : 6098710F
				/// @DnDArgument : "var" "boost_cooldown"
				/// @DnDArgument : "op" "3"
				if(boost_cooldown <= 0)
				{
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 0A4F3247
					/// @DnDComment : // Creates particle effect object for booster off effect
					/// @DnDParent : 3B493B47
					/// @DnDArgument : "var" "_new_aura_particle"
					/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
					var _new_aura_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 379C535A
					/// @DnDParent : 3B493B47
					/// @DnDArgument : "expr" "self"
					/// @DnDArgument : "var" "_new_aura_particle.owner"
					_new_aura_particle.owner = self;
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 09AFF3DD
					/// @DnDComment : // Creates particle effect object for booster off effect
					/// @DnDInput : 2
					/// @DnDParent : 3B493B47
					/// @DnDArgument : "function" "_new_aura_particle.set_particle"
					/// @DnDArgument : "arg" "ps_powerup_out"
					/// @DnDArgument : "arg_1" ""StageFrontEffects""
					_new_aura_particle.set_particle(ps_powerup_out, "StageFrontEffects");
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 055EA18B
					/// @DnDComment : // Sets boosting state to false$(13_10)// Resets the cooldown
					/// @DnDInput : 2
					/// @DnDParent : 3B493B47
					/// @DnDArgument : "expr" "false"
					/// @DnDArgument : "var" "is_boosting"
					/// @DnDArgument : "var_1" "boost_cooldown"
					is_boosting = false;
					boost_cooldown = 0;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 0AFD858D
			/// @DnDParent : 5656B3D8
			else
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3A58252A
				/// @DnDComment : // Sets the target spped to 50% (Normal speed)
				/// @DnDParent : 0AFD858D
				/// @DnDArgument : "expr" "0.5"
				/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
				obj_game_manager.target_speed_percentage = 0.5;
			}
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 67149F19
		/// @DnDParent : 11177C85
		/// @DnDArgument : "const" "GAME_STATE.DYING"
		case GAME_STATE.DYING:
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 2F9D19CD
			/// @DnDComment : // Checks if the player hasnt already died
			/// @DnDParent : 67149F19
			/// @DnDArgument : "expr" "current_player_state != PLAYER_STATE.DEATH"
			if(current_player_state != PLAYER_STATE.DEATH)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 0FAF8027
				/// @DnDComment : // Sets the player to dead
				/// @DnDParent : 2F9D19CD
				/// @DnDArgument : "expr" "PLAYER_STATE.DEATH"
				/// @DnDArgument : "var" "current_player_state"
				current_player_state = PLAYER_STATE.DEATH;
			
				/// @DnDAction : YoYo Games.Instances.Set_Sprite
				/// @DnDVersion : 1
				/// @DnDHash : 1F7298C7
				/// @DnDComment : // Changes the sprite$(13_10)// Resets the image index
				/// @DnDParent : 2F9D19CD
				/// @DnDArgument : "spriteind" "spr_character_death"
				/// @DnDSaveInfo : "spriteind" "spr_character_death"
				sprite_index = spr_character_death;
				image_index = 0;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 70F7297D
				/// @DnDComment : // Sets the target speed to 0 and stop
				/// @DnDParent : 2F9D19CD
				/// @DnDArgument : "expr" "0.0"
				/// @DnDArgument : "var" "obj_game_manager.target_speed_percentage"
				obj_game_manager.target_speed_percentage = 0.0;
			}
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 1B0BD4AD
		/// @DnDParent : 11177C85
		/// @DnDArgument : "const" "GAME_STATE.TUTORIAL"
		case GAME_STATE.TUTORIAL:
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 7970C38B
			/// @DnDComment : // Checks if player can jump in tutorial yet
			/// @DnDParent : 1B0BD4AD
			/// @DnDArgument : "expr" "obj_tutorial.can_jump"
			/// @DnDArgument : "not" "1"
			if(!(obj_tutorial.can_jump))
			{
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 45A1511C
				/// @DnDComment : // Checks if the player is falling
				/// @DnDParent : 7970C38B
				/// @DnDArgument : "var" "y"
				/// @DnDArgument : "op" "1"
				/// @DnDArgument : "value" "ystart"
				if(y < ystart)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 3CAF6A78
					/// @DnDComment : // Sets player to relased state
					/// @DnDParent : 45A1511C
					/// @DnDArgument : "expr" "PLAYER_STATE.FLY_RELEASED"
					/// @DnDArgument : "var" "current_player_state"
					current_player_state = PLAYER_STATE.FLY_RELEASED;
				
					/// @DnDAction : YoYo Games.Instances.Set_Sprite
					/// @DnDVersion : 1
					/// @DnDHash : 3559EE0F
					/// @DnDComment : // Resets the player sprite
					/// @DnDParent : 45A1511C
					/// @DnDArgument : "imageind_relative" "1"
					/// @DnDArgument : "spriteind" "spr_character_idle"
					/// @DnDSaveInfo : "spriteind" "spr_character_idle"
					sprite_index = spr_character_idle;
					image_index += 0;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2DB2FB72
			/// @DnDComment : // Sets up temp jump check for tutorial gamepad controls
			/// @DnDParent : 1B0BD4AD
			/// @DnDArgument : "var" "_gamepad_jump_tutorial"
			/// @DnDArgument : "value" "false"
			var _gamepad_jump_tutorial = false;
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 2ABE972E
			/// @DnDComment : // Check gamepad 0 (player 1) is connected
			/// @DnDParent : 1B0BD4AD
			/// @DnDArgument : "expr" "gamepad_is_connected(0)"
			if(gamepad_is_connected(0))
			{
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 6C1735E8
				/// @DnDComment : // Check for jump button press
				/// @DnDParent : 2ABE972E
				/// @DnDArgument : "expr" "gamepad_button_check(0, gp_face1)"
				if(gamepad_button_check(0, gp_face1))
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 3D0DF8D2
					/// @DnDComment : // Set state for temp variable to true
					/// @DnDParent : 6C1735E8
					/// @DnDArgument : "expr" "true"
					/// @DnDArgument : "var" "_gamepad_jump_tutorial"
					_gamepad_jump_tutorial = true;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 34BA6373
			/// @DnDComment : // Check if keyboard, mouse or gamepad has jumped
			/// @DnDParent : 1B0BD4AD
			/// @DnDArgument : "expr" "keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump_tutorial"
			if(keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump_tutorial)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5AC63419
				/// @DnDComment : // Set has jumped variable to true
				/// @DnDParent : 34BA6373
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "has_jumped"
				has_jumped = true;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 38A9C2BE
				/// @DnDComment : // Add jump strenght to y velosity
				/// @DnDParent : 34BA6373
				/// @DnDArgument : "expr" "jump_strength * _delta_time"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "y_velo"
				y_velo += jump_strength * _delta_time;
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 6F332998
				/// @DnDComment : // Check if player is running
				/// @DnDParent : 34BA6373
				/// @DnDArgument : "expr" "current_player_state == PLAYER_STATE.RUN"
				if(current_player_state == PLAYER_STATE.RUN)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 208B1B86
					/// @DnDComment : // Set their state to idle
					/// @DnDParent : 6F332998
					/// @DnDArgument : "expr" "PLAYER_STATE.IDLE"
					/// @DnDArgument : "var" "current_player_state"
					current_player_state = PLAYER_STATE.IDLE;
				
					/// @DnDAction : YoYo Games.Instances.Set_Sprite
					/// @DnDVersion : 1
					/// @DnDHash : 0915D627
					/// @DnDComment : // Resets the player sprite
					/// @DnDParent : 6F332998
					/// @DnDArgument : "spriteind" "spr_character_idle"
					/// @DnDSaveInfo : "spriteind" "spr_character_idle"
					sprite_index = spr_character_idle;
					image_index = 0;
				
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 0C53C12E
					/// @DnDComment : // Creates and sets up particle object for initial jump flame
					/// @DnDParent : 6F332998
					/// @DnDArgument : "var" "_new_flame_particle"
					/// @DnDArgument : "value" "instance_create_layer(x, y, "Stage", obj_particle_manager)"
					var _new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 5C55E0A4
					/// @DnDInput : 2
					/// @DnDParent : 6F332998
					/// @DnDArgument : "function" "_new_flame_particle.set_particle"
					/// @DnDArgument : "arg" "ps_inital_jump_flame"
					/// @DnDArgument : "arg_1" ""StageBackEffects""
					_new_flame_particle.set_particle(ps_inital_jump_flame, "StageBackEffects");
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 52664350
					/// @DnDInput : 2
					/// @DnDParent : 6F332998
					/// @DnDArgument : "function" "_new_flame_particle.set_offset"
					/// @DnDArgument : "arg" "0"
					/// @DnDArgument : "arg_1" "100"
					_new_flame_particle.set_offset(0, 100);
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 1E4CA92B
					/// @DnDInput : 2
					/// @DnDParent : 6F332998
					/// @DnDArgument : "expr_1" "0.05"
					/// @DnDArgument : "var" "_new_flame_particle.move_rate"
					/// @DnDArgument : "var_1" "_new_flame_particle.drag_rate"
					_new_flame_particle.move_rate = 0;
					_new_flame_particle.drag_rate = 0.05;
				
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 1B9E4BFA
					/// @DnDComment : // Creates and sets up particle effect for initial jump dust cloud effect
					/// @DnDParent : 6F332998
					/// @DnDArgument : "var" "_dust_particle"
					/// @DnDArgument : "value" "instance_create_layer(x, y + 80, "Stage", obj_particle_manager)"
					var _dust_particle = instance_create_layer(x, y + 80, "Stage", obj_particle_manager);
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 439FCD34
					/// @DnDInput : 2
					/// @DnDParent : 6F332998
					/// @DnDArgument : "function" "_dust_particle.set_particle"
					/// @DnDArgument : "arg" "ps_dust_small"
					/// @DnDArgument : "arg_1" ""StageFrontEffects""
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 15BB286F
					/// @DnDInput : 2
					/// @DnDParent : 6F332998
					/// @DnDArgument : "expr_1" "0.05"
					/// @DnDArgument : "var" "_dust_particle.move_rate"
					/// @DnDArgument : "var_1" "_dust_particle.drag_rate"
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.05;
				}
			
				/// @DnDAction : YoYo Games.Common.Else
				/// @DnDVersion : 1
				/// @DnDHash : 09DC85E1
				/// @DnDParent : 34BA6373
				else
				{
					/// @DnDAction : YoYo Games.Common.If_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 2619E5C3
					/// @DnDComment : // Check if vertical jump velocity is greater than the threshold
					/// @DnDParent : 09DC85E1
					/// @DnDArgument : "var" "y_velo"
					/// @DnDArgument : "op" "2"
					/// @DnDArgument : "value" "jump_threshold"
					if(y_velo > jump_threshold)
					{
						/// @DnDAction : YoYo Games.Common.Variable
						/// @DnDVersion : 1
						/// @DnDHash : 0F6C570B
						/// @DnDComment : // Set player state to big jump
						/// @DnDParent : 2619E5C3
						/// @DnDArgument : "expr" " PLAYER_STATE.FLY_BIG"
						/// @DnDArgument : "var" "current_player_state"
						current_player_state =  PLAYER_STATE.FLY_BIG;
					
						/// @DnDAction : YoYo Games.Instances.Set_Sprite
						/// @DnDVersion : 1
						/// @DnDHash : 1221DCA2
						/// @DnDComment : // Resets the player sprite
						/// @DnDParent : 2619E5C3
						/// @DnDArgument : "imageind_relative" "1"
						/// @DnDArgument : "spriteind" "spr_character_idle"
						/// @DnDSaveInfo : "spriteind" "spr_character_idle"
						sprite_index = spr_character_idle;
						image_index += 0;
					}
				
					/// @DnDAction : YoYo Games.Common.Else
					/// @DnDVersion : 1
					/// @DnDHash : 12B67686
					/// @DnDParent : 09DC85E1
					else
					{
						/// @DnDAction : YoYo Games.Common.Variable
						/// @DnDVersion : 1
						/// @DnDHash : 763C6618
						/// @DnDComment : // Set player state to small jump
						/// @DnDParent : 12B67686
						/// @DnDArgument : "expr" " PLAYER_STATE.FLY_SMALL"
						/// @DnDArgument : "var" "current_player_state"
						current_player_state =  PLAYER_STATE.FLY_SMALL;
					
						/// @DnDAction : YoYo Games.Instances.Set_Sprite
						/// @DnDVersion : 1
						/// @DnDHash : 24B21669
						/// @DnDComment : // Resets the player sprite
						/// @DnDParent : 12B67686
						/// @DnDArgument : "imageind_relative" "1"
						/// @DnDArgument : "spriteind" "spr_character_idle"
						/// @DnDSaveInfo : "spriteind" "spr_character_idle"
						sprite_index = spr_character_idle;
						image_index += 0;
					}
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 5C6F07A8
			/// @DnDParent : 1B0BD4AD
			else
			{
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 44FECDAE
				/// @DnDComment : // Check if player is in air
				/// @DnDParent : 5C6F07A8
				/// @DnDArgument : "var" "y"
				/// @DnDArgument : "op" "1"
				/// @DnDArgument : "value" "ystart"
				if(y < ystart)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 174A8791
					/// @DnDComment : // Sets player to relased state
					/// @DnDParent : 44FECDAE
					/// @DnDArgument : "expr" "PLAYER_STATE.FLY_RELEASED"
					/// @DnDArgument : "var" "current_player_state"
					current_player_state = PLAYER_STATE.FLY_RELEASED;
				
					/// @DnDAction : YoYo Games.Instances.Set_Sprite
					/// @DnDVersion : 1
					/// @DnDHash : 5877AC2C
					/// @DnDComment : // Resets the player sprite
					/// @DnDParent : 44FECDAE
					/// @DnDArgument : "imageind_relative" "1"
					/// @DnDArgument : "spriteind" "spr_character_idle"
					/// @DnDSaveInfo : "spriteind" "spr_character_idle"
					sprite_index = spr_character_idle;
					image_index += 0;
				}
			}
			break;
	}

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 55B57779
	/// @DnDComment : // Checks the game is not currently paused
	/// @DnDParent : 30E54CBA
	/// @DnDArgument : "expr" "obj_game_manager.current_game_state != GAME_STATE.PAUSED"
	if(obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5360E48D
		/// @DnDComment : // Adjust velocity by gravity
		/// @DnDParent : 55B57779
		/// @DnDArgument : "expr" "-gravity_strength"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "y_velo"
		y_velo += -gravity_strength;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6BC88DE4
		/// @DnDComment : // Adds the velocity to the y position
		/// @DnDParent : 55B57779
		/// @DnDArgument : "expr" "-y_velo"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "y"
		y += -y_velo;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3AFB3A06
		/// @DnDComment : // Checks if the player is under the ground level
		/// @DnDParent : 55B57779
		/// @DnDArgument : "var" "y"
		/// @DnDArgument : "op" "2"
		/// @DnDArgument : "value" "ystart"
		if(y > ystart)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6F07FEFB
			/// @DnDComment : // Set the players y position back to ground
			/// @DnDParent : 3AFB3A06
			/// @DnDArgument : "expr" "ystart"
			/// @DnDArgument : "var" "y"
			y = ystart;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7DDCA1F1
			/// @DnDComment : // Set the vertical speed to zero
			/// @DnDParent : 3AFB3A06
			/// @DnDArgument : "expr" "0.0"
			/// @DnDArgument : "var" "y_velo"
			y_velo = 0.0;
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 65852F48
			/// @DnDComment : // Checks if the game is playing or in tutorial mode
			/// @DnDParent : 3AFB3A06
			/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING || obj_game_manager.current_game_state == GAME_STATE.TUTORIAL"
			if(obj_game_manager.current_game_state == GAME_STATE.PLAYING || obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
			{
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 4EFAC07E
				/// @DnDComment : // When the player isnt running
				/// @DnDParent : 65852F48
				/// @DnDArgument : "expr" "current_player_state != PLAYER_STATE.RUN"
				if(current_player_state != PLAYER_STATE.RUN)
				{
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 70DD300F
					/// @DnDComment : // Reset the player to run
					/// @DnDParent : 4EFAC07E
					/// @DnDArgument : "expr" "PLAYER_STATE.RUN"
					/// @DnDArgument : "var" "current_player_state"
					current_player_state = PLAYER_STATE.RUN;
				
					/// @DnDAction : YoYo Games.Instances.Set_Sprite
					/// @DnDVersion : 1
					/// @DnDHash : 12194F34
					/// @DnDComment : // Set player sprite to running sprite
					/// @DnDParent : 4EFAC07E
					/// @DnDArgument : "imageind_relative" "1"
					/// @DnDArgument : "spriteind" "spr_character_run"
					/// @DnDSaveInfo : "spriteind" "spr_character_run"
					sprite_index = spr_character_run;
					image_index += 0;
				}
			
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 413F0F16
				/// @DnDComment : // If player has jumped and isnt boosting
				/// @DnDParent : 65852F48
				/// @DnDArgument : "expr" "has_jumped && !is_boosting"
				if(has_jumped && !is_boosting)
				{
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 4D4A3002
					/// @DnDComment : // Create a particle effect at the players feet for a dust effect (jump particle effect)
					/// @DnDParent : 413F0F16
					/// @DnDArgument : "var" "_dust_particle"
					/// @DnDArgument : "value" "instance_create_layer(x, y + 90, "Stage", obj_particle_manager)"
					var _dust_particle = instance_create_layer(x, y + 90, "Stage", obj_particle_manager);
				
					/// @DnDAction : YoYo Games.Common.Function_Call
					/// @DnDVersion : 1
					/// @DnDHash : 4EEF9CB2
					/// @DnDInput : 2
					/// @DnDParent : 413F0F16
					/// @DnDArgument : "function" "_dust_particle.set_particle"
					/// @DnDArgument : "arg" "ps_dust_small"
					/// @DnDArgument : "arg_1" ""StageFrontEffects""
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 120DF4E5
					/// @DnDInput : 2
					/// @DnDParent : 413F0F16
					/// @DnDArgument : "expr_1" "0.01"
					/// @DnDArgument : "var" "_dust_particle.move_rate"
					/// @DnDArgument : "var_1" "_dust_particle.drag_rate"
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.01;
				
					/// @DnDAction : YoYo Games.Common.Variable
					/// @DnDVersion : 1
					/// @DnDHash : 029B4807
					/// @DnDComment : // Set has jumped state back to false
					/// @DnDParent : 413F0F16
					/// @DnDArgument : "expr" "false"
					/// @DnDArgument : "var" "has_jumped"
					has_jumped = false;
				}
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 244EEFD6
		/// @DnDParent : 55B57779
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6384A323
			/// @DnDComment : // If the player is above the top of the screen
			/// @DnDParent : 244EEFD6
			/// @DnDArgument : "var" "y"
			/// @DnDArgument : "op" "1"
			if(y < 0)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5C386CD9
				/// @DnDComment : // Set the player to the top of the screen
				/// @DnDParent : 6384A323
				/// @DnDArgument : "var" "y"
				y = 0;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6A857136
				/// @DnDComment : // Clear their vertical velocity
				/// @DnDParent : 6384A323
				/// @DnDArgument : "expr" "0.0"
				/// @DnDArgument : "var" "y_velo"
				y_velo = 0.0;
			}
		}
	
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 3A35964B
		/// @DnDComment : // Checks if the game is playing and the player is boosting
		/// @DnDParent : 55B57779
		/// @DnDArgument : "expr" "is_boosting && obj_game_manager.current_game_state == GAME_STATE.PLAYING"
		if(is_boosting && obj_game_manager.current_game_state == GAME_STATE.PLAYING)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0B53789D
			/// @DnDComment : // Change the player state to boosting
			/// @DnDParent : 3A35964B
			/// @DnDArgument : "expr" "PLAYER_STATE.BOOST"
			/// @DnDArgument : "var" "current_player_state"
			current_player_state = PLAYER_STATE.BOOST;
		
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 6A47FB47
			/// @DnDComment : // Sets the plater sprite to the boosting sprite
			/// @DnDParent : 3A35964B
			/// @DnDArgument : "imageind_relative" "1"
			/// @DnDArgument : "spriteind" "spr_character_boost"
			/// @DnDSaveInfo : "spriteind" "spr_character_boost"
			sprite_index = spr_character_boost;
			image_index += 0;
		}
	}
}