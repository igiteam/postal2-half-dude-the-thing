class LPAICmd_CarrierComboBashStrike extends LPAICmd_CarrierStrikeBase within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeTalonBashFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeHitEnemy[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bMeleeHitEnemy = false;
    bMeleeTalonBashFinished = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    //return;    
}

function On_CarrierTalonBashStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleeTalonBashFinished = true;
    //return;    
}

function StartMeleeStrikeSM()
{
    bMeleeTalonBashFinished = false;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierComboBashStrikePof', true, false, On_CarrierTalonBashStrike_Finished);
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x155
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x155
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.CarrierPawn != none)
        {
            Outer.CarrierPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
            Outer.LastTimeTalonBashedVs = Outer.WorldInfo.TimeSeconds;
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

    StartMeleeStrikeSM();
    J0x0A:

    // End:0x39 [Loop If]
    if(!bMeleeTalonBashFinished)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;                
}
