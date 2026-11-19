class LPEmitCameraEffectVsRightWindow extends LPEmitCameraEffectOnVs
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

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffectVsRightWindow.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
}