class KynapseSeqAct_AIFollow extends KynapseSeqAct
    editinlinenew
    hidecategories(Object);

var(accidentRatio) /*0x01B30000-0x00000000*/ private @NULL FollowTarget[65537];
var(accidentRatio) /*0x01B30000-0x00000000*/ private float distanceFromTarget[65537];
var(accidentRatio) /*0x01B30000-0x00000000*/ private float angleFromTarget[65537];
var(accidentRatio) /*0x01B30000-0x00000000*/ private float minimumMoveDistance[65537];
var(accidentRatio) /*0x01B30000-0x00000000*/ private float modeRatioClose[65537];
var(accidentRatio) /*0x01B30000-0x00000000*/ private float modeRatioRelaxed[65537];
var(accidentRatio) /*0x01B30000-0x00000000*/ private float recalTimeInterval[65537];

defaultproperties
{
    distanceFromTarget=100.0000000
    angleFromTarget=180.0000000
    minimumMoveDistance=100.0000000
    modeRatioClose=1.5000000
    modeRatioRelaxed=2.0000000
    recalTimeInterval=5.0000000
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Follow Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Follow (Latent)"
}