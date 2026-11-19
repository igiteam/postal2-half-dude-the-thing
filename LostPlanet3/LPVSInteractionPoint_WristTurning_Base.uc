class LPVSInteractionPoint_WristTurning_Base extends LPVSInteractionPoint
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private @NULL AttachedSkelMeshActor[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float NumRotationForCompleteMove[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float MaxRotationPerFrame[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private bool bAllowClockwiseRotation[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private bool bAllowCounterClockwiseRotation[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private bool bAllowResetOnAbort[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private bool bAllowResetOnComplete[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private bool bUsefulCW[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private bool bUsefulCCW[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float MomentumFactor[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float RotationInterpTime[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float InitialMomentum[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float MomentumDecay[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float MaxRotationAngle[65537];
var(0.25_Pct) /*0x8ACF0000-0x00000000*/ private float RotationSpeedScale[65537];
var(0.25_Pct) /*0x8ACE0000-0x00000000*/ private name RetractFromFinishedName[65537];

simulated function GetTargetLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL RequestedBy[9437185];
    local /*0x97E50000-0x00000000*/ private bool bRequestAlternateLoc[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x40
    if(bRequestAlternateLoc && Mesh != none)
    {
        return Mesh.GetPosition();
    }
    return Location;
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    SetHidden(false);
    //return;    
}

function CheckObstructions()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609], CameraLoc;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(Mesh != none)
    {
        return LPPC.LineOfSightTo(self, CameraLoc, true);
    }
    return super.CheckObstructions(LPPC, CameraLoc);
    //return ReturnValue;    
}

event IsTouching()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL A;

    // End:0x33
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        // End:0x32
        if(A == Other)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function CanInteractWith()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NewSMInstance, Winch;

    // End:0x1A
    if(!IsTouching(vsPawn))
    {
        return false;
    }
    // End:0x3E
    if(vsPawn.IsDoingASpecialMove())
    {
        return false;
    }
    Winch = LPWeaponVSWinch(vsPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xB4
    if((Winch != none) && !Winch.IsInState('Idle'))
    {
        return false;
    }
    // End:0xC5
    if(vsPawn == none)
    {
        return false;
    }
    NewSMInstance = LPSM_VSIP_WristTurning_Base(vsPawn.GetSpecialMoveInstance(VSSpecialMoveClass));
    // End:0x111
    if(NewSMInstance == none)
    {
        return false;
    }
    NewSMInstance.vsPawn = LPVSPlayerPawn(vsPawn);
    // End:0x168
    if(!NewSMInstance.CheckCanReach())
    {
        return false;
    }
    return super.CanInteractWith(vsPawn);
    //return ReturnValue;    
}

function OnSetUsefulTwist()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bUsefulCW = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bUsefulCW = false;            
        }
        else
        {
            // End:0xD3
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bUsefulCCW = true;                
            }
            else
            {
                // End:0x117
                if(inAction.InputLinks[3].bHasImpulse)
                {
                    bUsefulCCW = false;
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    MaxRotationPerFrame=25.0000000
    bAllowClockwiseRotation=true
    bAllowCounterClockwiseRotation=true
    bUsefulCW=true
    bUsefulCCW=true
    MomentumFactor=4.0000000
    RotationInterpTime=10.0000000
    InitialMomentum=0.3000000
    MomentumDecay=3.5000000
    MaxRotationAngle=-1.0000000
    RotationSpeedScale=0.4000000
    // Reference: CylinderComponent'Default__LPVSInteractionPoint_WristTurning_Base.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}