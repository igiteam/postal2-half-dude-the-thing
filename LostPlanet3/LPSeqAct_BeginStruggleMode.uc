class LPSeqAct_BeginStruggleMode extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82810000-0x00000000*/ private class StruggleModeClass[65537];

static event GetObjClassVersion()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion();
    //return ReturnValue;    
}

defaultproperties
{
    ObjName="Begin Struggle Mode (LP)"
}