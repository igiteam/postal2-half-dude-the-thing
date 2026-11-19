class LPAICmd_PackHunterPlowIn extends LPAICmd_PackHunterStrikeBase within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlowingInSpecialMovePlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTookGrenadeInMouth[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMovingFastEnoughForPlowIn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMovingSoSlowGettingKnockedBack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimePlowingInSpecialMovePlayingStarted[536870913];

function Pushed()
{
    bTookGrenadeInMouth = false;
    bMovingFastEnoughForPlowIn = false;
    bMovingSoSlowGettingKnockedBack = false;
    super.Pushed();
    bPlowingInSpecialMovePlaying = false;
    TimePlowingInSpecialMovePlayingStarted = 0.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetRotationRate();
    bPlowingInSpecialMovePlaying = false;
    //return;    
}

event SPAborted()
{
    Outer.ResetRotationRate();
    bPlowingInSpecialMovePlaying = false;
    //return;    
}

function SetIfPlowingInBecauseOfGrenadeInMouth()
{
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609];

    bTookGrenadeInMouth = bGrenadeInMouth;
    //return;    
}

function SetIfMovingFastEnoughForPlowInAfterFall()
{
    local /*0x97E50000-0x00000000*/ private bool bFastMovement[8388609];

    bMovingFastEnoughForPlowIn = bFastMovement;
    //return;    
}

function SetIfMovingMovingSoSlowGettingKnockedBack()
{
    local /*0x97E50000-0x00000000*/ private bool bVerySlowMovement[8388609];

    bMovingSoSlowGettingKnockedBack = bVerySlowMovement;
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

function GetGrenadeInMouthWhileMovingSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterGrenadeInMouthWhileMoving';
    //return ReturnValue;    
}

function GetFallAndPlowInDuringFastRunSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterFallAndPlowInDuringFastRun';
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

function GetGrenadeInMouthWhileMovingSlowSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterGrenadeInMouthWhileMovingSlow';
    //return ReturnValue;    
}

function GetFallAndPlowInDuringSlowMoveSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterFallAndPlowInDuringSlowMove';
    //return ReturnValue;    
}

function On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bPlowingInSpecialMovePlaying = false;
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

    function IsPlowInAnimationDone()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float maxLengthOfAnimation, timeSinceAnimationStarted;

        timeSinceAnimationStarted = Outer.WorldInfo.TimeSeconds - TimePlowingInSpecialMovePlayingStarted;
        maxLengthOfAnimation = Outer.PHPawn.TuneDataPackHunter.MaxTimeForPlowInAnimation;
        // End:0xC2
        if(bPlowingInSpecialMovePlaying && timeSinceAnimationStarted < maxLengthOfAnimation)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    bPlowingInSpecialMovePlaying = true;
    TimePlowingInSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
    Outer.ZeroRotationRate();
    // End:0x14C
    if(bMovingFastEnoughForPlowIn)
    {
        // End:0xF7
        if(bTookGrenadeInMouth)
        {
            Outer.PHPawn.DoSpecialMove(GetGrenadeInMouthWhileMovingSM(), true, true, On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished);            
        }
        else
        {
            Outer.PHPawn.DoSpecialMove(GetFallAndPlowInDuringFastRunSM(), true, true, On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished);
        }        
    }
    else
    {
        // End:0x210
        if(bMovingSoSlowGettingKnockedBack)
        {
            // End:0x1BB
            if(bTookGrenadeInMouth)
            {
                Outer.PHPawn.DoSpecialMove(GetGrenadeInMouthWhileNotMovingSM(), true, true, On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished);                
            }
            else
            {
                Outer.PHPawn.DoSpecialMove(GetMouthCoreHitKnockBackOutOfDirectAttackSM(), true, true, On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished);
            }            
        }
        else
        {
            // End:0x272
            if(bTookGrenadeInMouth)
            {
                Outer.PHPawn.DoSpecialMove(GetGrenadeInMouthWhileMovingSlowSM(), true, true, On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished);                
            }
            else
            {
                Outer.PHPawn.DoSpecialMove(GetFallAndPlowInDuringSlowMoveSM(), true, true, On_LPSM_PackHunterFallAndPlowInDuringFastRun_Finished);
            }
        }
    }
    J0x2C4:

    // End:0x2F3 [Loop If]
    if(!IsPlowInAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x2C4;
    }
    goto 'AfterMajorDamageActionOrSpecialMove';
AfterMajorDamageActionOrSpecialMove:


    goto 'EndCommand';
EndCommand:


    Outer.PopCommand(self);
    stop;                    
}
