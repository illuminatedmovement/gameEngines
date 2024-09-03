/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 03AA362A
/// @DnDComment : //// Spawn Manager Object.$(13_10)// This object is used to control spawning objects when needed.$(13_10)// Cooldown variables
/// @DnDInput : 3
/// @DnDArgument : "expr_1" "50"
/// @DnDArgument : "expr_2" "100"
/// @DnDArgument : "var" "spawn_cooldown"
/// @DnDArgument : "var_1" "powerup_cooldown"
/// @DnDArgument : "var_2" "enemy_cooldown"
spawn_cooldown = 0;
powerup_cooldown = 50;
enemy_cooldown = 100;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 57F024C1
/// @DnDComment : // Spawns random enemy
/// @DnDArgument : "funcName" "spawn_enemy"
function spawn_enemy() 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1E024028
	/// @DnDComment : // Sets the x position enemy will be spawned on
	/// @DnDParent : 57F024C1
	/// @DnDArgument : "var" "_spawn_x"
	/// @DnDArgument : "value" "room_width * 2"
	var _spawn_x = room_width * 2;

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5F183A0F
	/// @DnDComment : // Randomised value of what type of enemy will spawn
	/// @DnDParent : 57F024C1
	/// @DnDArgument : "var" "_type"
	/// @DnDArgument : "value" "irandom(2)"
	var _type = irandom(2);

	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 01006D7D
	/// @DnDComment : // Switch statement of available types$(13_10)// Creates new enemy and updates cooldown based on distance needed
	/// @DnDParent : 57F024C1
	/// @DnDArgument : "expr" "_type"
	var l01006D7D_0 = _type;
	switch(l01006D7D_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 72801A82
		/// @DnDComment : // Beam high
		/// @DnDParent : 01006D7D
		case 0:
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 45480A29
			/// @DnDParent : 72801A82
			/// @DnDArgument : "xpos" "_spawn_x + 59"
			/// @DnDArgument : "ypos" "230"
			/// @DnDArgument : "objectid" "obj_beam"
			/// @DnDArgument : "layer" ""Stage""
			/// @DnDSaveInfo : "objectid" "obj_beam"
			instance_create_layer(_spawn_x + 59, 230, "Stage", obj_beam);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6ACE2049
			/// @DnDParent : 72801A82
			/// @DnDArgument : "expr" "10 + 1.8"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 1.8;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 0FB976DA
		/// @DnDComment : // Beam low
		/// @DnDParent : 01006D7D
		/// @DnDArgument : "const" "1"
		case 1:
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 0CCDF70D
			/// @DnDParent : 0FB976DA
			/// @DnDArgument : "xpos" "_spawn_x + 59"
			/// @DnDArgument : "ypos" "720"
			/// @DnDArgument : "objectid" "obj_beam"
			/// @DnDArgument : "layer" ""Stage""
			/// @DnDSaveInfo : "objectid" "obj_beam"
			instance_create_layer(_spawn_x + 59, 720, "Stage", obj_beam);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 6F6DAC1D
			/// @DnDParent : 0FB976DA
			/// @DnDArgument : "expr" "10 + 1.8"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 1.8;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 03024BCF
		/// @DnDComment : // Normal enemy
		/// @DnDParent : 01006D7D
		/// @DnDArgument : "const" "2"
		case 2:
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 53276F89
			/// @DnDParent : 03024BCF
			/// @DnDArgument : "xpos" "_spawn_x + 204"
			/// @DnDArgument : "ypos" "800"
			/// @DnDArgument : "objectid" "obj_enemy"
			/// @DnDArgument : "layer" ""Stage""
			/// @DnDSaveInfo : "objectid" "obj_enemy"
			instance_create_layer(_spawn_x + 204, 800, "Stage", obj_enemy);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 46D866C9
			/// @DnDParent : 03024BCF
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 0;
			break;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 17004D04
	/// @DnDComment : // Sets the enemy cooldown to a value between 200 and 75 calulated on the current level (More enemies the more gold collected)
	/// @DnDParent : 57F024C1
	/// @DnDArgument : "expr" "250 - (50 * clamp((obj_game_manager.current_level / 2), 1, 3.5))"
	/// @DnDArgument : "var" "enemy_cooldown"
	enemy_cooldown = 250 - (50 * clamp((obj_game_manager.current_level / 2), 1, 3.5));
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3B5287F8
/// @DnDComment : // Spawns random powerup
/// @DnDArgument : "funcName" "spawn_powerup"
function spawn_powerup() 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 279EAE35
	/// @DnDComment : // Sets the x and y coordinates for powerup drop$(13_10)	// Y values are preset and chosen at random
	/// @DnDInput : 2
	/// @DnDParent : 3B5287F8
	/// @DnDArgument : "var" "_spawn_x"
	/// @DnDArgument : "value" "room_width * 2"
	/// @DnDArgument : "var_1" "_new_y"
	/// @DnDArgument : "value_1" "choose(140, 315, 490, 665, 840)"
	var _spawn_x = room_width * 2;
	var _new_y = choose(140, 315, 490, 665, 840);

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 233F3F7E
	/// @DnDComment : // Creates instance choosing a random type
	/// @DnDParent : 3B5287F8
	/// @DnDArgument : "xpos" "_spawn_x + 92"
	/// @DnDArgument : "ypos" "_new_y"
	/// @DnDArgument : "objectid" "choose(obj_pickup_boost, obj_pickup_shield)"
	/// @DnDArgument : "layer" ""Stage""
	instance_create_layer(_spawn_x + 92, _new_y, "Stage", choose(obj_pickup_boost, obj_pickup_shield));

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 638B8EDB
	/// @DnDComment : // Resets spawn cooldown accounting for offset
	/// @DnDParent : 3B5287F8
	/// @DnDArgument : "expr" "10 + 1.7"
	/// @DnDArgument : "var" "spawn_cooldown"
	spawn_cooldown = 10 + 1.7;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5C32C64B
	/// @DnDComment : // Resets powerup cooldown adjusting for player level (less powerups late game)
	/// @DnDParent : 3B5287F8
	/// @DnDArgument : "expr" "100 * min(obj_game_manager.current_level, 5)"
	/// @DnDArgument : "var" "powerup_cooldown"
	powerup_cooldown = 100 * min(obj_game_manager.current_level, 5);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3EB21DF1
/// @DnDComment : // Function for spawning a preset reward
/// @DnDArgument : "funcName" "spawn_reward"
/// @DnDArgument : "arg" "_reward_type"
function spawn_reward(_reward_type) 
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 762B267B
	/// @DnDComment : // Sets up new spawn coordinates with preset x value and random y initially
	/// @DnDInput : 3
	/// @DnDParent : 3EB21DF1
	/// @DnDArgument : "var" "_spawn_x"
	/// @DnDArgument : "value" "room_width * 2"
	/// @DnDArgument : "var_1" "_new_x"
	/// @DnDArgument : "value_1" "_spawn_x + 34"
	/// @DnDArgument : "var_2" "_new_y"
	/// @DnDArgument : "value_2" "random_range(100, 896)"
	var _spawn_x = room_width * 2;
	var _new_x = _spawn_x + 34;
	var _new_y = random_range(100, 896);

	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 7A1344A9
	/// @DnDComment : // Switch statement for reward types
	/// @DnDParent : 3EB21DF1
	/// @DnDArgument : "expr" "_reward_type"
	var l7A1344A9_0 = _reward_type;
	switch(l7A1344A9_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 28DFD2C2
		/// @DnDComment : // Single Coin
		/// @DnDParent : 7A1344A9
		case 0:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1EF4C99C
			/// @DnDComment : // New y value (ground level)
			/// @DnDParent : 28DFD2C2
			/// @DnDArgument : "expr" "896"
			/// @DnDArgument : "var" "_new_y"
			_new_y = 896;
		
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 31754F1C
			/// @DnDComment : // Creates instance at coordinates
			/// @DnDParent : 28DFD2C2
			/// @DnDArgument : "xpos" "_new_x"
			/// @DnDArgument : "ypos" "_new_y"
			/// @DnDArgument : "objectid" "obj_pickup_coin"
			/// @DnDArgument : "layer" ""Stage""
			/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
			instance_create_layer(_new_x, _new_y, "Stage", obj_pickup_coin);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7ADFF349
			/// @DnDComment : // Sets the spawn cooldown for offsets
			/// @DnDParent : 28DFD2C2
			/// @DnDArgument : "expr" "10 + 1"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 1;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 4AB882C1
		/// @DnDComment : // 3x3 Set Coins
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "1"
		case 1:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2EC3F36E
			/// @DnDComment : // Sets y position at random from preset coordinates
			/// @DnDParent : 4AB882C1
			/// @DnDArgument : "expr" "choose(100, 438, 776)"
			/// @DnDArgument : "var" "_new_y"
			_new_y = choose(100, 438, 776);
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 6817FE27
			/// @DnDComment : // Loops horizontally for 3
			/// @DnDParent : 4AB882C1
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 3"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 3; _i += 1) {
				/// @DnDAction : YoYo Games.Loops.For_Loop
				/// @DnDVersion : 1
				/// @DnDHash : 53C8CFA7
				/// @DnDComment : // Loops vertically for 3
				/// @DnDParent : 6817FE27
				/// @DnDArgument : "init" "_j = 0"
				/// @DnDArgument : "init_temp" "1"
				/// @DnDArgument : "cond" "_j < 3"
				/// @DnDArgument : "expr" "_j += 1"
				for(var _j = 0; _j < 3; _j += 1) {
					/// @DnDAction : YoYo Games.Instances.Create_Instance
					/// @DnDVersion : 1
					/// @DnDHash : 2BB3A896
					/// @DnDComment : // Creates coin object at new positions
					/// @DnDParent : 53C8CFA7
					/// @DnDArgument : "xpos" "_new_x + _i * 70"
					/// @DnDArgument : "ypos" "_new_y + _j * 80"
					/// @DnDArgument : "objectid" "obj_pickup_coin"
					/// @DnDArgument : "layer" ""Stage""
					/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 14B97501
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for horizontal length of segment
			/// @DnDParent : 4AB882C1
			/// @DnDArgument : "expr" "10 + 3.2"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 3.2;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 246C3988
		/// @DnDComment : // 9x2 Set Coins
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "2"
		case 2:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 132049C9
			/// @DnDComment : // Sets y position at random from preset coordinates
			/// @DnDParent : 246C3988
			/// @DnDArgument : "expr" "choose(100, 340, 580, 820)"
			/// @DnDArgument : "var" "_new_y"
			_new_y = choose(100, 340, 580, 820);
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 3E67AABA
			/// @DnDComment : // Loops horizontally for 9
			/// @DnDParent : 246C3988
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 9"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 9; _i += 1) {
				/// @DnDAction : YoYo Games.Loops.For_Loop
				/// @DnDVersion : 1
				/// @DnDHash : 69583D6D
				/// @DnDComment : // Loops vertically for 2
				/// @DnDParent : 3E67AABA
				/// @DnDArgument : "init" "_j = 0"
				/// @DnDArgument : "init_temp" "1"
				/// @DnDArgument : "cond" "_j < 2"
				/// @DnDArgument : "expr" "_j += 1"
				for(var _j = 0; _j < 2; _j += 1) {
					/// @DnDAction : YoYo Games.Instances.Create_Instance
					/// @DnDVersion : 1
					/// @DnDHash : 26CE6D46
					/// @DnDComment : // Creates new object at determined position
					/// @DnDParent : 69583D6D
					/// @DnDArgument : "xpos" "_new_x + _i * 70"
					/// @DnDArgument : "ypos" "_new_y + _j * 80"
					/// @DnDArgument : "objectid" "obj_pickup_coin"
					/// @DnDArgument : "layer" ""Stage""
					/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 613EF30C
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for horizontal length of segment
			/// @DnDParent : 246C3988
			/// @DnDArgument : "expr" "10 + 9.9"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 9.9;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 1E76A502
		/// @DnDComment : // 2x9 Set Coins
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "3"
		case 3:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2662F383
			/// @DnDComment : // Sets new y position
			/// @DnDParent : 1E76A502
			/// @DnDArgument : "expr" "180"
			/// @DnDArgument : "var" "_new_y"
			_new_y = 180;
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 07720449
			/// @DnDComment : // Loops horizontally for 2
			/// @DnDParent : 1E76A502
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 2"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 2; _i += 1) {
				/// @DnDAction : YoYo Games.Loops.For_Loop
				/// @DnDVersion : 1
				/// @DnDHash : 640370DC
				/// @DnDComment : // Loops vertically for 9
				/// @DnDParent : 07720449
				/// @DnDArgument : "init" "_j = 0"
				/// @DnDArgument : "init_temp" "1"
				/// @DnDArgument : "cond" "_j < 9"
				/// @DnDArgument : "expr" "_j += 1"
				for(var _j = 0; _j < 9; _j += 1) {
					/// @DnDAction : YoYo Games.Instances.Create_Instance
					/// @DnDVersion : 1
					/// @DnDHash : 4B7A45CA
					/// @DnDComment : // Creates new coin object at set coordinates
					/// @DnDParent : 640370DC
					/// @DnDArgument : "xpos" "_new_x + _i * 70"
					/// @DnDArgument : "ypos" "_new_y + _j * 80"
					/// @DnDArgument : "objectid" "obj_pickup_coin"
					/// @DnDArgument : "layer" ""Stage""
					/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1D1C57D6
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for horizontal length of segment
			/// @DnDParent : 1E76A502
			/// @DnDArgument : "expr" "10 + 3.2"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 3.2;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 4E698B91
		/// @DnDComment : // 9x1 Wave Coins up curve
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "4"
		case 4:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1F23BE37
			/// @DnDComment : // Sets y position at random from preset positions
			/// @DnDParent : 4E698B91
			/// @DnDArgument : "expr" "choose(300, 550, 800)"
			/// @DnDArgument : "var" "_new_y"
			_new_y = choose(300, 550, 800);
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 70EE3FA4
			/// @DnDComment : // Loops horizontally for 9
			/// @DnDParent : 4E698B91
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 9"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 9; _i += 1) {
				/// @DnDAction : YoYo Games.Instances.Create_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 3810CA81
				/// @DnDComment : // Calculates position spacing using sin curve and creates instance of object
				/// @DnDParent : 70EE3FA4
				/// @DnDArgument : "xpos" "_new_x + _i * 70"
				/// @DnDArgument : "ypos" "_new_y - sin(pi / (8 / _i)) * 160"
				/// @DnDArgument : "objectid" "obj_pickup_coin"
				/// @DnDArgument : "layer" ""Stage""
				/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7F32D28D
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for horizontal length of segment
			/// @DnDParent : 4E698B91
			/// @DnDArgument : "expr" "10 + 9.9"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 9.9;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 21663D7D
		/// @DnDComment : // 9x1 Wave Coins down curve
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "5"
		case 5:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 77A45A62
			/// @DnDComment : // Picks y coordinate from 2 preset positions
			/// @DnDParent : 21663D7D
			/// @DnDArgument : "expr" "choose(350, 600)"
			/// @DnDArgument : "var" "_new_y"
			_new_y = choose(350, 600);
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 1FAEE0F9
			/// @DnDComment : // Loops horizontally for 9
			/// @DnDParent : 21663D7D
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 9"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 9; _i += 1) {
				/// @DnDAction : YoYo Games.Instances.Create_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 48214A38
				/// @DnDComment : // Calculates position spacing using sin curve and creates instance of object
				/// @DnDParent : 1FAEE0F9
				/// @DnDArgument : "xpos" "_new_x + _i * 70"
				/// @DnDArgument : "ypos" " _new_y + sin(pi / (8 / _i)) * 160"
				/// @DnDArgument : "objectid" "obj_pickup_coin"
				/// @DnDArgument : "layer" ""Stage""
				/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
				instance_create_layer(_new_x + _i * 70,  _new_y + sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 60B056DC
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for horizontal length of segment
			/// @DnDParent : 21663D7D
			/// @DnDArgument : "expr" "10 + 9.9"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 9.9;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 68675E97
		/// @DnDComment : // 17x2 Wave Coins twin curves
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "6"
		case 6:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 4D029FA8
			/// @DnDComment : // Sets middle y position
			/// @DnDParent : 68675E97
			/// @DnDArgument : "expr" "500"
			/// @DnDArgument : "var" "_new_y"
			_new_y = 500;
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 6F202093
			/// @DnDComment : // First loops one curve
			/// @DnDParent : 68675E97
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 17"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 17; _i += 1) {
				/// @DnDAction : YoYo Games.Instances.Create_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 1A1C7641
				/// @DnDComment : // Places objects with sin curve
				/// @DnDParent : 6F202093
				/// @DnDArgument : "xpos" "_new_x + _i * 70"
				/// @DnDArgument : "ypos" "_new_y + sin(pi / (8 / _i)) * 160"
				/// @DnDArgument : "objectid" "obj_pickup_coin"
				/// @DnDArgument : "layer" ""Stage""
				/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
				instance_create_layer(_new_x + _i * 70, _new_y + sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 4A7D5041
			/// @DnDComment : // Loops second curve
			/// @DnDParent : 68675E97
			/// @DnDArgument : "init" "_i = 0"
			/// @DnDArgument : "init_temp" "1"
			/// @DnDArgument : "cond" "_i < 17"
			/// @DnDArgument : "expr" "_i += 1"
			for(var _i = 0; _i < 17; _i += 1) {
				/// @DnDAction : YoYo Games.Instances.Create_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 428533F8
				/// @DnDComment : // Places objects with sin curve
				/// @DnDParent : 4A7D5041
				/// @DnDArgument : "xpos" "_new_x + _i * 70"
				/// @DnDArgument : "ypos" "_new_y - sin(pi / (8 / _i)) * 160"
				/// @DnDArgument : "objectid" "obj_pickup_coin"
				/// @DnDArgument : "layer" ""Stage""
				/// @DnDSaveInfo : "objectid" "obj_pickup_coin"
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 77D451A8
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for horizontal length of segment
			/// @DnDParent : 68675E97
			/// @DnDArgument : "expr" "10 + 18.9"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 18.9;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 14E9A5BB
		/// @DnDComment : // Chest
		/// @DnDParent : 7A1344A9
		/// @DnDArgument : "const" "7"
		case 7:
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2980BB17
			/// @DnDComment : // Sets new position for spawn coordinates (Ground Level)
			/// @DnDParent : 14E9A5BB
			/// @DnDArgument : "expr" "_spawn_x + 206"
			/// @DnDArgument : "var" "_new_x"
			_new_x = _spawn_x + 206;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 2828D04F
			/// @DnDParent : 14E9A5BB
			/// @DnDArgument : "expr" "896"
			/// @DnDArgument : "var" "_new_y"
			_new_y = 896;
		
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 774B268A
			/// @DnDComment : // Creates new chest
			/// @DnDParent : 14E9A5BB
			/// @DnDArgument : "xpos" "_new_x"
			/// @DnDArgument : "ypos" "_new_y"
			/// @DnDArgument : "objectid" "obj_chest"
			/// @DnDArgument : "layer" ""Stage""
			/// @DnDSaveInfo : "objectid" "obj_chest"
			instance_create_layer(_new_x, _new_y, "Stage", obj_chest);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7149A7C8
			/// @DnDComment : // Sets the cooldown for spawn gap with added value for chest segment length
			/// @DnDParent : 14E9A5BB
			/// @DnDArgument : "expr" "10 + 3.7"
			/// @DnDArgument : "var" "spawn_cooldown"
			spawn_cooldown = 10 + 3.7;
			break;
	}
}