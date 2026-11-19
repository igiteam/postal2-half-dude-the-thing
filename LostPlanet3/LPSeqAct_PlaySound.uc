class LPSeqAct_PlaySound extends SPSeqAct_PlaySound
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83040000-0x00000000*/ private bool bShowRadioMessageInVSHUD[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRegisteredRadioMessage[536870913];

defaultproperties
{
    ObjName="Play Sound (LP)"
}