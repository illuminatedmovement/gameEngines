/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1E0A1A50
/// @DnDComment : // Checks if the child particle object still exists
/// @DnDArgument : "expr" "instance_exists(child_particle)"
if(instance_exists(child_particle))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3FB5B5AE
	/// @DnDComment : // Sets the particle to have no parent so its movement will stop tracking
	/// @DnDParent : 1E0A1A50
	/// @DnDArgument : "expr" "noone"
	/// @DnDArgument : "var" "child_particle.owner"
	child_particle.owner = noone;
}