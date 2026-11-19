class LPSM_WeaponReloadShotgun extends LPSM_ReloadWeaponBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TotalShotgunReloads;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StartingReloads;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte NumReloads;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldEndGracefully;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BeginAnimSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CycleAnimSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EndAnimSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataShotgun;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyShotgun;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(SPSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    bShouldEndGracefully = false;
    TotalShotgunReloads = 0;
    NumReloads = 0;
    EndAnimSeq = none;
    bWantsToFire = false;
    // End:0x2F2
    if(MySPPawn.Controller != none)
    {
        // End:0x11F
        if(MySPPawn.IsLocallyControlled())
        {
            MySPPawn.StopFire(0);
            // End:0x11F
            if(MySPPawn.IsHumanControlled())
            {
                SPPlayerController(MySPPawn.Controller).OnReloadWeaponBegin();
            }
        }
        MyShotgun = LPWeaponShotgun(MySPPawn.Weapon);
        NumReloads = byte(MyShotgun.GetMagazineCapacity() - MyShotgun.AmmoLeftInMagazine);
        TuneDataShotgun = MyShotgun.TuneDataShotgun;
        // End:0x223
        if((TuneDataShotgun != none) && MyShotgun.AmmoLeftInMagazine == 0)
        {
            NumReloads -= byte(TuneDataShotgun.NumExtraBulletsToReloadOnEmptyMagazine);
        }
        StartingReloads = NumReloads;
        // End:0x28E
        if(int(NumReloads) > MyShotgun.AmmoLeftForWeapon)
        {
            NumReloads = byte(MyShotgun.AmmoLeftForWeapon);
        }
        // End:0x2E8
        if(int(MySPPawn.Role) == int(ROLE_Authority))
        {
            LPPlayerPawn(MySPPawn).TotalShotgunReloads = NumReloads;
        }
        PlayReloadBeginAnim();
    }
    //return;    
}

function PlayReloadBeginAnim()
{
    BeginAnimSeq = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), ReloadBeginAnimFinished,, 1.0000000 * MySPPawn.GetWeaponReloadMultiplier(), 0.1000000, 0.3000000, false, true);
    //return;    
}

function PlayReloadLoopAnim()
{
    // End:0x2E
    if(MyShotgun != none)
    {
        MyShotgun.AttachShellMesh();
    }
    // End:0x5D
    if(bWantsToFire || int(NumReloads) <= int(1))
    {
        PlayReloadEndAnim();
        return;
    }
    CycleAnimSeq = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), ReloadAnimFinished,, 1.0000000 * MySPPawn.GetWeaponReloadMultiplier(), 0.1000000, 0.3000000, false, true);
    //return;    
}

function PlayReloadEndAnim()
{
    EndAnimSeq = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(2), ReloadEndAnimFinished,, 1.0000000 * MySPPawn.GetWeaponReloadMultiplier(), 0.1000000, 0.2500000, false, true);
    //return;    
}

function PlayReloadPumpAnim()
{
    EndAnimSeq = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(3), ReloadPumpAnimFinished,, 1.0000000 * MySPPawn.GetWeaponReloadMultiplier(), 0.1000000, 0.2500000, false, true);
    //return;    
}

function ReloadAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    NumReloads--;
    // End:0x1C
    if(EndAnimSeq != none)
    {
        return;
    }
    // End:0x4A
    if(!bInterrupted)
    {
        MySPPawn.NotifyWeaponReload();
    }
    // End:0xB1
    if((int(StartingReloads) < MyShotgun.GetMagazineCapacity()) && int(NumReloads) == int(0))
    {
        MySPPawn.EndCurrentSpecialMove();
        return;
    }
    PlayReloadLoopAnim();
    //return;    
}

function ReloadPumpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bShouldEndGracefully = true;
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function ReloadBeginAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    BeginAnimSeq = none;
    PlayReloadLoopAnim();
    //return;    
}

function ReloadEndAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x3C
    if(bWantsToFire)
    {
        bShouldEndGracefully = true;
        MySPPawn.EndCurrentSpecialMove();        
    }
    else
    {
        PlayReloadPumpAnim();
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0x8D
    if(bWantsToFire)
    {
        // End:0x8D
        if((MyShotgun.AmmoLeftInMagazine > 0) && int(NumReloads) < int(StartingReloads))
        {
            bShouldEndGracefully = true;
            MySPPawn.EndCurrentSpecialMove();
        }
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
        // End:0x52
        case Class'LPSMMTypes'.default.SMM_ShotgunWantsToFire:
            // End:0x4F
            if(EndAnimSeq == none)
            {
                bWantsToFire = true;
            }
            // End:0x58
            break;
        // End:0xFFFF
        default:
            // End:0x58
            break;
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private bool bShouldFire;

    // End:0x19
    if(bShouldEndGracefully)
    {
        bAborted = false;
    }
    super(SPSM_ReloadWeaponBase).SpecialMoveEnded(PrevMove, NextMove);
    // End:0xA2
    if((LPPlayerPawn(MySPPawn) != none) && int(MySPPawn.Role) == int(ROLE_Authority))
    {
        LPPlayerPawn(MySPPawn).TotalShotgunReloads = 0;
    }
    // End:0x16C
    if(MyShotgun != none)
    {
        MyShotgun.DetachShellMesh();
        bShouldFire = bWantsToFire && NextMove == none;
        // End:0x122
        if(bShouldFire)
        {
            MyShotgun.StopAttemptingToReload();
        }
        // End:0x16C
        if(!MyShotgun.IsInState('Active'))
        {
            MyShotgun.GotoState('Active');
        }
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}