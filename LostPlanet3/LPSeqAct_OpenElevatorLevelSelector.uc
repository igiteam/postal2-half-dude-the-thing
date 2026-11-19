class LPSeqAct_OpenElevatorLevelSelector extends SequenceAction
    abstract
    config(UI)
    forcescriptorder(true)
    hidecategories(Object);

struct native ElevatorFloorInfo
{
    var(0.25_Pct) /*0x4FA90000-0x00000000*/ private bool bCurrentLevel[65537];
    var(0.25_Pct) /*0x4FA90000-0x00000400*/ private editfixedsize @NULL FloorTitle[589825];
    var(0.25_Pct) /*0x4FA90000-0x00000400*/ private editfixedsize @NULL FloorDescription[589825];
    var(0.25_Pct) /*0x4FA90000-0x00000000*/ private editfixedsize string LoadConsoleCommand[65537];
    var(0.25_Pct) /*0x4FA90000-0x00000000*/ private name ThumbnailName[65537];
    var(0.25_Pct) /*0x4FA90000-0x00000000*/ private bool bExitFloor[65537];

    structdefaultproperties
    {
        bCurrentLevel=false
        FloorTitle=none
        FloorDescription=none
        LoadConsoleCommand=""
        ThumbnailName="None"
        bExitFloor=false
    }
};

var(0.25_Pct) /*0x82EF0000-0x00000400*/ private editfixedsize @NULL ElevatorTitle[589825];
var(0.25_Pct) /*0x82EF0000-0x00000000*/ private editfixedsize array ElevatorFloors[65537];
var(0.25_Pct) /*0x82EF0000-0x00000000*/ private int InitialFloorToDisplay[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SupportedThumbnailNames[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie;

defaultproperties
{
    InitialFloorToDisplay=1
    SupportedThumbnailNames=/* Array type was not detected. */
    InputLinks[0]=(LinkDesc="Open",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Done",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Open Elevator Level Selector (LP)"
}