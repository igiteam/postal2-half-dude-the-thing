class LPAICmd_CrabPincerStrikePof extends LPAICmd_CrabPincerStrike within LPAIControllerBaseSnowCrab;

function Pushed()
{
    super.Pushed();
    Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(4, 0, EnemyForStrike);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.CrabPawn.HandleNotifyPlayerDodgeWindow(4, 1, EnemyForStrike);
    // End:0xA2
    if(Outer.CrabPawn.AreClawsBothDismembered())
    {
        Outer.SetWantsNewEnemy(true);
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x95
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller == none)
    {
        Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x8C
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller == none)
    {
        Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
    }
    //return;    
}

function On_LPSM_SnowCrabAttackPincerPOF_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePincerFinished = true;
    //return;    
}

function StartMeleePoF()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPincerPOF', true, false, On_LPSM_SnowCrabAttackPincerPOF_Finished);
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
    J0x00:
    // End:0xE9 [Loop If]
    if(!Outer.IsTimeForNextPincerBash())
    {
        Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // End:0xE6
        if(!Outer.IsInBashZone(EnemyForStrike.Location, true))
        {
            Outer.MeleeFinished();
            Outer.PopCommand(self);
        }
        // [Loop Continue]
        goto J0x00;
    }
    StartMeleePoF();
    J0xF3:

    // End:0x145 [Loop If]
    if(!bMeleePincerFinished)
    {
        Outer.HandlePossibleNeedToPushAwayPawnWhileNotMoving();
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0xF3;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;                
}
