class LPSeqEvent_TwistInteractionPlayRateChanged extends LPSeqEvent_TwistInteractionBase
    hidecategories(Object);

function HandlePlayRateChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOriginator[8388609], InInstigator;
    local /*0x97E50000-0x00000000*/ private float NewRate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL FloatVar;

    PublishLinkedVariableValues();
    // End:0xC2
    if(((InOriginator != none) && bEnabled) && !bPlayerOnly || (InInstigator != none) && InInstigator.IsPlayerOwned())
    {
        // End:0xC1
        foreach LinkedVariables(Class'Engine.SeqVar_Float', FloatVar, "Play Rate")
        {
            FloatVar.FloatValue = NewRate;            
        }        
    }
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Play Rate",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Twist Interaction Play Rate(LP)"
}