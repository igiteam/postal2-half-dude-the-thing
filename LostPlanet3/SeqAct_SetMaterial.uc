class SeqAct_SetMaterial extends SequenceAction
    hidecategories(Object);

var(*) /*0x442C0000-0x00000000*/ private @NULL NewMaterial[65537];
var(*) /*0x442C0000-0x00000000*/ private int MaterialIndex[65537];

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=true,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Set Material"
}