/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2549CEF3
/// @DnDComment : // Checks the game is not currently paused
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PAUSED"
/// @DnDArgument : "not" "1"
if(!(obj_game_manager.current_game_state == GAME_STATE.PAUSED))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 500AE587
	/// @DnDComment : // Reduces the x position by the current speed and move rate
	/// @DnDParent : 2549CEF3
	/// @DnDArgument : "expr" "-(obj_game_manager.current_speed * background_move_rate)"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "x"
	x += -(obj_game_manager.current_speed * background_move_rate);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3AEAE8EA
	/// @DnDComment : // Checks if the x coordinate is less than the origin
	/// @DnDParent : 2549CEF3
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "op" "1"
	if(x < 0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5EA91E62
		/// @DnDComment : // Sets the before sprite to the indexed (current) one
		/// @DnDParent : 3AEAE8EA
		/// @DnDArgument : "expr" "sprite_index"
		/// @DnDArgument : "var" "before_sprite"
		before_sprite = sprite_index;
	
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 6FABD39B
		/// @DnDComment : // Sets the current sprite to the one after
		/// @DnDParent : 3AEAE8EA
		/// @DnDArgument : "spriteind" "after_sprite"
		sprite_index = after_sprite;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Switch.Switch
		/// @DnDVersion : 1
		/// @DnDHash : 1D472BDA
		/// @DnDComment : // Check what sprite the last one was set to and then set up the appropriate sprite to follow
		/// @DnDParent : 3AEAE8EA
		/// @DnDArgument : "expr" "after_sprite"
		var l1D472BDA_0 = after_sprite;
		switch(l1D472BDA_0)
		{
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 6EF2BD3B
			/// @DnDParent : 1D472BDA
			/// @DnDArgument : "const" "sprites[0]"
			case sprites[0]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 4B715725
				/// @DnDParent : 6EF2BD3B
				/// @DnDArgument : "expr" "sprites[1]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprites[1];
				break;
		
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 36285C2C
			/// @DnDParent : 1D472BDA
			/// @DnDArgument : "const" "sprites[1]"
			case sprites[1]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 2F05236C
				/// @DnDParent : 36285C2C
				/// @DnDArgument : "expr" "sprites[2]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprites[2];
				break;
		
			/// @DnDAction : YoYo Games.Switch.Case
			/// @DnDVersion : 1
			/// @DnDHash : 4DBDEE51
			/// @DnDParent : 1D472BDA
			/// @DnDArgument : "const" "sprites[2]"
			case sprites[2]:
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 5872AF2E
				/// @DnDParent : 4DBDEE51
				/// @DnDArgument : "expr" "sprites[0]"
				/// @DnDArgument : "var" "after_sprite"
				after_sprite = sprites[0];
				break;
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1A79F3E4
		/// @DnDComment : // Move the x position forward the sprite width to move the sprites draw positions
		/// @DnDParent : 3AEAE8EA
		/// @DnDArgument : "expr" "sprite_width"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "x"
		x += sprite_width;
	}
}