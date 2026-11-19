class LPVSInteractionPoint extends LPTrigger
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CalloutMesh[524289];
var(0.25_Pct) /*0x8AD00000-0x00000400*/ private export @NULL Mesh[589825];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private @NULL InteractionAnimSet[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private class VSSpecialMoveClass[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private @NULL HUDIcon[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float InitialLocationOffset[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float GrabLocationOffset[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float InitialGrabRotation[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name GrabAnimationName[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name HoldAnimationName[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name RetractAnimationName[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name ShockAnimationName[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name ForkArmRaiseAnimationName[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private int MaxInteractions[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private int MaxSuccessfulInteractions[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private bool bNeedsLineOfSight[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private bool bCheckForObstructions[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private bool bUseHUDIconForLOSValidation[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float IconRadius[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float MinDistanceToActivate[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float MaxDistanceToActivate[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private float MaxDistOffCenterLine[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private @NULL IKActor[65537];
var(0.25_Pct) /*0x8AD00000-0x00000000*/ private @NULL InteractionActor[65537];
var(0.25_Pct) /*0x8AD00000-0x00000400*/ private export @NULL LightEnvironment[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IPM_Grabbed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IPM_Interact;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IPM_Aborted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IPM_Finished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSPawnOwner;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumInteractions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumSuccessfulInteractions;

event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x5B
    filtereditoronly
    {
        // End:0x5B
        if(CalloutMesh != none)
        {
            DetachComponent(CalloutMesh);
            CalloutMesh.SetStaticMesh(none, true);
            CalloutMesh = none;
        }
    }
    SetHidden(true);
    //return;    
}

simulated event PostBeginPlay()
{
    // End:0x45
    if((HUDIcon == none) && LPVSInteractionPointHUD(InteractionActor) != none)
    {
        SetHUDIcon(LPVSInteractionPointHUD(InteractionActor));
    }
    // End:0x74
    if(HUDIcon != none)
    {
        HUDIcon.SetInteractionPoint(self);
    }
    super(Trigger).PostBeginPlay();
    //return;    
}

simulated function SetHUDIcon()
{
    local /*0x97E50000-0x00000000*/ private @NULL InIcon[8388609];

    // End:0x28
    if(HUDIcon != none)
    {
        // End:0x26
        if(HUDIcon != InIcon)
        {
        }
        return;
    }
    HUDIcon = InIcon;
    //return;    
}

event SetEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool newEnabled[8388609];

    bEnabled = newEnabled;
    // End:0xCD
    if(bEnabled)
    {
        SetInitialState();
        // End:0x7C
        if(HUDIcon != none)
        {
            HUDIcon.SetHidden(false);
            HUDIcon.bEnabled = true;
        }
        // End:0xCA
        if(VSPawnOwner != none)
        {
            VSPawnOwner.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSInteractionPointEnable, self);
        }        
    }
    else
    {
        GotoState('Disabled');
        // End:0x12B
        if(HUDIcon != none)
        {
            HUDIcon.SetHidden(true);
            HUDIcon.bEnabled = false;
        }
        // End:0x179
        if(VSPawnOwner != none)
        {
            VSPawnOwner.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSInteractionPointDisable, self);
        }
    }
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x45
    if(Action.InputLinks[0].bHasImpulse)
    {
        SetEnabled(true);        
    }
    else
    {
        // End:0x8A
        if(Action.InputLinks[1].bHasImpulse)
        {
            SetEnabled(false);            
        }
        else
        {
            // End:0xD6
            if(Action.InputLinks[2].bHasImpulse)
            {
                SetEnabled(bEnabled);
            }
        }
    }
    //return;    
}

function CanDoVSExit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanDoVSRightArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HasAltVSExit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoAltVSExit()
{
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

function GetFocusLocation()
{
    local /*0x97E50000-0x00000000*/ private bool bIsIK[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    false
    // End:0x42
    if(bIsIK && IKActor != none)
    {
        return IKActor.Location;
    }
    // End:0x71
    if(Mesh != none)
    {
        return Mesh.GetPosition();
    }
    // End:0x9F
    if(InteractionActor != none)
    {
        return InteractionActor.Location;
    }
    return Location;
    //return ReturnValue;    
}

function CheckObstructions()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609], CameraLoc;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPPC.LineOfSightTo(self, CameraLoc);
    //return ReturnValue;    
}

function IsInLineOfSight()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, CameraLoc, compareLoc, CameraRot, OffsetTriggerLoc;

    local /*0x97E50000-0x00000000*/ private float DistToInteraction, AngleBetween, MaxAngle, DistanceOffCenterLine;

    // End:0x62
    if((vsPawn.Controller == none) || !vsPawn.Controller.IsA('PlayerController'))
    {
        return false;
    }
    // End:0xAB
    if(bUseHUDIconForLOSValidation && HUDIcon != none)
    {
        compareLoc = HUDIcon.Location;        
    }
    else
    {
        compareLoc = GetFocusLocation();
    }
    // End:0x11D
    if((vsPawn.Location.Z - compareLoc.Z) > float(500))
    {
        return false;
    }
    LPPC = LPPlayerController(vsPawn.Controller);
    LPPC.GetPlayerViewPoint(CameraLoc, CameraRot);
    DistToInteraction = VSize(compareLoc - CameraLoc);
    // End:0x1D1
    if((MinDistanceToActivate > DistToInteraction) || MaxDistanceToActivate < DistToInteraction)
    {
        return false;
    }
    // End:0x2B4
    if(compareLoc != Location)
    {
        OffsetTriggerLoc = Location;
        OffsetTriggerLoc.Z = vsPawn.Location.Z;
        DistanceOffCenterLine = PointDistToLine(vsPawn.Location, Normal2D(Location - compareLoc), OffsetTriggerLoc);
        // End:0x2B4
        if(DistanceOffCenterLine > MaxDistOffCenterLine)
        {
            return false;
        }
    }
    AngleBetween = Normal(compareLoc - CameraLoc) Dot Vector(CameraRot);
    AngleBetween = Acos(AngleBetween);
    MaxAngle = Atan(IconRadius / DistToInteraction);
    // End:0x337
    if(AngleBetween > MaxAngle)
    {
        return false;
    }
    // End:0x369
    if(bCheckForObstructions && !CheckObstructions(LPPC, CameraLoc))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanInteractWith()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    // End:0x46
    if((HUDIcon != none) && HUDIcon.bForceDisplayInactive)
    {
        return false;
    }
    // End:0x9C
    if((bNeedsLineOfSight && !IsInLineOfSight(vsPawn)) || vsPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_VSIPBase'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ProcessInteractionMessage()
{
    local /*0x97E50000-0x00000000*/ private name InteractionType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(InteractionType)
    {
        // End:0x38
        case IPM_Grabbed:
            TriggerEventClass(Class'LPSeqEvent_VSIP_ForkArmGrab', self);
            return true;
        // End:0x5D
        case IPM_Interact:
            TriggerEventClass(Class'LPSeqEvent_VSIP_ForkArmInteract', self);
            return true;
        // End:0x8D
        case IPM_Aborted:
            EndInteraction(true);
            TriggerEventClass(Class'LPSeqEvent_VSIP_InteractionAborted', self);
            return true;
        // End:0xBD
        case IPM_Finished:
            EndInteraction();
            TriggerEventClass(Class'LPSeqEvent_VSIP_InteractionFinished', self);
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    return false;
    //return ReturnValue;    
}

function BeginInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];

    VSPawnOwner = vsPawn;
    GotoState('Interacting');
    //return;    
}

function EndInteraction()
{
    local /*0x97E50000-0x00000000*/ private bool bAborted[9437185];

    VSPawnOwner = none;
    // End:0x1E
    if(IsInState('Disabled'))
    {
        return;
    }
    // End:0x4C
    if(bAborted || MaxInteractions <= 0)
    {
        GotoState('None');
        return;
    }
    NumInteractions++;
    // End:0x7C
    if(NumInteractions == MaxInteractions)
    {
        GotoState('Disabled');
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    Record.NumInteractions = NumInteractions;
    Record.NumSuccessfulInteractions = NumSuccessfulInteractions;
    super(Trigger).CreateCheckpointRecord(Record);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    super(Trigger).ApplyCheckpointRecord(Record);
    bEnabled = Record.bEnabled;
    // End:0x6F
    if(Record.bEnabled == false)
    {
        GotoState('Disabled');        
    }
    else
    {
        SetInitialState();
        // End:0xC9
        if(HUDIcon != none)
        {
            HUDIcon.SetHidden(false);
            HUDIcon.bEnabled = true;
        }
    }
    NumInteractions = Record.NumInteractions;
    NumSuccessfulInteractions = Record.NumSuccessfulInteractions;
    //return;    
}

function NotifyFractureActorHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], HitLocation;

    //return;    
}

function NotifyConstructionActorHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], HitLocation;

    //return;    
}

state Interacting
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        VSPawnOwner.DoSpecialMove(VSSpecialMoveClass, true);
        // End:0x7C
        if(HUDIcon != none)
        {
            HUDIcon.SetHidden(true);
            HUDIcon.bEnabled = false;
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x50
        if(HUDIcon != none)
        {
            HUDIcon.SetHidden(false);
            HUDIcon.bEnabled = true;
        }
        //return;        
    }

    function CanInteractWith()
    {
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
Begin:

    stop;                
}

state Disabled
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bEnabled = false;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bEnabled = true;
        //return;        
    }

    function CanInteractWith()
    {
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
Begin:

    stop;                
}

defaultproperties
{
    InitialLocationOffset=270.0000000
    GrabLocationOffset=25.0000000
    GrabAnimationName="CHA_VS_InteractionPoint_Grab_Core"
    HoldAnimationName="CHA_VS_InteractionPoint_TurningHold_Core"
    RetractAnimationName="CHA_VS_InteractionPoint_Retract_Core"
    ShockAnimationName="CHA_VS_WorkTaser_Vibration_Core"
    bNeedsLineOfSight=true
    bCheckForObstructions=true
    bEnabled=true
    bUseHUDIconForLOSValidation=true
    IconRadius=100.0000000
    MaxDistanceToActivate=1000.0000000
    MaxDistOffCenterLine=250.0000000
    IPM_Grabbed="IPM_Grabbed"
    IPM_Interact="IPM_Interact"
    IPM_Aborted="IPM_Aborted"
    IPM_Finished="IPM_Finished"
    // Reference: CylinderComponent'Default__LPVSInteractionPoint.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}