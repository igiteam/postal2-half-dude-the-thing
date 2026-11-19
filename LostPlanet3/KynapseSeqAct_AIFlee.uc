class KynapseSeqAct_AIFlee extends KynapseSeqAct
    editinlinenew
    hidecategories(Object);

var(accidentRatio) /*0x01B20000-0x00000000*/ private editfixedsize array FleeDangerousNodes[65537];
var(accidentRatio) /*0x01B20000-0x00000000*/ private editfixedsize array FleeDangerousBots[65537];
var(accidentRatio) /*0x01B20000-0x00000000*/ private float computeDestinationInterval[65537];
var(accidentRatio) /*0x01B20000-0x00000000*/ private bool stopWhenHidden[65537];
var(accidentRatio) /*0x01B20000-0x00000000*/ private float DangerRadius[65537];
var(accidentRatio) /*0x01B20000-0x00000000*/ private float explorationRadius[65537];

defaultproperties
{
    computeDestinationInterval=1.0000000
    stopWhenHidden=true
    DangerRadius=1000.0000000
    explorationRadius=5000.0000000
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Dangerous Point",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Dangerous Bodies",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Flee (Latent)"
}