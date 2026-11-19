class LPAICmd_Act1BossRetreat extends LPAICommand within LPAIControllerAct1Boss;

function GetRetreatSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x2F
    if(Outer.bIsInTongueAttack)
    {
        return Class'LPSM_Act1BossRetreatTongue';        
    }
    else
    {
        return Class'LPSM_Act1BossRetreat';
    }
    //return ReturnValue;    
}

function DescendArms()
{
    Outer.AllArmsPlaySpecialMove(Class'LPSM_Act1BossArmDescend');
    //return;    
}

state StateCmdActive
{Begin:

    Outer.Focus = none;
    DescendArms();
    MyPawn.EndSpecialMove(none);
    MyPawn.DoSpecialMove(GetRetreatSpecialMoveClass(), true, true);
    J0x77:

    // End:0xB9 [Loop If]
    if(MyPawn.IsDoingASpecialMove())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x77;
    }
    Outer.bIsInRetreat = true;
    Outer.HideBoss();
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bInterruptible=false
}