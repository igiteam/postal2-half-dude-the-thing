//======================================================
//DE Falme Thrower Primary Spark
//10-4-2008
//======================================================

class DEFlameThrowerSpark extends BBPFires;


// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: SparkEmitter'DEFlameThrowerSpark.SparkEmitter1'
    begin object name=SparkEmitter1 class=Class'Engine.SparkEmitter'
        LineSegmentsRange=(Min=0.0100000,Max=0.0500000)
        TimeBetweenSegmentsRange=(Min=0.0100000,Max=0.0500000)
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1000.0000000)
        UseColorScale=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0100000
        FadeOut=true
        CoordinateSystem=1
        MaxParticles=45
        RespawnDeadParticles=false
        UseRotationFrom=1
        InitialParticlesPerSecond=10000000.0000000
        AutomaticInitialSpawning=false
        Texture=Texture'SpecialFX.Particles.YellowSpark'
        SecondsBeforeInactive=0.0000000
        LifetimeRange=(Min=1.2000000,Max=1.2000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=500.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
    end object
    Emitters[0]=SparkEmitter1
    // Reference: SpriteEmitter'DEFlameThrowerSpark.SpriteEmitter37'
    begin object name=SpriteEmitter37 class=Class'Engine.SpriteEmitter'
        CoordinateSystem=1
        MaxParticles=1
        RespawnDeadParticles=false
        AutoDestroy=true
        StartSizeRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
        UniformSize=true
        SpawningSound=3
        SpawningSoundIndex=(Min=0.0000000,Max=1.0000000)
        SpawningSoundProbability=(Min=1.0000000,Max=1.0000000)
        InitialParticlesPerSecond=100000000.0000000
        AutomaticInitialSpawning=false
        SecondsBeforeInactive=0.0000000
    end object
    Emitters[1]=SpriteEmitter37
    AutoDestroy=true
    bNoDelete=false
    bUnlit=false
    bDirectional=true
}