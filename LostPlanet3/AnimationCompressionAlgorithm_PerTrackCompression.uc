class AnimationCompressionAlgorithm_PerTrackCompression extends AnimationCompressionAlgorithm_RemoveLinearKeys
    hidecategories(Object,AnimationCompressionAlgorithm);

var(*) /*0x3C040000-0x00000000*/ private float MaxZeroingThreshold[65537];
var(*) /*0x3C040000-0x00000000*/ private float MaxPosDiffBitwise[65537];
var(*) /*0x3C040000-0x00000000*/ private float MaxAngleDiffBitwise[65537];
var(*) /*0x3C040000-0x00000000*/ private editfixedsize array AllowedRotationFormats[65537];
var(*) /*0x3C040000-0x00000000*/ private editfixedsize array AllowedTranslationFormats[65537];
var(*) /*0x418C0000-0x00000000*/ private bool bResampleAnimation[65537];
var(*) /*0x00DA0000-0x00000000*/ private bool bUseAdaptiveError[65537];
var(*) /*0x00DA0000-0x00000000*/ private bool bUseOverrideForEndEffectors[65537];
var(*) /*0x00DB0000-0x00000000*/ private bool bUseAdaptiveError2[65537];
var(*) /*0x418C0000-0x00000000*/ private float ResampledFramerate[65537];
var(*) /*0x418C0000-0x00000000*/ private int MinKeysForResampling[65537];
var(*) /*0x00DA0000-0x00000000*/ private int TrackHeightBias[65537];
var(*) /*0x00DA0000-0x00000000*/ private float ParentingDivisor[65537];
var(*) /*0x00DA0000-0x00000000*/ private float ParentingDivisorExponent[65537];
var(*) /*0x00DB0000-0x00000000*/ private float RotationErrorSourceRatio[65537];
var(*) /*0x00DB0000-0x00000000*/ private float TranslationErrorSourceRatio[65537];
var(*) /*0x00DB0000-0x00000000*/ private float MaxErrorPerTrackRatio[65537];
var(*) /*0x35EA0000-0x00000000*/ private float PerturbationProbeSize;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PerReductionCachedData[805437441];

defaultproperties
{
    MaxZeroingThreshold=0.0002000
    MaxPosDiffBitwise=0.0070000
    MaxAngleDiffBitwise=0.0020000
    AllowedRotationFormats=/* Array type was not detected. */
    AllowedTranslationFormats=/* Array type was not detected. */
    ResampledFramerate=15.0000000
    MinKeysForResampling=10
    TrackHeightBias=1
    ParentingDivisor=1.0000000
    ParentingDivisorExponent=1.0000000
    RotationErrorSourceRatio=0.8000000
    TranslationErrorSourceRatio=0.8000000
    MaxErrorPerTrackRatio=0.3000000
    PerturbationProbeSize=0.0010000
    bRetarget=false
    bActuallyFilterLinearKeys=false
    Description="Compress each track independently"
}