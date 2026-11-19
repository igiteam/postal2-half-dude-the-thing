class SpeechRecognition extends Object
    collapsecategories
    hidecategories(Object);

struct native RecognisableWord
{
    var(*) /*0x408E0000-0x00000000*/ private int Id[65537];
    var(*) /*0x408E0000-0x00000000*/ private editfixedsize string ReferenceWord[65537];
    var(*) /*0x408E0000-0x00000000*/ private editfixedsize string PhoneticWord[65537];

    structdefaultproperties
    {
        Id=0
        ReferenceWord=""
        PhoneticWord=""
    }
};

struct native RecogVocabulary
{
    var(*) /*0x40910000-0x00000000*/ private editfixedsize array WhoDictionary[65537];
    var(*) /*0x40910000-0x00000000*/ private editfixedsize array WhatDictionary[65537];
    var(*) /*0x40910000-0x00000000*/ private editfixedsize array WhereDictionary[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string VocabName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VocabData;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WorkingVocabData;

    structdefaultproperties
    {
        WhoDictionary=none
        WhatDictionary=none
        WhereDictionary=none
        VocabName=""
        VocabData=none
        WorkingVocabData=none
    }
};

struct native RecogUserData
{
    var(*) /*0x35EA0000-0x00000000*/ private int ActiveVocabularies;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array UserData;

    structdefaultproperties
    {
        ActiveVocabularies=0
        UserData=none
    }
};

var(*) /*0x49000000-0x00000000*/ private editfixedsize string Language[65537];
var(*) /*0x49000000-0x00000000*/ private float ConfidenceThreshhold[65537];
var(*) /*0x49000000-0x00000000*/ private editfixedsize array Vocabularies[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VoiceData;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array WorkingVoiceData;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array UserData;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL InstanceData[4];
var(*) /*0x35EA0000-0x00000000*/ private bool bDirty[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bInitialised[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FnxVoiceData[268566529];

defaultproperties
{
    Language="INT"
    ConfidenceThreshhold=50.0000000
}