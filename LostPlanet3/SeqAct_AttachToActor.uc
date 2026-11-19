class SeqAct_AttachToActor extends SequenceAction
    hidecategories(Object);

var(*) /*0x43EB0000-0x00000000*/ private bool bDetach[65537];
var(*) /*0x43EB0000-0x00000000*/ private bool bHardAttach[65537];
var(*) /*0x43EB0000-0x00000000*/ private bool bUseRelativeOffset[65537];
var(*) /*0x43EB0000-0x00000000*/ private bool bUseRelativeRotation[65537];
var(*) /*0x43EB0000-0x00000000*/ private name BoneName[65537];
var(*) /*0x43EB0000-0x00000000*/ private @NULL RelativeOffset[65537];
var(*) /*0x43EB0000-0x00000000*/ private @NULL RelativeRotation[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    bHardAttach=true
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Attachment",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Attach to Actor"
}