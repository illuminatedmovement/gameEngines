/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
/// @DnDVersion : 1
/// @DnDHash : 5C1A8355
/// @DnDComment : // Draws the before sprite at a minus offset
/// @DnDArgument : "x" "- sprite_get_width(before_sprite)"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "sprite" "before_sprite"
draw_sprite(before_sprite, 0, x + - sprite_get_width(before_sprite), y + 0);

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 0D90E826
/// @DnDComment : // Draws the middle current sprite
draw_self();

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
/// @DnDVersion : 1
/// @DnDHash : 36A3E661
/// @DnDComment : // Draws the after sprite with offset added to x position
/// @DnDArgument : "x" "sprite_width"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "sprite" "after_sprite"
draw_sprite(after_sprite, 0, x + sprite_width, y + 0);