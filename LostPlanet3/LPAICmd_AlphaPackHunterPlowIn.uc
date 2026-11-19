class LPAICmd_AlphaPackHunterPlowIn extends LPAICmd_PackHunterPlowIn within LPAIControllerAlphaPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpittingOutGrenadeSpecialMovePlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpittingOutGrenadeSpecialMovePlayingStarted[536870913];

function Pushed()
{
    super.Pushed();
    bSpittingOutGrenadeSpecialMovePlaying = false;
    TimeSpittingOutGrenadeSpecialMovePlayingStarted = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function GetGrenadeInMouthWhileMovingSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AlphaPackHunterGrenadeInMouthWhileMoving';
    //return ReturnValue;    
}

function GetGrenadeInMouthWhileNotMovingSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AlphaPackHunterGrenadeInMouthWhileNotMoving';
    //return ReturnValue;    
}

function GetGrenadeInMouthWhileMovingSlowSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AlphaPackHunterGrenadeInMouthWhileMovingSlow';
    //return ReturnValue;    
}

function GetSpittingOutGrenadeSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_AlphaPackHunterSpittingOutGrenade';
    //return ReturnValue;    
}

function On_LPSM_SpittingOutGrenade_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpittingOutGrenadeSpecialMovePlaying = false;
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

    function IsSpitOutAnimationDone()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float maxLengthOfAnimation, timeSinceAnimationStarted;

        timeSinceAnimationStarted = Outer.WorldInfo.TimeSeconds - TimeSpittingOutGrenadeSpecialMovePlayingStarted;
        maxLengthOfAnimation = Outer.APHPawn.TuneDataPackHunter.MaxTimeForSpitOutGrenadeAnimation;
        // End:0xC2
        if(bSpittingOutGrenadeSpecialMovePlaying && timeSinceAnimationStarted < maxLengthOfAnimation)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
AfterMajorDamageActionOrSpecialMove:

    // End:0xA8
    if(bTookGrenadeInMouth)
    {
        bSpittingOutGrenadeSpecialMovePlaying = true;
        TimeSpittingOutGrenadeSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
        Outer.PHPawn.DoSpecialMove(GetSpittingOutGrenadeSM(), true, true, On_LPSM_SpittingOutGrenade_Finished);
    }
    J0xA8:

    // End:0xD7 [Loop If]
    if(!IsSpitOutAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xA8;
    }
    goto 'EndCommand';
    stop;            
}
