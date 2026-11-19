class AnimationCompressionAlgorithm_RemoveLinearKeys extends AnimationCompressionAlgorithm
    hidecategories(Object);

var(*) /*0x2F000000-0x00000000*/ private float MaxPosDiff[65537];
var(*) /*0x2F000000-0x00000000*/ private float MaxAngleDiff[65537];
var(*) /*0x2F000000-0x00000000*/ private float MaxEffectorDiff[65537];
var(*) /*0x2F000000-0x00000000*/ private float MinEffectorDiff[65537];
var(*) /*0x2F000000-0x00000000*/ private float EffectorDiffSocket[65537];
var(*) /*0x2F000000-0x00000000*/ private float ParentKeyScale[65537];
var(*) /*0x2F000000-0x00000000*/ private bool bRetarget[65537];
var(*) /*0x2F000000-0x00000000*/ private bool bActuallyFilterLinearKeys[65537];

defaultproperties
{
    MaxPosDiff=0.0010000
    MaxAngleDiff=0.0007500
    MaxEffectorDiff=0.0010000
    MinEffectorDiff=0.0010000
    EffectorDiffSocket=0.0010000
    ParentKeyScale=2.0000000
    bRetarget=true
    bActuallyFilterLinearKeys=true
    Description="Remove Linear Keys"
    bNeedsSkeleton=true
}