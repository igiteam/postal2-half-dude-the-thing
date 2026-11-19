class LPSM_GrenadePrime extends LPSM_GrenadePrimeThrowBase
    config(Pawn);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrenadeAttached;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHeld;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsRelease;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnderhandToss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrenadeHoldPaused;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAborted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeHoldSequenceTemplate;

// Export ULPSM_GrenadePrime::execAbortGrenade(FFrame&, void* const)
native final simulated function AbortGrenade();

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn.GetAnimTemplateTreeForSpecialMove(self.Class);
    //return ReturnValue;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerCtrl, CoverPawn;

    GrenadeHoldSequenceTemplate = none;
    bGrenadeHoldPaused = false;
    super(SPGFCoverSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    CoverPawn = SPGFCoverPawn(MySPPawn);
    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0xF3
    if((PlayerCtrl != none) && MySPPawn.IsLocallyControlled())
    {
        PlayerCtrl.OnGrenadePull();
        PlayerCtrl.HideCrosshair(true);
    }
    bGrenadeAttached = false;
    bHeld = false;
    bWantsRelease = false;
    bUnderhandToss = false;
    bAborted = false;
    // End:0x176
    if(CoverPawn.bDoing360Aiming)
    {
        CoverPawn.SetGrenade360DegreeSkelControlStrength(1.0000000);
    }
    PlayGrenadeGrab();
    //return;    
}

function PlayGrenadeGrab()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, MyPawn;

    MyPawn = LPPawn(MySPPawn);
    GrenadeWeapon = MyPawn.GetGrenade();
    // End:0xA3
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.PlayCustomWeaponAnimation(GrenadeWeapon.DeployAnimName, 1.0000000, 0.0000000, -1.0000000, false, true);
    }
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), PlayGrenadeHold,, 1.0000000, 0.2000000, 0.1000000, false, true);
    MyPawn.ClearTimer('EndGrenadeMovement');
    MyPawn.StartGrenadeMovement();
    //return;    
}

function PlayGrenadeHold()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, MyPawn;

    // End:0x0F
    if(bInterrupted)
    {
        return;
    }
    // End:0x28
    if(bWantsRelease)
    {
        DoGrenadeThrowSM();
        return;
    }
    bHeld = true;
    MyPawn = LPPawn(MySPPawn);
    GrenadeWeapon = MyPawn.GetGrenade();
    // End:0xC2
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.PlayCustomWeaponAnimation('WPN_StickGrenade_grenstickhold_Core', 1.0000000, 0.3000000, 0.0000000, true, true);
    }
    GrenadeHoldSequenceTemplate = GetBestSequenceTemplateByIndex(((bUnderhandToss) ? 2 : 1));
    MySPPawn.PlayUpperBodyAnimationSequence(GrenadeHoldSequenceTemplate,,, 1.0000000, 0.2000000, 0.1000000, true, true);
    //return;    
}

function UpdateGrenadeHold()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewSeq[9437185];

    none
    // End:0x25
    if(bGrenadeHoldPaused || GrenadeHoldSequenceTemplate == none)
    {
        return;
    }
    // End:0x5D
    if(NewSeq == none)
    {
        GrenadeHoldSequenceTemplate = GetBestSequenceTemplateByIndex(((bUnderhandToss) ? 2 : 1));        
    }
    else
    {
        GrenadeHoldSequenceTemplate = NewSeq;
    }
    MySPPawn.PlayUpperBodyAnimationSequence(GrenadeHoldSequenceTemplate,,, 1.0000000, 0.1500000, 0.1000000, true, true);
    //return;    
}

function PauseGrenadeHold()
{
    bGrenadeHoldPaused = true;
    // End:0x3B
    if(GrenadeHoldSequenceTemplate != none)
    {
        MySPPawn.StopUpperBodyAnim();
    }
    //return;    
}

function ResumeGrenadeHold()
{
    bGrenadeHoldPaused = false;
    // End:0x26
    if(GrenadeHoldSequenceTemplate != none)
    {
        UpdateGrenadeHold();
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x5D
        case Class'LPSMMTypes'.default.SMM_GrenadeReleased:
            // End:0x4E
            if(bHeld)
            {
                DoGrenadeThrowSM();                
            }
            else
            {
                bWantsRelease = true;
            }
            // End:0xE5
            break;
        // End:0xA4
        case Class'LPSMMTypes'.default.SMM_GrenadeCanQuickRelease:
            // End:0xA1
            if(bWantsRelease)
            {
                bWantsRelease = false;
                DoGrenadeThrowSM();
            }
            // End:0xE5
            break;
        // End:0xDF
        case Class'LPSMMTypes'.default.SMM_GrenadeAborted:
            // End:0xDC
            if(CanBeAborted())
            {
                AbortGrenade();
            }
            // End:0xE5
            break;
        // End:0xFFFF
        default:
            // End:0xE5
            break;
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DoGrenadeThrowSM()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl;

    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0xAB
    if(PlayerCtrl != none)
    {
        // End:0x7C
        if(bUnderhandToss)
        {
            PlayerCtrl.DoSpecialMove(Class'LPSM_GrenadeThrowUnderhand', true);            
        }
        else
        {
            PlayerCtrl.DoSpecialMove(Class'LPSM_GrenadeThrow', true);
        }        
    }
    else
    {
        MySPPawn.DoSpecialMove(Class'LPSM_GrenadeThrow', true);
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DesiredSeq;

    super(SPGFCoverSpecialMove).Tick(DeltaTime);
    // End:0x3F
    if(MySPPawn.IsLocallyControlled())
    {
        UpdateUnderhandOverhand();
    }
    // End:0xAF
    if((GrenadeHoldSequenceTemplate != none) && !bGrenadeHoldPaused)
    {
        DesiredSeq = GetBestSequenceTemplateByIndex(((bUnderhandToss) ? 2 : 1));
        // End:0xAF
        if(DesiredSeq != GrenadeHoldSequenceTemplate)
        {
            UpdateGrenadeHold(DesiredSeq);
        }
    }
    //return;    
}

function UpdateUnderhandOverhand()
{
    local /*0x97E50000-0x00000000*/ private bool bLastUnderhand;
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, PlayerPawn;

    PlayerPawn = LPPlayerPawn(MySPPawn);
    // End:0x2D
    if(PlayerPawn == none)
    {
        return;
    }
    bLastUnderhand = bUnderhandToss;
    bUnderhandToss = LPPlayerController(PlayerPawn.Controller).IsGrenadeUnderhand();
    // End:0x10A
    if(bLastUnderhand != bUnderhandToss)
    {
        // End:0x10A
        if(int(MySPPawn.WorldInfo.NetMode) != int(NM_Standalone))
        {
            PlayerPawn.ServerUpdateGrenadePose(bUnderhandToss);
        }
    }
    GrenadeWeapon = PlayerPawn.GetGrenade();
    // End:0x16C
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.bUnderhandToss = bUnderhandToss;
    }
    //return;    
}

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class InMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!CanBeAborted())
    {
        return false;
    }
    return super(SPSpecialMove).CanOverrideMoveWith(InMove);
    //return ReturnValue;    
}

simulated function CanBeInterruptedBySwitchWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!CanBeAborted())
    {
        return false;
    }
    return super(SPSpecialMove).CanBeInterruptedBySwitchWeapon();
    //return ReturnValue;    
}

simulated function CanBeAborted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHeld || bGrenadeAttached;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, MyLPPawn;

    super(SPGFCoverSpecialMove).SpecialMoveEnded(PrevMove, NextMove);
    MyLPPawn = LPPawn(MySPPawn);
    bIsLocalPlayer = MySPPawn.IsLocallyControlled() && MySPPawn.IsHumanControlled();
    // End:0x103
    if(bIsLocalPlayer)
    {
        LPPC = LPPlayerController(MySPPawn.Controller);
        LPPC.HideCrosshair(LPPC.ShouldHideReticle());
    }
    // End:0x270
    if((NextMove == none) || !ClassIsChildOf(NextMove.Class, Class'LPSM_GrenadeThrow'))
    {
        // End:0x16F
        if(bIsLocalPlayer)
        {
            LPPC.UnPauseFire();
        }
        MyLPPawn.EndGrenadeMovement();
        // End:0x1FB
        if(bAborted || (NextMove != none) && CanOverrideMoveWith(NextMove.Class))
        {
            MyLPPawn.NotifyGrenadeAborted();            
        }
        else
        {
            // End:0x249
            if(!ClassIsChildOf(NextMove.Class, Class'SPEngine.SPSM_ReloadWeaponBase'))
            {
                MyLPPawn.NotifyGrenadeAborted();
            }
        }
        MyLPPawn.StopUpperBodyAnim(0.2000000);        
    }
    else
    {
        MyLPPawn.SetTimer(0.7000000, false, 'EndGrenadeMovement');
    }
    //return;    
}

function GetGrenadeThrowAnimName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GTSM;

    // End:0x4B
    if(bUnderhandToss)
    {
        GTSM = LPSM_GrenadeThrow(MySPPawn.GetSpecialMoveInstance(Class'LPSM_GrenadeThrowUnderhand'));        
    }
    else
    {
        GTSM = LPSM_GrenadeThrow(MySPPawn.GetSpecialMoveInstance(Class'LPSM_GrenadeThrow'));
    }
    return GTSM.GetGrenadeThrowAnimName();
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
    CanBeOverridenByBaseClasses=/* Array type was not detected. */
    bAllowAdditiveHitReaction=true
    bAllowSwitchWeapon=true
}