class LPSeqAct_AILatent extends SeqAct_Latent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82630000-0x00000000*/ private bool bRestartOnNewInput[65537];

event GetStopInputLink()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return -1;
    //return ReturnValue;    
}

defaultproperties
{
    bRestartOnNewInput=true
}