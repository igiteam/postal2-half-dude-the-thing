class LPAICmd_StalkerHitReaction extends LPAICmd_HitReaction within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeAttackCommand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeEnemy[536870913];

function OnSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;
    local /*0x97E50000-0x00000000*/ private float DistanceToPawn;

    StrikeEnemy = LPPlayerPawn(Outer.StalkerPawn.TakeDamageParams.InstigatedByPawn);
    // End:0xF1
    if(StrikeEnemy != none)
    {
        DistanceToPawn = VSize2D(StrikeEnemy.Location - Outer.StalkerPawn.Location);
        // End:0xF1
        if(DistanceToPawn < float(200))
        {
            GotoState('ReactiveAttack');
            return;
        }
    }
    super(LPAICmd_SpecialMove).OnSpecialMoveFinished(FinishedSM, NextSM);
    //return;    
}

state ReactiveAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeStampReactiveAttack = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(StrikeAttackCommand);
        StrikeAttackCommand = none;
        //return;        
    }
Begin:

    StrikeAttackCommand = Outer.CmdStalkerStrikeKnockDown(StrikeEnemy);
    StrikeAttackCommand = none;
    Outer.PopCommand(self);
    stop;                    
}
