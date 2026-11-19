class SeqAct_Possess extends SequenceAction
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL PawnToPossess[536870913];
var(*) /*0x441D0000-0x00000000*/ private bool bKillOldPawn[65537];
var(*) /*0x441D0000-0x00000000*/ private bool bTryToLeaveVehicle[65537];

defaultproperties
{
    bTryToLeaveVehicle=true
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Pawn Target",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Possess Pawn"
}