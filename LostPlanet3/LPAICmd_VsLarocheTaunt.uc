class LPAICmd_VsLarocheTaunt extends LPAICmd_BasicDamageAssessment within LPAIControllerVsLaroche
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTauntLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalDamageReceivedToMouthCoreDuringTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForThisTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.VsLarochePawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.VsLarochePawn.SetMaxSpeedScale(Outer.VsLarochePawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.VsLarochePawn));
    //return;    
}

function SetMinTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MinTauntLoopTime = TimeToLoop;
    //return;    
}

function SetMaxTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MaxTauntLoopTime = TimeToLoop;
    //return;    
}

function SetDamageAmountToCauseEndOfTaunt()
{
    local /*0x97E50000-0x00000000*/ private float DamageToCauseEnd[8388609];

    DamageAmountToCauseEndOfTaunt = DamageToCauseEnd;
    //return;    
}

function SetMinDistanceToBeAwayForThisTaunt()
{
    local /*0x97E50000-0x00000000*/ private float MinDistanceNeeded[8388609];

    MinDistanceToBeAwayForThisTaunt = MinDistanceNeeded;
    //return;    
}

function On_LPSM_TauntRaise_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 4;
    //return;    
}

function OnLPSM_TauntLower_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 7;
    //return;    
}

function OnLPSM_LPSM_TauntAttack_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CurrentTauntState = 9;
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function FinishTauntLoopSpecialMove()
{
    Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheTauntLoop');
    Outer.CurrentTauntState = 5;
    //return;    
}

function ShouldStrikeWhileEndingTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeToLoop;

    TimeToLoop = RandRange(MinTauntLoopTime, MaxTauntLoopTime);
    return TimeToLoop;
    //return ReturnValue;    
}

function RaiseIntoTaunt()
{
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheTauntRaise', true, true, On_LPSM_TauntRaise_Finished);
    //return;    
}

function MoveToEnemyForTaunt()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    // End:0x1B7
    if(IsActorToCareAboutWhileAssessingStillValidForAssessment())
    {
        Seperation = Outer.Seperation2DTight(ActorToCareAboutWhileAssessing);
        // End:0x1B7
        if(Seperation > MinDistanceToBeAwayForThisTaunt)
        {
            Outer.VsLarochePawn.SetMaxSpeedScale(Outer.VsLarochePawn.TuneDataVsLaroche.RunningInForTauntAttackMaxSpeedScale.GetValue());
            MoveToActorCmd = Outer.CmdMoveToActorTight(ActorToCareAboutWhileAssessing, ActorToCareAboutWhileAssessing, MinDistanceToBeAwayForThisTaunt, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToTaunt, false, true);
            MoveToActorCmd.bZeroVelocityOnFinish = false;
        }
    }
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

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function IsDoneWithThisState()
    {
        local /*0x97E50000-0x00000000*/ private byte StateToTest[8388609];
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x32
        if(int(Outer.CurrentTauntState) != int(StateToTest))
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x93
        if(durationOfAction > MaxDurationOfState)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
MoveIntoTauntRange:

    Outer.CurrentTauntState = 1;
    MoveToEnemyForTaunt();
    Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
RisingIntoTaunt:


    Outer.CurrentTauntState = 2;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    // End:0x1B0
    if(Outer.VsLarochePawn.TuneDataVsLaroche.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    Outer.VsLarochePawn.SetCurrentlyValidTargetForGrenadeAssist();
    RaiseIntoTaunt();
    J0x20E:

    // End:0x29D [Loop If]
    if(!IsDoneWithThisState(2, Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeForRaiseIntoTaunt.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x20E;
    }
    goto 'LoopingTaunt';
LoopingTaunt:


    // End:0x333
    if(Outer.VsLarochePawn.TuneDataVsLaroche.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    DurationOfTauntLoop = GetTauntLoopTime();
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheTauntLoop', true, true);
    J0x3E5:

    // End:0x41F [Loop If]
    if(!IsDoneWithThisState(4, DurationOfTauntLoop))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x3E5;
    }
    FinishTauntLoopSpecialMove();
    goto 'LoweringOutOfTaunt';
LoweringOutOfTaunt:


    Outer.CurrentTauntState = 6;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheTauntLower', true, true, OnLPSM_TauntLower_Finished);
    J0x51F:

    // End:0x5AE [Loop If]
    if(!IsDoneWithThisState(6, Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeForLoweringOutOfTaunt.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x51F;
    }
    goto 'EndCommand';
StrikingOutOfTaunt:


    Outer.CurrentTauntState = 8;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    J0x653:

    // End:0x6E2 [Loop If]
    if(!IsDoneWithThisState(8, Outer.VsLarochePawn.TuneDataVsLaroche.MaxTimeForStrikingOutOfTaunt.GetValue()))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x653;
    }
    goto 'EndCommand';
ToMuchDirrectDamageIntoMouth:


    goto 'EndCommand';
EndCommand:


    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;                    
}

defaultproperties
{
    bInterruptible=false
}