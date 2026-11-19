class LPSM_PlayerVSWinchFireRetractWithSmallPawn extends LPSM_PlayerVSWinchFireBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AttachedPawnSMClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Winch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInterpolating;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    bIsInterpolating = true;
    AttachedPawn = LPAIPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    AttachedPawn.DoSpecialMove(AttachedPawnSMClass, true, true, None, MySPPawn);
    Winch = LPWeaponVSWinch(MySPPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    Winch.PlowThroughAndAttachPawn(AttachedPawn);
    Class'SPEngine.SPUtil'.static.SetRBCollision(AttachedPawn.Mesh, MySPPawn.Mesh, false);
    AttachedPawn.SetCollision(false, false, false);
    MySPPawn.SetTimer(AttachedPawn.TuneDataAIPawn.PlowedByWinchFollowThroughTime, false, 'StartRetract', self);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.ClearTimer('StartRetract', self);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartRetract()
{
    Winch.StartInteractingWithSmallPawn(AttachedPawn);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL socketLoc, SocketRot;

    super(SPSM_PlayAnimBase).Tick(DeltaTime);
    // End:0x268
    if(Winch.SpawnedProjectile != none)
    {
        Winch.SpawnedProjectile.GetSkeletalMesh().ForceUpdate(true);
        Winch.SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation(AttachedPawn.TuneDataAIPawn.SocketNameToAttachToWhenGrabbedByVs, socketLoc, SocketRot);
        // End:0x21F
        if(bIsInterpolating)
        {
            AttachedPawn.SetLocation(VInterpTo(AttachedPawn.Location, socketLoc, DeltaTime, 300.0000000));
            AttachedPawn.SetRotation(RInterpTo(AttachedPawn.Rotation, SocketRot, DeltaTime, 65536.0000000 * float(2)));
            // End:0x21C
            if(VSize(AttachedPawn.Location - socketLoc) < 5.0000000)
            {
                bIsInterpolating = false;
            }            
        }
        else
        {
            AttachedPawn.SetLocation(socketLoc);
            AttachedPawn.SetRotation(SocketRot);
        }
    }
    //return;    
}

defaultproperties
{
    AttachedPawnSMClass=Class'LPSM_WinchStruggleBase'
    bEndSpecialMoveOnAnimFinish=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}