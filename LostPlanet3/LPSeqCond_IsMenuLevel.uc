class LPSeqCond_IsMenuLevel extends SPSeqCond_IsMenuLevel
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    // End:0xB5
    if(Class'Engine.WorldInfo'.static.IsMenuLevel())
    {
        // End:0xB2
        if(!OutputLinks[0].bDisabled && !OutputLinks[0].bDisabledPIE && Class'Engine.WorldInfo'.static.IsPlayInEditor())
        {
            OutputLinks[0].bHasImpulse = true;
        }        
    }
    else
    {
        // End:0x144
        if(!OutputLinks[1].bDisabled && !OutputLinks[1].bDisabledPIE && Class'Engine.WorldInfo'.static.IsPlayInEditor())
        {
            OutputLinks[1].bHasImpulse = true;
        }
    }
    //return;    
}

defaultproperties
{
    ObjName="Is MenuLevel (LP)"
}