class LPSeqAct_KillPawn extends SPSeqAct_KillPawn
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82CB0000-0x00000000*/ private bool ForceKillPlayerIfInVS[65537];

defaultproperties
{
    ObjName="Kill Pawn ( LP )"
}