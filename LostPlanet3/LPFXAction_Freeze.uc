class LPFXAction_Freeze extends LPFXActionBase
    abstract;

struct native FreezeMaterial
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MatName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaterialToReplace;

    structdefaultproperties
    {
        MatName="None"
        MaterialToReplace=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myAIPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AkridMatInstances;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FreezeParamName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeInitialValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeFinalValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeInTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FracturedStaticMeshToSwap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableKyObstacleInFracturedMesh;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool AutoExplodeOnlyOneEffect;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAvoidFracturedByVSWinch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte KyObstacleType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FreezeMaterials[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoExplodeStrength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AutoExplodeEffectOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AutoExplodeMaxCoreDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinFragmentsRatioPlayExplosionEffect;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SizeFractureMeshPartTooBig[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeDestroyPartTooBig[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeDestroyPartTooBig[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerMeleeDamageScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeFreezeEffectFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeFreezeEffectStarted;

// Export ULPFXAction_Freeze::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_Freeze::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_Freeze::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    super(SPFXActionBase).Init();
    myAIPawn = LPAIPawnAkrid(FXActionManager().Owner);
    AutoExplodeStrength = myAIPawn.TuneDataPawn.StrengthExplodeAfterFreeze;
    AutoExplodeEffectOffset = myAIPawn.TuneDataPawn.OffsetExplodeEffectAfterFreeze;
    AutoExplodeOnlyOneEffect = myAIPawn.TuneDataPawn.AutoExplodeOnlyOneEffect;
    SizeFractureMeshPartTooBig = myAIPawn.TuneDataPawn.SizeFractureMeshPartTooBig;
    MinTimeDestroyPartTooBig = myAIPawn.TuneDataPawn.MinTimeDestroyPartTooBig;
    MaxTimeDestroyPartTooBig = myAIPawn.TuneDataPawn.MaxTimeDestroyPartTooBig;
    PlayerMeleeDamageScale = myAIPawn.TuneDataPawn.PlayerMeleeDamageScale;
    //return;    
}

function GetFadeInTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ((myAIPawn.bShouldRagdoll) ? myAIPawn.TuneDataPawn.TimeFreezeRagdoll : myAIPawn.TuneDataPawn.TimeFreeze);
    //return ReturnValue;    
}

function Begin()
{
    local /*0x97E50000-0x00000000*/ private @NULL MInstanceConstant, MInterface;
    local /*0x97E50000-0x00000000*/ private int I, Idx, iNumElements;

    FadeInTime = GetFadeInTime();
    TimeFreezeEffectFinished = -1.0000000;
    TimeFreezeEffectStarted = myAIPawn.WorldInfo.TimeSeconds;
    // End:0x330
    if(!myAIPawn.TuneDataAIPawn.DebugDontDestroyPawn)
    {
        iNumElements = myAIPawn.Mesh.GetNumElements();
        I = 0;
        J0xE2:

        // End:0x330 [Loop If]
        if(I < iNumElements)
        {
            MInterface = myAIPawn.Mesh.GetMaterial(I);
            J0x140:

            // End:0x322 [Loop If]
            if(MInterface != none)
            {
                Idx = FreezeMaterials.Find('MatName', MInterface.Name);                
                // End:0x2C8
                if(Idx != -1)
                {
                    // End:0x22F
                    if(FreezeMaterials[Idx].MaterialToReplace != none)
                    {
                        myAIPawn.Mesh.SetMaterial(I, FreezeMaterials[Idx].MaterialToReplace);
                    }
                    MInstanceConstant = myAIPawn.Mesh.CreateAndSetMaterialInstanceConstant(I);
                    MInstanceConstant.SetScalarParameterValue(FreezeParamName, FadeInitialValue);
                    AkridMatInstances.AddItem(MInstanceConstant);                    
                    MInterface = none;
                }
                // End:0x314
                if(MaterialInstance(MInterface) != none)
                {
                    MInterface = MaterialInstance(MInterface).Parent;                    
                }
                else
                {
                    MInterface = none;
                }
                // [Loop Continue]
                goto J0x140;
            }
            ++I;
            // [Loop Continue]
            goto J0xE2;
        }
    }
    super(SPFXActionBase).Begin();
    //return;    
}

function IsFreezingFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (myAIPawn.WorldInfo.TimeSeconds - TimeFreezeEffectStarted) >= FadeInTime;
    //return ReturnValue;    
}

event WantToSwapToFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsFreezingFinished();
    //return ReturnValue;    
}

event SwapToFracturedStaticMeshActor()
{
    //return;    
}

protected function SpawnFracturedMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL InFracturedLocation[8388609], InFracturedRotation, InStaticMesh, ReturnValue, FractSMActor;

    local /*0x97E50000-0x00000000*/ private float AutoExplodeInSeconds;

    FractSMActor = myAIPawn.Spawn(Class'LPFracturedSMActorMovable',,, InFracturedLocation, InFracturedRotation);
    FractSMActor.FracturedStaticMeshComponent.SetStaticMesh(InStaticMesh);
    FractSMActor.FracturedStaticMeshComponent.bIgnoreInstanceForTextureStreaming = true;
    FractSMActor.bDestroyOnReset = true;
    FractSMActor.bDestroyAfterFullyCleanedUp = true;
    // End:0x1F2
    if(!myAIPawn.bShouldRagdoll && !myAIPawn.bAutoExplodeFrozen)
    {
        AutoExplodeInSeconds = RandRange(myAIPawn.TuneDataAIPawn.MinTimeExplodeAfterFreeze.GetValue(), myAIPawn.TuneDataAIPawn.MaxTimeExplodeAfterFreeze.GetValue());        
    }
    else
    {
        AutoExplodeInSeconds = 0.0000000;
    }
    FractSMActor.ResetHealth();
    FractSMActor.ExplodeInSeconds(AutoExplodeInSeconds, AutoExplodeStrength, AutoExplodeEffectOffset, AutoExplodeOnlyOneEffect);
    FractSMActor.minFragmentsRatioToPlayExplosionEffect = MinFragmentsRatioPlayExplosionEffect;
    FractSMActor.bDestroyPartsOnDamage = true;
    FractSMActor.bExplodeOnPlayerMelee = true;
    FractSMActor.ExplodeOnPlayerMeleeStrength = AutoExplodeStrength;
    FractSMActor.bPlayEffectsOnPartDestroyed = true;
    FractSMActor.DestroyPartAfterSecondsTooBigSize = SizeFractureMeshPartTooBig;
    FractSMActor.DestroyPartAfterSecondsTooBigMinTime = MinTimeDestroyPartTooBig;
    FractSMActor.DestroyPartAfterSecondsTooBigMaxTime = MaxTimeDestroyPartTooBig;
    FractSMActor.DestroyPartTooBigWhenTouched = true;
    FractSMActor.PlayerMeleeDamageScale = PlayerMeleeDamageScale;
    FractSMActor.bNoCollisionWhenExploded = true;
    FractSMActor.bNoCollisionWhenOnlySupportParts = false;
    // End:0x453
    if(bAvoidFracturedByVSWinch)
    {
        FractSMActor.DamagedByDamageType.AddItem(Class'LPDamageTypeVSWinch');        
    }
    // End:0x4E2
    if(bEnableKyObstacleInFracturedMesh && FractSMActor.KynapseObstacleComponent != none)
    {
        FractSMActor.KynapseObstacleComponent.ObstacleType = KyObstacleType;
        FractSMActor.ActivateKynapseHandle();
    }
    return FractSMActor;
    //return ReturnValue;    
}

defaultproperties
{
    FreezeParamName="FreezeAmount"
    FadeFinalValue=1.0000000
    MinFragmentsRatioPlayExplosionEffect=-1.0000000
    bIsTickable=true
}