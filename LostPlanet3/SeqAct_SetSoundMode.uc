class SeqAct_SetSoundMode extends SequenceAction
    hidecategories(Object);

var(*) /*0x44380000-0x00000000*/ private @NULL SoundMode[65537];
var(*) /*0x44380000-0x00000000*/ private bool bTopPriority[65537];

event Activated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    PC = GetWorldInfo().GetALocalPlayerController();
    // End:0x59
    if(PC != none)
    {
        PC.OnSetSoundMode(self);
    }
    //return;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 3;
    //return ReturnValue;    
}

defaultproperties
{
    bCallHandler=false
    InputLinks[0]=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks=none
    ObjName="Set Sound Mode"
}