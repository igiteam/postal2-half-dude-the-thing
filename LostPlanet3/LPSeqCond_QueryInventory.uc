class LPSeqCond_QueryInventory extends SequenceCondition
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FoundCount;
var(0.25_Pct) /*0xA8610000-0x00000000*/ private class TypeToQuery[65537];
var(0.25_Pct) /*0xA8610000-0x00000000*/ private bool bExactTypeOnly[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array objVars;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PP, InvMan, Inv;
    local /*0x97E50000-0x00000000*/ private int iCount;

    GetObjectVars(objVars, "Players");
    Idx = 0;
    J0x27:

    // End:0x10B [Loop If]
    if(Idx < objVars.Length)
    {
        PP = LPPlayerPawn(objVars[Idx]);
        // End:0xFD
        if(PP != none)
        {
            InvMan = PP.InvManager;
            // End:0xFD
            if((InvMan != none) && TypeToQuery != none)
            {
                // End:0xFC
                foreach InvMan.InventoryActors(TypeToQuery, Inv)
                {
                    ++iCount;                    
                }                
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x27;
    }
    FoundCount = iCount;
    // End:0x151
    if(iCount > 0)
    {
        OutputLinks[0].bHasImpulse = true;        
    }
    else
    {
        OutputLinks[1].bHasImpulse = true;
    }
    //return;    
}

defaultproperties
{
    bExactTypeOnly=true
    OutputLinks[0]=(Links=none,LinkDesc="Found",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Not Found",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Players",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Int',LinkedVariables=none,LinkDesc="Count",LinkVar="None",PropertyName="FoundCount",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Query Inventory (LP)"
}