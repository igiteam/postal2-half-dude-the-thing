class LPFXAction_FreezePawn extends LPFXAction_Freeze;

struct DismemberPart
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FracturedStaticMeshToSwap;

    structdefaultproperties
    {
        CoreID=0
        FracturedStaticMeshToSwap=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DismemberParts[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RagdollCollidedTimeStamp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NotMovedTimeStamp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SwapTraslationAdjustment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSetPhysNone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSetFracturedMeshToExplodeOnDamage;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SimplifiedFracturedCollision[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FracMeshActors;

function Init()
{
    super.Init();
    SwapTraslationAdjustment += myAIPawn.TuneDataPawn.SwapTranslationAdjustment;
    //return;    
}

function Begin()
{
    // End:0x81
    if(!myAIPawn.bShouldRagdoll && bSetPhysNone)
    {
        myAIPawn.SetPhysics(0);
        myAIPawn.Mesh.SPRestoreBodiesFixed();
    }
    RagdollCollidedTimeStamp = -1.0000000;
    PlayTEnergyEffect();
    super.Begin();
    //return;    
}

function GetFadeInTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0xAC
    if(myAIPawn.bFreezeWhilePlayingAnim && myAIPawn.IsDoingASpecialMove())
    {
        return SPSM_PlayAnimBase(myAIPawn.SpecialMoveState.CurSMInstance).PlayingSeq.GetTimeLeft();
    }
    return super.GetFadeInTime();
    //return ReturnValue;    
}

function PlayTEnergyEffect()
{
    myAIPawn.TuneDataPawnFXEventBindings.PlayEventFX('PlayDeathTEnergyEffect', myAIPawn, myAIPawn.Mesh, none);
    myAIPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('PlayDeathTEnergyEffectSound', 'None', myAIPawn, none, none);
    //return;    
}

function PlaySwapToFracturedMesh()
{
    myAIPawn.TuneDataPawnFXEventBindings.PlayEventFX('FreezeSwapToFracturedMesh', myAIPawn, myAIPawn.Mesh, none);
    myAIPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('FreezeSwapToFracturedMeshSound', 'None', myAIPawn, none, none);
    //return;    
}

simulated function @NULL RagdollCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

    // End:0x52
    if(RagdollCollidedTimeStamp == float(-1))
    {
        RagdollCollidedTimeStamp = myAIPawn.WorldInfo.TimeSeconds;
    }
    //return;    
}

function TimeSinceRagdollCollided()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return myAIPawn.WorldInfo.TimeSeconds - RagdollCollidedTimeStamp;
    //return ReturnValue;    
}

function IsFreezingFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if(myAIPawn.bFreezeWhilePlayingAnim && myAIPawn.IsDoingASpecialMove())
    {
        return false;
    }
    return super.IsFreezingFinished();
    //return ReturnValue;    
}

event WantToSwapToFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!super.WantToSwapToFracturedStaticMeshActor())
    {
        return false;
    }
    // End:0x37
    if(!myAIPawn.bShouldRagdoll)
    {
        return true;
    }
    // End:0x88
    if(myAIPawn.bAutoExplodeFrozen || (RagdollCollidedTimeStamp != float(-1)) && (TimeSinceRagdollCollided()) > 0.1000000)
    {
        return true;
    }
    // End:0xD0
    if((myAIPawn.WorldInfo.TimeSeconds - TimeFreezeEffectFinished) < float(0))
    {
        return false;
    }
    // End:0x148
    if((myAIPawn.WorldInfo.TimeSeconds - TimeFreezeEffectFinished) > myAIPawn.TuneDataPawn.MaxTimeAfterFreeze)
    {
        return true;
    }
    // End:0x23C
    if(IsZero(myAIPawn.Velocity))
    {
        // End:0x1C1
        if(NotMovedTimeStamp == float(-1))
        {
            NotMovedTimeStamp = myAIPawn.WorldInfo.TimeSeconds;            
        }
        else
        {
            // End:0x239
            if((myAIPawn.WorldInfo.TimeSeconds - NotMovedTimeStamp) > myAIPawn.TuneDataPawn.MaxTimeNoMovementAfterFreeze)
            {
                return true;
            }
        }        
    }
    else
    {
        NotMovedTimeStamp = -1.0000000;
    }
    return false;
    //return ReturnValue;    
}

event SwapToFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL FractSMActor, FracturedLocation, FracturedRotation, Part, MatPropTag;

    local /*0x97E50000-0x00000000*/ private int ClawCoreIndex;
    local /*0x97E50000-0x00000000*/ private name BoneName;
    local /*0x97E50000-0x00000000*/ private int BoneIdx, I;
    local /*0x97E50000-0x00000000*/ private @NULL LocalXAxis, LocalYAxis, LocalZAxis, FracMesh;

    myAIPawn.SetCollision(false, false, true);
    FracturedLocation = myAIPawn.Location;
    FracturedLocation += myAIPawn.Mesh.Translation;
    FracturedRotation = myAIPawn.Rotation + myAIPawn.Mesh.Rotation;
    GetAxes(FracturedRotation, LocalXAxis, LocalYAxis, LocalZAxis);
    FracturedLocation += (((LocalXAxis * SwapTraslationAdjustment.X) + (LocalYAxis * SwapTraslationAdjustment.Y)) + (LocalZAxis * SwapTraslationAdjustment.Z));
    // End:0x20A
    if(myAIPawn.bShouldRagdoll)
    {
        FracturedRotation.Pitch = 0;
        FracturedRotation.Roll = 0;
        FracturedLocation.Z += 150.0000000;
    }
    // End:0x295
    foreach FracturedStaticMeshToSwap(FracMesh)
    {
        FractSMActor = SpawnFracturedMesh(FracturedLocation, FracturedRotation, FracMesh);
        FracMeshActors.AddItem(FractSMActor);        
        // End:0x294
        if(bSetFracturedMeshToExplodeOnDamage)
        {
            FractSMActor.bExplodeOnDamage = true;
        }        
    }    
    // End:0x2CD
    if(SimplifiedFracturedCollision != none)
    {
        FractSMActor.SetSimplifiedCollision(SimplifiedFracturedCollision);
    }
    // End:0x381
    foreach FracMeshActors(FractSMActor)
    {
        I = 0;
        J0x2EF:

        // End:0x380 [Loop If]
        if(I < FracMeshActors.Length)
        {
            // End:0x372
            if(FractSMActor != FracMeshActors[I])
            {
                FractSMActor.IgnoreCollisionComponentList.AddItem(FracMeshActors[I].FracturedStaticMeshComponent);                
            }
            ++I;
            // [Loop Continue]
            goto J0x2EF;
        }        
    }    
    // End:0x5F9
    foreach DismemberParts(Part)
    {
        MatPropTag = myAIPawn.FindPhysMatPropTag_CoreIdFromCoreID(Part.CoreID);
        ClawCoreIndex = myAIPawn.GetCoreIndexFromTag(MatPropTag);
        // End:0x47B
        if((ClawCoreIndex == -1) || myAIPawn.MyCoreData[ClawCoreIndex].DismembermentInfo.bIsDismembered)
        {
            continue;            
        }
        else
        {
            BoneName = myAIPawn.MyCoreData[ClawCoreIndex].DismembermentInfo.BoneName;
            FracturedLocation = myAIPawn.Mesh.GetBoneLocation(BoneName, 0);
            BoneIdx = myAIPawn.Mesh.MatchRefBone(BoneName);
            FracturedRotation = MatrixGetRotator(myAIPawn.Mesh.GetBoneMatrix(BoneIdx));
            FracMeshActors.AddItem(SpawnFracturedMesh(FracturedLocation, FracturedRotation, Part.FracturedStaticMeshToSwap));                        
        }
    }    
    PlaySwapToFracturedMesh();
    myAIPawn.NotifyFreezeComplete();
    //return;    
}

defaultproperties
{
    bSetPhysNone=true
}