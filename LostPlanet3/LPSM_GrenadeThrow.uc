class LPSM_GrenadeThrow extends LPSM_GrenadePrimeThrowBase
    config(Pawn);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirePaused;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAborted;

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
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(SPGFCoverSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    bFirePaused = true;
    PlayGrenadeThrow();
    //return;    
}

function PlayGrenadeThrow()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, MyPawn;

    MyPawn = LPPawn(MySPPawn);
    GrenadeWeapon = MyPawn.GetGrenade();
    // End:0x8E
    if(GrenadeWeapon != none)
    {
        GrenadeWeapon.PlayCustomWeaponAnimation('WPN_StickGrenade_grenstickrelease_Core', 1.0000000, 0.0000000, 0.0000000, false, true);
    }
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), ThrowAnimFinished,, 1.0000000, 0.1000000, 0.2500000, false, true);
    //return;    
}

function ThrowAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0xEB
    if(MySPPawn.IsHumanControlled())
    {
        // End:0x82
        if(MySPPawn.IsLocallyControlled())
        {
            LPPlayerController(MySPPawn.Controller).UnPauseFire();
        }
        // End:0xEB
        if(int(MySPPawn.Role) == int(ROLE_Authority))
        {
            LPPlayerController(MySPPawn.Controller).BroadcastChatter(7);
        }
    }
    bFirePaused = false;
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function AbortGrenade()
{
    bAborted = true;
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyLPPawn, PlayerPawn;

    super(SPGFCoverSpecialMove).SpecialMoveEnded(PrevMove, NextMove);
    MyLPPawn = LPPawn(MySPPawn);
    // End:0x117
    if(bFirePaused)
    {
        // End:0xC9
        if(MyLPPawn.IsLocallyControlled() && MyLPPawn.IsHumanControlled())
        {
            LPPlayerController(MySPPawn.Controller).UnPauseFire();
        }
        // End:0xF8
        if(bAborted)
        {
            MyLPPawn.NotifyGrenadeAborted();            
        }
        else
        {
            MyLPPawn.NotifyGrenadeReleased();
        }
    }
    MyLPPawn.StopUpperBodyAnim(0.2500000);
    PlayerPawn = LPPlayerPawn(MyLPPawn);
    // End:0x185
    if(PlayerPawn != none)
    {
        PlayerPawn.CheckCSAForSwitchToBestWeapon();
    }
    //return;    
}

function GetGrenadeThrowAnimName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Node;

    Node = GetBestSequenceTemplateByIndex(0);
    return Node.AnimSeqName;
    //return ReturnValue;    
}

defaultproperties
{
    bFirePaused=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}