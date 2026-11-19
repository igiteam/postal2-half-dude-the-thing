class SoundNodeWave extends SoundNode
    perobjectconfig
    editinlinenew
    hidecategories(Object,Object);

enum EDecompressionType
{
    DTYPE_Setup,                    // 0
    DTYPE_Invalid,                  // 1
    DTYPE_Preview,                  // 2
    DTYPE_Native,                   // 3
    DTYPE_RealTime,                 // 4
    DTYPE_Procedural,               // 5
    DTYPE_Xenon,                    // 6
    DTYPE_MAX                       // 7
};

var(*) /*0x13EA0000-0x00000000*/ private int CompressionQuality[65537];
var(*) /*0x13EA0000-0x00000000*/ private bool bForceRealTimeDecompression[65537];
var(*) /*0x13EA0000-0x00000000*/ private bool bLoopingSound[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDynamicResource[537001985];
var(*) /*0x4DF10000-0x00000000*/ private bool bUseTTS[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bProcedural[536870913];
var(*) /*0x4AE30000-0x00000000*/ private bool bMature;
var(*) /*0x4AE30000-0x00000000*/ private bool bManualWordWrap;
var(*) /*0x4AE30000-0x00000000*/ private bool bSingleLine;
var(*) /*0x4AE30000-0x00000000*/ private bool bShowSubtitleOnceOnly[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSubtitleShown[536870913];
var(*) /*0x4DF10000-0x00000000*/ private byte TTSSpeaker[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte DecompressionType[537001985];
var(*) /*0x48740000-0x00000000*/ private byte MobileDetailMode[196609];
var(*) /*0x4DF10000-0x00000000*/ private editfixedsize string SpokenText;
var(*) /*0x2A520000-0x00000000*/ private float Volume[196609];
var(*) /*0x2A520000-0x00000000*/ private const float Pitch[196609];
var(*) /*0x2A520000-0x00000000*/ private const float Duration[196609];
var(*) /*0x2A520000-0x00000000*/ private const int NumChannels[196609];
var(*) /*0x2A520000-0x00000000*/ private const int SampleRate[196609];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ChannelOffsets[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ChannelSizes[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RawData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL VorbisDecompressor[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RawPCMData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int RawPCMDataSize[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CompressedPCData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CompressedXbox360Data[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array CompressedPS3Data[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CompressedWiiUData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CompressedIPhoneData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CompressedFlashData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int ResourceID[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int ResourceSize[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ResourceData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PS3HeaderData[537001985];
var(*) /*0x4AE30000-0x00000000*/ private editfixedsize array Subtitles;
var(*) /*0x4AE30000-0x00000000*/ private editfixedsize string Comment;
var(*) /*0x4AE30000-0x00000000*/ private float ExtraSubtitleDuration;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LocalizedSubtitles;
var(*) /*0x48740000-0x00000000*/ private const editfixedsize string SourceFilePath[196609];
var(*) /*0x48740000-0x00000000*/ private const editfixedsize string SourceFileTimestamp[196609];

event GeneratePCMData()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Buffer[25165825];
    local /*0x35EA0000-0x00000000*/ private int SamplesNeeded[8388609];

    //return;    
}

defaultproperties
{
    CompressionQuality=40
    bLoopingSound=true
    Volume=0.7500000
    Pitch=1.0000000
}