class Input extends Interaction
    transient
    config(Input)
    hidecategories(Object,UIRoot);

struct native KeyBind
{
    var(*) /*0x35EA0000-0x00000000*/ private name Name[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Command[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool Control[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool Shift[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool Alt[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreCtrl[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreShift[1073741825];
    var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreAlt[1073741825];

    structdefaultproperties
    {
        Name="None"
        Command=""
        Control=false
        Shift=false
        Alt=false
        bIgnoreCtrl=false
        bIgnoreShift=false
        bIgnoreAlt=false
    }
};

struct native TouchTracker
{
    var(*) /*0x35EA0000-0x00000000*/ private int Handle;
    var(*) /*0x35EA0000-0x00000000*/ private int TouchpadIndex;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private byte EventType;
    var(*) /*0x35EA0000-0x00000000*/ private bool bTrapInput;

    structdefaultproperties
    {
        Handle=0
        TouchpadIndex=0
        Location=(X=0.0000000,Y=0.0000000)
        EventType=EInputEvent.IE_Pressed
        bTrapInput=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Bindings[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize noexport array PressedKeys;
var(*) /*0x35EA0000-0x00000000*/ private int CurrentControllerId[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte CurrentEvent[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentDelta[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentDeltaTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} NameToPtr[268566529];
var(*) /*0x35EA0000-0x00000010*/ private array AxisArray[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedInputEvents[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedAnalogInputEvents[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedTouchInputEvents[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CurrentTouches[131073];

// Export UInput::execResetInput(FFrame&, void* const)
native function ResetInput();

// Export UInput::execGetBind(FFrame&, void* const)
native function GetBind()
{
    local /*0x35EA0000-0x00000000*/ private name Key[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

exec function SetBind()
{
    local /*0x35EA0000-0x00000000*/ private name BindName[25296897];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL NewBind;
    local /*0x35EA0000-0x00000000*/ private int BindIndex;

    // End:0x4F
    if((Left(Command, 1) == "\"") && Right(Command, 1) == "\"")
    {
        Command = Mid(Command, 1, Len(Command) - 2);
    }
    BindIndex = Bindings.Length - 1;
    J0x66:

    // End:0xEC [Loop If]
    if(BindIndex >= 0)
    {
        // End:0xDE
        if(Bindings[BindIndex].Name == BindName)
        {
            Bindings[BindIndex].Command = Command;
            SaveConfig();
            return;
        }
        BindIndex--;
        // [Loop Continue]
        goto J0x66;
    }
    NewBind.Name = BindName;
    NewBind.Command = Command;
    Bindings[Bindings.Length] = NewBind;
    SaveConfig();
    //return;    
}
