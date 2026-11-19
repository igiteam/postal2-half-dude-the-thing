class LPSeqAct_TriggerObjectiveEvent extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EventTarget;
var(0.25_Pct) /*0xCE880000-0x00000000*/ private class EventClassToTrigger[65537];

event @NULL Activated()
{
    local /*0x97E50000-0x00000400*/ private editfixedsize array Comps;
    local /*0x97E50000-0x00000400*/ private @NULL Comp, EventInstigator;

    // End:0x11
    if(EventTarget == none)
    {
        return;
    }
    // End:0x22
    if(EventClassToTrigger == none)
    {
        return;
    }
    EventTarget.GetComponentsOfClass(Class'LPObjectiveComponentBase', Comps);
    // End:0x65
    if(Comps.Length <= 0)
    {
        return;
    }
    Comp = LPObjectiveComponentBase(Comps[0]);
    // End:0xB1
    if(Targets.Length > 0)
    {
        EventInstigator = Actor(Targets[0]);
    }
    Comp.ExternalTriggerEvent(EventClassToTrigger, EventInstigator);
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Objective Actor",LinkVar="None",PropertyName="EventTarget",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Force Objective Event (LP)"
}