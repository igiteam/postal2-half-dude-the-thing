class LPCombatWindow extends Object
    abstract
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7CA30000-0x00000000*/ private name WindowName[65537];
var(0.25_Pct) /*0x7CA30000-0x00000000*/ private float MinSeparationDistance[65537];
var(0.25_Pct) /*0x7CA30000-0x00000000*/ private float MaxSeparationDistance[65537];
var(0.25_Pct) /*0x7CA30000-0x00000000*/ private float AngleTolerance[65537];
var(0.25_Pct) /*0x7CA30000-0x00000000*/ private int Priority[65537];
var(0.25_Pct) /*0x7CA30000-0x00000000*/ private int Weight[65537];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Performer[8388609], Target;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float D;
    local /*0x97E50000-0x00000000*/ private @NULL ToTarget, ToTargetRotator;
    local /*0x97E50000-0x00000000*/ private int DeltaYaw;

    D = Performer.DistanceBetweenCollisionCylinders(Target);
    // End:0x64
    if((D < MinSeparationDistance) || D > MaxSeparationDistance)
    {
        return false;
    }
    ToTarget = Target.Location - Performer.Location;
    ToTargetRotator = Rotator(ToTarget);
    DeltaYaw = ToTargetRotator.Yaw - Performer.Rotation.Yaw;
    DeltaYaw = NormalizeRotAxis(DeltaYaw);
    // End:0x162
    if(Abs(float(DeltaYaw)) > ((AngleTolerance * 0.5000000) * 182.0444000))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

static function IsBetterWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestWindow[25296897], BaselineWindow, inPawn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    MaxSeparationDistance=300.0000000
    AngleTolerance=180.0000000
    Weight=1
}