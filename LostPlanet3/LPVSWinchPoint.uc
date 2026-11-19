class LPVSWinchPoint extends LPZiplinePoint_Base
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Mesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SkelActorToAttachTo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AttachmentBoneName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchBoneOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchWeapon;
var(0.25_Pct) /*0xD83A0000-0x00000000*/ private bool bUseAsZipline[65537];
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private bool bFireDelayedWinchRelease[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShockStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanSee;
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private bool bAllowVSWinchAction[65537];
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private bool bForceDisplayActive[65537];
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private bool bForceDisplayInactive[65537];
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private bool bAllowVSPitchToTarget[65537];
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private float EventDelayTime[65537];
var(0.25_Pct) /*0x8AF00000-0x00000000*/ private float VisibilityDistance[65537];

// Export ULPVSWinchPoint::execUpdate(FFrame&, void* const)
native simulated function Update()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnLocation[8388609], CameraPos, CameraDir;


}

// Export ULPVSWinchPoint::execGetGrapplePoint(FFrame&, void* const)
native simulated function GetGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdjustForCollision[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPVSWinchPoint::execCheckGrappleEarlyOuts(FFrame&, void* const)
native simulated function CheckGrappleEarlyOuts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPVSWinchPoint::execIsInViewableRange(FFrame&, void* const)
native simulated function IsInViewableRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraLocation[8388609], CameraDir;
    local /*0x97E50000-0x00000000*/ private float RequiredDot[8388609], MaxDist, ReturnValue;


}

function Reset()
{
    super.Reset();
    WinchWeapon = none;
    bUseAsZipline = default.bUseAsZipline;
    //return;    
}

simulated function TryToInteractWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x20
    if(!bEnabled || bForceDisplayInactive)
    {
        return false;
    }
    // End:0x37
    if(bFireDelayedWinchRelease)
    {
        FireWinchDelayEventAndRelease();
    }
    return super.TryToInteractWith();
    //return ReturnValue;    
}

simulated function FireWinchDelayEventAndRelease()
{
    SetTimer(EventDelayTime, false, 'FireRetract');
    //return;    
}

simulated function NotifyWinchDetached()
{
    ClearTimer('FireRetract');
    WinchWeapon = none;
    SetWinchPointState();
    //return;    
}

simulated function FireRetract()
{
    TriggerEventClass(Class'LPSeqEvent_VSWinchReleased', self);
    WinchWeapon.GotoState('Retracting');
    //return;    
}

function OnToggleVSWinchPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    // End:0x127
    if(Action.SkelActorToAttachTo != none)
    {
        SkelActorToAttachTo = Action.SkelActorToAttachTo;
    }
    // End:0x17B
    if(Action.AttachmentBoneName != 'None')
    {
        AttachmentBoneName = Action.AttachmentBoneName;
    }
    WinchBoneOffset = Action.AttachmentBoneOffset;
    SetWinchPointState();
    //return;    
}

simulated function OnInteractionPointHUDForceActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bForceDisplayActive = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bForceDisplayActive = false;            
        }
        else
        {
            // End:0xDE
            if(Action.InputLinks[2].bHasImpulse)
            {
                bForceDisplayActive = !bForceDisplayActive;                
            }
            else
            {
                // End:0x125
                if(Action.InputLinks[3].bHasImpulse)
                {
                    bForceDisplayInactive = true;                    
                }
                else
                {
                    // End:0x16C
                    if(Action.InputLinks[4].bHasImpulse)
                    {
                        bForceDisplayInactive = false;                        
                    }
                    else
                    {
                        // End:0x1BB
                        if(Action.InputLinks[5].bHasImpulse)
                        {
                            bForceDisplayInactive = !bForceDisplayInactive;
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    super(LPGrapplePointActorBase).OnToggle(Action);
    // End:0x2C
    if(!bEnabled)
    {
        FireRetract();
    }
    //return;    
}

simulated function SetWinchPointState()
{
    // End:0x36
    if(bEnabled)
    {
        Mesh.SetBlockRigidBody(true);
        SetCollision(true, true);        
    }
    else
    {
        Mesh.SetBlockRigidBody(false);
        SetCollision(true, false);
        // End:0xD3
        if(WinchWeapon != none)
        {
            // End:0xC8
            if(WinchWeapon.SpawnedProjectile != none)
            {
                WinchWeapon.SpawnedProjectile.LifeSpan = -1.0000000;
            }
            WinchWeapon = none;
        }
    }
    //return;    
}

simulated function NotifyWinchAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch[8388609];

    WinchWeapon = Winch;
    WinchWeapon.WinchPointOffset = WinchBoneOffset;
    WinchWeapon.GotoState('WinchPointInteracting');
    TriggerEventClass(Class'LPSeqEvent_VSWinchAttached', self);
    SetCollision(true, false);
    //return;    
}

simulated function GetHUDReticleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x1C
    if(SkelActorToAttachTo == none)
    {
        return Location;        
    }
    else
    {
        return SkelActorToAttachTo.SkeletalMeshComponent.GetBoneLocation(AttachmentBoneName);
    }
    //return ReturnValue;    
}

function ShockObject()
{
    // End:0x43
    if(!bShockStarted)
    {
        TriggerEventClass(Class'LPSeqEvent_VSIP_Taser', WinchWeapon.Owner, 0);
    }
    //return;    
}

simulated function GetLineDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Loc;

    // End:0xAC
    if((WinchWeapon != none) && WinchWeapon.MyLpPawnOwner != none)
    {
        WinchWeapon.MyLpPawnOwner.Mesh.GetSocketWorldLocationAndRotation('WinchCable', Loc);
        return Normal(Loc - Location);        
    }
    else
    {
        return super.GetLineDirection();
    }
    //return ReturnValue;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_VSInteractionPointDisable:
            return true;
        // End:0x59
        case Class'LPSMMTypes'.default.SMM_VSInteractionPointEnable:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

simulated event Destroyed()
{
    ClearTimer('FireRetract');
    super(Actor).Destroyed();
    //return;    
}

defaultproperties
{
    bUseAsZipline=true
    bAllowVSWinchAction=true
    EventDelayTime=1.0000000
    VisibilityDistance=-1.0000000
    GrappleType=Class'LPSM_GrappleToZipline'
    bEnabled=true
    // Reference: CylinderComponent'Default__LPVSWinchPoint.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    TickGroup=ETickingGroup.TG_PostUpdateWork
    bNoDelete=false
    bBlockActors=true
    SupportedEvents=/* Array type was not detected. */
}