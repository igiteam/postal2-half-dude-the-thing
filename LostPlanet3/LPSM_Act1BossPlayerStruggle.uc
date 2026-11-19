class LPSM_Act1BossPlayerStruggle extends LPSM_FollowerStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawn(inPawn).TuneDataStruggle;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NewRotation;

    super.SpecialMoveStarted(bForced, PrevMove);
    NewRotation = MySPPawn.Rotation;
    NewRotation.Pitch = 0;
    MySPPawn.SetRotation(NewRotation);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, BossPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    BossPawn = LPAIPawnAct1Boss(MySPPawn);
    // End:0x86
    if(BossPawn != none)
    {
        LPAIControllerAct1Boss(BossPawn.Controller).bRequestRetreat = true;
    }
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStrugglePlayerAct1Boss'
}