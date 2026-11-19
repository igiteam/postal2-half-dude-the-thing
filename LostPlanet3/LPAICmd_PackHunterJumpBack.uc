class LPAICmd_PackHunterJumpBack extends LPAICmd_PackHunterStrikeBase within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTookGrenadeInMouth[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpecialMovePlayingStarted[536870913];

function Pushed()
{
    bTookGrenadeInMouth = false;
    super.Pushed();
    bSpecialMovePlaying = false;
    TimeSpecialMovePlayingStarted = 0.0000000;
    Outer.LastJumpBackTime = Outer.WorldInfo.TimeSeconds;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetRotationRate();
    bSpecialMovePlaying = false;
    //return;    
}

event SPAborted()
{
    Outer.ResetRotationRate();
    bSpecialMovePlaying = false;
    //return;    
}

function SetIfJumpingBackBecauseOfGrenadeInMouth()
{
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609];

    bTookGrenadeInMouth = bGrenadeInMouth;
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x163
    if(Outer.PHPawn != none)
    {
        // End:0x139
        if(Outer.PHPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x139
            if((Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 1) || Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 2)
            {
                Outer.StartAdditiveTailCoreHitAnimation(1.0000000);
            }
        }
        // End:0x163
        if((TypeOfDamage == Class'LPDamageTypeGrenadeActual') && !bTookGrenadeInMouth)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function GetGrenadeInMouthWhileNotMovingSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterGrenadeInMouthWhileNotMoving';
    //return ReturnValue;    
}

function GetMouthCoreHitKnockBackOutOfDirectAttackSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterMouthCoreHitKnockBackOutOfDirectAttack';
    //return ReturnValue;    
}

function On_LPSM_PackHunterJumpBack_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
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

    function IsJumpBackAnimationDone()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float maxLengthOfAnimation, timeSinceAnimationStarted;

        timeSinceAnimationStarted = Outer.WorldInfo.TimeSeconds - TimeSpecialMovePlayingStarted;
        maxLengthOfAnimation = Outer.PHPawn.TuneDataPackHunter.MaxTimeForPlowInAnimation;
        // End:0xC2
        if(bSpecialMovePlaying && timeSinceAnimationStarted < maxLengthOfAnimation)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    bSpecialMovePlaying = true;
    TimeSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
    Outer.ZeroRotationRate();
    // End:0xEA
    if(bTookGrenadeInMouth)
    {
        Outer.PHPawn.DoSpecialMove(GetGrenadeInMouthWhileNotMovingSM(), true, true, On_LPSM_PackHunterJumpBack_Finished);        
    }
    else
    {
        Outer.PHPawn.DoSpecialMove(GetMouthCoreHitKnockBackOutOfDirectAttackSM(), true, true, On_LPSM_PackHunterJumpBack_Finished);
    }
    J0x13C:

    // End:0x16B [Loop If]
    if(!IsJumpBackAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x13C;
    }
    goto 'AfterMajorDamageActionOrSpecialMove';
AfterMajorDamageActionOrSpecialMove:


    goto 'EndCommand';
EndCommand:


    Outer.PopCommand(self);
    stop;                    
}
