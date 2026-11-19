class SPDAction_CameraShake extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x026A0000-0x00000000*/ private @NULL CameraShake[65537];
var(__OnDestroyed__Delegate) /*0x026A0000-0x00000000*/ private float InfluenceRadius[65537];
var(__OnDestroyed__Delegate) /*0x026A0000-0x00000000*/ private float GlobalScale[65537];
var(__OnDestroyed__Delegate) /*0x026A0000-0x00000000*/ private float GlobalAmplitudeScale[65537];
var(__OnDestroyed__Delegate) /*0x026A0000-0x00000000*/ private float GlobalFrequencyScale[65537];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL PCFound, PC;
    local /*0x01C00000-0x00000000*/ private float ShakeDist;

    // End:0x15E
    if(Actor != none)
    {
        // End:0x14E
        foreach manager.GetWorldInfo().AllControllers(Class'Engine.PlayerController', PC)
        {
            // End:0x14D
            if((PC.Pawn != none) && SPPlayerController(PC.Pawn.Controller) != none)
            {
                ShakeDist = VSize(Actor.Location - PC.Pawn.Location);
                // End:0x14D
                if(ShakeDist < InfluenceRadius)
                {
                    PCFound = PC;
                    // End:0x14E
                    break;
                }
            }            
        }        
        // End:0x15E
        if(PCFound != none)
        {
        }
    }
    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    CameraShake=(TimeToGo=0.0000000,TimeDuration=1.0000000,RotAmplitude=(X=100.0000000,Y=100.0000000,Z=200.0000000),RotFrequency=(X=10.0000000,Y=10.0000000,Z=25.0000000),RotSinOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),RotParam=(X=EShakeParam.ESP_OffsetRandom,Y=EShakeParam.ESP_OffsetRandom,Z=EShakeParam.ESP_OffsetRandom,Padding=0),LocAmplitude=(X=0.0000000,Y=3.0000000,Z=5.0000000),LocFrequency=(X=1.0000000,Y=10.0000000,Z=20.0000000),LocSinOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),LocParam=(X=EShakeParam.ESP_OffsetRandom,Y=EShakeParam.ESP_OffsetRandom,Z=EShakeParam.ESP_OffsetRandom,Padding=0),FOVAmplitude=2.0000000,FOVFrequency=5.0000000,FOVSinOffset=0.0000000,FOVParam=EShakeParam.ESP_OffsetRandom,ShakeName="None",bOverrideTargetingDampening=false,TargetingDampening=0.0000000)
    GlobalScale=1.0000000
    GlobalAmplitudeScale=1.0000000
    GlobalFrequencyScale=1.0000000
}