class AnimSequence extends Object
    hidecategories(Object);

enum AnimationCompressionFormat
{
    ACF_None,                       // 0
    ACF_Float96NoW,                 // 1
    ACF_Fixed48NoW,                 // 2
    ACF_IntervalFixed32NoW,         // 3
    ACF_Fixed32NoW,                 // 4
    ACF_Float32NoW,                 // 5
    ACF_Identity,                   // 6
    ACF_MAX                         // 7
};

enum AnimationKeyFormat
{
    AKF_ConstantKeyLerp,            // 0
    AKF_VariableKeyLerp,            // 1
    AKF_PerTrackCompression,        // 2
    AKF_MAX                         // 3
};

struct native AnimNotifyEvent
{
    var(*) /*0x02F80000-0x00000000*/ private float Time[65537];
    var(*) /*0x02F80000-0x00000400*/ private editfixedsize @NULL Notify[589825];
    var(*) /*0x02F80000-0x00000000*/ private name Comment[65537];
    var(*) /*0x02F80000-0x00000000*/ private float Duration[65537];

    structdefaultproperties
    {
        Time=0.0000000
        Notify=none
        Comment="None"
        Duration=0.0000000
    }
};

struct RawAnimSequenceTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PosKeys;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RotKeys;

    structdefaultproperties
    {
        PosKeys=none
        RotKeys=none
    }
};

struct native TimeModifier
{
    var(*) /*0x4CB40000-0x00000000*/ private float Time[65537];
    var(*) /*0x4CB40000-0x00000000*/ private float TargetStrength[65537];

    structdefaultproperties
    {
        Time=0.0000000
        TargetStrength=0.0000000
    }
};

struct native SkelControlModifier
{
    var(*) /*0x477D0000-0x00000000*/ private name SkelControlName[65537];
    var(*) /*0x477D0000-0x00000400*/ private editfixedsize array Modifiers[65537];

    structdefaultproperties
    {
        SkelControlName="None"
        Modifiers=none
    }
};

struct native TranslationTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PosKeys;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Times;

    structdefaultproperties
    {
        PosKeys=none
        Times=none
    }
};

struct native RotationTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RotKeys;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Times;

    structdefaultproperties
    {
        RotKeys=none
        Times=none
    }
};

struct native CurveTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private name CurveName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CurveWeights;

    structdefaultproperties
    {
        CurveName="None"
        CurveWeights=none
    }
};

struct native CompressedTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ByteStream;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Times;
    var(*) /*0x35EA0000-0x00000000*/ private float Mins[3];
    var(*) /*0x35EA0000-0x00000000*/ private float Ranges[3];

    structdefaultproperties
    {
        ByteStream=none
        Times=none
        Mins[0]=0.0000000
        Mins[1]=0.0000000
        Mins[2]=0.0000000
        Ranges[0]=0.0000000
        Ranges[1]=0.0000000
        Ranges[2]=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private name SequenceName;
var(*) /*0x03030000-0x00000400*/ private editfixedsize array Notifies[65537];
var(*) /*0x03030000-0x00000400*/ private editfixedsize array MetaData[589825];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize transient array BoneControlModifiers;
var(*) /*0x35EA0000-0x00000000*/ private float SequenceLength;
var(*) /*0x35EA0000-0x00000000*/ private int NumFrames;
var(*) /*0x03030000-0x00000000*/ private float RateScale[65537];
var(*) /*0x03030000-0x00000000*/ private bool bNoLoopingInterpolation[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsAdditive[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bAdditiveBuiltLooping;
var(*) /*0x03030000-0x00000000*/ private bool bDoNotOverrideCompression[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasBeenUsed[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasCompressedWithoutTranslations;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array RawAnimData[131073];
var(*) /*0x35EA0000-0x00000000*/ private array RawAnimationData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TranslationData[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RotationData[537001985];
var(*) /*0x03030000-0x00000000*/ private const editfixedsize array CurveData[196609];
var(*) /*0x03030000-0x00000400*/ private const @NULL CompressionScheme[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte TranslationCompressionFormat[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte RotationCompressionFormat[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte KeyEncodingFormat[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CompressedTrackOffsets;
var(*) /*0x35EA0000-0x00000000*/ private array CompressedByteStream[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TranslationCodec[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RotationCodec[805306369];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array AdditiveRefPose[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AdditiveBasePose[131073];
var(*) /*0x35EA0000-0x00000000*/ private name AdditiveRefName[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AdditiveBasePoseAnimSeq;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AdditiveTargetPoseAnimSeq;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RelatedAdditiveAnimSeqs;
var(*) /*0x35EA0000-0x00000000*/ private int EncodingPkgVersion[131073];
var(*) /*0x35EA0000-0x00000000*/ private int CompressCommandletVersion[131073];
var(*) /*0x03030000-0x00000000*/ private const editfixedsize string SourceFilePath[196609];
var(*) /*0x03030000-0x00000000*/ private const editfixedsize string SourceFileTimestamp[196609];
var(*) /*0x35EA0000-0x00000000*/ private float UseScore[537001985];
var(*) /*0x03030000-0x00000400*/ private const editfixedsize @NULL SPMetaData[589825];

// Export UAnimSequence::execGetNotifies(FFrame&, void* const)
native function GetNotifies()
{
    local /*0x35EA0000-0x00000000*/ private class NotifyClass[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array NotifyArray[25165825];


}

// Export UAnimSequence::execGetNotifyTimeByClass(FFrame&, void* const)
native function GetNotifyTimeByClass()
{
    local /*0x35EA0000-0x00000000*/ private class NotifyClass[8388609];
    local /*0x35EA0000-0x00000000*/ private float PlayRate[9437185], StartPosition;
    local /*0x35EA0000-0x00000000*/ private @NULL out_Notify[26214401];
    local /*0x35EA0000-0x00000000*/ private float out_Duration[26214401], ReturnValue;

    1.0000000
    -1.0000000                                    
}

defaultproperties
{
    RateScale=1.0000000
}