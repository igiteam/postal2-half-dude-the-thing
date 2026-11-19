class LPAICmd_HSIdle extends LPAICommand within LPAIControllerHumanSoldier;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

state StateCmdActive
{
    function LookAtClosestSquadMember()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ClosestMember;

        ClosestMember = Outer.MyGFSquad.GetClosestMember(Outer.MyCoverPawn);
        // End:0xC8
        if(ClosestMember != none)
        {
            Outer.PawnLookAtActor(ClosestMember.Pawn);
            Outer.AIAimDownSight(false);
        }
        //return;        
    }
Begin:

    // End:0x143
    if(Outer.CoverIsIn())
    {
        // End:0x89
        if(Outer.CoverActionIsDoing() && !Outer.CanExitCoverFromCoverAction())
        {
            Outer.CoverResetAction();
        }
        J0x89:

        // End:0xCB [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0x89;
        }
        Outer.CoverExit();
        J0xEC:

        // End:0x143 [Loop If]
        if(Outer.HumanSoldierPawn.IsDoingASpecialMove())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xEC;
        }
    }
    LookAtClosestSquadMember();
    Outer.PawnZeroVelocity();
    stop;                
}
