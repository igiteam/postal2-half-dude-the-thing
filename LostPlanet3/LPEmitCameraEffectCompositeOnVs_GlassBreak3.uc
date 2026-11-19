class LPEmitCameraEffectCompositeOnVs_GlassBreak3 extends LPEmitCameraEffectCompositeOnVs
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
        ResetCameraEffectToTheseParams(VsPlayerPawnOwner.TuneDataVSPlayerPawn.VsGlassBreak3_CameraEffect.CenterWindowEffect);
    }
    super(EmitterCameraLensEffectBase).ActivateLensEffect();
    //return;    
}

function SetParamtersForLeftWindowEffect()
{
    // End:0x85
    if((VsPlayerPawnOwner != none) && LeftWindow != none)
    {
        LeftWindow.ResetCameraEffectToTheseParams(VsPlayerPawnOwner.TuneDataVSPlayerPawn.VsGlassBreak3_CameraEffect.LeftWindowEffect);
    }
    //return;    
}

function SetParamtersForRightWindowEffect()
{
    // End:0x85
    if((VsPlayerPawnOwner != none) && RightWindow != none)
    {
        RightWindow.ResetCameraEffectToTheseParams(VsPlayerPawnOwner.TuneDataVSPlayerPawn.VsGlassBreak3_CameraEffect.RightWindowEffect);
    }
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffectCompositeOnVs_GlassBreak3.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
}