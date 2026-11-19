class LPSeqEvent_SnowcatFeedback extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL Snowcat;
    local /*0x97E50000-0x00000000*/ private float Modifier, Original;

    // End:0x13
    if(VariableLinks.Length != 2)
    {
        return;
    }
    Modifier = 1.0000000;
    Original = SeqVar_Float(VariableLinks[0].LinkedVariables[0]).FloatValue;
    Snowcat = LPSnowcatInterpTransport(Originator);
    // End:0xBE
    if(Snowcat != none)
    {
        Modifier = Snowcat.GetMatineeModifier();
    }
    Modifier = Modifier * Original;
    SeqVar_Float(VariableLinks[1].LinkedVariables[0]).FloatValue = Modifier;
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    MaxTriggerCount=0
    bPlayerOnly=false
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Original Playback Speed",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Modified Playback Speed",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Snowcat Feedback (LP)"
}