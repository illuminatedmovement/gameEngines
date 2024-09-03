/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 54BC5179
/// @DnDComment : // Enum state for the interior states used
/// @DnDArgument : "code" "// Enum state for the interior states used$(13_10)enum INTERIOR_STATE$(13_10){$(13_10)	OUTSIDE,$(13_10)	ENTER,$(13_10)	INSIDE,$(13_10)	EXIT,$(13_10)	SIZE$(13_10)}"
// Enum state for the interior states used
enum INTERIOR_STATE
{
	OUTSIDE,
	ENTER,
	INSIDE,
	EXIT,
	SIZE
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 093E65CD
/// @DnDComment : // Sets the inital interior state to outside
/// @DnDArgument : "expr" "INTERIOR_STATE.OUTSIDE"
/// @DnDArgument : "var" "current_interior_state"
current_interior_state = INTERIOR_STATE.OUTSIDE;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 19E7F322
/// @DnDComment : // Sets all the environment wall, ground, pipe states to outside
/// @DnDInput : 3
/// @DnDArgument : "expr" "INTERIOR_STATE.OUTSIDE"
/// @DnDArgument : "expr_1" "INTERIOR_STATE.OUTSIDE"
/// @DnDArgument : "expr_2" "INTERIOR_STATE.OUTSIDE"
/// @DnDArgument : "var" "current_wall_state"
/// @DnDArgument : "var_1" "current_ground_state"
/// @DnDArgument : "var_2" "current_pipe_state"
current_wall_state = INTERIOR_STATE.OUTSIDE;
current_ground_state = INTERIOR_STATE.OUTSIDE;
current_pipe_state = INTERIOR_STATE.OUTSIDE;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 244A3A8B
/// @DnDComment : // Sets state for knowing when a wall has changed
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "has_wall_changed"
has_wall_changed = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5BFAF2F5
/// @DnDComment : // Count for how many walls can exist
/// @DnDArgument : "expr" "3"
/// @DnDArgument : "var" "wall_segment_count"
wall_segment_count = 3;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 56CB73DB
/// @DnDComment : // Stores the walls sprites within an array
/// @DnDInput : 5
/// @DnDArgument : "expr" "spr_wall_1"
/// @DnDArgument : "expr_1" "spr_wall_2"
/// @DnDArgument : "expr_2" "spr_wall_3"
/// @DnDArgument : "expr_3" "spr_wall_start"
/// @DnDArgument : "expr_4" "spr_wall_end"
/// @DnDArgument : "var" "wall_sprite[0]"
/// @DnDArgument : "var_1" "wall_sprite[1]"
/// @DnDArgument : "var_2" "wall_sprite[2]"
/// @DnDArgument : "var_3" "wall_sprite[3]"
/// @DnDArgument : "var_4" "wall_sprite[4]"
wall_sprite[0] = spr_wall_1;
wall_sprite[1] = spr_wall_2;
wall_sprite[2] = spr_wall_3;
wall_sprite[3] = spr_wall_start;
wall_sprite[4] = spr_wall_end;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 6C81624C
/// @DnDComment : // Prefetches the sprite array to load into system resources (prevents potential hanging when they are changed later)$(13_10)
/// @DnDArgument : "function" "sprite_prefetch_multi"
/// @DnDArgument : "arg" "wall_sprite"
sprite_prefetch_multi(wall_sprite);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 52E31F64
/// @DnDComment : // Creates an array for the set wall sprites to exist in
/// @DnDArgument : "expr" "array_create(wall_segment_count, -1)"
/// @DnDArgument : "var" "set_wall_sprites"
set_wall_sprites = array_create(wall_segment_count, -1);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 53070C07
/// @DnDComment : // Creates an array of wall coordinates
/// @DnDArgument : "expr" "array_create(wall_segment_count, 0)"
/// @DnDArgument : "var" "wall_x_coords"
wall_x_coords = array_create(wall_segment_count, 0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 11171B1C
/// @DnDComment : // Sets the y coordinate to 0
/// @DnDArgument : "var" "wall_y_coords"
wall_y_coords = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 126E7478
/// @DnDComment : // Sets the count for how many pipe segements will exist
/// @DnDArgument : "expr" "3"
/// @DnDArgument : "var" "pipe_segment_count"
pipe_segment_count = 3;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4CF22457
/// @DnDComment : // Fills an array for all the pipe sprites
/// @DnDInput : 3
/// @DnDArgument : "expr" "spr_pipe_start"
/// @DnDArgument : "expr_1" "spr_pipe_mid"
/// @DnDArgument : "expr_2" "spr_pipe_end"
/// @DnDArgument : "var" "pipe_sprite[0]"
/// @DnDArgument : "var_1" "pipe_sprite[1]"
/// @DnDArgument : "var_2" "pipe_sprite[2]"
pipe_sprite[0] = spr_pipe_start;
pipe_sprite[1] = spr_pipe_mid;
pipe_sprite[2] = spr_pipe_end;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 409DAC59
/// @DnDComment : // Prefethes the sprite array (again prevents hanging)
/// @DnDArgument : "function" "sprite_prefetch_multi"
/// @DnDArgument : "arg" "pipe_sprite"
sprite_prefetch_multi(pipe_sprite);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7912DBE7
/// @DnDComment : // Creates an array for the set sprites (what is drawn)
/// @DnDArgument : "expr" "array_create(wall_segment_count, -1)"
/// @DnDArgument : "var" "set_pipe_sprites"
set_pipe_sprites = array_create(wall_segment_count, -1);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 396CC0C4
/// @DnDComment : // Creates and array of pipe x coordinates
/// @DnDArgument : "expr" "array_create(wall_segment_count, 0)"
/// @DnDArgument : "var" "pipe_x_coords"
pipe_x_coords = array_create(wall_segment_count, 0);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 07219145
/// @DnDComment : // Creates the pipes y coordinate
/// @DnDArgument : "var" "pipe_y_coords"
pipe_y_coords = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6B28BA16
/// @DnDComment : // Variable for the ground segment count (larger since these sprites are smaller so more are needed to fill the screen)
/// @DnDArgument : "expr" "5"
/// @DnDArgument : "var" "ground_segment_count"
ground_segment_count = 5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 751FA70E
/// @DnDComment : // Stores the sprites for the runways within an array
/// @DnDInput : 6
/// @DnDArgument : "expr" "spr_runway_inside_start"
/// @DnDArgument : "expr_1" "spr_runway_inside_mid"
/// @DnDArgument : "expr_2" "spr_runway_inside_end"
/// @DnDArgument : "expr_3" "spr_runway_outside_1"
/// @DnDArgument : "expr_4" "spr_runway_outside_2"
/// @DnDArgument : "expr_5" "spr_runway_outside_3"
/// @DnDArgument : "var" "ground_sprite[0]"
/// @DnDArgument : "var_1" "ground_sprite[1]"
/// @DnDArgument : "var_2" "ground_sprite[2]"
/// @DnDArgument : "var_3" "ground_sprite[3]"
/// @DnDArgument : "var_4" "ground_sprite[4]"
/// @DnDArgument : "var_5" "ground_sprite[5]"
ground_sprite[0] = spr_runway_inside_start;
ground_sprite[1] = spr_runway_inside_mid;
ground_sprite[2] = spr_runway_inside_end;
ground_sprite[3] = spr_runway_outside_1;
ground_sprite[4] = spr_runway_outside_2;
ground_sprite[5] = spr_runway_outside_3;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 3F7051A4
/// @DnDComment : // Prefetches all the ground sprites from the array (again preventing hanging later when needed for the first time)
/// @DnDArgument : "function" "sprite_prefetch_multi"
/// @DnDArgument : "arg" "ground_sprite"
sprite_prefetch_multi(ground_sprite);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 26A8139A
/// @DnDComment : // Array for seting the sprites drawn in
/// @DnDArgument : "expr" "array_create(ground_segment_count, -1)"
/// @DnDArgument : "var" "set_ground_sprites"
set_ground_sprites = array_create(ground_segment_count, -1);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0EBE696A
/// @DnDComment : // Array for the x coordinates positions
/// @DnDArgument : "expr" "array_create(ground_segment_count, 0)"
/// @DnDArgument : "var" "ground_x_coords"
ground_x_coords = array_create(ground_segment_count, 0);

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 0629F2C9
/// @DnDComment : // Loops through the ground segments
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < ground_segment_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < ground_segment_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1C8B1186
	/// @DnDComment : // Sets the sprite to follow a pattern (the last 3 from array drawn outside 1, outside 2, outside 3)
	/// @DnDParent : 0629F2C9
	/// @DnDArgument : "expr" "ground_sprite[3 + (_i % 3)]"
	/// @DnDArgument : "var" "set_ground_sprites[_i]"
	set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 79181CF0
	/// @DnDComment : // Sets the sprites x coordinates
	/// @DnDParent : 0629F2C9
	/// @DnDArgument : "expr" "512 * _i"
	/// @DnDArgument : "var" "ground_x_coords[_i]"
	ground_x_coords[_i] = 512 * _i;
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4095B3C2
/// @DnDComment : // Sets the y coordinate
/// @DnDArgument : "expr" "610"
/// @DnDArgument : "var" "ground_y_coords"
ground_y_coords = 610;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 345C11F3
/// @DnDComment : // Sets the backgrounds parallaxing move rate
/// @DnDArgument : "expr" "1.0"
/// @DnDArgument : "var" "background_move_rate"
background_move_rate = 1.0;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 226964D1
/// @DnDComment : // Function for changing the interior state (swapping inside and outside environments and back again)
/// @DnDArgument : "funcName" "change_interior_state"
function change_interior_state() 
{
	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 4DCC53F0
	/// @DnDComment : // Checks what the current state is
	/// @DnDParent : 226964D1
	/// @DnDArgument : "expr" "current_interior_state"
	var l4DCC53F0_0 = current_interior_state;
	switch(l4DCC53F0_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 72F4CAA2
		/// @DnDComment : // When inside
		/// @DnDParent : 4DCC53F0
		/// @DnDArgument : "const" "INTERIOR_STATE.INSIDE"
		case INTERIOR_STATE.INSIDE:
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 0CD5CB80
			/// @DnDComment : // Will only trigger when all environments are in inside state
			/// @DnDParent : 72F4CAA2
			/// @DnDArgument : "expr" "current_wall_state == INTERIOR_STATE.INSIDE && current_ground_state == INTERIOR_STATE.INSIDE && current_pipe_state == INTERIOR_STATE.INSIDE"
			if(current_wall_state == INTERIOR_STATE.INSIDE && current_ground_state == INTERIOR_STATE.INSIDE && current_pipe_state == INTERIOR_STATE.INSIDE)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5046341A
				/// @DnDComment : // Enters exit state
				/// @DnDParent : 0CD5CB80
				/// @DnDArgument : "expr" "INTERIOR_STATE.EXIT"
				/// @DnDArgument : "var" "current_interior_state"
				current_interior_state = INTERIOR_STATE.EXIT;
			}
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 09B93F4A
		/// @DnDComment : // When outside
		/// @DnDParent : 4DCC53F0
		/// @DnDArgument : "const" "INTERIOR_STATE.OUTSIDE"
		case INTERIOR_STATE.OUTSIDE:
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 6F5321D1
			/// @DnDComment : // Will only trigger when all environments are in outside state
			/// @DnDParent : 09B93F4A
			/// @DnDArgument : "expr" "current_wall_state == INTERIOR_STATE.OUTSIDE && current_ground_state == INTERIOR_STATE.OUTSIDE && current_pipe_state == INTERIOR_STATE.OUTSIDE"
			if(current_wall_state == INTERIOR_STATE.OUTSIDE && current_ground_state == INTERIOR_STATE.OUTSIDE && current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 378AC571
				/// @DnDComment : // Changes to enter state
				/// @DnDParent : 6F5321D1
				/// @DnDArgument : "expr" "INTERIOR_STATE.ENTER"
				/// @DnDArgument : "var" "current_interior_state"
				current_interior_state = INTERIOR_STATE.ENTER;
			}
			break;
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3A6AA296
/// @DnDComment : // Functions for setting flowers$(13_10)// Each set is created for the ground sprite bounds but are varied$(13_10)// Flower object is created at random bounds from the coordinates set$(13_10)// Object is then given a pre determined sprite based on those bounds
/// @DnDInput : 2
/// @DnDArgument : "funcName" "flower_set_1"
/// @DnDArgument : "arg" "_x"
/// @DnDArgument : "arg_1" "_y"
function flower_set_1(_x, _y) 
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5B0C8B62
	/// @DnDParent : 3A6AA296
	/// @DnDArgument : "xpos" "_x + random_range(268, 500)"
	/// @DnDArgument : "ypos" "_y + random_range(200, 230)"
	/// @DnDArgument : "var" "_flower_1"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_1 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 230), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3D764614
	/// @DnDParent : 3A6AA296
	/// @DnDArgument : "expr" "spr_flower_1"
	/// @DnDArgument : "var" "_flower_1.sprite_index"
	_flower_1.sprite_index = spr_flower_1;

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 0733D562
	/// @DnDParent : 3A6AA296
	/// @DnDArgument : "xpos" "_x + random_range(12, 246)"
	/// @DnDArgument : "ypos" " _y + random_range(220, 250)"
	/// @DnDArgument : "var" "_flower_2"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_2 = instance_create_layer(_x + random_range(12, 246),  _y + random_range(220, 250), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 362D3CE7
	/// @DnDParent : 3A6AA296
	/// @DnDArgument : "expr" "spr_flower_2"
	/// @DnDArgument : "var" "_flower_2.sprite_index"
	_flower_2.sprite_index = spr_flower_2;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4CDBEB5C
/// @DnDInput : 2
/// @DnDArgument : "funcName" "flower_set_2"
/// @DnDArgument : "arg" "_x"
/// @DnDArgument : "arg_1" "_y"
function flower_set_2(_x, _y) 
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 1D32FD91
	/// @DnDParent : 4CDBEB5C
	/// @DnDArgument : "xpos" "_x + random_range(268, 500)"
	/// @DnDArgument : "ypos" "_y + random_range(200, 230)"
	/// @DnDArgument : "var" "_flower_1"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_1 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 230), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4C96E011
	/// @DnDParent : 4CDBEB5C
	/// @DnDArgument : "expr" "spr_flower_1"
	/// @DnDArgument : "var" "_flower_1.sprite_index"
	_flower_1.sprite_index = spr_flower_1;

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 2DFE1B2C
	/// @DnDParent : 4CDBEB5C
	/// @DnDArgument : "xpos" "_x + random_range(12, 246)"
	/// @DnDArgument : "ypos" "_y + random_range(200, 250)"
	/// @DnDArgument : "var" "_flower_3"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_3 = instance_create_layer(_x + random_range(12, 246), _y + random_range(200, 250), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6E918980
	/// @DnDParent : 4CDBEB5C
	/// @DnDArgument : "expr" "spr_flower_3"
	/// @DnDArgument : "var" "_flower_3.sprite_index"
	_flower_3.sprite_index = spr_flower_3;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3DE87567
/// @DnDInput : 2
/// @DnDArgument : "funcName" "flower_set_3"
/// @DnDArgument : "arg" "_x"
/// @DnDArgument : "arg_1" "_y"
function flower_set_3(_x, _y) 
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 3DEA5327
	/// @DnDParent : 3DE87567
	/// @DnDArgument : "xpos" "_x + random_range(12, 246)"
	/// @DnDArgument : "ypos" " _y + random_range(220, 250)"
	/// @DnDArgument : "var" "_flower_2"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_2 = instance_create_layer(_x + random_range(12, 246),  _y + random_range(220, 250), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4DB3E2BA
	/// @DnDParent : 3DE87567
	/// @DnDArgument : "expr" "spr_flower_2"
	/// @DnDArgument : "var" "_flower_2.sprite_index"
	_flower_2.sprite_index = spr_flower_2;

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 7F2B0666
	/// @DnDParent : 3DE87567
	/// @DnDArgument : "xpos" "_x + random_range(268, 500)"
	/// @DnDArgument : "ypos" "_y + random_range(200, 250)"
	/// @DnDArgument : "var" "_flower_3"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_3 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 250), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 751ED3AE
	/// @DnDParent : 3DE87567
	/// @DnDArgument : "expr" "spr_flower_3"
	/// @DnDArgument : "var" "_flower_3.sprite_index"
	_flower_3.sprite_index = spr_flower_3;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 256F56F6
/// @DnDInput : 2
/// @DnDArgument : "funcName" "flower_set_4"
/// @DnDArgument : "arg" "_x"
/// @DnDArgument : "arg_1" "_y"
function flower_set_4(_x, _y) 
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 24B7921E
	/// @DnDParent : 256F56F6
	/// @DnDArgument : "xpos" "_x + random_range(268, 500)"
	/// @DnDArgument : "ypos" "_y + random_range(220, 250)"
	/// @DnDArgument : "var" "_flower_2"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_2 = instance_create_layer(_x + random_range(268, 500), _y + random_range(220, 250), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3D90EDCD
	/// @DnDParent : 256F56F6
	/// @DnDArgument : "expr" "spr_flower_2"
	/// @DnDArgument : "var" "_flower_2.sprite_index"
	_flower_2.sprite_index = spr_flower_2;

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 1C493094
	/// @DnDParent : 256F56F6
	/// @DnDArgument : "xpos" "_x + random_range(12, 246)"
	/// @DnDArgument : "ypos" " _y + random_range(200, 250)"
	/// @DnDArgument : "var" "_flower_3"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_flower"
	/// @DnDArgument : "layer" ""Flowers""
	/// @DnDSaveInfo : "objectid" "obj_flower"
	var _flower_3 = instance_create_layer(_x + random_range(12, 246),  _y + random_range(200, 250), "Flowers", obj_flower);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3FBA2750
	/// @DnDParent : 256F56F6
	/// @DnDArgument : "expr" "spr_flower_3"
	/// @DnDArgument : "var" "_flower_3.sprite_index"
	_flower_3.sprite_index = spr_flower_3;
}

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 23938B19
/// @DnDComment : // Loops through the ground segements
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < ground_segment_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < ground_segment_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 138D3DA6
	/// @DnDComment : // Chooses a random flower set function
	/// @DnDParent : 23938B19
	/// @DnDArgument : "var" "_handle"
	/// @DnDArgument : "value" "choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4)"
	var _handle = choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 397007F3
	/// @DnDComment : // Calls the chosen set function with the custom coordinates
	/// @DnDInput : 2
	/// @DnDParent : 23938B19
	/// @DnDArgument : "function" "_handle"
	/// @DnDArgument : "arg" "ground_x_coords[_i]"
	/// @DnDArgument : "arg_1" "ground_y_coords"
	_handle(ground_x_coords[_i], ground_y_coords);
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 207937FA
/// @DnDComment : // Tells the gamemanager that this object has prefetched since relies on many sprite resources so it is safe to start the game
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "obj_game_manager.has_prefetched"
obj_game_manager.has_prefetched = true;