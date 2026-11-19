class LPAnimNodeSequenceStandAlone extends LPAnimNodeSequence
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7BBD0000-0x00000000*/ private bool bAutoStart[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoopLastSequence;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SeqStack;

event OnInit()
{
    super(AnimNode).OnInit();
    // End:0x35
    if(bAutoStart)
    {
        PlayAnim(bLooping, Rate);
    }
    //return;    
}

defaultproperties
{
    bCallScriptEventOnInit=true
}