class AnimNotify_ViewShake extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private const float Duration;
var(*) /*0x35EA0000-0x00000000*/ private const @NULL RotAmplitude;
var(*) /*0x35EA0000-0x00000000*/ private const @NULL RotFrequency;
var(*) /*0x35EA0000-0x00000000*/ private const @NULL LocAmplitude;
var(*) /*0x35EA0000-0x00000000*/ private const @NULL LocFrequency;
var(*) /*0x35EA0000-0x00000000*/ private const float FOVAmplitude;
var(*) /*0x35EA0000-0x00000000*/ private const float FOVFrequency;
var(*) /*0x02F60000-0x00000000*/ private bool bDoControllerVibration[65537];
var(*) /*0x02F60000-0x00000000*/ private bool bUseBoneLocation[65537];
var(*) /*0x02F60000-0x00000000*/ private float ShakeRadius[65537];
var(*) /*0x02F60000-0x00000000*/ private name BoneName[65537];
var(*) /*0x02F60000-0x00000400*/ private editfixedsize @NULL ShakeParams[589825];

event Notify()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator, ViewShakeOrigin, P, PC;

    // End:0xD8
    if(ShakeRadius == float(0))
    {
        P = Pawn(Owner);
        // End:0xD5
        if((P != none) && P.IsLocallyControlled())
        {
            PC = PlayerController(P.Controller);
            // End:0xD5
            if(PC != none)
            {
                PC.ClientPlayCameraShake(ShakeParams,, bDoControllerVibration);
            }
        }        
    }
    else
    {
        // End:0x167
        if((bUseBoneLocation && AnimSeqInstigator != none) && AnimSeqInstigator.SkelComponent != none)
        {
            ViewShakeOrigin = AnimSeqInstigator.SkelComponent.GetBoneLocation(BoneName);            
        }
        else
        {
            ViewShakeOrigin = Owner.Location;
        }
        // End:0x1F6
        if(Owner != none)
        {
            Class'Camera'.static.PlayWorldCameraShake(ShakeParams, Owner, ViewShakeOrigin, 0.0000000, ShakeRadius, 1.0000000, bDoControllerVibration);
        }
    }
    //return;    
}

defaultproperties
{
    Duration=1.0000000
    RotAmplitude=(X=100.0000000,Y=100.0000000,Z=200.0000000)
    RotFrequency=(X=10.0000000,Y=10.0000000,Z=25.0000000)
    LocAmplitude=(X=0.0000000,Y=3.0000000,Z=6.0000000)
    LocFrequency=(X=1.0000000,Y=10.0000000,Z=20.0000000)
    FOVAmplitude=2.0000000
    FOVFrequency=5.0000000
    ShakeRadius=4096.0000000
}