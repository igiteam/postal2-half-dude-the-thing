class LPAICmd_CarrierTakeBigShotInTheMouth extends LPAICmd_CarrierStrikeBase within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTakingItSpecialMovePlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeTakingInSpecialMovePlayingStarted[536870913];

function Pushed()
{
    super.Pushed();
    bTakingItSpecialMovePlaying = false;
    TimeTakingInSpecialMovePlayingStarted = 0.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetRotationRate();
    bTakingItSpecialMovePlaying = false;
    //return;    
}

function GetTakeBigShotInTheMouthSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_CarrierTakeBigShotInTheMouth';
    //return ReturnValue;    
}

function On_LPSM_TakeBigShotInTheMouthSMn_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bTakingItSpecialMovePlaying = false;
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

    function IsTakingItInTheMouthAnimationDone()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float maxLengthOfAnimation, timeSinceAnimationStarted;

        timeSinceAnimationStarted = Outer.WorldInfo.TimeSeconds - TimeTakingInSpecialMovePlayingStarted;
        maxLengthOfAnimation = Outer.CarrierPawn.TuneDataCarrier.MaxTimeForTakeItInTheMouthInAnimation;
        // End:0xC2
        if(bTakingItSpecialMovePlaying && timeSinceAnimationStarted < maxLengthOfAnimation)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    bTakingItSpecialMovePlaying = true;
    TimeTakingInSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
    Outer.ZeroRotationRate();
    Outer.CarrierPawn.DoSpecialMove(GetTakeBigShotInTheMouthSM(), true, true, On_LPSM_TakeBigShotInTheMouthSMn_Finished);
    J0xDA:

    // End:0x109 [Loop If]
    if(!IsTakingItInTheMouthAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xDA;
    }
    goto 'AfterMajorDamageActionOrSpecialMove';
AfterMajorDamageActionOrSpecialMove:


    goto 'EndCommand';
EndCommand:


    Outer.PopCommand(self);
    stop;            
}
