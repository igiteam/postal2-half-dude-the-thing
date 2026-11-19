class LPSeqAct_SetCoverLock extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x831E0000-0x00000000*/ private bool bLocked[65537];

defaultproperties
{
    ObjName="Set Cover Lock(LP)"
}