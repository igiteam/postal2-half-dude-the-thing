class LPAICmd_CarrierTalonFlurryStrikePof extends LPAICmd_CarrierTalonFlurryStrike within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToFinishStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesHitTarget[536870913];

function Pushed()
{
    NumTimesHitTarget = 0;
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x4C
    if(!bMeleePincerFinished)
    {
        Outer.CarrierPawn.EndSpecialMove(Class'LPSM_CarrierTalonFlurryStrikePOF');
    }
    super.Popped();
    //return;    
}

function On_CarrierTalonFlurryStrikeInPOF_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonFlurryStrikePOF', true, false);
    //return;    
}

function GetDurationOfStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0xF1
    if(int(Outer.GetCurrentCarrierMacroCombatState()) == int(4))
    {
        return RandRange(Outer.CarrierPawn.TuneDataCarrier.MinAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxAmountOfTimeToLoopFlurryStrikeWhenBerserkAttackPof.GetValue());
    }
    return RandRange(Outer.CarrierPawn.TuneDataCarrier.MinAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxAmountOfTimeToLoopFlurryStrikeWhenDirectAttackPof.GetValue());
    //return ReturnValue;    
}

function StartMeleePoF()
{
    TimeToFinishStrike = Outer.WorldInfo.TimeSeconds + (GetDurationOfStrike());
    bMeleePincerFinished = false;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonFlurryStrikeInPOF', true, false, On_CarrierTalonFlurryStrikeInPOF_Finished, EnemyForStrike);
    //return;    
}

function On_CarrierTalonFlurryStrikeOutPOF_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePincerFinished = true;
    //return;    
}

function StopMeleePoF()
{
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonFlurryStrikeOutPOF', true, false, On_CarrierTalonFlurryStrikeOutPOF_Finished);
    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];

    Outer.CarrierPawn.LineSweepHitTester.ResetHits();
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x5A
    if((EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        NumTimesHitTarget++;
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
        super.PushedState();
        //return;        
    }

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function IsStrikeFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bMeleePincerFinished)
        {
            return true;
        }
        // End:0x52
        if(Outer.WorldInfo.TimeSeconds > TimeToFinishStrike)
        {
            return true;
        }
        // End:0x9F
        if(!Class'SPEngine.SPUtil'.static.IsInFront(Outer.CarrierPawn, EnemyForStrike))
        {
            return true;
        }
        // End:0xF8
        if((EnemySeperation2D()) > Outer.CarrierPawn.TuneDataCarrier.MaxSeparationRequiredToMaintainFlurry)
        {
            return true;
        }
        // End:0x152
        if(float(NumTimesHitTarget) >= Outer.CarrierPawn.TuneDataCarrier.FlurryAttack_MaxNumberHits)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    StartMeleePoF();
    J0x0A:

    // End:0x3D [Loop If]
    if(!IsStrikeFinished())
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    StopMeleePoF();
    J0x47:

    // End:0x7A [Loop If]
    if(!bMeleePincerFinished)
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0x47;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bInterruptible=false
}