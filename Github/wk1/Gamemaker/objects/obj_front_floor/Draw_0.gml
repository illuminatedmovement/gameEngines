/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 2A32FD5B
/// @DnDComment : // Loops though the bushes
/// @DnDArgument : "init" "_i = 0"
/// @DnDArgument : "init_temp" "1"
/// @DnDArgument : "cond" "_i < fauna_count"
/// @DnDArgument : "expr" "_i += 1"
for(var _i = 0; _i < fauna_count; _i += 1) {
	/// @DnDAction : YoYo Games.Drawing.Set_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 4454885C
	/// @DnDComment : // Sets the bushes alpha independently
	/// @DnDParent : 2A32FD5B
	/// @DnDArgument : "alpha" "set_alphas[_i]"
	draw_set_alpha(set_alphas[_i]);

	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 11C57491
	/// @DnDComment : // Draws the bush with its set sprite at its set coordinate
	/// @DnDParent : 2A32FD5B
	/// @DnDArgument : "x" "x_coords[_i]"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "sprite" "set_sprites[_i]"
	draw_sprite(set_sprites[_i], 0, x_coords[_i], y + 0);
}

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 52AF6FC3
/// @DnDComment : // Resets the alpha back to normal
/// @DnDArgument : "alpha" "1.0"
draw_set_alpha(1.0);