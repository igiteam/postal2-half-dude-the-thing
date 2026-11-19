class LPEmitCameraEffectCompositeOnVs extends LPEmitCameraEffectOnVs
    abstract
    hidecategories(AnimDependency,Navigation,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftWindow;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightWindow;

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL playCtrl, playerCam;

    super.PostBeginPlay();
    // End:0x2BC
    if(VsPlayerPawnOwner != none)
    {
        ScoketOn = VsPlayerPawnOwner.TuneDataVSPlayerPawn.CenterWindowEffectRefrenceSocketName;
        LeftWindow = Spawn(Class'LPEmitCameraEffectVsLeftWindow', VsPlayerPawnOwner);
        LeftWindow.ScoketOn = VsPlayerPawnOwner.TuneDataVSPlayerPawn.LeftWindowEffectRefrenceSocketName;
        RightWindow = Spawn(Class'LPEmitCameraEffectVsRightWindow', VsPlayerPawnOwner);
        RightWindow.ScoketOn = VsPlayerPawnOwner.TuneDataVSPlayerPawn.RightWindowEffectRefrenceSocketName;
        playCtrl = PlayerController(VsPlayerPawnOwner.Controller);
        // End:0x2BC
        if((((playCtrl != none) && playCtrl.PlayerCamera != none) && LeftWindow != none) && RightWindow != none)
        {
            playerCam = LPPlayerCamera(playCtrl.PlayerCamera);
            // End:0x2BC
            if(playerCam != none)
            {
                SetParamtersForLeftWindowEffect();
                LeftWindow.ActivateLensEffect();
                SetParamtersForRightWindowEffect();
                RightWindow.ActivateLensEffect();
                playerCam.AddExistingCameraLensEffect(LeftWindow);
                playerCam.AddExistingCameraLensEffect(RightWindow);
            }
        }
    }
    //return;    
}

function Destroyed()
{
    LeftWindow.Destroy();
    LeftWindow = none;
    RightWindow.Destroy();
    RightWindow = none;
    super.Destroyed();
    //return;    
}

function SetParamtersForLeftWindowEffect()
{
    //return;    
}

function SetParamtersForRightWindowEffect()
{
    //return;    
}

defaultproperties
{
    ScoketOn="CenterGlass"
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffectCompositeOnVs.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
}