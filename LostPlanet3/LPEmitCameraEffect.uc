class LPEmitCameraEffect extends SPEmitCameraEffect
    hidecategories(AnimDependency,Navigation,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BasePlayerPawnOwner;

simulated event PostBeginPlay()
{
    BasePlayerPawnOwner = LPBasePlayerPawn(Owner);
    super.PostBeginPlay();
    //return;    
}

function Destroyed()
{
    super(EmitterCameraLensEffectBase).Destroyed();
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffect.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
    TickGroup=ETickingGroup.TG_EffectsUpdateWork
}