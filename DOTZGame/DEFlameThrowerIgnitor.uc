//======================================================
//DE Falme Thrower Primary Ignitor
//10-4-2008
//======================================================

class DEFlameThrowerIgnitor extends BBPFires;


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: SpriteEmitter'DEFlameThrowerIgnitor.SpriteEmitter34'
    begin object name=SpriteEmitter34 class=Class'Engine.SpriteEmitter'
        Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        FadeOutStartTime=0.2500000
        FadeOut=true
        FadeInEndTime=0.2500000
        FadeIn=true
        MaxParticles=40
        AutoDestroy=true
        StartLocationPolarRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=10.0000000))
        SpinParticles=true
        StartSpinRange=(X=(Min=0.3000000,Max=0.4000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRegularSizeScale=false
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
        UniformSize=true
        InitialParticlesPerSecond=20.0000000
        AutomaticInitialSpawning=false
        Texture=Texture'SpecialFX.Fire.LargeFlames2'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        UseRandomSubdivision=true
        SecondsBeforeInactive=0.0000000
        LifetimeRange=(Min=0.2500000,Max=0.5000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=10.0000000))
    end object
    Emitters[0]=SpriteEmitter34
    // Reference: SpriteEmitter'DEFlameThrowerIgnitor.SpriteEmitter35'
    begin object name=SpriteEmitter35 class=Class'Engine.SpriteEmitter'
        Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
        FadeOutStartTime=0.2500000
        FadeOut=true
        FadeInEndTime=0.2500000
        FadeIn=true
        MaxParticles=4
        AutoDestroy=true
        SpinParticles=true
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRegularSizeScale=false
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
        UniformSize=true
        InitialParticlesPerSecond=4.0000000
        AutomaticInitialSpawning=false
        Texture=Texture'SpecialFX.MuzzleFlash.Fireball'
        SecondsBeforeInactive=0.0000000
        LifetimeRange=(Min=0.2500000,Max=0.5000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=10.0000000,Max=10.0000000))
    end object
    Emitters[1]=SpriteEmitter35
    AutoDestroy=true
    bNoDelete=false
    bUnlit=false
    bDirectional=true
}