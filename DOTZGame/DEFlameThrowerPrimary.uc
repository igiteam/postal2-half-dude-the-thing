//=============================================================================
// DE Falme Thrower Primary Fire
// 10-4-2008
// Note: To increase the velocity of the particles, be sure to change the
// StartVelocity in the default properties instead of the emitter.
//=============================================================================
class DEFlameThrowerPrimary extends BBPFires;

var float StartVelocity;

function SetDirection(rotator Direction)
{
    local int i;
    local vector ParticleVelocity;

    ParticleVelocity = vector(Direction) * StartVelocity;

    for(i=0; i<Emitters.length; i++)
    {
        if(Emitters[i] != None)
        {
            Emitters[i].StartVelocityRange.X.Min = ParticleVelocity.X;
            Emitters[i].StartVelocityRange.X.Max = ParticleVelocity.X;

            Emitters[i].StartVelocityRange.Y.Min = ParticleVelocity.Y;
            Emitters[i].StartVelocityRange.Y.Max = ParticleVelocity.Y;

            Emitters[i].StartVelocityRange.Z.Min = ParticleVelocity.Z;
            Emitters[i].StartVelocityRange.Z.Max = ParticleVelocity.Z;
        }
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    StartVelocity=800.0000000
    // Reference: SpriteEmitter'DEFlameThrowerPrimary.SpriteEmitter53'
    begin object name=SpriteEmitter53 class=Class'Engine.SpriteEmitter'
        FadeOutStartTime=0.5000000
        FadeOut=true
        MaxParticles=30
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseSizeScale=true
        UseRegularSizeScale=false
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
        UniformSize=true
        DrawStyle=6
        Texture=Texture'SpecialFX.Fire.LargeFlames2'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        BlendBetweenSubdivisions=true
        LifetimeRange=(Min=1.7500000,Max=1.7500000)
        StartVelocityRange=(X=(Min=800.0000000,Max=800.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter53
    // Reference: SpriteEmitter'DEFlameThrowerPrimary.SpriteEmitter54'
    begin object name=SpriteEmitter54 class=Class'Engine.SpriteEmitter'
        FadeOutStartTime=0.7000000
        FadeOut=true
        MaxParticles=20
        SpinParticles=true
        SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        UniformSize=true
        DrawStyle=6
        Texture=Texture'SpecialFX.Fire.LargeFlames2'
        LifetimeRange=(Min=0.9000000,Max=0.9000000)
        StartVelocityRange=(X=(Min=800.0000000,Max=800.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter54
    AutoDestroy=true
    bNoDelete=false
    bUnlit=false
    bDirectional=true
}