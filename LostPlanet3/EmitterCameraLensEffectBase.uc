class EmitterCameraLensEffectBase extends Emitter
    abstract
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private @NULL PS_CameraEffect;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PS_CameraEffectNonExtremeContent;
var(*) /*0x35EA0000-0x00000000*/ private float BaseFOV;
var(*) /*0x1FB10000-0x00000000*/ private float DistFromCamera[196609];
var(*) /*0x1FB10000-0x00000000*/ private noexport bool bAllowMultipleInstances[196609];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EmittersToTreatAsSame;
var(*) /*0x35EA0000-0x00000000*/ private @NULL BaseCamera[536870913];

function Destroyed()
{
    // End:0x2F
    if(BaseCamera != none)
    {
        BaseCamera.RemoveCameraLensEffect(self);
    }
    super(Actor).Destroyed();
    //return;    
}

function RegisterCamera()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];

    BaseCamera = C;
    //return;    
}

function NotifyRetriggered()
{
    //return;    
}

simulated function PostBeginPlay()
{
    ParticleSystemComponent.SetDepthPriorityGroup(2);
    super.PostBeginPlay();
    ActivateLensEffect();
    //return;    
}

simulated function ActivateLensEffect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PSToActuallySpawn;

    // End:0xB5
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x76
        if(WorldInfo.GRI.ShouldShowGore())
        {
            PSToActuallySpawn = PS_CameraEffect;            
        }
        else
        {
            PSToActuallySpawn = PS_CameraEffectNonExtremeContent;
        }
        // End:0xB5
        if(PSToActuallySpawn != none)
        {
            SetTemplate(PS_CameraEffect, bDestroyOnSystemFinish);
        }
    }
    //return;    
}

// Export UEmitterCameraLensEffectBase::execUpdateLocation(FFrame&, void* const)
native simulated function UpdateLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CamLoc[25296897], CamRot;
    local /*0x35EA0000-0x00000000*/ private float CamFOVDeg[8388609];


}

defaultproperties
{
    BaseFOV=80.0000000
    DistFromCamera=90.0000000
    // Reference: ParticleSystemComponent'Default__EmitterCameraLensEffectBase.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    bDestroyOnSystemFinish=true
    Components[0]=ParticleSystemComponent0
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bNoDelete=false
    bNetInitialRotation=true
    LifeSpan=10.0000000
}