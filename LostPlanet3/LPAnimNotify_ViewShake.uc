class LPAnimNotify_ViewShake extends SPAnimNotify_ViewShake
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBeenKingSized;
var(0.25_Pct) /*0x7C2B0000-0x00000000*/ private bool bActiveForVS[65537];

event Notify()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator, ViewShakeOrigin, P, PC;

    local /*0x97E50000-0x00000000*/ private float ShakeScale;
    local /*0x97E50000-0x00000000*/ private @NULL elvis;

    elvis = LPAIPawnKingCrab(Owner);
    // End:0xB60
    if((elvis != none) && !bBeenKingSized)
    {
        ShakeParams.OscillationDuration += elvis.TuneDataKingCrab.ShakeParams.OscillationDuration;
        ShakeParams.OscillationBlendInTime += elvis.TuneDataKingCrab.ShakeParams.OscillationBlendInTime;
        ShakeParams.OscillationBlendInTime += elvis.TuneDataKingCrab.ShakeParams.OscillationBlendOutTime;
        ShakeRadius += elvis.TuneDataKingCrab.ShakeRadius_Tunable.GetValue();
        ShakeParams.RotOscillation.Pitch.Amplitude += elvis.TuneDataKingCrab.ShakeParams.RotOscillation.Pitch.Amplitude;
        ShakeParams.RotOscillation.Pitch.Frequency += elvis.TuneDataKingCrab.ShakeParams.RotOscillation.Pitch.Frequency;
        ShakeParams.RotOscillation.Yaw.Amplitude += elvis.TuneDataKingCrab.ShakeParams.RotOscillation.Yaw.Amplitude;
        ShakeParams.RotOscillation.Yaw.Frequency += elvis.TuneDataKingCrab.ShakeParams.RotOscillation.Yaw.Frequency;
        ShakeParams.RotOscillation.Roll.Amplitude += elvis.TuneDataKingCrab.ShakeParams.RotOscillation.Roll.Amplitude;
        ShakeParams.RotOscillation.Roll.Frequency += elvis.TuneDataKingCrab.ShakeParams.RotOscillation.Roll.Frequency;
        ShakeParams.LocOscillation.X.Amplitude += elvis.TuneDataKingCrab.ShakeParams.LocOscillation.X.Amplitude;
        ShakeParams.LocOscillation.X.Frequency += elvis.TuneDataKingCrab.ShakeParams.LocOscillation.X.Frequency;
        ShakeParams.LocOscillation.Y.Amplitude += elvis.TuneDataKingCrab.ShakeParams.LocOscillation.Y.Amplitude;
        ShakeParams.LocOscillation.Y.Frequency += elvis.TuneDataKingCrab.ShakeParams.LocOscillation.Y.Frequency;
        ShakeParams.LocOscillation.Z.Amplitude += elvis.TuneDataKingCrab.ShakeParams.LocOscillation.Z.Amplitude;
        ShakeParams.LocOscillation.Z.Frequency += elvis.TuneDataKingCrab.ShakeParams.LocOscillation.Z.Frequency;
        ShakeParams.FOVOscillation.Amplitude += elvis.TuneDataKingCrab.ShakeParams.FOVOscillation.Amplitude;
        ShakeParams.FOVOscillation.Frequency += elvis.TuneDataKingCrab.ShakeParams.FOVOscillation.Frequency;
        bBeenKingSized = true;
    }
    // End:0xC76
    if(ShakeRadius == float(0))
    {
        // End:0xBAF
        if(!bActiveForVS)
        {
            // End:0xBAF
            if(ClassIsChildOf(Owner.Class, Class'LPBaseVSPlayerPawn'))
            {
                return;
            }
        }
        P = Pawn(Owner);
        // End:0xC73
        if((P != none) && P.IsLocallyControlled())
        {
            PC = PlayerController(P.Controller);
            // End:0xC73
            if(PC != none)
            {
                PC.ClientPlayCameraShake(ShakeParams,, bDoControllerVibration);
            }
        }        
    }
    else
    {
        // End:0xD05
        if((bUseBoneLocation && AnimSeqInstigator != none) && AnimSeqInstigator.SkelComponent != none)
        {
            ViewShakeOrigin = AnimSeqInstigator.SkelComponent.GetBoneLocation(BoneName);            
        }
        else
        {
            ViewShakeOrigin = Owner.Location;
        }
        // End:0xEC5
        if(Owner != none)
        {
            // End:0xEC4
            foreach Owner.LocalPlayerControllers(Class'Engine.PlayerController', PC)
            {
                // End:0xEC3
                if(PC.PlayerCamera != none)
                {
                    // End:0xE23
                    if((!bActiveForVS && ClassIsChildOf(PC.Class, Class'LPPlayerController')) && ClassIsChildOf(LPPlayerController(PC).Pawn.Class, Class'LPBaseVSPlayerPawn'))
                    {
                        continue;                        
                    }
                    ShakeScale = Class'Engine.Camera'.static.CalcRadialShakeScale(PC.PlayerCamera, ViewShakeOrigin, 0.0000000, ShakeRadius, 1.0000000);
                    PC.ClientPlayCameraShake(ShakeParams, ShakeScale, bDoControllerVibration);
                }                
            }            
        }
    }
    //return;    
}

defaultproperties
{
    bActiveForVS=true
}