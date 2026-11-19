class LPEmitCameraEffect_DefenderDeath extends LPEmitCameraEffect
    hidecategories(AnimDependency,Navigation,Object);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

function Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated function ActivateLensEffect()
{
    // End:0x4C
    if(BasePlayerPawnOwner != none)
    {
        ResetCameraEffectToTheseParams(BasePlayerPawnOwner.TuneDataBasePlayerPawn.DefenderTooCloseOnDeath_CameraEffect);
    }
    super(EmitterCameraLensEffectBase).ActivateLensEffect();
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffect_DefenderDeath.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
    TickGroup=ETickingGroup.TG_DuringAsyncWork
}