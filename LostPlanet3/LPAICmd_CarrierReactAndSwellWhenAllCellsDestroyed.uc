class LPAICmd_CarrierReactAndSwellWhenAllCellsDestroyed extends LPAICmd_BasicDamageAssessment within LPAIControllerCarrier
    abstract
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationOfTauntLoop[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalDamageReceivedToMouthCoreDuringTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReactionDone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];

function Pushed()
{
    super.Pushed();
    bReactionDone = false;
    MaxTauntLoopTime = Outer.CarrierPawn.TuneDataCarrier.MaxTimeForHiveSwellReaction.GetValue();
    Outer.bJustPerformedTauntRightOutOfStrike = false;
    //return;    
}

function Popped()
{
    local /*0x97E50000-0x00000000*/ private bool bswollenHiveFoundInNode;
    local /*0x97E50000-0x00000000*/ private int iter;

    Outer.bNeedsToReactAndSwellWhenBecauseAllCellsDestroyedOnEndOfCommittedBehavior = false;
    super.Popped();
    Outer.CarrierPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    Outer.CarrierPawn.SetMaxSpeedScale(Outer.CarrierPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.CarrierPawn));
    bswollenHiveFoundInNode = false;
    iter = 0;
    J0x145:

    // End:0x258 [Loop If]
    if(iter < Outer.CarrierPawn.HiveCellsMorphWeightNode.MorphNames.Length)
    {
        // End:0x24A
        if(Outer.CarrierPawn.HiveCellsMorphWeightNode.MorphNames[iter] == Outer.CarrierPawn.TuneDataCarrier.NameOfMorphTargetToSwellHive)
        {
            bswollenHiveFoundInNode = true;
            // [Explicit Break]
            goto J0x258;
        }
        ++iter;
        // [Loop Continue]
        goto J0x145;
    }
    J0x258:

    // End:0x29B
    if(!bswollenHiveFoundInNode)
    {
        Outer.CarrierPawn.NotifyAllCellsDestroyedAndSwellTheHive();
    }
    Outer.SetCurrentCarrierMacroCombatState(4);
    Outer.CarrierReactAndSwellWhenAllCellsDestroyedCmd = none;
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

function GetReactionToAllCellsDestroyedSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierReactionToAllCellsDestroyedAndSwellPof';
    //return ReturnValue;    
}

function On_LPSM_ReactionToAllCellsDestroyed_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bReactionDone = true;
    //return;    
}

function HandleGrenadeInMouthBasedOnState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x78
    if((int(Outer.CurrentTauntState) == int(4)) || int(Outer.CurrentTauntState) == int(5))
    {
        Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = true;        
    }
    else
    {
        // End:0xDA
        if(int(Outer.CurrentTauntState) == int(10))
        {
            Outer.CarrierPawn.TurnOffRoarAudioComponent();
            return false;            
        }
        else
        {
            // End:0x15F
            if(int(Outer.CurrentTauntState) == int(1))
            {
                // End:0x13B
                if(MoveToActorCmd != none)
                {
                    Outer.AbortCommand(MoveToActorCmd);
                }
                Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = true;                
            }
            else
            {
                Outer.bNeedsToPerformGettingGrenadeInTheMouthAction = true;
            }
        }
    }
    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    return true;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x173
    if(Outer.CarrierPawn != none)
    {
        // End:0x173
        if(Outer.CarrierPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x173
            if(Outer.CarrierPawn.IsThisCoreAStickGrenadeToCore(Outer.CarrierPawn.MyCoreData[HitCoreIndex].CoreID))
            {
                // End:0x10F
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    return HandleGrenadeInMouthBasedOnState();
                }
                TotalDamageReceivedToMouthCoreDuringTaunt += AmountOfDamage;
                // End:0x13D
                if(TotalDamageReceivedToMouthCoreDuringTaunt >= DamageAmountToCauseEndOfTaunt)
                {                    
                }
                Outer.CarrierPawn.TurnOffRoarAudioComponent();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function StartReactionToAllCellsDestroyed()
{
    Outer.CarrierPawn.DoSpecialMove(GetReactionToAllCellsDestroyedSM(), true, true, On_LPSM_ReactionToAllCellsDestroyed_Finished, ActorToCareAboutWhileAssessing);
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

    function IsDoneWithReaction()
    {
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x0F
        if(bReactionDone)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x70
        if(durationOfAction > MaxDurationOfState)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
RisingIntoSwell:

    // End:0x8C
    if(Outer.CarrierPawn.TuneDataCarrier.bFocusOnEnemyDuringTaunt)
    {
        Outer.Focus = Outer.MyLPEnemy;        
    }
    else
    {
        Outer.Focus = none;
    }
    Outer.CarrierPawn.SetCurrentlyValidTargetForGrenadeAssist();
    StartReactionToAllCellsDestroyed();
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    J0x127:

    // End:0x15F [Loop If]
    if(!IsDoneWithReaction(MaxTauntLoopTime))
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x127;
    }
    // End:0x18B
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        goto 'EndCommand';
    }
    goto 'EndCommand';
StrikingOutOfTaunt:


    Outer.CurrentTauntState = 8;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = Outer.MyLPEnemy;
    goto 'EndCommand';
ToMuchDirrectDamageIntoMouth:


    Outer.CarrierPawn.TurnOffRoarAudioComponent();
    goto 'EndCommand';
EndCommand:


    // End:0x323
    if(Outer.bNeedsToPerformGettingGrenadeInTheMouthAction)
    {
        Outer.CarrierPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
        Outer.CurrentTauntState = 10;
        Outer.CarrierPawn.TurnOffRoarAudioComponent();
    }
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}