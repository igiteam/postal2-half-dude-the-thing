class LPSeqAct_ModifyCrab extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82DF0000-0x00000000*/ private bool bEnableCrabSwipe[65537];
var(0.25_Pct) /*0x82DF0000-0x00000000*/ private bool bEnableGroundPound[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Crab;

event Activated()
{
    // End:0x63
    if(Crab != none)
    {
        Crab.bEnableGroundPound = bEnableGroundPound;
        Crab.bEnableClawSwipe = bEnableCrabSwipe;
    }
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target Crab",LinkVar="None",PropertyName="Crab",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Bool',LinkedVariables=none,LinkDesc="bEnableGroundPound",LinkVar="None",PropertyName="bEnableGroundPound",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'Engine.SeqVar_Bool',LinkedVariables=none,LinkDesc="bEnableCrabSwipe",LinkVar="None",PropertyName="bEnableCrabSwipe",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Modify Crab (LP)"
}