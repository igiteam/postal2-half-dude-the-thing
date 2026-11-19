class LPAICmd_InteractWithSmartObject extends LPAICmd_Objective within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectInteractionData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectInteraction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SmartActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SmartActorTightRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SmartActorRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SmartActorHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractStatus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SmartActorAccess[536870913];

function SetInteractionData()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteractionData[8388609], SmartPawn;

    ObjectInteractionData = InInteractionData;
    // End:0x4A
    if(ObjectInteractionData != none)
    {
        SmartActor = ObjectInteractionData.MySmartActor;
    }
    // End:0x1A2
    if(SmartActor != none)
    {
        SmartPawn = LPPawn(SmartActor);
        // End:0x133
        if(SmartPawn != none)
        {
            SmartActorRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(SmartPawn);
            SmartActorTightRadius = SmartPawn.CylinderComponent.CollisionRadius;
            SmartActorHeight = SmartPawn.CylinderComponent.CollisionHeight;            
        }
        else
        {
            SmartActor.GetBoundingCylinder(SmartActorRadius, SmartActorHeight);
            SmartActorTightRadius = SmartActorRadius;
        }
        Outer.Focus = SmartActor;        
    }
    else
    {
        SmartActorRadius = -1.0000000;
        SmartActorHeight = -1.0000000;
    }
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    InteractStatus = LPAICmdStatus_InteractWithSmartObject(ReturnStatus);
    //return;    
}

function GetAccessToSmartActor()
{
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    SmartActorAccess = ObjectInteractionData.GetAccessToSmartActor(Outer.myAIPawn, RevokeTolerance);
    return HaveAccessToSmartActor();
    //return ReturnValue;    
}

function ReleaseAccessToSmartActor()
{
    UnLockAccessToSmartActor();
    // End:0x43
    if(SmartActorAccess != none)
    {
        SmartActorAccess.Destroy();
        SmartActorAccess = none;
    }
    //return;    
}

function LockAccessToSmartActor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(SmartActorAccess != none)
    {
        SmartActorAccess.Lock(true);
        return SmartActorAccess.IsLocked();
    }
    return false;
    //return ReturnValue;    
}

function UnLockAccessToSmartActor()
{
    // End:0x2F
    if(SmartActorAccess != none)
    {
        SmartActorAccess.Lock(false);
    }
    //return;    
}

function ExitWithFaliure()
{
    LPAICmd_Ineract_Status(1);
    Outer.PopCommand(self);
    //return;    
}

function HaveAccessToSmartActor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHaveAccess;

    bHaveAccess = (SmartActorAccess != none) && SmartActorAccess.IsValid();
    return bHaveAccess;
    //return ReturnValue;    
}

function GotoStateWithAccessCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x26
    if(HaveAccessToSmartActor())
    {
        GotoState(StateName, 'Begin');        
    }
    else
    {
        ExitWithFaliure();
    }
    //return;    
}

function Range2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize2D(Outer.myAIPawn.Location - SmartActor.Location);
    //return ReturnValue;    
}

function Seperation2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + SmartActorRadius;
    return (Range2D()) - combinedRadius;
    //return ReturnValue;    
}

function Seperation2DFromActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Radius, Height;
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;
    local /*0x97E50000-0x00000000*/ private float Seperation, combinedRadius;

    Seperation = 2147484000.0000000;
    // End:0x191
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0xBB
        if(inPawn != none)
        {
            Radius = Class'LPAIUtils'.static.KynapseAdjustedRadius(inPawn);
            Height = inPawn.CylinderComponent.CollisionHeight;            
        }
        else
        {
            inActor.GetBoundingCylinder(Radius, Height);
        }
        combinedRadius = Outer.MyKynapseRadius + Radius;
        Seperation = VSize2D(Outer.myAIPawn.Location - inActor.Location) - combinedRadius;
    }
    return Seperation;
    //return ReturnValue;    
}

function Seperation2DTight()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = Outer.myAIPawn.CylinderComponent.CollisionRadius + SmartActorTightRadius;
    return (Range2D()) - combinedRadius;
    //return ReturnValue;    
}

function ConvertRangeToSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float RangeToConvert[8388609], ReturnValue, combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + SmartActorRadius;
    return RangeToConvert - combinedRadius;
    //return ReturnValue;    
}

function LPAICmd_Ineract_Status()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    // End:0x62
    if((InteractStatus != none) && int(InteractStatus.Cmd_Interact_Error) < int(1))
    {
        InteractStatus.Cmd_Interact_Error = NewStatus;
    }
    // End:0x82
    if(int(NewStatus) >= int(1))
    {
        LPAICmd_Status(1);
    }
    //return;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !HaveAccessToSmartActor();
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    OnExit();
    //return;    
}

event SPAborted()
{
    super(LPAICommand).SPAborted();
    OnExit();
    //return;    
}

function OnExit()
{
    ReleaseAccessToSmartActor();
    // End:0x43
    if(ObjectInteraction != none)
    {
        ObjectInteraction.Destroy();
        ObjectInteraction = none;
    }
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
    J0x00:
    // End:0x24 [Loop If]
    if(true)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                
}
