class LPAICmd_VsLarocheDamageAssessment extends LPAICmd_BasicDamageAssessment within LPAIControllerVsLaroche
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLastSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfAssLoopPart1[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfAssLoopPart2[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDurationOfAssLoopPart3[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageAmountToCauseEndOfDamAss[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToBeAwayForThisDamAss[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentAssLoopPart[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamAssStateLoopPartCount[536870913];

function Pushed()
{
    super.Pushed();
    TimeLastSpecialMoveStarted = -1.0000000;
    MaxDurationOfAssLoopPart1 = 5.0000000;
    MaxDurationOfAssLoopPart2 = 5.0000000;
    MaxDurationOfAssLoopPart3 = 5.0000000;
    DamageAmountToCauseEndOfDamAss = 20.0000000;
    MinDistanceToBeAwayForThisDamAss = 1000.0000000;
    CurrentAssLoopPart = -1;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.VsLarochePawn.SetMaxSpeedScale(Outer.VsLarochePawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.VsLarochePawn));
    //return;    
}

function SetDamageAmountToCauseEndOfDamAss()
{
    local /*0x97E50000-0x00000000*/ private float DamageToCauseEnd[8388609];

    DamageAmountToCauseEndOfDamAss = DamageToCauseEnd;
    //return;    
}

function SetMinDistanceToBeAwayForThisDamAss()
{
    local /*0x97E50000-0x00000000*/ private float MinDistanceNeeded[8388609];

    MinDistanceToBeAwayForThisDamAss = MinDistanceNeeded;
    //return;    
}

function ShouldJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldDoFastSprintToDamageAssessmentPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetJumpBackSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarocheMoveBackBeforeDamageAssessment';
    //return ReturnValue;    
}

function On_LPSM_DamAssPart1_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    CurrentAssLoopPart = 2;
    //return;    
}

function On_LPSM_DamAssPart2_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    CurrentAssLoopPart = 3;
    //return;    
}

function On_LPSM_DamAssPart3_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    CurrentAssLoopPart = -1;
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

function FinishDamAssLoopSpecialMove()
{
    // End:0x4F
    if(CurrentAssLoopPart == 1)
    {
        Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheDamAssPart1');        
    }
    else
    {
        // End:0x9F
        if(CurrentAssLoopPart == 2)
        {
            Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheDamAssPart2');            
        }
        else
        {
            // End:0xEC
            if(CurrentAssLoopPart == 3)
            {
                Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheDamAssPart3');
            }
        }
    }
    //return;    
}

function GetMaxDamAssPartDurations()
{
    MaxDurationOfAssLoopPart1 = 5.0000000;
    MaxDurationOfAssLoopPart2 = 5.0000000;
    MaxDurationOfAssLoopPart3 = 5.0000000;
    return;
    //return;    
}

function GetMaxDamAssPartDuration()
{
    local /*0x97E50000-0x00000000*/ private int CurrentDamAssPart[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x1C
    if(CurrentDamAssPart == 1)
    {
        return MaxDurationOfAssLoopPart1;        
    }
    else
    {
        // End:0x39
        if(CurrentDamAssPart == 2)
        {
            return MaxDurationOfAssLoopPart2;            
        }
        else
        {
            // End:0x53
            if(CurrentDamAssPart == 3)
            {
                return MaxDurationOfAssLoopPart3;
            }
        }
    }
    return 5.0000000;
    //return ReturnValue;    
}

function StartDamAssPart1()
{
    CurrentAssLoopPart = 1;
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheDamAssPart1', true, true, On_LPSM_DamAssPart1_Finished);
    //return;    
}

function StartDamAssPart2()
{
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheDamAssPart2', true, true, On_LPSM_DamAssPart2_Finished);
    //return;    
}

function StartDamAssPart3()
{
    TimeLastSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheDamAssPart3', true, true, On_LPSM_DamAssPart3_Finished);
    //return;    
}

function StartNextDamAssPart()
{
    // End:0x2D
    if((CurrentAssLoopPart == 0) || CurrentAssLoopPart == 1)
    {
        StartDamAssPart1();        
    }
    else
    {
        // End:0x4A
        if(CurrentAssLoopPart == 2)
        {
            StartDamAssPart2();            
        }
        else
        {
            // End:0x64
            if(CurrentAssLoopPart == 3)
            {
                StartDamAssPart3();
            }
        }
    }
    //return;    
}

function IncrementCurrentAssLoopPartBecauseForcedEnd()
{
    // End:0x2F
    if((CurrentAssLoopPart >= 0) && CurrentAssLoopPart < 3)
    {
        ++CurrentAssLoopPart;        
    }
    else
    {
        CurrentAssLoopPart = -1;
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

    function IsDoneWithThisDamAssPart()
    {
        local /*0x97E50000-0x00000000*/ private int PartOfDamAss[8388609];
        local /*0x97E50000-0x00000000*/ private float MaxDurationOfPart[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction;

        // End:0x19
        if(CurrentAssLoopPart != PartOfDamAss)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLastSpecialMoveStarted;
        // End:0x84
        if(durationOfAction > MaxDurationOfPart)
        {
            IncrementCurrentAssLoopPartBecauseForcedEnd();
            return true;
        }
        return false;
        //return ReturnValue;        
    }
DamageAssessment:

    Outer.myAIPawn.SetMaxSpeedScale(MaxSpeedScaleBeforeJumpBack);
    Outer.myAIPawn.AccelRate = Outer.myAIPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
    // End:0x271
    if(!HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq))
    {
        Outer.EnableAnnounceEffects(true);
        bAssessingDamage = true;
        Outer.Focus = Outer.MyLPEnemy;
        TimeStartedAssessingDamage = Outer.WorldInfo.TimeSeconds;
        CurrentAssLoopPart = 1;
        DamAssStateLoopPartCount = 0;
        TimeLastSpecialMoveStarted = TimeStartedAssessingDamage;
        J0x1B6:

        // End:0x26E [Loop If]
        if(CurrentAssLoopPart != -1)
        {
            J0x1C9:

            // End:0x256 [Loop If]
            if(!IsDoneWithThisDamAssPart(DamAssStateLoopPartCount, GetMaxDamAssPartDuration(CurrentAssLoopPart)))
            {
                // End:0x236
                if((HasEnemyGottenToCloseDurringAssessmentOrAnnounce(CurrentSeperationToEnemySq)) || HasEnemyGottenToFarAwayDurringAssessment(CurrentSeperationToEnemySq))
                {
                    FinishDamAssLoopSpecialMove();
                    goto 'EndCommand';
                }
                Outer.Sleep(0.0100000);
                // [Loop Continue]
                goto J0x1C9;
            }
            ++DamAssStateLoopPartCount;
            StartNextDamAssPart();
            // [Loop Continue]
            goto J0x1B6;
        }        
    }
    J0x271:

    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}