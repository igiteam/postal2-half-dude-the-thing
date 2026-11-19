class LPAICmd_MedFlyerBasicLobStrike extends LPAICmd_MedFlyerStrikeBase within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpecialMovePlayingStarted;

function Pushed()
{
    super.Pushed();
    bSpecialMovePlaying = false;
    TimeSpecialMovePlayingStarted = 0.0000000;
    //return;    
}

function Popped()
{
    // End:0x58
    if(Outer.MedFlyerPawn != none)
    {
        Outer.MedFlyerPawn.StopPawnChoreography();
    }
    Outer.NotifyCombatManagerOfStrikeCompleted(2);
    super.Popped();
    //return;    
}

function On_LPSM_MedFlyerStaticStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_MedFlyerBasicRangedLobStrike';
    //return ReturnValue;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 5.0000000;
    //return ReturnValue;    
}

function IsStrikeAnimationDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float maxLengthOfAnimation, timeSinceAnimationStarted;

    timeSinceAnimationStarted = Outer.WorldInfo.TimeSeconds - TimeSpecialMovePlayingStarted;
    maxLengthOfAnimation = GetMaxStrikeAnimationTime();
    // End:0x84
    if(bSpecialMovePlaying && timeSinceAnimationStarted < maxLengthOfAnimation)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartStaticStrikeSpecialMove()
{
    bSpecialMovePlaying = true;
    TimeSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
    // End:0x18E
    if(EnemyForStrike != none)
    {
        Outer.PawnLookAtActor(EnemyForStrike);
        Outer.MedFlyerPawn.SetAimInfoForRangedLobStrike(EnemyForStrike.Location, EnemyForStrike, Outer.MedFlyerPawn.GetRangedLobStrikeTierForCurrentAttack(), Outer.MedFlyerPawn.GetRangedLobStrikeZoneForCurrentAttack(), Outer.MedFlyerPawn.TuneDataMedFlyer.HieghtOffTargetPointForEndOfLobFireArc);        
    }
    Outer.PawnZeroVelocity();
    Outer.MedFlyerPawn.DoSpecialMove(GetStaticStrikeSpecialMoveClass(), true, true, On_LPSM_MedFlyerStaticStrike_Finished, EnemyForStrike);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    StartStaticStrikeSpecialMove();
    J0x0A:

    // End:0x39 [Loop If]
    if(!IsStrikeAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.PopCommand(self);
    stop;            
}
