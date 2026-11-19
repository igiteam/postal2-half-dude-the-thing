class ForceFeedbackWaveform extends Object
    editinlinenew;

enum EWaveformFunction
{
    WF_Constant,                    // 0
    WF_LinearIncreasing,            // 1
    WF_LinearDecreasing,            // 2
    WF_Sin0to90,                    // 3
    WF_Sin90to180,                  // 4
    WF_Sin0to180,                   // 5
    WF_Noise,                       // 6
    WF_MAX                          // 7
};

struct native WaveformSample
{
    var(*) /*0x50630000-0x00000000*/ private byte LeftAmplitude[65537];
    var(*) /*0x50630000-0x00000000*/ private byte RightAmplitude[65537];
    var(*) /*0x50630000-0x00000000*/ private byte LeftFunction[65537];
    var(*) /*0x50630000-0x00000000*/ private byte RightFunction[65537];
    var(*) /*0x50630000-0x00000000*/ private float Duration[65537];

    structdefaultproperties
    {
        LeftAmplitude=0
        RightAmplitude=0
        LeftFunction=EWaveformFunction.WF_Constant
        RightFunction=EWaveformFunction.WF_Constant
        Duration=0.0000000
    }
};

var(*) /*0x24260000-0x00000000*/ private bool bIsLooping[65537];
var(*) /*0x24260000-0x00000000*/ private editfixedsize array Samples[65537];
var(*) /*0x24260000-0x00000000*/ private float WaveformFalloffStartDistance[65537];
var(*) /*0x24260000-0x00000000*/ private float MaxWaveformDistance[65537];
