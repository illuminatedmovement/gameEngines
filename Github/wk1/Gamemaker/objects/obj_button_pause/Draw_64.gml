/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 6A03C0AB
/// @DnDComment : // Checks if game is currently playing
/// @DnDArgument : "expr" "obj_game_manager.current_game_state == GAME_STATE.PLAYING"
if(obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Self
	/// @DnDVersion : 1
	/// @DnDHash : 35974584
	/// @DnDComment : // Draws the button
	/// @DnDParent : 6A03C0AB
	draw_self();
}