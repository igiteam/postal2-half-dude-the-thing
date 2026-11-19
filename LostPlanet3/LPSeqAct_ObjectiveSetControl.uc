class LPSeqAct_ObjectiveSetControl extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x26D10000-0x00000000*/ private byte ControlTeam[65537];

defaultproperties
{
    ControlTeam=ELPTeams.LPTeam_Neutral
    ObjName="Objective Set Control (LP)"
}