class SavedMove extends Object;

var(*) /*0x35EA0000-0x00000000*/ private @NULL NextMove;
var(*) /*0x35EA0000-0x00000000*/ private float TimeStamp;
var(*) /*0x35EA0000-0x00000000*/ private float Delta;
var(*) /*0x35EA0000-0x00000000*/ private bool bRun;
var(*) /*0x35EA0000-0x00000000*/ private bool bDuck;
var(*) /*0x35EA0000-0x00000000*/ private bool bPressedJump;
var(*) /*0x35EA0000-0x00000000*/ private bool bDoubleJump;
var(*) /*0x35EA0000-0x00000000*/ private bool bPreciseDestination;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceRMVelocity;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceMaxAccel;
var(*) /*0x35EA0000-0x00000000*/ private bool bRootMotionFromInterpCurve;
var(*) /*0x35EA0000-0x00000000*/ private byte DoubleClickMove;
var(*) /*0x35EA0000-0x00000000*/ private byte SavedPhysics;
var(*) /*0x35EA0000-0x00000000*/ private byte RootMotionMode;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StartLocation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StartRelativeLocation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StartVelocity;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StartFloor;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedLocation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedVelocity;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedRelativeLocation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL RMVelocity;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Acceleration;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StartBase;
var(*) /*0x35EA0000-0x00000000*/ private @NULL EndBase;
var(*) /*0x35EA0000-0x00000000*/ private float CustomTimeDilation;
var(*) /*0x35EA0000-0x00000000*/ private float AccelDotThreshold;
var(*) /*0x35EA0000-0x00000000*/ private float RootMotionInterpCurrentTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL RootMotionInterpCurveLastValue;

event Clear()
{
    TimeStamp = 0.0000000;
    Delta = 0.0000000;
    DoubleClickMove = 0;
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    StartVelocity = vect(0.0000000, 0.0000000, 0.0000000);
    bRun = false;
    bDuck = false;
    bPressedJump = false;
    bDoubleJump = false;
    bPreciseDestination = false;
    bForceRMVelocity = false;
    CustomTimeDilation = 1.0000000;
    //return;    
}

function PostUpdate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    bDoubleJump = P.bDoubleJump || bDoubleJump;
    // End:0x1E3
    if(P.Pawn != none)
    {
        RMVelocity = P.Pawn.RMVelocity;
        SavedLocation = P.Pawn.Location;
        SavedVelocity = P.Pawn.Velocity;
        EndBase = P.Pawn.Base;
        // End:0x1E3
        if((EndBase != none) && !EndBase.bWorldGeometry)
        {
            SavedRelativeLocation = P.Pawn.Location - EndBase.Location;
        }
    }
    Rotation = P.Rotation;
    //return;    
}

function IsImportantMove()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CompareAccel[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL AccelNorm;

    // End:0x60
    if((bPressedJump || bDoubleJump) || ((int(DoubleClickMove) != int(0)) && int(DoubleClickMove) != int(5)) && int(DoubleClickMove) != int(6))
    {
        return true;
    }
    // End:0x6F
    if(bRootMotionFromInterpCurve)
    {
        return true;
    }
    AccelNorm = Normal(Acceleration);
    return (CompareAccel != AccelNorm) && (CompareAccel Dot AccelNorm) < AccelDotThreshold;
    //return ReturnValue;    
}

function GetStartLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5F
    if((StartBase != none) && !StartBase.bWorldGeometry)
    {
        return StartBase.Location + StartRelativeLocation;
    }
    return StartLocation;
    //return ReturnValue;    
}

function SetInitialPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    SavedPhysics = P.Physics;
    StartLocation = P.Location;
    StartVelocity = P.Velocity;
    StartBase = P.Base;
    StartFloor = P.Floor;
    CustomTimeDilation = P.CustomTimeDilation;
    // End:0x16D
    if((StartBase != none) && !StartBase.bWorldGeometry)
    {
        StartRelativeLocation = P.Location - StartBase.Location;
    }
    bRootMotionFromInterpCurve = P.bRootMotionFromInterpCurve;
    // End:0x231
    if(bRootMotionFromInterpCurve)
    {
        RootMotionInterpCurrentTime = P.RootMotionInterpCurrentTime;
        RootMotionInterpCurveLastValue = P.RootMotionInterpCurveLastValue;
        RootMotionMode = P.Mesh.RootMotionMode;
    }
    //return;    
}

function CanCombineWith()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMove[8388609], inPawn;
    local /*0x35EA0000-0x00000000*/ private float MaxDelta[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(inPawn == none)
    {
        return false;
    }
    // End:0x20
    if(bRootMotionFromInterpCurve)
    {
        return false;
    }
    // End:0x2A7
    if(NewMove.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
    {
        return ((((((((((((((Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) && StartVelocity == vect(0.0000000, 0.0000000, 0.0000000)) && NewMove.StartVelocity == vect(0.0000000, 0.0000000, 0.0000000)) && int(SavedPhysics) == int(inPawn.Physics)) && !bPressedJump) && !NewMove.bPressedJump) && bRun == NewMove.bRun) && bDuck == NewMove.bDuck) && bPreciseDestination == NewMove.bPreciseDestination) && bDoubleJump == NewMove.bDoubleJump) && (int(DoubleClickMove) == int(0)) || int(DoubleClickMove) == int(5)) && int(NewMove.DoubleClickMove) == int(DoubleClickMove)) && !bForceRMVelocity) && !NewMove.bForceRMVelocity) && CustomTimeDilation == NewMove.CustomTimeDilation;        
    }
    else
    {
        return ((((((((((((((inPawn != none) && (NewMove.Delta + Delta) < MaxDelta) && int(SavedPhysics) == int(inPawn.Physics)) && !bPressedJump) && !NewMove.bPressedJump) && bRun == NewMove.bRun) && bDuck == NewMove.bDuck) && bDoubleJump == NewMove.bDoubleJump) && bPreciseDestination == NewMove.bPreciseDestination) && (int(DoubleClickMove) == int(0)) || int(DoubleClickMove) == int(5)) && int(NewMove.DoubleClickMove) == int(DoubleClickMove)) && (Normal(Acceleration) Dot Normal(NewMove.Acceleration)) > 0.9900000) && !bForceRMVelocity) && !NewMove.bForceRMVelocity) && CustomTimeDilation == NewMove.CustomTimeDilation;
    }
    //return ReturnValue;    
}

function SetMoveFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL newAccel[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InDoubleClick[8388609];

    Delta = DeltaTime;
    // End:0x48
    if(VSize(newAccel) > float(26214))
    {
        newAccel = float(26214) * Normal(newAccel);
    }
    // End:0x94
    if(P.Pawn != none)
    {
        SetInitialPosition(P.Pawn);
    }
    Acceleration = newAccel;
    DoubleClickMove = InDoubleClick;
    bRun = int(P.bRun) > int(0);
    bDuck = int(P.bDuck) > int(0);
    bPressedJump = P.bPressedJump;
    bDoubleJump = P.bDoubleJump;
    bPreciseDestination = P.bPreciseDestination;
    bForceRMVelocity = P.bPreciseDestination || (((P.Pawn != none) && P.Pawn.Mesh != none) && !P.Pawn.bRootMotionFromInterpCurve) && (int(P.Pawn.Mesh.RootMotionMode) == int(3)) || int(P.Pawn.Mesh.RootMotionMode) == int(1);
    bForceMaxAccel = (P.Pawn != none) && P.Pawn.bForceMaxAccel;
    TimeStamp = P.WorldInfo.TimeSeconds;
    //return;    
}

function PrepMoveFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x16E
    if(P != none)
    {
        P.bForceRMVelocity = bForceRMVelocity;
        P.bForceMaxAccel = bForceMaxAccel;
        P.RMVelocity = RMVelocity;
        P.bRootMotionFromInterpCurve = bRootMotionFromInterpCurve;
        // End:0x16E
        if(P.bRootMotionFromInterpCurve)
        {
            P.Mesh.RootMotionMode = RootMotionMode;
            P.RootMotionInterpCurveLastValue = RootMotionInterpCurveLastValue;
            P.SetRootMotionInterpCurrentTime(RootMotionInterpCurrentTime, Delta, true);
        }
    }
    //return;    
}

function ResetMoveFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x125
    if(P != none)
    {
        SavedLocation = P.Location;
        SavedVelocity = P.Velocity;
        EndBase = P.Base;
        // End:0x104
        if((EndBase != none) && !EndBase.bWorldGeometry)
        {
            SavedRelativeLocation = P.Location - EndBase.Location;
        }
        P.bForceRMVelocity = false;
    }
    //return;    
}

function CompressedFlags()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689], Result;

    Result = DoubleClickMove;
    // End:0x2D
    if(bRun)
    {
        Result += 8;
    }
    // End:0x47
    if(bDuck)
    {
        Result += 16;
    }
    // End:0x61
    if(bPressedJump)
    {
        Result += 32;
    }
    // End:0x7B
    if(bDoubleJump)
    {
        Result += 64;
    }
    // End:0x95
    if(bPreciseDestination)
    {
        Result += 128;
    }
    return Result;
    //return ReturnValue;    
}

// Export USavedMove::execSetFlags(FFrame&, void* const)
native static function SetFlags()
{
    local /*0x35EA0000-0x00000000*/ private byte Flags[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

function GetDebugString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689], Str;

    Str = (((((((((((((((((((((((((((((string(self) @ "Delta:'") $ string(Delta)) $ "'") @ "SavedPhysics:'") $ string(SavedPhysics)) $ "'") @ "StartLocation:'") $ string(StartLocation)) $ "'") @ "StartVelocity:'") $ string(StartVelocity)) $ "'") @ "SavedLocation:'") $ string(SavedLocation)) $ "'") @ "SavedVelocity:'") $ string(SavedVelocity)) $ "'") @ "RMVelocity:'") $ string(RMVelocity)) $ "'") @ "Acceleration:'") $ string(Acceleration)) $ "'") @ "bRootMotionFromInterpCurve:'") $ string(bRootMotionFromInterpCurve)) $ "'") @ "RootMotionInterpCurrentTime:'") $ string(RootMotionInterpCurrentTime)) $ "'";
    return Str;
    //return ReturnValue;    
}

defaultproperties
{
    AccelDotThreshold=0.9000000
}