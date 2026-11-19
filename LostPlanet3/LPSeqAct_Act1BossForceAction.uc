class LPSeqAct_Act1BossForceAction extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82500000-0x00000000*/ private bool bForceRetreat[65537];
var(0.25_Pct) /*0x82500000-0x00000000*/ private bool bForceAwake[65537];
var(0.25_Pct) /*0x82500000-0x00000000*/ private bool bTeleportToDestination[65537];
var(0.25_Pct) /*0x82500000-0x00000000*/ private bool bMoveToDestination[65537];
var(0.25_Pct) /*0x82500000-0x00000000*/ private bool bBeginBridgeStruggleMode[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Dest;

static event GetObjClassVersion()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 4;
    //return ReturnValue;    
}

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Dest",LinkVar="None",PropertyName="Dest",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Act 1 Boss Force Action (LP)"
}