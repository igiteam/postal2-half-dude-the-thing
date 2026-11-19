class LPSeqAct_GetGameflow_Tpost extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82AE0000-0x00000000*/ private name GFVarName[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte GFType;

defaultproperties
{
    bCallHandler=false
    bAutoActivateOutputLinks=false
    OutputLinks[0]=(Links=none,LinkDesc="True",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="False",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks=none
    ObjName="Get Gameflow Tpost (LP)"
    bSuppressAutoComment=false
}