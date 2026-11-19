class LPSeqAct_AddTime extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x03170000-0x00000000*/ private int TimeToAdd[65537];

event Activated()
{
    AddTime(TimeToAdd);
    super(SequenceOp).Activated();
    //return;    
}

static function AddTime()
{
    local /*0x97E50000-0x00000000*/ private int NumSeconds[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL W, GRI;

    W = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x115
    if((W != none) && int(W.Role) == int(ROLE_Authority))
    {
        GRI = LPGRI_Base_MP(W.GRI);
        // End:0x115
        if(GRI != none)
        {
            GRI.RemainingTime += NumSeconds;
            GRI.TimeAdded += NumSeconds;
            GRI.HandleTimeAdded();
        }
    }
    //return;    
}

defaultproperties
{
    VariableLinks=none
    ObjName="MP Add Time (LP)"
}