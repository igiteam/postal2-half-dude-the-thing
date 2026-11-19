class LPAimControlStalker extends SPGFAimControlBase
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAimYawDegreesSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxAimPitchDegreesSpeed[536870913];

// Export ULPAimControlStalker::execDebugDraw(FFrame&, void* const)
native function DebugDraw();

event UpdateAim()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myStalkerCtrl, MyAkridPawn, NewAimRotator;

    myStalkerCtrl = LPAIControllerStalker(PawnOuter.Controller);
    MyAkridPawn = LPAIPawnAkrid(PawnOuter);
    // End:0x1DC
    if(myStalkerCtrl != none)
    {
        NewAimRotator = myStalkerCtrl.GetBaseAIAimRotation(none, MyAkridPawn.GetBurstFireStartTraceLocation(), myStalkerCtrl.GetAimLocation());
        NewAimRotator.Yaw = int(LimitAimDegreesChange(float(NewAimRotator.Yaw), float(WorldAimRotator.Yaw), DeltaTime, MaxAimYawDegreesSpeed));
        NewAimRotator.Pitch = int(LimitAimDegreesChange(float(NewAimRotator.Pitch), float(WorldAimRotator.Pitch), DeltaTime, MaxAimPitchDegreesSpeed));
        WorldAimRotator = NewAimRotator;
        WorldAimDir = Vector(WorldAimRotator);
    }
    //return;    
}

protected event ScriptDebugDraw()
{
    //return;    
}

defaultproperties
{
    MaxAimYawDegreesSpeed=180.0000000
    MaxAimPitchDegreesSpeed=180.0000000
}