class LPEmitCameraEffectOnVs extends LPEmitCameraEffect
    abstract
    hidecategories(AnimDependency,Navigation,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsPlayerPawnOwner;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ScoketOn;

// Export ULPEmitCameraEffectOnVs::execUpdateLocation(FFrame&, void* const)
native simulated function UpdateLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL CamLoc[25296897], CamRot;
    local /*0x97E50000-0x00000000*/ private float CamFOVDeg[8388609];


}

simulated event PostBeginPlay()
{
    VsPlayerPawnOwner = LPVSPlayerPawn(Owner);
    // End:0x7F
    if((VsPlayerPawnOwner == none) && LPPlayerController(Owner) != none)
    {
        VsPlayerPawnOwner = LPVSPlayerPawn(LPPlayerController(Owner).MyBasePlayerPawn);
    }
    super.PostBeginPlay();
    //return;    
}

function Destroyed()
{
    super.Destroyed();
    //return;    
}

event ScriptUpdateLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL CamLoc[25296897], CamRot;
    local /*0x97E50000-0x00000000*/ private float CamFOVDeg[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL M, XAxis;
    local /*0x97E50000-0x00000000*/ private float distAdjustedForFOV, dividend, divisor;
    local /*0x97E50000-0x00000000*/ private @NULL centerWindownSpugeLoc, centerWindownSpugeRot;

    VsPlayerPawnOwner.Mesh.GetSocketWorldLocationAndRotation(ScoketOn, centerWindownSpugeLoc, centerWindownSpugeRot);
    M = MakeRotationMatrix(centerWindownSpugeRot);
    XAxis = MatrixGetAxis(M, 1);
    dividend = Tan(BaseFOV * 0.0087266);
    divisor = Tan(CamFOVDeg * 0.0087266);
    distAdjustedForFOV = (DistFromCamera * dividend) / divisor;
    SetLocation(centerWindownSpugeLoc + (XAxis * distAdjustedForFOV));
    SetRotation(centerWindownSpugeRot);
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__LPEmitCameraEffectOnVs.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=ParticleSystemComponent0
}