class LPAICmd_DefenderAttachToVS extends LPAICmd_MedFlyerStrikeBase within LPAIControllerDefender;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyVS[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionFlyCmd[536870913];

function Pushed()
{
    super.Pushed();
    Outer.ReleaseOrbitAccess();
    Outer.ReleaseAdHocSquadMgrAccess();
    Outer.ReleaseStrikeAccess();
    Outer.UseSuicideRamAnimations();
    Outer.DefenderPawn.AirSpeed = Outer.DefenderPawn.AirSpeed * Outer.DefenderPawn.TuneDataDefender.RamMaxSpeedScale.GetValue();
    //return;    
}

function Popped()
{
    Outer.DefenderPawn.AirSpeed = Outer.DefenderPawn.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
    // End:0xFB
    if((Outer.DefenderPawn != none) && Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx >= 0)
    {
        ConditionalAbortAttachToVS();
    }
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    EnemyVS = LPBaseVSPlayerPawn(InEnemy);
    //return;    
}

function ConditionalAbortAttachToVS()
{
    // End:0x26
    if(Outer.DefenderPawn == none)
    {
        return;
    }
    EnemyVS.AIResDefenderVS.ReleaseSlot(Outer.DefenderPawn);
    Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = -1;
    // End:0xC2
    if(!IsDoingLandingOrAttachedToVSSpecialMove())
    {
        return;
    }
    Outer.DefenderPawn.EndCurrentSpecialMove();
    //return;    
}

function IsDoingLandingOrAttachedToVSSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class SM;

    SM = GetSpecialMoveForLandingOnVs();
    // End:0x67
    if((SM != none) && Outer.DefenderPawn.IsDoingSpecialMove_OF_Class(SM))
    {
        return true;
    }
    SM = GetSpecialMoveForAttachedToVs();
    // End:0xCE
    if((SM != none) && Outer.DefenderPawn.IsDoingSpecialMove_OF_Class(SM))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetSpecialMoveForLandingOnVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderVsLandOn';
    //return ReturnValue;    
}

function GetSpecialMoveForAttachedToVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x46
    if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 0)
    {
        return Class'LPSM_DefenderVSSuckingWhileMovingA';        
    }
    else
    {
        // End:0x8C
        if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 1)
        {
            return Class'LPSM_DefenderVSSuckingWhileMovingB';            
        }
        else
        {
            // End:0xD3
            if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 2)
            {
                return Class'LPSM_DefenderVSSuckingWhileMovingC';                
            }
            else
            {
                return Class'LPSM_DefenderVSSucking';
            }
        }
    }
    //return ReturnValue;    
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
Begin:

    Outer.ReleaseAdHocSquadMgrAccess();
    Outer.PawnZeroVelocity();
    Outer.CmdSpecialMove(GetSpecialMoveForLandingOnVs(), true, 0.0000000, -1.0000000, 1, EnemyVS);
    EnemyVS.NotifyDefenderCountChanged();
    Outer.CmdSpecialMove(GetSpecialMoveForAttachedToVs(), true, 0.0000000, -1.0000000,, EnemyVS);
    stop;                
}
