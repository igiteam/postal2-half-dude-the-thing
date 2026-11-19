class LPAICmd_Act1BossSpawnLeeches extends LPAICmd_Attack within LPAIControllerAct1Boss;

state StateCmdActive
{Begin:

    Outer.StopFollowingEnemy();
    J0x1F:

    // End:0xB1 [Loop If]
    if(Outer.LeechesRemaining > 0)
    {
        Outer.PlaySM(Class'LPSM_Act1BossLeechSpawnIntro');
        J0x6C:

        // End:0xAE [Loop If]
        if(Outer.bSpecialMovePlaying)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x6C;
        }
        // [Loop Continue]
        goto J0x1F;
    }
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bInterruptible=false
}