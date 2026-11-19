class LPAICmd_CarrierTalonSweepStrikePof extends LPAICmd_CarrierTalonSweepStrike within LPAIControllerCarrier;

function Pushed()
{
    Outer.bKnockedDownTargetOnLastTalonSweepStrikePof = false;
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    // End:0x71
    if(OldCommandName == 'LPAICmd_CarrierTauntPof')
    {
        bMeleePincerFinished = true;
        Outer.Focus = EnemyForStrike;
        PreviousFocus = EnemyForStrike;
    }
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x311
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x311
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.CarrierPawn != none)
        {
            Outer.CarrierPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
            Outer.bKnockedDownTargetOnLastTalonSweepStrikePof = EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerCarrierSweepHitReaction');
            // End:0x311
            if(Outer.bKnockedDownTargetOnLastTalonSweepStrikePof)
            {
                Outer.LastTimeKnockedPlayerDown = Outer.WorldInfo.TimeSeconds;
                LPPawn(Info.Impact.HitActor).CarrierKnockDownTimeToStayOnGround = Outer.CarrierPawn.TuneDataCarrier.SweepHitOnGroundTime.GetValue();
                // End:0x2D4
                if(int(Outer.CurrentCarrierStrikeAttempting) == int(2))
                {
                    Outer.CarrierPawn.EndSpecialMove(Class'LPSM_CarrierTalonSweepLeftStrikePOF');                    
                }
                else
                {
                    Outer.CarrierPawn.EndSpecialMove(Class'LPSM_CarrierTalonSweepRightStrikePOF');
                }
            }
        }
    }
    //return;    
}

function On_CarrierTalonSweepStrikePOF_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x101
    if(!Outer.bKnockedDownTargetOnLastTalonSweepStrikePof)
    {
        bMeleePincerFinished = false;
        // End:0xAD
        if(int(Outer.CurrentCarrierStrikeAttempting) == int(2))
        {
            Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonSweepLeftStrikeFailPOF', true, false, On_CarrierTalonSweepStrikePOFFail_Finished);            
        }
        else
        {
            Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonSweepRightStrikeFailPOF', true, false, On_CarrierTalonSweepStrikePOFFail_Finished);
        }        
    }
    else
    {
        bMeleePincerFinished = false;
        // End:0x18A
        if(int(Outer.CurrentCarrierStrikeAttempting) == int(2))
        {
            Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonSweepLeftStrikeIntoTauntPOF', true, false, On_CarrierTalonSweepStrikePOFTaunt_Finished);            
        }
        else
        {
            Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonSweepRightStrikeIntoTauntPOF', true, false, On_CarrierTalonSweepStrikePOFTaunt_Finished);
        }
    }
    //return;    
}

function On_CarrierTalonSweepStrikePOFFail_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePincerFinished = true;
    //return;    
}

function On_CarrierTalonSweepStrikePOFTaunt_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    TauntPerformedRightOutOfStrike = Outer.CmdPerformTauntPof(EnemyForStrike, Outer.CarrierPawn.TuneDataCarrier.MinTauntLoopTime.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MaxTauntLoopTime.GetValue(), Outer.CarrierPawn.TuneDataCarrier.DamageAmountToCauseEndOfTaunt.GetValue(), Outer.CarrierPawn.TuneDataCarrier.MinDistanceAwayForReactiveTaunt.GetValue(), true,, 1);
    //return;    
}

function StartMeleePoF()
{
    bMeleePincerFinished = false;
    // End:0xB2
    if(int(Outer.CurrentCarrierStrikeAttempting) == int(2))
    {
        Outer.bLastPofKnockDownStrikeFromRight = false;
        Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonSweepLeftStrikePOF', true, false, On_CarrierTalonSweepStrikePOF_Finished, EnemyForStrike);        
    }
    else
    {
        Outer.bLastPofKnockDownStrikeFromRight = true;
        Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonSweepRightStrikePOF', true, false, On_CarrierTalonSweepStrikePOF_Finished, EnemyForStrike);
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
Begin:

    StartMeleePoF();
    J0x0A:

    // End:0x3D [Loop If]
    if(!bMeleePincerFinished)
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}