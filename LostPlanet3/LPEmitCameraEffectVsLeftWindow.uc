class LPEmitCameraEffectVsLeftWindow extends LPEmitCameraEffectOnVs
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
    super(EmitterCameraLensEffectBase).ActivateLensEffect();
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffectVsLeftWindow.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
}