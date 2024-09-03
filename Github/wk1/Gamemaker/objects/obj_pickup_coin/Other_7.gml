/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 48AA2879
/// @DnDComment : // Checks if the coin is collecting
/// @DnDArgument : "expr" "sprite_index == spr_coin_colleting"
if(sprite_index == spr_coin_colleting)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 3C23B94B
	/// @DnDComment : // Destroys the instance for the coin pickup$(13_10)
	/// @DnDParent : 48AA2879
	instance_destroy();
}