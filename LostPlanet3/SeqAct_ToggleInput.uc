class SeqAct_ToggleInput extends SeqAct_Toggle
    hidecategories(Object);

var(*) /*0x444B0000-0x00000000*/ private bool bToggleMovement[65537];
var(*) /*0x444B0000-0x00000000*/ private bool bToggleTurning[65537];

defaultproperties
{
    bToggleMovement=true
    bToggleTurning=true
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=true,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Toggle Input"
}