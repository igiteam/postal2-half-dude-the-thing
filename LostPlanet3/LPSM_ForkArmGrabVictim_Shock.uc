class LPSM_ForkArmGrabVictim_Shock extends LPSM_ForkArmGrabVictim_Hold
    config(Game);

function EndAnimationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SpitterPawn, carrierCtrl, CrabPawn, crabCtrl;

    // End:0x2E
    if(LeaderSMInstance != none)
    {
        LeaderPawn.StopPawnChoreography();
    }
    // End:0x44A
    if(MySPPawn != none)
    {
        // End:0x1A0
        if(ClassIsChildOf(MySPPawn.Class, Class'LPAIPawnSpitter'))
        {
            SpitterPawn = LPAIPawnSpitter(MySPPawn);
            // End:0x14E
            if(SpitterPawn.IsTailDestroyed())
            {
                SpitterPawn.MySpitterController.CmdSpitterDefaultStun(LeaderPawn, SpitterPawn.TuneDataAIPawn.DurationOfShockStun.GetValue(), Class'LPSM_SpitterTazed', Class'LPSM_SpitterTazedStunStart', Class'LPSM_SpitterTazedStunFinish', 0);                
            }
            else
            {
                SpitterPawn.MySpitterController.CmdSpitterDefaultStun(LeaderPawn, 0.0000000,,, Class'LPSM_SnowCrabShockExplode', 0);
            }            
        }
        else
        {
            // End:0x30C
            if(ClassIsChildOf(MySPPawn.Class, Class'LPAIPawnBaseSnowCrab'))
            {
                crabCtrl = LPAIControllerBaseSnowCrab(MySPPawn.Controller);
                // End:0x309
                if(crabCtrl != none)
                {
                    CrabPawn = LPAIPawnBaseSnowCrab(MySPPawn);
                    // End:0x281
                    if(CrabPawn.HasAnyDismemberables())
                    {
                        crabCtrl.CmdBecomeCrabDefaultStunned(0.0000000, false,, false, Class'LPSM_SnowCrabShockExplode',, 0);                        
                    }
                    else
                    {
                        crabCtrl.CmdBecomeCrabDefaultStunned(LPAIPawn(MySPPawn).TuneDataAIPawn.DurationOfShockStun.GetValue(), false, Class'LPSM_SnowCrabShockStun', false, Class'LPSM_SnowCrabStunRecovery',, 0);
                    }
                }                
            }
            else
            {
                // End:0x403
                if(ClassIsChildOf(MySPPawn.Class, Class'LPAIPawnCarrier'))
                {
                    carrierCtrl = LPAIControllerCarrier(MySPPawn.Controller);
                    // End:0x400
                    if(carrierCtrl != none)
                    {
                        carrierCtrl.CmdHitReactionToStun(LPAIPawn(MySPPawn).TuneDataAIPawn.DurationOfShockStun.GetValue(), Class'LPSM_CarrierGrabTazed',, Class'LPSM_CarrierGrabTazedStunFinish',, 0);
                    }                    
                }
                else
                {
                    GameAIController(MySPPawn.Controller).AbortCommand(none, Class'GameFramework.GameAICommand');
                }
            }
        }
    }
    //return;    
}
