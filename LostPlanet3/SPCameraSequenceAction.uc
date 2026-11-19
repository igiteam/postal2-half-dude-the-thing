class SPCameraSequenceAction extends SequenceAction
    abstract
    forcescriptorder(true)
    hidecategories(Object);

static event GetObjClassVersion()
{
    local /*0x043A0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 2;
    //return ReturnValue;    
}

defaultproperties
{
    bDefaultAllPlayers=true
    bTryPlayerCamera=true
    VariableLinks=none
}