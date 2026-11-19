class SPControllerGestures extends Object within SPInputBase;

const eGESTURE_MUSTMATCH = 0x8000;
const MaximumSectorEntriesForJoystick = 256;
const MaximumButtonEntriesForBuffer = 256;

enum EGestureRecordOptions
{
    eGestureRecordLeftStick,        // 0
    eGestureRecordRightStick,       // 1
    eGestureRecordButtons,          // 2
    EGestureRecordOptions_MAX       // 3
};

enum EStickGesture
{
    eStickGesture_NONE,             // 0
    eStickGesture_downup,           // 1
    eStickGesture_UpUp,             // 2
    eStickGesture_Up,               // 3
    eStickGesture_Left,             // 4
    eStickGesture_Right,            // 5
    eStickGesture_RollLeft,         // 6
    eStickGesture_RollRight,        // 7
    eStickGesture_SweepLeft,        // 8
    eStickGesture_SweepRight,       // 9
    eStickGesture_MAX               // 10
};

enum EButtonGesture
{
    eButtonGesture_NONE,            // 0
    eButtonGesture_PnR_A,           // 1
    eButtonGesture_PnR_X,           // 2
    eButtonGesture_PnR_Y,           // 3
    eButtonGesture_PnR_B,           // 4
    eButtonGesture_PnR_LeftTrigger, // 5
    eButtonGesture_PnR_RightTrigger,// 6
    eButtonGesture_PnR_RightThumbstick,// 7
    eButtonGesture_PnR_RightShoulder,// 8
    eButtonGesture_Hold_A,          // 9
    eButtonGesture_Hold_X,          // 10
    eButtonGesture_Hold_Y,          // 11
    eButtonGesture_Hold_B,          // 12
    eButtonGesture_Hold_LeftTrigger,// 13
    eButtonGesture_Hold_RightTrigger,// 14
    eButtonGesture_Hold_RightThumbstick,// 15
    eButtonGesture_Hold_RightShoulder,// 16
    eButtonGesture_Press_A,         // 17
    eButtonGesture_Press_X,         // 18
    eButtonGesture_Press_Y,         // 19
    eButtonGesture_Press_B,         // 20
    eButtonGesture_Press_LeftTrigger,// 21
    eButtonGesture_Press_RightTrigger,// 22
    eButtonGesture_Press_RightThumbstick,// 23
    eButtonGesture_Press_RightShoulder,// 24
    eButtonGesture_PnR_Y_Y,         // 25
    eButtonGesture_PnR_Y_X,         // 26
    eButtonGesture_PnR_Y_B,         // 27
    eButtonGesture_MAX              // 28
};

enum EGestureSearchType
{
    eGestureSearchLeftStick,        // 0
    eGestureSearchRightStick,       // 1
    eGestureSearchBothSticks,       // 2
    EGestureSearchType_MAX          // 3
};

enum EButtonState
{
    eGestureButtonNoChange,         // 0
    eGestureButtonPressed,          // 1
    eGestureButtonReleased,         // 2
    EButtonState_MAX                // 3
};

enum EButtonStateCheck
{
    eGestureButtonStateCheckPressAndRelease,// 0
    eGestureButtonStateCheckHeldDown,// 1
    eGestureButtonStateCheckPressed,// 2
    eGestureButtonStateCheckInSequence,// 3
    eGestureButtonStateCheckInSequenceOnlyEndWindow,// 4
    EButtonStateCheck_MAX           // 5
};

struct native JoyStickGesture
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private byte GestureID[131073];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float GestureTime[131073];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array SectorList;

    structdefaultproperties
    {
        GestureID=EStickGesture.eStickGesture_NONE
        GestureTime=0.0000000
        SectorList=none
    }
};

struct native StickSectorLog
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int SectorInfo;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float TimeStamp;

    structdefaultproperties
    {
        SectorInfo=0
        TimeStamp=0.0000000
    }
};

struct native ButtonPressLog
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private name ButtonName;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private name ButtonKey;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float TimeStamp;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private byte eButtonStateValue;

    structdefaultproperties
    {
        ButtonName="None"
        ButtonKey="None"
        TimeStamp=0.0000000
        eButtonStateValue=EButtonState.eGestureButtonNoChange
    }
};

struct native ButtonFilterBlock
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private byte GestureID;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private byte eButtonStateToCheck;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bExclusiveButtons;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float TimeWindowStart;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float TimeWindowEnd;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array MatchButtonName;

    structdefaultproperties
    {
        GestureID=EButtonGesture.eButtonGesture_NONE
        eButtonStateToCheck=EButtonStateCheck.eGestureButtonStateCheckPressAndRelease
        bExclusiveButtons=false
        TimeWindowStart=0.0000000
        TimeWindowEnd=0.0000000
        MatchButtonName=none
    }
};

struct native ControllerSequenceCheck
{
    var(__HandleButtonInput__Delegate) /*0x00950000-0x00000000*/ private name ControllerSequenceName[65537];
    var(__HandleButtonInput__Delegate) /*0x00950000-0x00000000*/ private byte StickGestureID[65537];
    var(__HandleButtonInput__Delegate) /*0x00950000-0x00000000*/ private byte eGestureSearchStick[65537];
    var(__HandleButtonInput__Delegate) /*0x00950000-0x00000000*/ private editfixedsize array ButtonGestureID[65537];
    var(__HandleButtonInput__Delegate) /*0x00950000-0x00000000*/ private float EndTimeWindow[65537];
    var(__HandleButtonInput__Delegate) /*0x00950000-0x00000000*/ private float TimeWindowDuration[65537];

    structdefaultproperties
    {
        ControllerSequenceName="None"
        StickGestureID=EStickGesture.eStickGesture_NONE
        eGestureSearchStick=EGestureSearchType.eGestureSearchLeftStick
        ButtonGestureID=none
        EndTimeWindow=0.0000000
        TimeWindowDuration=0.0000000
    }
};

var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL MyPlayerInput;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int LeftStickSectorIndex;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int RightStickSectorIndex;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int ButtonMemoryIndexPointer;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool ButtonMemoryEmpty;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bRecordLeftStick;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bRecordRightStick;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bRecordButtons;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array JoyStickGestureList;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array ControllerSequenceList;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array ButtonGestureList;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL LeftStickSectorBuffer[256];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL RightStickSectorBuffer[256];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL ButtonMemoryBuffer[256];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float LastJoystickGestureStartTime;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float LastJoystickGestureEndTime;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float LastButtonSequenceTime;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float FirstButtonMatchSequenceTime;

// Export USPControllerGestures::execControllerStickUpdate(FFrame&, void* const)
native function ControllerStickUpdate()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPControllerGestures::execRecordButtons(FFrame&, void* const)
native function RecordButtons()
{
    local /*0x01E60000-0x00000000*/ private name ButtonName[8388609], ButtonKey;
    local /*0x01E60000-0x00000000*/ private byte eSetButtonState[8388609];


}

function OnInputObjectCreate()
{
    local /*0x01E60000-0x00000000*/ private int eFlags[8388609];

    LeftStickSectorIndex = 0;
    RightStickSectorIndex = 0;
    ButtonMemoryIndexPointer = 0;
    LeftStickSectorBuffer[LeftStickSectorIndex].SectorInfo = -1;
    RightStickSectorBuffer[RightStickSectorIndex].SectorInfo = -1;
    ButtonMemoryBuffer[ButtonMemoryIndexPointer].ButtonName = 'None';
    ButtonMemoryEmpty = true;
    MyPlayerInput = self.Outer;
    // End:0xF9
    if((eFlags & (1 << 0)) != 0)
    {
        bRecordLeftStick = true;        
    }
    else
    {
        bRecordLeftStick = false;
    }
    // End:0x129
    if((eFlags & (1 << 1)) != 0)
    {
        bRecordRightStick = true;        
    }
    else
    {
        bRecordRightStick = false;
    }
    // End:0x15A
    if((eFlags & (1 << 2)) != 0)
    {
        bRecordButtons = true;        
    }
    else
    {
        bRecordButtons = false;
    }
    //return;    
}

defaultproperties
{
    JoyStickGestureList=/* Array type was not detected. */
    ButtonGestureList=/* Array type was not detected. */
}