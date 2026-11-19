class LPVSInteractionPoint_Welding extends LPVSInteractionPoint
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x8AD20000-0x00000000*/ private @NULL PreWeldedActor[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private @NULL UnderWeldedActor[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private @NULL WeldFX[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private @NULL MissFX[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActiveFX[536870913];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private float PercentageOfFractureMeshToBeBroken[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private float AimScaleHoldX[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private float AimScaleHoldY[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private float AimScaleWeldX[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private float AimScaleWeldY[65537];
var(0.25_Pct) /*0x8AD20000-0x00000000*/ private @NULL GrabOffset[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float MaxNearBlurAmount[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float MaxFarBlurAmount[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float MinBlurAmount[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float FalloffExponent[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float FocusInnerRadius[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float FocusDistance[65537];
var(0.25_Pct) /*0xAFB20000-0x00000000*/ private float FOV[65537];

function CanInteractWith()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x31
    if(vsPawn.FindInventoryType(Class'LPWeaponVSWelder', true) == none)
    {
        return false;
    }
    return super.CanInteractWith(vsPawn);
    //return ReturnValue;    
}

function CanDoVSRightArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CurrentSpecialMove.CanDoVSRightArm();
    //return ReturnValue;    
}

function HasAltVSExit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CurrentSpecialMove.HasAltVSExit();
    //return ReturnValue;    
}

function DoAltVSExit()
{
    CurrentSpecialMove.DoAltVSExit();
    //return;    
}

function RegisterActors()
{
    PreWeldedActor.RegisterVSIP(self, PercentageOfFractureMeshToBeBroken);
    UnderWeldedActor.RegisterVSIP(self);
    //return;    
}

simulated function GetProgress()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return PreWeldedActor.GetProgress();
    //return ReturnValue;    
}

function Completed()
{
    SetEnabled(false);
    PreWeldedActor.SetHidden(true);
    StopFX();
    SetTimer(1.0000000, false, 'KillFX');
    //return;    
}

function NotifyFractureActorHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], HitLocation;

    // End:0x30
    if(int(Role) == int(ROLE_Authority))
    {
        StartFX(WeldFX, HitLocation);
    }
    //return;    
}

function NotifyConstructionActorHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], HitLocation;

    // End:0x30
    if(int(Role) == int(ROLE_Authority))
    {
        StartFX(MissFX, HitLocation);
    }
    //return;    
}

function StartFX()
{
    local /*0x97E50000-0x00000000*/ private @NULL inFX[8388609], InLocation;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x15A
    if(ActiveFX != inFX)
    {
        StopFX();
        // End:0x15A
        if(inFX != none)
        {
            ActiveFX = inFX;
            // End:0xC1
            if(!ActiveFX.bCurrentlyActive)
            {
                ActiveFX.bCurrentlyActive = true;
                ActiveFX.ParticleSystemComponent.SetActive(true, false);                
            }
            else
            {
                Idx = 0;
                J0xCC:

                // End:0x15A [Loop If]
                if(Idx < ActiveFX.ParticleSystemComponent.EmitterInstances.Length)
                {
                    ActiveFX.ParticleSystemComponent.SetStopSpawning(Idx, false);
                    ++Idx;
                    // [Loop Continue]
                    goto J0xCC;
                }
            }
        }
    }
    // End:0x19D
    if(ActiveFX != none)
    {
        ActiveFX.SetLocation(InLocation);
        SetTimer(0.2000000, false, 'StopFX');
    }
    //return;    
}

function StopFX()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0xA8
    if(ActiveFX != none)
    {
        Idx = 0;
        J0x1A:

        // End:0xA8 [Loop If]
        if(Idx < ActiveFX.ParticleSystemComponent.EmitterInstances.Length)
        {
            ActiveFX.ParticleSystemComponent.SetStopSpawning(Idx, true);
            ++Idx;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    ActiveFX = none;
    //return;    
}

function KillFX()
{
    StopFX();
    // End:0x4D
    if(WeldFX != none)
    {
        WeldFX.ParticleSystemComponent.DeactivateSystem();
    }
    // End:0x90
    if(MissFX != none)
    {
        MissFX.ParticleSystemComponent.DeactivateSystem();
    }
    //return;    
}

defaultproperties
{
    AimScaleHoldX=0.3500000
    AimScaleHoldY=0.3500000
    AimScaleWeldX=0.0400000
    AimScaleWeldY=0.0400000
    MaxNearBlurAmount=0.7000000
    MaxFarBlurAmount=0.0250000
    MinBlurAmount=0.6000000
    FalloffExponent=4.0000000
    FocusInnerRadius=100.0000000
    FocusDistance=400.0000000
    FOV=70.0000000
    VSSpecialMoveClass=Class'LPSM_VSIP_TorchWelding'
    GrabAnimationName="CHA_VS_Cutting_Grab_Core"
    HoldAnimationName="CHA_VS_Cutting_Hold_Core"
    RetractAnimationName="CHA_VS_Cutting_Retract_Core"
    // Reference: CylinderComponent'Default__LPVSInteractionPoint_Welding.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}