class LPTuneDataStrugglePhaseComposite extends LPTuneDataStrugglePhase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x262A0000-0x00000000*/ private name MainPhaseName[65537];
var(0.25_Pct) /*0x262A0000-0x00000000*/ private editfixedsize array SecondaryPhasesName[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private bool bAllowAllPhasesToSuggestNextPhase[65537];

defaultproperties
{
    GameClass=Class'LPSP_StruggleComposite'
}