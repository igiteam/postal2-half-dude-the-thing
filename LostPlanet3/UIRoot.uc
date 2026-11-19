class UIRoot extends SPStateObject
    abstract
    config(Engine)
    hidecategories(Object,UIRoot);

const DEFAULT_SIZE_X = 1024;
const DEFAULT_SIZE_Y = 768;
const MAX_SUPPORTED_GAMEPADS = 4;

enum EUIDataProviderFieldType
{
    DATATYPE_Property,              // 0
    DATATYPE_Provider,              // 1
    DATATYPE_RangeProperty,         // 2
    DATATYPE_NetIdProperty,         // 3
    DATATYPE_Collection,            // 4
    DATATYPE_ProviderCollection,    // 5
    DATATYPE_MAX                    // 6
};

enum EInputPlatformType
{
    IPT_PC,                         // 0
    IPT_360,                        // 1
    IPT_PS3,                        // 2
    IPT_MAX                         // 3
};

struct native UIRangeData
{
    var(*) /*0x3FAC0000-0x00000000*/ private float CurrentValue[65537];
    var(*) /*0x3FAC0000-0x00000000*/ private float MinValue[65537];
    var(*) /*0x3FAC0000-0x00000000*/ private float MaxValue[65537];
    var(*) /*0x3FAC0000-0x00000000*/ private float NudgeValue[65537];
    var(*) /*0x3FAC0000-0x00000000*/ private bool bIntRange[65537];

    structdefaultproperties
    {
        CurrentValue=0.0000000
        MinValue=0.0000000
        MaxValue=0.0000000
        NudgeValue=0.0000000
        bIntRange=false
    }
};

struct native TextureCoordinates
{
    var(*) /*0x4C1B0000-0x00000000*/ private float U[65537];
    var(*) /*0x4C1B0000-0x00000000*/ private float V[65537];
    var(*) /*0x4C1B0000-0x00000000*/ private float UL[65537];
    var(*) /*0x4C1B0000-0x00000000*/ private float VL[65537];

    structdefaultproperties
    {
        U=0.0000000
        V=0.0000000
        UL=0.0000000
        VL=0.0000000
    }
};

struct native UIProviderScriptFieldValue
{
    var(*) /*0x35EA0000-0x00000000*/ private name PropertyTag;
    var(*) /*0x35EA0000-0x00000000*/ private byte PropertyType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string StringValue;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ImageValue;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ArrayValue;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RangeValue;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NetIdValue;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL AtlasCoordinates;

    structdefaultproperties
    {
        PropertyTag="None"
        PropertyType=EUIDataProviderFieldType.DATATYPE_Property
        StringValue=""
        ImageValue=none
        ArrayValue=none
        RangeValue=(CurrentValue=0.0000000,MinValue=0.0000000,MaxValue=0.0000000,NudgeValue=0.0000000,bIntRange=false)
        NetIdValue=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        AtlasCoordinates=(U=0.0000000,V=0.0000000,UL=0.0000000,VL=0.0000000)
    }
};

struct native UIProviderFieldValue extends UIProviderScriptFieldValue
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CustomStringNode[805437441];
};

struct native InputKeyAction
{
    var(*) /*0x2AF20000-0x00000000*/ private name InputKeyName[65537];
    var(*) /*0x2AF20000-0x00000000*/ private byte InputKeyState[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TriggeredOps;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array ActionsToExecute;

    structdefaultproperties
    {
        InputKeyName="None"
        InputKeyState=EInputEvent.IE_Released
        TriggeredOps=none
    }
};

struct native transient InputEventParameters
{
    var(*) /*0x35EA0000-0x00000010*/ private int PlayerIndex[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private int ControllerId[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private name InputKeyName[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private byte EventType[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private float InputDelta[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private float DeltaTime[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private bool bAltPressed[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private bool bCtrlPressed[537001985];
    var(*) /*0x35EA0000-0x00000010*/ private bool bShiftPressed[537001985];

    structdefaultproperties
    {
        PlayerIndex=0
        ControllerId=0
        InputKeyName="None"
        EventType=EInputEvent.IE_Pressed
        InputDelta=0.0000000
        DeltaTime=0.0000000
        bAltPressed=false
        bCtrlPressed=false
        bShiftPressed=false
    }
};

struct native transient SubscribedInputEventParameters extends InputEventParameters
{
    var(*) /*0x35EA0000-0x00000010*/ private name InputAliasName[537001985];
};

struct native UIAxisEmulationDefinition
{
    var(*) /*0x35EA0000-0x00000000*/ private name AxisInputKey;
    var(*) /*0x35EA0000-0x00000000*/ private name AdjacentAxisInputKey;
    var(*) /*0x35EA0000-0x00000000*/ private bool bEmulateButtonPress;
    var(*) /*0x35EA0000-0x00000000*/ private name InputKeyToEmulate[2];

    structdefaultproperties
    {
        AxisInputKey="None"
        AdjacentAxisInputKey="None"
        bEmulateButtonPress=false
        InputKeyToEmulate[0]="None"
        InputKeyToEmulate[1]="None"
    }
};

struct native export RawInputKeyEventData
{
    var(*) /*0x35EA0000-0x00000000*/ private name InputKeyName;
    var(*) /*0x35EA0000-0x00000000*/ private byte ModifierKeyFlags;

    structdefaultproperties
    {
        InputKeyName="None"
        ModifierKeyFlags=56
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BadCapsLocContexts[1073741825];

// Export UUIRoot::execGetInputPlatformType(FFrame&, void* const)
native static final function GetInputPlatformType()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OwningPlayer[9437185];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UUIRoot::execGetCurrentUIController(FFrame&, void* const)
native static final function GetCurrentUIController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UUIRoot::execGetSceneClient(FFrame&, void* const)
native static final function GetSceneClient()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

static final function StaticResolveDataStore()
{
    local /*0x35EA0000-0x00000000*/ private name DataStoreTag[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayerOwner[9437185], ReturnValue, Result, DSClient;

    DSClient = Class'UIInteraction'.static.GetDataStoreClient();
    // End:0x74
    if(DSClient != none)
    {
        Result = DSClient.FindDataStore(DataStoreTag, InPlayerOwner);
    }
    return Result;
    //return ReturnValue;    
}

// Export UUIRoot::execSetDataStoreFieldValue(FFrame&, void* const)
native static final function SetDataStoreFieldValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InDataStoreMarkup[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL InFieldValue[25296897], OwnerPlayer;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

static function SetDataStoreStringValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InDataStoreMarkup[8388609], InStringValue;
    local /*0x35EA0000-0x00000000*/ private @NULL OwnerPlayer[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FieldValue;

    FieldValue.StringValue = InStringValue;
    FieldValue.PropertyType = 0;
    return SetDataStoreFieldValue(InDataStoreMarkup, FieldValue, OwnerPlayer);
    //return ReturnValue;    
}

// Export UUIRoot::execGetDataStoreFieldValue(FFrame&, void* const)
native static final function GetDataStoreFieldValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InDataStoreMarkup[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutFieldValue[25165825], OwnerPlayer;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

static function GetDataStoreStringValue()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InDataStoreMarkup[8388609], OutStringValue;
    local /*0x35EA0000-0x00000000*/ private @NULL OwnerPlayer[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL FieldValue;
    local /*0x35EA0000-0x00000000*/ private bool Result;

    none
    // End:0x5F
    if(GetDataStoreFieldValue(InDataStoreMarkup, FieldValue, OwnerPlayer))
    {
        OutStringValue = FieldValue.StringValue;
        Result = true;
    }
    return Result;
    //return ReturnValue;    
}

static final function GetOnlineGameInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSub, Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x63
    if(OnlineSub != none)
    {
        Result = OnlineSub.GameInterface;        
    }
    return Result;
    //return ReturnValue;    
}

static final function GetOnlinePlayerInterface()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSub, Result;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x63
    if(OnlineSub != none)
    {
        Result = OnlineSub.PlayerInterface;        
    }
    return Result;
    //return ReturnValue;    
}

static final function GetOnlinePlayerInterfaceEx()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], OnlineSub, PlayerIntEx;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x63
    if(OnlineSub != none)
    {
        PlayerIntEx = OnlineSub.PlayerInterfaceEx;        
    }
    return PlayerIntEx;
    //return ReturnValue;    
}

static final function SafeCaps()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string StringToCap[8388609], ReturnValue;

    // End:0x2B
    if(default.BadCapsLocContexts.Find(GetLanguage()) != )
    {        
        return StringToCap;
    }
    return Caps(StringToCap);
    //return ReturnValue;    
}
