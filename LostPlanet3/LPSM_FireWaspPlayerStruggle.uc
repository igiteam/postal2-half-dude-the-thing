class LPSM_FireWaspPlayerStruggle extends LPSM_FollowerStruggleMode
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
    LPAIPawnFireWasp(MySPPawn).bStingerAggressiveOnFlag = false;
    NewRotation = MySPPawn.Rotation;
    NewRotation.Pitch = 0;
    MySPPawn.SetRotation(NewRotation);
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStrugglePlayerFireWasp'
}