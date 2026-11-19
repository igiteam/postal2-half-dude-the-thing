class KynapseSeqAct_AIShoot extends KynapseSeqAct
    editinlinenew
    hidecategories(Object);

var(accidentRatio) /*0x01B60000-0x00000000*/ private @NULL ShootTarget[65537];
var(accidentRatio) /*0x01B60000-0x00000000*/ private float dangerousConeAngle[65537];
var(accidentRatio) /*0x01B60000-0x00000000*/ private float gunRange[65537];
var(accidentRatio) /*0x01B60000-0x00000000*/ private float LineOfFireCalculationInterval[65537];
var(accidentRatio) /*0x01B60000-0x00000000*/ private float sideStepAngle[65537];
var(accidentRatio) /*0x01B60000-0x00000000*/ private int potentialSideStepSize[65537];

defaultproperties
{
    dangerousConeAngle=10.0000000
    gunRange=300.0000000
    LineOfFireCalculationInterval=0.5000000
    sideStepAngle=10.0000000
    potentialSideStepSize=20
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Shoot Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Shoot (Latent)"
}