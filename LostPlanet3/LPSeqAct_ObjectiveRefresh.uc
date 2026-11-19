class LPSeqAct_ObjectiveRefresh extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

simulated event @NULL Activated()
{
    local /*0x97E50000-0x00000400*/ private editfixedsize array Comps;
    local /*0x97E50000-0x00000400*/ private @NULL Comp, WI, SPGI, Objective;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x256
    if((int(WI.NetMode) != int(NM_Standalone)) && int(WI.Role) == int(ROLE_Authority))
    {
        SPGI = SPGameInfo(WI.Game);
        // End:0x256
        if(SPGI != none)
        {
            Objective = Actor(SeqVar_Object(VariableLinks[0].LinkedVariables[0]).GetObjectValue());
            // End:0x256
            if(Objective != none)
            {
                Objective.GetComponentsOfClass(Class'LPObjectiveComponentBase', Comps);
                // End:0x256
                if(Comps.Length > 0)
                {
                    Comp = LPObjectiveComponentBase(Comps[0]);
                    SPGI.BroadcastObjectiveMessage(-1, Comp.CurrentPrimaryEventString, Comp.ObjectiveDescription.LocalizedTextMarkUp, int(Comp.ObjectiveType), Comp.IsPrimaryEvent(Comp.CurrentPrimaryEventString), none, -1.0000000);
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Objective Actor",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Refresh Objective (LP)"
}