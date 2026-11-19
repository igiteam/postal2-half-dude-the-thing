class AnimationCompressionAlgorithm_Automatic extends AnimationCompressionAlgorithm
    hidecategories(Object,AnimationCompressionAlgorithm);

var(*) /*0x029B0000-0x00000000*/ private float MaxEndEffectorError[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bTryFixedBitwiseCompression[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bTryPerTrackBitwiseCompression[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bTryLinearKeyRemovalCompression[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bTryIntervalKeyRemoval[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bRunCurrentDefaultCompressor[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bAutoReplaceIfExistingErrorTooGreat[65537];
var(*) /*0x029B0000-0x00000000*/ private bool bRaiseMaxErrorToExisting[65537];

defaultproperties
{
    MaxEndEffectorError=1.0000000
    bTryFixedBitwiseCompression=true
    bTryPerTrackBitwiseCompression=true
    bTryLinearKeyRemovalCompression=true
    bTryIntervalKeyRemoval=true
    Description="Automatic"
}