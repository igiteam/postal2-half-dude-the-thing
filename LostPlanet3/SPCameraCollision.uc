class SPCameraCollision extends Object
    editinlinenew;

const ECFO_DEFAULT = 0;
const ECFO_SKIP_FOR_MULTIPLAYER = 1;

enum ECameraFeelerType
{
    ECFT_UNKNOWN,                   // 0
    ECFT_MAIN,                      // 1
    ECFT_HORIZONTAL,                // 2
    ECFT_VERTICAL,                  // 3
    ECFT_CUSTOM,                    // 4
    ECFT_NEAR_CLIP_UPPER_RIGHT,     // 5
    ECFT_NEAR_CLIP_LOWER_RIGHT,     // 6
    ECFT_NEAR_CLIP_LOWER_LEFT,      // 7
    ECFT_NEAR_CLIP_UPPER_LEFT,      // 8
    ECFT_MAX                        // 9
};

enum ESPCameraCollision
{
    SPCC_None,                      // 0
    SPCC_SoftBlock,                 // 1
    SPCC_HardBlock,                 // 2
    SPCC_MAX                        // 3
};

struct native CameraCollisionFeelersStuct
{
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private @NULL AdjustmentRot[65537];
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private float WorldWeight[65537];
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private float PawnWeight[65537];
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private byte Type[65537];
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private @NULL Extent[65537];
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private float AttenuateLength[65537];
    var(__Filter1__Delegate) /*0x01080000-0x00000000*/ private int Flags[65537];

    structdefaultproperties
    {
        AdjustmentRot=(Pitch=0,Yaw=0,Roll=0)
        WorldWeight=1.0000000
        PawnWeight=0.0000000
        Type=ECameraFeelerType.ECFT_MAIN
        Extent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        AttenuateLength=1.0000000
        Flags=0
    }
};

struct native CameraCollisionDataStruct
{
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float CurrDistUnblockedPct[536870913];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float PenetrationExtentScale[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float PenetrationBlendOutTime[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float PenetrationBlendInTime[65537];
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bDisabled;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bDisplayFeelers[536870913];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private editfixedsize array CollisionFeelers[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private bool bSmallObstaclesDontHardBlock[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float SmallObstacleNearSpaceRequirementFactor[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float SmallObstacleNearSpaceRequirementFactorStringent[65537];
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private bool bSmallObstacleUseStringentNearSpaceRequirement[536870913];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float PawnFeelerFarSpaceExtraBlockFactor[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float FeelerInnerPadding[65537];
    var(__Filter1__Delegate) /*0x01070000-0x00000000*/ private float AutoHidePlayerBlockedThreshold[65537];

    structdefaultproperties
    {
        CurrDistUnblockedPct=1.0000000
        PenetrationExtentScale=1.0000000
        PenetrationBlendOutTime=0.1000000
        PenetrationBlendInTime=0.1000000
        bDisabled=false
        bDisplayFeelers=false
        CollisionFeelers=none
        bSmallObstaclesDontHardBlock=false
        SmallObstacleNearSpaceRequirementFactor=0.1800000
        SmallObstacleNearSpaceRequirementFactorStringent=0.2700000
        bSmallObstacleUseStringentNearSpaceRequirement=false
        PawnFeelerFarSpaceExtraBlockFactor=0.1000000
        FeelerInnerPadding=0.0000000
        AutoHidePlayerBlockedThreshold=-1.0000000
    }
};

struct native NearestColliderStruct
{
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL ToNearestPoint;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL SurfaceNormal;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FoundActor;

    structdefaultproperties
    {
        ToNearestPoint=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        SurfaceNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        FoundActor=none
    }
};

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private editfixedsize @NULL Data;

// Export USPCameraCollision::execPreventCameraPenetration(FFrame&, void* const)
native function PreventCameraPenetration()
{
    local /*0x043A0000-0x00000000*/ private @NULL ViewTarget[8388609], StartLoc, DesiredLoc;
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL CamForward[8388609], CamUp, CamRight;
    local /*0x043A0000-0x00000000*/ private float HorizontalFOV[8388609], AspectRatio;
    local /*0x043A0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export USPCameraCollision::execGetDebugColorFromFeelerType(FFrame&, void* const)
native static final simulated function GetDebugColorFromFeelerType()
{
    local /*0x043A0000-0x00000000*/ private byte FeelerType[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPCameraCollision::execQueryNearestColliders(FFrame&, void* const)
native static final simulated function QueryNearestColliders()
{
    local /*0x043A0000-0x00000000*/ private @NULL Pt[8388609];
    local /*0x043A0000-0x00000000*/ private float Extent[8388609];
    local /*0x043A0000-0x00000000*/ private editfixedsize array Results[25165825];
    local /*0x043A0000-0x00000000*/ private bool bIncludePawns[9437185];

    false                        
}

function Reset()
{
    Data.CurrDistUnblockedPct = 1.0000000;
    //return;    
}

static simulated function GetVTCollisionLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL VTActor[8388609], VTLocation, CameraLocation, ReturnValue;
    local /*0x043A0000-0x00000000*/ private float Dist;
    local /*0x043A0000-0x00000000*/ private @NULL Delta;

    Delta = CameraLocation - VTLocation;
    Dist = FMin(VSize(Delta), ((VTActor.CollisionComponent != none) ? VTActor.CollisionComponent.Bounds.SphereRadius * 0.2500000 : 25.0000000));
    return VTLocation + (Normal(Delta) * Dist);
    //return ReturnValue;    
}

static simulated function FindNearestObstacle()
{
    local /*0x043A0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x043A0000-0x00000000*/ private float Radius[8388609];
    local /*0x043A0000-0x00000000*/ private bool bIncludePawns[9437185];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x043A0000-0x00000000*/ private editfixedsize array Query;
    local /*0x043A0000-0x00000000*/ private @NULL Dir, toobstacles;
    local /*0x043A0000-0x00000000*/ private float avsize, mindistsq;
    local /*0x043A0000-0x00000000*/ private int I;

    false
    Class'SPCameraCollision'.static.QueryNearestColliders(Loc, Radius, Query, bIncludePawns);
    mindistsq = 1000000000.0000000;
    I = 0;
    J0x63:

    // End:0x124 [Loop If]
    if(I < Query.Length)
    {
        Dir = Query[I].ToNearestPoint;
        avsize = VSizeSq(Dir);
        // End:0xF2
        if(avsize > 0.0000000)
        {
            toobstacles += (Dir / avsize);
        }
        mindistsq = float(Min(int(mindistsq), int(avsize)));
        ++I;
        // [Loop Continue]
        goto J0x63;
    }
    avsize = VSize(toobstacles);
    // End:0x16D
    if(avsize > 0.0000000)
    {
        toobstacles *= (Sqrt(mindistsq) / avsize);
    }
    return toobstacles;
    //return ReturnValue;    
}

defaultproperties
{
    Data=(CurrDistUnblockedPct=1.0000000,PenetrationExtentScale=1.0000000,PenetrationBlendOutTime=0.1000000,PenetrationBlendInTime=0.1000000,bDisabled=false,bDisplayFeelers=false,CollisionFeelers=none,bSmallObstaclesDontHardBlock=false,SmallObstacleNearSpaceRequirementFactor=0.1800000,SmallObstacleNearSpaceRequirementFactorStringent=0.2700000,bSmallObstacleUseStringentNearSpaceRequirement=false,PawnFeelerFarSpaceExtraBlockFactor=0.1000000,FeelerInnerPadding=0.0000000,AutoHidePlayerBlockedThreshold=-1.0000000)
}