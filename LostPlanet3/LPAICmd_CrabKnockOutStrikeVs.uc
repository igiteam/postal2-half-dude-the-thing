class LPAICmd_CrabKnockOutStrikeVs extends LPAICmd_CrabPincerStrikeVs within LPAIControllerBaseSnowCrab;

function StartMeleeVs()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackKnockOutVS', true, false, On_LPSM_SnowCrabAttackPincerVs_Finished);
    //return;    
}

state StateCmdActive
{Begin:

    StartMeleeVs();
    J0x0A:

    // End:0x3D [Loop If]
    if(!bMeleePincerFinished)
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.MeleeFinished();
    Outer.ResetTimeForNextPincerBash();
    Outer.CmdCrabClawStrikeVs(EnemyForStrike,, 1);
    Outer.PopCommand(self);
    stop;        
}
