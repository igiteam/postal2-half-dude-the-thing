class LPGeneralPlayerInteractionObject extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum EGeneralPlayerInteractionObjectState
{
    EGeneralPlayerInteractionObjectState_Uninitialized,// 0
    EGeneralPlayerInteractionObjectState_Disabled,// 1
    EGeneralPlayerInteractionObjectState_Idle,// 2
    EGeneralPlayerInteractionObjectState_Preparing,// 3
    EGeneralPlayerInteractionObjectState_Operating,// 4
    EGeneralPlayerInteractionObjectState_UnPreparing,// 5
    EGeneralPlayerInteractionObjectState_Cooldown,// 6
    EGeneralPlayerInteractionObjectState_MAX// 7
};

struct native PlayerAnimationInfoStateStruct
{
    var(0.25_Pct) /*0xA3900000-0x00000000*/ private name AnimName[65537];
    var(0.25_Pct) /*0xA3900000-0x00000000*/ private bool bLooped[65537];
    var(0.25_Pct) /*0xA3900000-0x00000000*/ private float PlayBackRate[65537];
    var(0.25_Pct) /*0xA3900000-0x00000000*/ private bool bUseChoreography[65537];

    structdefaultproperties
    {
        AnimName="None"
        bLooped=false
        PlayBackRate=1.0000000
        bUseChoreography=true
    }
};

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TriggerCount;

    structdefaultproperties
    {
        bEnabled=false
        TriggerCount=0
    }
};

var(0.25_Pct) /*0x06380000-0x00000000*/ private @NULL Prepare[2162689];
var(0.25_Pct) /*0x06380000-0x00000000*/ private @NULL Operate[2162689];
var(0.25_Pct) /*0x06380000-0x00000000*/ private @NULL Aborted[2162689];
var(0.25_Pct) /*0x06380000-0x00000000*/ private @NULL Completed[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private bool bUseCameraAimAsCheck[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private bool bInitiallyEnabled[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private bool bResetCameraOnComplete[2162689];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPressOnly[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInteractive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExternalTriggerHandled;
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private travel float MaxOperationalDistance[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private float MaxOperationalPitch[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private float MaxOperationalYaw[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private travel float MaxOperationalHeight[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private editfixedsize string HUDPromptString[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private float OperationLength[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private float OperationCooldown[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private int MaxTriggers[2162689];
var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private int OperationTriggerFrequency[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastOperationTrigger;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPBasePlayerPawn CurrentOperator[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL TouchCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPGeneralPlayerInteractionObject.EGeneralPlayerInteractionObjectState OperatingState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OperationStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OperationEndTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TriggerCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HelperCone[524289];
var(0.25_Pct) /*0xCB160000-0x00000000*/ private @NULL ThirdPartyTargetSkel[65537];
var(0.25_Pct) /*0xCB160000-0x00000000*/ private name ThirdPartyTargetAnim[65537];
var(0.25_Pct) /*0xAD610000-0x00000000*/ private @NULL RevealActor[65537];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2D
    if(VarName == 'OperatingState')
    {
        MessageChangeOperatingState(OperatingState);        
    }
    else
    {
        // End:0x91
        if((VarName == 'MaxOperationalDistance') || VarName == 'MaxOperationalHeight')
        {
            TouchCylinder.SetCylinderSize(MaxOperationalDistance, MaxOperationalHeight);            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    TouchCylinder.SetCylinderSize(MaxOperationalDistance, MaxOperationalHeight);
    // End:0x57
    if(bInitiallyEnabled)
    {
        ChangeOperatingState(2);        
    }
    else
    {
        ChangeOperatingState(1);
    }
    InitialState = GetStateName();
    TriggerCount = 0;
    bPressOnly = (OperationLength <= 0.0000000) || bIsInteractive;
    // End:0xC7
    if(HelperCone != none)
    {
        DetachComponent(HelperCone);
    }
    // End:0x14E
    if(RevealActor != none)
    {
        // End:0x12E
        if(ClassIsChildOf(RevealActor.Class, Class'Engine.PickupFactory'))
        {
            PickupFactory(RevealActor).SetPickupHidden();            
        }
        else
        {
            RevealActor.SetHidden(true);
        }
    }
    bExternalTriggerHandled = false;
    //return;    
}

simulated event Reset()
{
    super.Reset();
    ClearTimer('CheckForUIPromptInRange');
    // End:0x3A
    if(bInitiallyEnabled)
    {
        ChangeOperatingState(2);        
    }
    else
    {
        ChangeOperatingState(1);
    }
    InitialState = GetStateName();
    TriggerCount = 0;
    bExternalTriggerHandled = false;
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    // End:0x4C
    if((int(OperatingState) == int(1)) || int(OperatingState) == int(0))
    {
        Record.bEnabled = false;        
    }
    else
    {
        Record.bEnabled = true;
    }
    Record.TriggerCount = TriggerCount;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    TriggerCount = Record.TriggerCount;
    // End:0x55
    if(Record.bEnabled)
    {
        ChangeOperatingState(2);        
    }
    else
    {
        ChangeOperatingState(1);
    }
    //return;    
}

simulated function ChangeOperatingState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    // End:0x44
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x31
        if(int(NewState) == int(OperatingState))
        {
            return;
        }
        MessageChangeOperatingState(NewState);
    }
    //return;    
}

simulated function MessageChangeOperatingState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    // End:0x40
    if(((int(OperatingState) == int(1)) && MaxTriggers > 0) && TriggerCount >= MaxTriggers)
    {
        return;
    }
    OperatingState = NewState;
    switch(NewState)
    {
        // End:0x7C
        case 0:
            GotoState('Uninitialized');
            // End:0x103
            break;
        // End:0x92
        case 1:
            GotoState('Disabled');
            // End:0x103
            break;
        // End:0xA8
        case 2:
            GotoState('Idle');
            // End:0x103
            break;
        // End:0xBE
        case 3:
            GotoState('Preparing');
            // End:0x103
            break;
        // End:0xD4
        case 4:
            GotoState('Operating');
            // End:0x103
            break;
        // End:0xEA
        case 5:
            GotoState('UnPreparing');
            // End:0x103
            break;
        // End:0x100
        case 6:
            GotoState('Cooldown');
            // End:0x103
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        ChangeOperatingState(2);        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            ChangeOperatingState(1);            
        }
        else
        {
            // End:0xAF
            if(int(OperatingState) == int(2))
            {
                ChangeOperatingState(1);                
            }
            else
            {
                ChangeOperatingState(2);
            }
        }
    }
    //return;    
}

simulated function GetCurrentOperator()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CurrentOperator;
    //return ReturnValue;    
}

simulated function SetCurrentOperator()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    CurrentOperator = LPP;
    //return;    
}

simulated function ChangeCollision()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    // End:0x16
    if(bEnabled)
    {
        SetCollision(true, false);        
    }
    else
    {
        ClearClientHUDMessages(false);
        SetCollision(false, false);
    }
    //return;    
}

simulated function ClearClientHUDMessages()
{
    local /*0x97E50000-0x00000000*/ private bool bIncludeCurrentOperator[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPC;

    // End:0xB6
    foreach OverlappingActors(Class'LPBasePlayerPawn', LPP, MaxOperationalDistance,, true)
    {
        // End:0x56
        if((LPP == CurrentOperator) && !bIncludeCurrentOperator)
        {
            continue;            
        }
        LPC = LPPlayerController(LPP.Controller);
        // End:0xB5
        if(LPC != none)
        {
            LPC.ClientClearGeneralPlayerInteractionObjectPrompt();
        }        
    }    
    //return;    
}

simulated function HandleNotifyInteractionObjectTriggerExternal()
{
    // End:0xE7
    if(!bExternalTriggerHandled)
    {
        // End:0x60
        if(ThirdPartyTargetSkel != none)
        {
            ThirdPartyTargetSkel.SkeletalMeshComponent.PlayAnim(ThirdPartyTargetAnim,, false, true);
        }
        // End:0xE7
        if(RevealActor != none)
        {
            // End:0xC7
            if(ClassIsChildOf(RevealActor.Class, Class'Engine.PickupFactory'))
            {
                PickupFactory(RevealActor).SetPickupVisible();                
            }
            else
            {
                RevealActor.SetHidden(false);
            }
        }
    }
    bExternalTriggerHandled = true;
    //return;    
}

simulated function InputDirection()
{
    local /*0x97E50000-0x00000000*/ private int iDirection[8388609];

    //return;    
}

simulated function IsOperating()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function IsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function CanBeOperatedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPBP[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

    super.UnTouch(Other);
    LPP = LPBasePlayerPawn(Other);
    // End:0x40
    if(LPP == none)
    {
        return;
    }
    LPC = LPPlayerController(LPP.Controller);
    // End:0x82
    if(LPC == none)
    {
        return;
    }
    LPC.LastTouchedGeneralInteractionObject = none;
    //return;    
}

simulated function BeginPrepareOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], SM;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated function CheckForUIPromptInRange()
{
    //return;    
}

simulated function GetCompletionRatio()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

simulated function OnSpecialMoveEvent_PrepareComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    ChangeOperatingState(4);
    // End:0x7E
    if(CurrentOperator != none)
    {
        LPC = LPPlayerController(CurrentOperator.Controller);
        // End:0x7B
        if(LPC != none)
        {
            LPC.InteractionObjectEvent_PrepareComplete(self);
        }        
    }
    else
    {
        ChangeOperatingState(6);
    }
    //return;    
}

simulated function OnSpecialMoveEvent_OperateComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 5);
    ChangeOperatingState(5);
    // End:0x9E
    if(CurrentOperator != none)
    {
        LPC = LPPlayerController(CurrentOperator.Controller);
        // End:0x9B
        if(LPC != none)
        {
            LPC.InteractionObjectEvent_OperateComplete(self);
        }        
    }
    else
    {
        ChangeOperatingState(6);
    }
    //return;    
}

simulated function OnSpecialMoveEvent_CompleteComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    ++TriggerCount;
    // End:0x7A
    if(CurrentOperator != none)
    {
        LPC = LPPlayerController(CurrentOperator.Controller);
        // End:0x7A
        if(LPC != none)
        {
            LPC.InteractionObjectEvent_CompleteComplete(self);
        }
    }
    ChangeOperatingState(6);
    ClearClientHUDMessages(true);
    //return;    
}

simulated function OnSpecialMoveEvent_AbortedComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    ChangeOperatingState(6);
    // End:0x7B
    if(CurrentOperator != none)
    {
        LPC = LPPlayerController(CurrentOperator.Controller);
        // End:0x7B
        if(LPC != none)
        {
            LPC.InteractionObjectEvent_AbortComplete(self);
        }
    }
    ClearClientHUDMessages(true);
    //return;    
}

simulated function OnSpecialMoveEvent_AbortedByController()
{
    TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 6);
    ChangeOperatingState(5);
    ClearClientHUDMessages(true);
    //return;    
}

simulated function OnSpecialMoveEvent_Interrupted()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 6);
    ChangeOperatingState(6);
    // End:0x9B
    if(CurrentOperator != none)
    {
        LPC = LPPlayerController(CurrentOperator.Controller);
        // End:0x9B
        if(LPC != none)
        {
            LPC.InteractionObjectEvent_Interrupted(self);
        }
    }
    ClearClientHUDMessages(true);
    //return;    
}

simulated function IsPressOnly()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bPressOnly;
    //return ReturnValue;    
}

simulated function IsInteractive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsInteractive;
    //return ReturnValue;    
}

simulated function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL NextMove[8388609], LocationBeforeInteraction;

    //return;    
}

simulated state Uninitialized
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bExternalTriggerHandled = false;
        //return;        
    }

    simulated function IsEnabled()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

simulated state Disabled
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ChangeCollision(false);
        TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 0);
        bExternalTriggerHandled = false;
        //return;        
    }

    simulated function IsEnabled()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

simulated state Idle
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ChangeCollision(true);
        // End:0x5A
        if((PreviousStateName == 'Disabled') || PreviousStateName == 'Uninitialized')
        {
            TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 1);
        }
        bExternalTriggerHandled = false;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('CheckForUIPromptInRange');
        //return;        
    }

    simulated function CanBeOperatedBy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPBP[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ToToucher, ToucherAim, YawAngle, PitchAngle;
        local /*0x97E50000-0x00000000*/ private float zdiff, dotYaw, MaxYaw, dotPitch, MaxPitch;

        local /*0x97E50000-0x00000000*/ private @NULL myRot, hisRot, toHim;

        // End:0x56
        if((LPBP.GetCurrentSpecialMoveInstance() != none) && !LPBP.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerInteractionObject'))
        {
            return false;
        }
        ToToucher = LPBP.Location - Location;
        zdiff = Abs(ToToucher.Z);
        toHim = ToToucher;
        toHim.Z = 0.0000000;
        // End:0x11A
        if((zdiff > MaxOperationalHeight) || VSize(toHim) > MaxOperationalDistance)
        {
            return false;
        }
        // End:0x399
        if(bUseCameraAimAsCheck)
        {
            ToucherAim = LPBP.GetAimDirection();
            ToucherAim.Yaw += 32768;
            ToucherAim.Pitch += 16384;
            // End:0x296
            if(MaxOperationalYaw > float(0))
            {
                YawAngle.Yaw = ToucherAim.Yaw;
                hisRot = Vector(YawAngle);
                YawAngle.Yaw = Rotation.Yaw;
                myRot = Vector(YawAngle);
                dotYaw = myRot Dot hisRot;
                MaxYaw = Cos(MaxOperationalYaw * 0.0174533);
                // End:0x296
                if(dotYaw < MaxYaw)
                {
                    return false;
                }
            }
            // End:0x396
            if(MaxOperationalPitch > float(0))
            {
                PitchAngle.Pitch = ToucherAim.Pitch;
                hisRot = Vector(PitchAngle);
                PitchAngle.Pitch = Rotation.Pitch;
                myRot = Vector(PitchAngle);
                dotPitch = myRot Dot hisRot;
                MaxPitch = Cos(MaxOperationalPitch * 0.0174533);
                // End:0x396
                if(dotPitch < MaxPitch)
                {
                    return false;
                }
            }            
        }
        else
        {
            YawAngle.Yaw = Rotation.Yaw;
            // End:0x460
            if(MaxOperationalYaw > float(0))
            {
                myRot = Vector(YawAngle);
                hisRot = Normal(toHim);
                dotYaw = myRot Dot hisRot;
                MaxYaw = Cos(MaxOperationalYaw * 0.0174533);
                // End:0x460
                if(dotYaw < MaxYaw)
                {
                    return false;
                }
            }
            // End:0x58D
            if(MaxOperationalPitch > float(0))
            {
                ToucherAim = Rotator(ToToucher);
                ToucherAim.Yaw = 0;
                ToucherAim.Roll = 0;
                toHim = Vector(ToucherAim);
                hisRot = Normal(toHim);
                PitchAngle.Pitch = Rotation.Pitch;
                myRot = Vector(PitchAngle);
                dotPitch = myRot Dot hisRot;
                MaxPitch = Cos(MaxOperationalPitch * 0.0174533);
                // End:0x58D
                if(dotPitch < MaxPitch)
                {
                    return false;
                }
            }
        }
        return true;
        //return ReturnValue;        
    }

    simulated event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

        // End:0x16
        if(int(OperatingState) != int(2))
        {
            return;
        }
        super(LPGeneralPlayerInteractionObject).UnTouch(Other);
        LPP = LPBasePlayerPawn(Other);
        // End:0x56
        if(LPP == none)
        {
            return;
        }
        LPC = LPPlayerController(LPP.Controller);
        // End:0x98
        if(LPC == none)
        {
            return;
        }
        // End:0xD9
        if(LPP.IsLocallyControlled())
        {
            LPC.ClearGeneralPlayerInteractionObjectPrompt();
        }
        LPC.LastTouchedGeneralInteractionObject = none;
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

        // End:0x16
        if(int(OperatingState) != int(2))
        {
            return;
        }
        super(LPGeneralPlayerInteractionObject).Touch(Other, OtherComp, HitLocation, HitNormal);
        LPP = LPBasePlayerPawn(Other);
        // End:0x71
        if(LPP == none)
        {
            return;
        }
        LPC = LPPlayerController(LPP.Controller);
        // End:0xB3
        if(LPC == none)
        {
            return;
        }
        SetTimer(0.1000000, true, 'CheckForUIPromptInRange');
        LPC.LastTouchedGeneralInteractionObject = self;
        //return;        
    }

    simulated function CheckForUIPromptInRange()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPBP, LPC;
        local /*0x97E50000-0x00000000*/ private bool bDrawIcon;

        // End:0x16
        if(int(OperatingState) != int(2))
        {
            return;
        }
        // End:0x123
        foreach TouchingActors(Class'LPBasePlayerPawn', LPBP)
        {
            LPC = LPPlayerController(LPBP.Controller);
            // End:0x122
            if(LPBP.IsLocallyControlled() && LPC != none)
            {
                // End:0x103
                if(CanBeOperatedBy(LPBP))
                {
                    bDrawIcon = !(IsPressOnly()) || IsInteractive();
                    LPC.DisplayGeneralPlayerInteractionObjectPrompt(HUDPromptString, bDrawIcon);
                    // End:0x122
                    continue;
                }
                LPC.ClearGeneralPlayerInteractionObjectPrompt();
            }            
        }        
        //return;        
    }

    simulated function BeginPrepareOperation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], SM;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x19
        if(LPP != CurrentOperator)
        {
            return false;
        }
        ChangeOperatingState(3);
        return true;
        //return ReturnValue;        
    }
    stop;    
}

simulated state Preparing
{
    ignores Touch, UnTouch, EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ChangeCollision(false);
        TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 2);
        //return;        
    }

    simulated function IsOperating()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function OperatorInstructsAbort()
    {
        ChangeOperatingState(5);
        //return;        
    }

    simulated function SpecialMoveEnded()
    {
        local /*0x97E50000-0x00000000*/ private @NULL NextMove[8388609], LocationBeforeInteraction, LPC;

        TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 6);
        ClearClientHUDMessages(true);
        // End:0x102
        if(CurrentOperator != none)
        {
            // End:0x84
            if(CurrentOperator.bIncapacitated)
            {
                CurrentOperator.LastGoodLocationBeforeRagdoll = LocationBeforeInteraction;
            }
            LPC = LPPlayerController(CurrentOperator.Controller);
            // End:0x102
            if(LPC != none)
            {
                LPC.ClearGeneralPlayerInteractionObjectPrompt();
                LPC.ServerEndDoGeneralInteractionOperation();
            }
        }
        ChangeOperatingState(6);
        //return;        
    }
    stop;    
}

simulated state Operating
{
    ignores Touch, UnTouch;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ChangeCollision(false);
        OperationStartTime = WorldInfo.TimeSeconds;
        OperationEndTime = OperationStartTime + OperationLength;
        TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 3);
        SetTimer(0.1000000, true, 'CheckOperatorStatus');
        LastOperationTrigger = 0;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('CheckOperatorStatus');
        //return;        
    }

    simulated function IsOperating()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function GetCompletionRatio()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], fStartTime, fCurrentTime, fDiff, fRatio, fMaxTime;

        fStartTime = OperationStartTime;
        fMaxTime = OperationLength;
        fCurrentTime = WorldInfo.TimeSeconds;
        fDiff = fCurrentTime - fStartTime;
        fRatio = FClamp(fDiff / fMaxTime, 0.0000000, 1.0000000);
        return fRatio;
        //return ReturnValue;        
    }

    function CheckOperatorStatus()
    {
        local /*0x97E50000-0x00000000*/ private int Percentage;

        // End:0x8C
        if((((CurrentOperator == none) || CurrentOperator.GetCurrentSpecialMoveInstance() == none) || CurrentOperator.IsDBNO()) || !CurrentOperator.IsAliveAndWell())
        {
            ChangeOperatingState(6);
        }
        Percentage = int((GetCompletionRatio()) * 100.0000000);
        Percentage = ((OperationTriggerFrequency > 0) ? Percentage / OperationTriggerFrequency : 0);
        // End:0x123
        if(LastOperationTrigger != Percentage)
        {
            TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 4);
            LastOperationTrigger = Percentage;
        }
        //return;        
    }

    simulated function SpecialMoveEnded()
    {
        local /*0x97E50000-0x00000000*/ private @NULL NextMove[8388609], LocationBeforeInteraction, LPC;

        ClearTimer('CheckOperatorStatus');
        TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 6);
        ClearClientHUDMessages(true);
        // End:0x116
        if(CurrentOperator != none)
        {
            // End:0x98
            if(CurrentOperator.bIncapacitated)
            {
                CurrentOperator.LastGoodLocationBeforeRagdoll = LocationBeforeInteraction;
            }
            LPC = LPPlayerController(CurrentOperator.Controller);
            // End:0x116
            if(LPC != none)
            {
                LPC.ClearGeneralPlayerInteractionObjectPrompt();
                LPC.ServerEndDoGeneralInteractionOperation();
            }
        }
        ChangeOperatingState(6);
        //return;        
    }
    stop;    
}

simulated state UnPreparing
{
    ignores Touch, UnTouch;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPC;

        ChangeCollision(false);
        // End:0x7C
        if(CurrentOperator != none)
        {
            LPC = LPPlayerController(CurrentOperator.Controller);
            // End:0x79
            if(LPC != none)
            {
                LPC.ClearGeneralPlayerInteractionObjectPrompt();
            }            
        }
        else
        {
            ChangeOperatingState(6);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        SetCurrentOperator(none);
        //return;        
    }

    simulated function IsOperating()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated function SpecialMoveEnded()
    {
        local /*0x97E50000-0x00000000*/ private @NULL NextMove[8388609], LocationBeforeInteraction, LPC;

        TriggerEventClass(Class'LPSeqEvent_GeneralInteractionObjectEvent', CurrentOperator, 6);
        ClearClientHUDMessages(true);
        // End:0x102
        if(CurrentOperator != none)
        {
            // End:0x84
            if(CurrentOperator.bIncapacitated)
            {
                CurrentOperator.LastGoodLocationBeforeRagdoll = LocationBeforeInteraction;
            }
            LPC = LPPlayerController(CurrentOperator.Controller);
            // End:0x102
            if(LPC != none)
            {
                LPC.ClearGeneralPlayerInteractionObjectPrompt();
                LPC.ServerEndDoGeneralInteractionOperation();
            }
        }
        ChangeOperatingState(6);
        //return;        
    }
    stop;    
}

simulated state Cooldown
{
    ignores Touch, UnTouch;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ChangeCollision(false);
        // End:0x41
        if((MaxTriggers > 0) && TriggerCount >= MaxTriggers)
        {
            ChangeOperatingState(1);
            return;
        }
        // End:0x6C
        if(OperationCooldown > float(0))
        {
            SetTimer(OperationCooldown, false, 'GotoIdle');            
        }
        else
        {
            ChangeOperatingState(2);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('GotoIdle');
        //return;        
    }

    simulated function GotoIdle()
    {
        ChangeOperatingState(2);
        //return;        
    }
    stop;    
}

defaultproperties
{
    Prepare=(AnimName="None",bLooped=false,PlayBackRate=1.0000000,bUseChoreography=true)
    Operate=(AnimName="None",bLooped=false,PlayBackRate=1.0000000,bUseChoreography=true)
    Aborted=(AnimName="None",bLooped=false,PlayBackRate=1.0000000,bUseChoreography=true)
    Completed=(AnimName="None",bLooped=false,PlayBackRate=1.0000000,bUseChoreography=true)
    bUseCameraAimAsCheck=true
    bInitiallyEnabled=true
    bResetCameraOnComplete=true
    MaxOperationalDistance=150.0000000
    MaxOperationalHeight=200.0000000
    HUDPromptString="<Strings:LostPlanetGame.HUDHintMessages.HUDHint_GeneralOperate>"
    OperationLength=5.0000000
    OperationCooldown=5.0000000
    OperationTriggerFrequency=5
    // Reference: CylinderComponent'Default__LPGeneralPlayerInteractionObject.TouchCylinder0'
    begin object name=TouchCylinder0 class=Class'Engine.CylinderComponent'
    end object
    TouchCylinder=TouchCylinder0
    Components[0]=TouchCylinder0
    Components[1]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bGameRelevant=true
    bCollideActors=true
    NetUpdateFrequency=1.0000000
    NetPriority=2.7000000
    CollisionComponent=TouchCylinder0
    SupportedEvents=/* Array type was not detected. */
}