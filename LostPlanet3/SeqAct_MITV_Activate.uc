class SeqAct_MITV_Activate extends SequenceAction
    hidecategories(Object);

var(*) /*0x44110000-0x00000000*/ private float DurationOfMITV[65537];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

event Activated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ObjVar, MITVA;

    // End:0xC8
    foreach LinkedVariables(Class'SeqVar_Object', ObjVar, "MITV")
    {
        MITVA = MaterialInstanceTimeVaryingActor(ObjVar.GetObjectValue());
        // End:0xC7
        if(MITVA != none)
        {
            // End:0xC7
            if(MITVA.MatInst != none)
            {
                MITVA.MatInst.SetDuration(DurationOfMITV);
            }
        }        
    }    
    //return;    
}

defaultproperties
{
    bCallHandler=false
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="MITV",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="MITV Activate"
}