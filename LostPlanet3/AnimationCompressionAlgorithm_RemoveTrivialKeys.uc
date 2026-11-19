class AnimationCompressionAlgorithm_RemoveTrivialKeys extends AnimationCompressionAlgorithm
    hidecategories(Object);

var(*) /*0x02A10000-0x00000000*/ private float MaxPosDiff[65537];
var(*) /*0x02A10000-0x00000000*/ private float MaxAngleDiff[65537];

defaultproperties
{
    MaxPosDiff=0.0001000
    MaxAngleDiff=0.0003000
    Description="Remove Trivial Keys"
}