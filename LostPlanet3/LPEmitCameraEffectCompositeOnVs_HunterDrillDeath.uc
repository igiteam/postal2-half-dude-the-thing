class LPEmitCameraEffectCompositeOnVs_HunterDrillDeath extends LPEmitCameraEffectCompositeOnVs
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
    // End:0x5F
    if(VsPlayerPawnOwner != none)
    {
        ResetCameraEffectToTheseParams(VsPlayerPawnOwner.TuneDataVSPlayerPawn.VsHunterDrillDeath_CameraEffect.CenterWindowEffect);
    }
    super(EmitterCameraLensEffectBase).ActivateLensEffect();
    //return;    
}

function SetParamtersForLeftWindowEffect()
{
    // End:0x85
    if((VsPlayerPawnOwner != none) && LeftWindow != none)
    {
        LeftWindow.ResetCameraEffectToTheseParams(VsPlayerPawnOwner.TuneDataVSPlayerPawn.VsHunterDrillDeath_CameraEffect.LeftWindowEffect);
    }
    //return;    
}

function SetParamtersForRightWindowEffect()
{
    // End:0x85
    if((VsPlayerPawnOwner != none) && RightWindow != none)
    {
        RightWindow.ResetCameraEffectToTheseParams(VsPlayerPawnOwner.TuneDataVSPlayerPawn.VsHunterDrillDeath_CameraEffect.RightWindowEffect);
    }
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffectCompositeOnVs_HunterDrillDeath.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
}