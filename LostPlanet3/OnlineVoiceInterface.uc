interface OnlineVoiceInterface extends Interface
    abstract;

function RegisterLocalTalker()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UnregisterLocalTalker()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function RegisterRemoteTalker()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function UnregisterRemoteTalker()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsLocalPlayerTalking()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsRemotePlayerTalking()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsHeadsetPresent()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SetRemoteTalkerPriority()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private int Priority[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function MuteRemoteTalker()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSystemWide[9437185], ReturnValue;

    //return ReturnValue;    
}

function UnmuteRemoteTalker()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSystemWide[9437185], ReturnValue;

    //return ReturnValue;    
}

function IsMuted()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerID[25296897];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnPlayerTalkingStateChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsTalking[8388609];

    //return;    
}

function AddPlayerTalkingDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> TalkerDelegate[8388609];

    //return;    
}

function ClearPlayerTalkingDelegate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> TalkerDelegate[8388609];

    //return;    
}

function StartNetworkedVoice()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    //return;    
}

function StopNetworkedVoice()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    //return;    
}

function StartSpeechRecognition()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function StopSpeechRecognition()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GetRecognitionResults()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Words[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnRecognitionComplete()
{
    //return;    
}

function AddRecognitionCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RecognitionDelegate[8388609];

    //return;    
}

function ClearRecognitionCompleteDelegate()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> RecognitionDelegate[8388609];

    //return;    
}

function SelectVocabulary()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private int VocabularyId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function SetSpeechRecognitionObject()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SpeechRecogObj[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function MuteAll()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAllowFriends[8388609], ReturnValue;

    //return ReturnValue;    
}

function UnmuteAll()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}
