/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 0192D38A
/// @DnDComment : // Loops through the wall segements
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < wall_segment_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < wall_segment_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 76B18CA7
	/// @DnDComment : // Checks they has sprite set
	/// @DnDParent : 0192D38A
	/// @DnDArgument : "expr" "set_wall_sprites[_i] == -1"
	/// @DnDArgument : "not" "1"
	if(!(set_wall_sprites[_i] == -1))
	{
		/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 2CE081B3
		/// @DnDComment : // Draws at position
		/// @DnDParent : 76B18CA7
		/// @DnDArgument : "x" "wall_x_coords[_i]"
		/// @DnDArgument : "y" "wall_y_coords"
		/// @DnDArgument : "sprite" "set_wall_sprites[_i]"
		draw_sprite(set_wall_sprites[_i], 0, wall_x_coords[_i], wall_y_coords);
	}
}

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 0A91A2E1
/// @DnDComment : // Loops through the pipe segements
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < pipe_segment_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < pipe_segment_count; _i += 1) {
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 170E022D
	/// @DnDComment : // Checks they has sprite set
	/// @DnDParent : 0A91A2E1
	/// @DnDArgument : "expr" "set_pipe_sprites[_i] == -1"
	/// @DnDArgument : "not" "1"
	if(!(set_pipe_sprites[_i] == -1))
	{
		/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 0B3A22B7
		/// @DnDComment : // Draws at position
		/// @DnDParent : 170E022D
		/// @DnDArgument : "x" "pipe_x_coords[_i]"
		/// @DnDArgument : "y" "pipe_y_coords"
		/// @DnDArgument : "sprite" "set_pipe_sprites[_i]"
		draw_sprite(set_pipe_sprites[_i], 0, pipe_x_coords[_i], pipe_y_coords);
	}
}

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 0A49D3C9
/// @DnDComment : // Loops through the ground segements
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < ground_segment_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < ground_segment_count; _i += 1) {
	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 2582C3BD
	/// @DnDComment : // Draws at position
	/// @DnDParent : 0A49D3C9
	/// @DnDArgument : "x" "ground_x_coords[_i]"
	/// @DnDArgument : "y" "ground_y_coords"
	/// @DnDArgument : "sprite" "set_ground_sprites[_i]"
	draw_sprite(set_ground_sprites[_i], 0, ground_x_coords[_i], ground_y_coords);
}