class LPFXAction_FreezePart extends LPFXAction_Freeze;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PartCoreID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PartMovingTimeStamp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OldAngularVelocity;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentVibrationLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxVibrationLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAngularVelocity;

function Init()
{
    super.Init();
    myAIPawn = LPAIPawnAkrid(FXActionManager().Owner);
    //return;    
}

function Begin()
{
    super.Begin();
    //return;    
}

function GetFadeInTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return myAIPawn.TuneDataPawn.TimeFreezeParts;
    //return ReturnValue;    
}

event WantToSwapToFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(myAIPawn == none)
    {
        return true;
    }
    // End:0x20
    if(CheckPartVibrating())
    {
        return true;
    }
    // End:0x31
    if(!super.WantToSwapToFracturedStaticMeshActor())
    {
        return false;
    }
    // End:0x42
    if(!CheckPartStopped())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event SwapToFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL MatPropTag;
    local /*0x97E50000-0x00000000*/ private int ClawCoreIndex;
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private @NULL FracturedLocation, FracturedRotation, FracMesh, PartBodyInst, BodyInstMatrix;

    MatPropTag = myAIPawn.FindPhysMatPropTag_CoreIdFromCoreID(PartCoreID);
    ClawCoreIndex = myAIPawn.GetCoreIndexFromTag(MatPropTag);
    BoneName = myAIPawn.MyCoreData[ClawCoreIndex].DismembermentInfo.BoneName;
    PartBodyInst = myAIPawn.Mesh.PhysicsAssetInstance.FindBodyInstance(BoneName, myAIPawn.Mesh.PhysicsAsset);
    BodyInstMatrix = PartBodyInst.GetUnrealWorldTM();
    FracturedLocation = MatrixGetOrigin(BodyInstMatrix);
    FracturedRotation = MatrixGetRotator(BodyInstMatrix);
    myAIPawn.Mesh.HideBoneByName(BoneName, 1);
    // End:0x22A
    foreach FracturedStaticMeshToSwap(FracMesh)
    {
        SpawnFracturedMesh(FracturedLocation, FracturedRotation, FracMesh);        
    }    
    //return;    
}

function CheckPartVibrating()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MatPropTag, PartBodyInst;
    local /*0x97E50000-0x00000000*/ private int PartCoreIndex;
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private @NULL PartAngularVelocity;
    local /*0x97E50000-0x00000000*/ private float PartAngularSpeedChange;

    MatPropTag = myAIPawn.FindPhysMatPropTag_CoreIdFromCoreID(PartCoreID);
    PartCoreIndex = myAIPawn.GetCoreIndexFromTag(MatPropTag);
    BoneName = myAIPawn.MyCoreData[PartCoreIndex].DismembermentInfo.BoneName;
    PartBodyInst = myAIPawn.Mesh.PhysicsAssetInstance.FindBodyInstance(BoneName, myAIPawn.Mesh.PhysicsAsset);
    // End:0x214
    if(PartBodyInst != none)
    {
        PartAngularVelocity = PartBodyInst.GetUnrealWorldAngularVelocity();
        PartAngularSpeedChange = PartAngularVelocity Dot OldAngularVelocity;
        OldAngularVelocity = PartAngularVelocity;
        // End:0x1DA
        if(PartAngularSpeedChange < -0.0010000)
        {
            CurrentVibrationLevel += 1.0000000;            
        }
        else
        {
            CurrentVibrationLevel = float(Max(int(CurrentVibrationLevel - 0.2500000), 0));
        }
        // End:0x214
        if(CurrentVibrationLevel > MaxVibrationLevel)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function CheckPartStopped()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MatPropTag, PartBodyInst;
    local /*0x97E50000-0x00000000*/ private int PartCoreIndex;
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private float partvelocity;
    local /*0x97E50000-0x00000000*/ private bool bPartStopped;

    MatPropTag = myAIPawn.FindPhysMatPropTag_CoreIdFromCoreID(PartCoreID);
    PartCoreIndex = myAIPawn.GetCoreIndexFromTag(MatPropTag);
    BoneName = myAIPawn.MyCoreData[PartCoreIndex].DismembermentInfo.BoneName;
    bPartStopped = false;
    PartBodyInst = myAIPawn.Mesh.PhysicsAssetInstance.FindBodyInstance(BoneName, myAIPawn.Mesh.PhysicsAsset);
    // End:0x23C
    if(PartBodyInst != none)
    {
        partvelocity = VSize(PartBodyInst.GetUnrealWorldVelocity());
        // End:0x1E6
        if(partvelocity > 5.0000000)
        {
            PartMovingTimeStamp = int(myAIPawn.WorldInfo.TimeSeconds);            
        }
        else
        {
            // End:0x23C
            if((myAIPawn.WorldInfo.TimeSeconds - float(PartMovingTimeStamp)) > 0.5000000)
            {
                bPartStopped = true;
            }
        }
    }
    return bPartStopped;
    //return ReturnValue;    
}

defaultproperties
{
    MaxVibrationLevel=3.0000000
}