class LPSM_PlayerVSUberStrikeVictim extends SPSM_FollowerPawnBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowedToCheckForRegenedVs;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    bAllowedToCheckForRegenedVs = false;
    MyVSPawn.GotoState('VSShutdown');
    super.SpecialMoveStarted(bForced, PrevMove);
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x5D
    if(!bAllowedToCheckForRegenedVs && MyVSPawn.Health <= 0)
    {
        bAllowedToCheckForRegenedVs = true;
    }
    // End:0x14D
    if(((MyVSPawn != none) && bAllowedToCheckForRegenedVs) && MyVSPawn.Health > MyVSPawn.TuneDataVSPlayerPawn.MinHealthForEntry)
    {
        MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('VSRepaired', 'None', MyVSPawn, none, none);
        MyVSPawn.EndSpecialMove(Class);
    }
    super(GameSpecialMove).Tick(DeltaTime);
    //return;    
}

function AllowRegen()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x71
    if((MyVSPawn != none) && MyVSPawn.Health < 1)
    {
        MyVSPawn.Health = 1;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    MyVSPawn.ClearTimer('AllowRegen', self);
    // End:0x113
    if(LPSM_PlayerVSDeath(NextMove) == none)
    {
        // End:0xDB
        if(MyVSPawn.Health > 0)
        {
            MyVSPawn.TriggerEventClass(Class'LPSeqEvent_VSRegenerated', MyVSPawn);
            MyVSPawn.GotoState('None');            
        }
        SpecialMoveEndedStopAnimation(PrevMove, NextMove);
        super(SPSM_LeaderFollowerBase).SpecialMoveEnded(PrevMove, NextMove);
    }
    LeaderSMInstance = none;
    LeaderPawn = none;
    //return;    
}

function SpecialMoveEndedStopAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.StopFullBodyAnim(0.5000000);
    //return;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    MyVSPawn.SetTimer(MyVSPawn.TuneDataVSPlayerPawn.HealthRegenDelayAfterDeath, false, 'AllowRegen', self);
    MyVSPawn.DoSpecialMove(Class'LPSM_PlayerVSDeath', true);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}