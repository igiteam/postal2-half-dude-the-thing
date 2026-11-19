class LPAICmd_DongoTauntDuringStalk extends LPAICmd_DongoShortTaunt within LPAIControllerDongo;

function Pushed()
{
    super.Pushed();
    Outer.TimeOfLastTaunt = CurTime();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.DongoPawn.ServerEndSpecialMove(Class'LPSM_DongoTauntDuringStalk');
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function On_LPSM_DongoShortTaunt_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bShortTauntFinished = true;
    //return;    
}

function StartDongoShortTaunt()
{
    bShortTauntFinished = false;
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoTauntDuringStalk', true, false, On_LPSM_DongoShortTaunt_Finished, EnemyForStrike);
    //return;    
}
