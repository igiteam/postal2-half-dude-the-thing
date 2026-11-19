class SeqAct_GetVectorComponents extends SequenceAction
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL InVector;
var(*) /*0x35EA0000-0x00000000*/ private float X;
var(*) /*0x35EA0000-0x00000000*/ private float Y;
var(*) /*0x35EA0000-0x00000000*/ private float Z;

defaultproperties
{
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Input Vector",LinkVar="None",PropertyName="InVector",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="X",LinkVar="None",PropertyName="X",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Y",LinkVar="None",PropertyName="Y",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[3]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Z",LinkVar="None",PropertyName="Z",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Get Vector Components"
}