class SeqAct_Teleport extends SequenceAction
    hidecategories(Object);

var(*) /*0x44420000-0x00000000*/ private bool bUpdateRotation[65537];
var(*) /*0x44420000-0x00000000*/ private bool bCheckOverlap[65537];
var(*) /*0x44420000-0x00000000*/ private float TeleportDistance[65537];
var(*) /*0x44420000-0x00000000*/ private editfixedsize array TeleportVolumes[65537];

static final function ShouldTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TestActor[8388609], TeleportLocation;
    local /*0x35EA0000-0x00000000*/ private float TeleportDist[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Volumes[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int VolumeIdx;

    // End:0x60
    if((TeleportDist > 0.0000000) && VSizeSq(TestActor.Location - TeleportLocation) < (TeleportDist * TeleportDist))
    {
        return false;        
    }
    else
    {
        // End:0xF3
        if(Volumes.Length > 0)
        {
            VolumeIdx = 0;
            J0x7B:

            // End:0xF3 [Loop If]
            if(VolumeIdx < Volumes.Length)
            {
                // End:0xE5
                if((Volumes[VolumeIdx] != none) && Volumes[VolumeIdx].Encompasses(TestActor))
                {
                    return false;
                }
                ++VolumeIdx;
                // [Loop Continue]
                goto J0x7B;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    bUpdateRotation=true
    TeleportDistance=-1.0000000
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Destination",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Teleport Volumes",LinkVar="None",PropertyName="TeleportVolumes",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=true,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Teleport"
}