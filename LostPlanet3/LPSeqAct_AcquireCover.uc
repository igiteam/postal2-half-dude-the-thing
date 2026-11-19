class LPSeqAct_AcquireCover extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x824D0000-0x00000000*/ private bool bFindNearest[65537];
var(0.25_Pct) /*0x824D0000-0x00000000*/ private bool bNoCameraAutoAlign[65537];
var(0.25_Pct) /*0x824D0000-0x00000000*/ private bool bForce[65537];
var(0.25_Pct) /*0x824D0000-0x00000000*/ private bool bLockInCover[65537];
var(0.25_Pct) /*0x824D0000-0x00000000*/ private float SearchDistance[65537];
var(0.25_Pct) /*0x824D0000-0x00000000*/ private int SlotIndex[65537];

defaultproperties
{
    bFindNearest=true
    SearchDistance=512.0000000
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="CoverNode",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Acquire Cover (LP)"
}