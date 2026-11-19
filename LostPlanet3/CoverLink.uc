class CoverLink extends NavigationPoint
    config(Game)
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force)
    classgroup(Cover);

const COVERLINK_ExposureDot = 0.4f;
const COVERLINK_EdgeCheckDot = 0.25f;
const COVERLINK_EdgeExposureDot = 0.85f;
const COVERLINK_DangerDist = 1536.f;

enum ECoverAction
{
    CA_Default,                     // 0
    CA_BlindLeft,                   // 1
    CA_BlindRight,                  // 2
    CA_LeanLeft,                    // 3
    CA_LeanRight,                   // 4
    CA_PopUp,                       // 5
    CA_BlindUp,                     // 6
    CA_PeekLeft,                    // 7
    CA_PeekRight,                   // 8
    CA_PeekUp,                      // 9
    CA_MAX                          // 10
};

enum ECoverDirection
{
    CD_Default,                     // 0
    CD_Left,                        // 1
    CD_Right,                       // 2
    CD_Up,                          // 3
    CD_MAX                          // 4
};

enum ECoverType
{
    CT_None,                        // 0
    CT_Standing,                    // 1
    CT_MidLevel,                    // 2
    CT_Ledge,                       // 3
    CT_MAX                          // 4
};

enum ECoverLocationDescription
{
    CoverDesc_None,                 // 0
    CoverDesc_InWindow,             // 1
    CoverDesc_InDoorway,            // 2
    CoverDesc_BehindCar,            // 3
    CoverDesc_BehindTruck,          // 4
    CoverDesc_OnTruck,              // 5
    CoverDesc_BehindBarrier,        // 6
    CoverDesc_BehindColumn,         // 7
    CoverDesc_BehindCrate,          // 8
    CoverDesc_BehindWall,           // 9
    CoverDesc_BehindStatue,         // 10
    CoverDesc_BehindSandbags,       // 11
    CoverDesc_MAX                   // 12
};

enum EFireLinkID
{
    FLI_FireLink,                   // 0
    FLI_RejectedFireLink,           // 1
    FLI_MAX                         // 2
};

struct native atomicwhencooked immutablewhencooked CoverReference extends ActorReference
{
    var(*) /*0x14B90000-0x00000000*/ private int SlotIdx[65537];
};

struct native atomicwhencooked immutablewhencooked CoverInfo
{
    var(*) /*0x14AE0000-0x00000000*/ private const @NULL Link[65537];
    var(*) /*0x14AE0000-0x00000000*/ private const int SlotIdx[65537];

    structdefaultproperties
    {
        Link=none
        SlotIdx=0
    }
};

struct native atomicwhencooked immutablewhencooked CovPosInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Link;
    var(*) /*0x35EA0000-0x00000000*/ private int LtSlotIdx;
    var(*) /*0x35EA0000-0x00000000*/ private int RtSlotIdx;
    var(*) /*0x35EA0000-0x00000000*/ private float LtToRtPct;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Normal;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Tangent;

    structdefaultproperties
    {
        Link=none
        LtSlotIdx=-1
        RtSlotIdx=-1
        LtToRtPct=0.0000000
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Normal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Tangent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native atomicwhencooked immutablewhencooked FireLinkItem
{
    var(*) /*0x35EA0000-0x00000000*/ private byte SrcType;
    var(*) /*0x35EA0000-0x00000000*/ private byte SrcAction;
    var(*) /*0x35EA0000-0x00000000*/ private byte DestType;
    var(*) /*0x35EA0000-0x00000000*/ private byte DestAction;

    structdefaultproperties
    {
        SrcType=ECoverType.CT_None
        SrcAction=ECoverAction.CA_Default
        DestType=ECoverType.CT_None
        DestAction=ECoverAction.CA_Default
    }
};

struct native atomicwhencooked immutablewhencooked FireLink
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Interactions;
    var(*) /*0x35EA0000-0x00000000*/ private int PackedProperties_CoverPairRefAndDynamicInfo[131073];
    var(*) /*0x35EA0000-0x00000000*/ private bool bFallbackLink;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDynamicIndexInited;

    structdefaultproperties
    {
        Interactions=none
        PackedProperties_CoverPairRefAndDynamicInfo=0
        bFallbackLink=false
        bDynamicIndexInited=false
    }
};

struct native atomicwhencooked immutablewhencooked DynamicLinkInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LastTargetLocation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LastSrcLocation;

    structdefaultproperties
    {
        LastTargetLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LastSrcLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native atomicwhencooked immutablewhencooked ExposedLink
{
    var(*) /*0x21E30000-0x00000000*/ private const @NULL TargetActor[196609];
    var(*) /*0x21E30000-0x00000000*/ private byte ExposedScale[65537];

    structdefaultproperties
    {
        TargetActor=none
        ExposedScale=0
    }
};

struct native atomicwhencooked immutablewhencooked SlotMoveRef
{
    var(*) /*0x47D10000-0x00000000*/ private @NULL Poly[65537];
    var(*) /*0x47D10000-0x00000000*/ private @NULL Dest[65537];
    var(*) /*0x47D10000-0x00000000*/ private int Direction[65537];

    structdefaultproperties
    {
        Poly=none
        Dest=(Base=none,Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),CachedBaseLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),CachedBaseRotation=(Pitch=0,Yaw=0,Roll=0),CachedTransPosition=(X=0.0000000,Y=0.0000000,Z=0.0000000))
        Direction=0
    }
};

struct native atomicwhencooked immutablewhencooked CoverSlot
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SlotOwner;
    var(*) /*0x35EA0000-0x00000000*/ private float SlotValidAfterTime[536870913];
    var(*) /*0x14BF0000-0x00000000*/ private byte ForceCoverType[65537];
    var(*) /*0x03E20000-0x00000000*/ private const byte CoverType[65537];
    var(*) /*0x14BF0000-0x00000000*/ private byte LocationDescription[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LocationOffset;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RotationOffset;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Actions;
    var(*) /*0x14BF0000-0x00000000*/ private const editfixedsize array FireLinks[65537];
    var(*) /*0x14BF0000-0x00000000*/ private const editfixedsize array RejectedFireLinks[536936449];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ExposedCoverPackedProperties;
    var(*) /*0x35EA0000-0x00000000*/ private int TurnTargetPackedProperties;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlipRefs;
    var(*) /*0x03E20000-0x00000000*/ private const editfixedsize array OverlapClaimsList[65537];
    var(*) /*0x03E20000-0x00000000*/ private bool bLeanLeft[65537];
    var(*) /*0x03E20000-0x00000000*/ private bool bLeanRight[65537];
    var(*) /*0x03E20000-0x00000000*/ private bool bForceCanPopUp[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanPopUp[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanMantle[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanClimbUp[65537];
    var(*) /*0x03E20000-0x00000000*/ private bool bForceCanCoverSlip_Left[65537];
    var(*) /*0x03E20000-0x00000000*/ private bool bForceCanCoverSlip_Right[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanCoverSlip_Left[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanCoverSlip_Right[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanSwatTurn_Left[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanSwatTurn_Right[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanCornerTurn_Left[65537];
    var(*) /*0x03E20000-0x00000000*/ private const bool bCanCornerTurn_Right[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bEnabled[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bAllowPopup[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bAllowMantle[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bDontAllowMantleAI[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bAllowCoverSlip[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bAllowClimbUp[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bAllowSwatTurn[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bAllowCornerTurn[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bForceNoGroundAdjust[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bPlayerOnly[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bPreferLeanOverPopup[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bDestructible[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private bool bSelected[536870913];
    var(*) /*0x14BF0000-0x00000000*/ private const bool bFailedToFindSurface[536936449];
    var(*) /*0x14BF0000-0x00000000*/ private const @NULL SlotMarker[65537];
    var(*) /*0x14BF0000-0x00000000*/ private bool bIsRailing[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int CornerTurnTargetPackedProperties;
    var(*) /*0x14BF0000-0x00000000*/ private const bool bHaveKyClosestVertex[65537];
    var(*) /*0x14BF0000-0x00000000*/ private const @NULL KyClosestVertex[65537];

    structdefaultproperties
    {
        SlotOwner=none
        SlotValidAfterTime=0.0000000
        ForceCoverType=ECoverType.CT_None
        CoverType=ECoverType.CT_None
        LocationDescription=ECoverLocationDescription.CoverDesc_None
        LocationOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RotationOffset=(Pitch=0,Yaw=0,Roll=0)
        Actions=none
        FireLinks=none
        RejectedFireLinks=none
        ExposedCoverPackedProperties=none
        TurnTargetPackedProperties=-1
        SlipRefs=none
        OverlapClaimsList=none
        bLeanLeft=false
        bLeanRight=false
        bForceCanPopUp=false
        bCanPopUp=false
        bCanMantle=true
        bCanClimbUp=false
        bForceCanCoverSlip_Left=false
        bForceCanCoverSlip_Right=false
        bCanCoverSlip_Left=true
        bCanCoverSlip_Right=true
        bCanSwatTurn_Left=true
        bCanSwatTurn_Right=true
        bCanCornerTurn_Left=true
        bCanCornerTurn_Right=true
        bEnabled=true
        bAllowPopup=true
        bAllowMantle=true
        bDontAllowMantleAI=false
        bAllowCoverSlip=true
        bAllowClimbUp=false
        bAllowSwatTurn=true
        bAllowCornerTurn=true
        bForceNoGroundAdjust=false
        bPlayerOnly=false
        bPreferLeanOverPopup=false
        bDestructible=false
        bSelected=false
        bFailedToFindSurface=false
        SlotMarker=none
        bIsRailing=false
        CornerTurnTargetPackedProperties=-1
        bHaveKyClosestVertex=false
        KyClosestVertex=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private input bool GLOBAL_bUseSlotMarkers[1073741825];
var(*) /*0x14AF0000-0x00000000*/ private bool bPreventsCover[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bOnlyMoving[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bDisabled[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bClaimAllSlots[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bAutoSort[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bAutoAdjust[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bCircular[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bLooped[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bPlayerOnly[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDynamicCover;
var(*) /*0x14AF0000-0x00000000*/ private bool bFractureOnTouch[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDebug_FireLinks[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDebug_ExposedLinks[65537];
var(*) /*0x16220000-0x00000000*/ private bool bDebug_CoverGen[65537];
var(*) /*0x14AF0000-0x00000000*/ private bool bDoAutoSlotDensityFixup[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LeanTraceDist;
var(*) /*0x14AF0000-0x00000400*/ private editfixedsize array Slots[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DynamicLinkInfos;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Claims;
var(*) /*0x14AF0000-0x00000000*/ private float InvalidateDistance[65537];
var(*) /*0x14AF0000-0x00000000*/ private float MaxFireLinkDist[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CircularOrigin[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CircularRadius[131073];
var(*) /*0x35EA0000-0x00000000*/ private float AlignDist[131073];
var(*) /*0x35EA0000-0x00000000*/ private float AutoCoverSlotInterval[131073];
var(*) /*0x35EA0000-0x00000000*/ private float StandHeight[131073];
var(*) /*0x35EA0000-0x00000000*/ private float MidHeight[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL StandingLeanOffset[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CrouchLeanOffset[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PopupOffset[131073];
var(*) /*0x35EA0000-0x00000000*/ private float SlipDist[131073];
var(*) /*0x35EA0000-0x00000000*/ private float TurnDist[131073];
var(*) /*0x14AF0000-0x00000000*/ private float DangerScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextCoverLink[131073];
var(*) /*0x14AF0000-0x00000000*/ private byte LocationDescription[196609];

// Export UCoverLink::execGetFireLinkTargetCoverInfo(FFrame&, void* const)
native simulated function GetFireLinkTargetCoverInfo()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609], FireLinkIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL out_Info[25165825];
    local /*0x35EA0000-0x00000000*/ private byte ArrayID[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCoverLink::execPackFireLinkInteractionInfo(FFrame&, void* const)
native static simulated function PackFireLinkInteractionInfo()
{
    local /*0x35EA0000-0x00000000*/ private byte SrcType[8388609], SrcAction, DestType, DestAction, ReturnValue;


}

// Export UCoverLink::execUnPackFireLinkInteractionInfo(FFrame&, void* const)
native static simulated function UnPackFireLinkInteractionInfo()
{
    local /*0x35EA0000-0x00000000*/ private byte PackedByte[8519681], SrcType, SrcAction, DestType, DestAction;


}

// Export UCoverLink::execGetSlotLocation(FFrame&, void* const)
native final simulated function GetSlotLocation()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceUseOffset[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UCoverLink::execGetSlotRotation(FFrame&, void* const)
native final simulated function GetSlotRotation()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceUseOffset[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UCoverLink::execGetSlotViewPoint(FFrame&, void* const)
native simulated function GetSlotViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Type[9437185], Action;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UCoverLink::execIsExposedTo(FFrame&, void* const)
native final simulated function IsExposedTo()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ChkSlot[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_ExposedScale[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

final simulated event SetInvalidUntil()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private float TimeToBecomeValid[8388609];

    Slots[SlotIdx].SlotValidAfterTime = TimeToBecomeValid;
    NotifySlotOwnerCoverDisabled(SlotIdx);
    //return;    
}

final simulated event Claim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewClaim[8388609];
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private float ClaimDistance[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private bool bResult, bDoClaim;
    local /*0x35EA0000-0x00000000*/ private @NULL PC, PreviousOwner;
    local /*0x35EA0000-0x00000000*/ private float ClaimDistanceSq;
    local /*0x35EA0000-0x00000000*/ private @NULL MySlotLocation, OtherSlotLocation;

    0.0000000
    // End:0x1A
    if(SlotIdx < 0)
    {
        return false;
    }
    bDoClaim = true;
    // End:0x125
    if(Slots[SlotIdx].SlotOwner != none)
    {
        bResult = Slots[SlotIdx].SlotOwner == NewClaim;
        bDoClaim = false;
        // End:0x125
        if(!bResult)
        {
            PC = PlayerController(NewClaim.Controller);
            // End:0x125
            if(PC != none)
            {
                PreviousOwner = Slots[SlotIdx].SlotOwner;
                bDoClaim = true;
            }
        }
    }
    // End:0x49C
    if(bDoClaim)
    {
        // End:0x1F9
        if(bClaimAllSlots)
        {
            Idx = 0;
            J0x14A:

            // End:0x1F6 [Loop If]
            if(Idx < Slots.Length)
            {
                // End:0x1E8
                if(Slots[Idx].SlotOwner == none)
                {
                    Claims[Claims.Length] = NewClaim;
                    Slots[Idx].SlotOwner = NewClaim;
                    bResult = true;
                }
                Idx++;
                // [Loop Continue]
                goto J0x14A;
            }            
        }
        else
        {
            // End:0x3B1
            if(ClaimDistance > 0.0000000)
            {
                Claims[Claims.Length] = NewClaim;
                Slots[SlotIdx].SlotOwner = NewClaim;
                bResult = true;
                ClaimDistanceSq = ClaimDistance * ClaimDistance;
                MySlotLocation = GetSlotLocation(SlotIdx);
                Idx = 0;
                J0x2AD:

                // End:0x3AE [Loop If]
                if(Idx < Slots.Length)
                {
                    // End:0x30D
                    if((Idx == SlotIdx) || Slots[Idx].SlotOwner != none)
                    {                        
                    }
                    else
                    {
                        OtherSlotLocation = GetSlotLocation(Idx);
                        // End:0x352
                        if(VSizeSq(OtherSlotLocation - MySlotLocation) > ClaimDistanceSq)
                        {                            
                        }
                        else
                        {
                            Claims[Claims.Length] = NewClaim;
                            Slots[Idx].SlotOwner = NewClaim;
                        }
                    }
                    Idx++;
                    // [Loop Continue]
                    goto J0x2AD;
                }                
            }
            else
            {
                Claims[Claims.Length] = NewClaim;
                Slots[SlotIdx].SlotOwner = NewClaim;
                bResult = true;
            }
        }
        // End:0x49C
        if((PreviousOwner != none) && PreviousOwner.Controller != none)
        {
            PreviousOwner.Controller.NotifyCoverClaimViolation(NewClaim.Controller, self, SlotIdx);
        }
    }
    return bResult;
    //return ReturnValue;    
}

final simulated event UnClaim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldClaim[8388609];
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bUnclaimAll[8388609], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private int Idx, NumReleased;
    local /*0x35EA0000-0x00000000*/ private bool bResult;

    // End:0x22
    if(!bUnclaimAll && SlotIdx < 0)
    {
        return false;
    }
    // End:0xD6
    if(bUnclaimAll)
    {
        Idx = 0;
        J0x3A:

        // End:0xD3 [Loop If]
        if(Idx < Slots.Length)
        {
            // End:0xC5
            if(Slots[Idx].SlotOwner == OldClaim)
            {
                Slots[Idx].SlotOwner = none;
                NumReleased++;
                bResult = true;
            }
            Idx++;
            // [Loop Continue]
            goto J0x3A;
        }        
    }
    else
    {
        // End:0x15A
        if(!bClaimAllSlots && Slots[SlotIdx].SlotOwner == OldClaim)
        {
            Slots[SlotIdx].SlotOwner = none;
            NumReleased++;
            bResult = true;
        }
    }
    J0x15A:

    // End:0x1BE [Loop If]
    if(NumReleased > 0)
    {
        Idx = Claims.Find(OldClaim);        
        // End:0x19B
        if(Idx < 0)
        {
            // [Explicit Break]
            goto J0x1BE;
        }
        Claims.Remove(Idx, 1);        
        NumReleased--;
        // [Loop Continue]
        goto J0x15A;
    }
    J0x1BE:

    return bResult;
    //return ReturnValue;    
}

// Export UCoverLink::execIsValidClaim(FFrame&, void* const)
native final function IsValidClaim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ChkClaim[8388609];
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSkipTeamCheck[9437185], bSkipOverlapCheck, ReturnValue;


}

// Export UCoverLink::execIsValidClaimBetween(FFrame&, void* const)
native final function IsValidClaimBetween()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ChkClaim[8388609];
    local /*0x35EA0000-0x00000000*/ private int StartSlotIdx[8388609], EndSlotIdx;
    local /*0x35EA0000-0x00000000*/ private bool bSkipTeamCheck[9437185], bSkipOverlapCheck, ReturnValue;


}

final simulated function IsStationarySlot()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return !bCircular && IsEdgeSlot(SlotIdx, false);
    //return ReturnValue;    
}

// Export UCoverLink::execFindSlots(FFrame&, void* const)
native final simulated function FindSlots()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CheckLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private float MaxDistance[8388609];
    local /*0x35EA0000-0x00000000*/ private int LeftSlotIdx[25165825], RightSlotIdx;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCoverLink::execIsEdgeSlot(FFrame&, void* const)
native final simulated function IsEdgeSlot()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreLeans[9437185], ReturnValue;


}

// Export UCoverLink::execIsLeftEdgeSlot(FFrame&, void* const)
native final simulated function IsLeftEdgeSlot()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreLeans[8388609], ReturnValue;


}

// Export UCoverLink::execIsRightEdgeSlot(FFrame&, void* const)
native final simulated function IsRightEdgeSlot()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIgnoreLeans[8388609], ReturnValue;


}

// Export UCoverLink::execGetSlotIdxToLeft(FFrame&, void* const)
native final simulated function GetSlotIdxToLeft()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609], Cnt, ReturnValue;

    1                
}

// Export UCoverLink::execGetSlotIdxToRight(FFrame&, void* const)
native final simulated function GetSlotIdxToRight()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609], Cnt, ReturnValue;

    1                
}

final simulated function AllowRightTransition()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int NextSlotIdx;

    NextSlotIdx = GetSlotIdxToRight(SlotIdx);
    // End:0x55
    if(NextSlotIdx >= 0)
    {
        return Slots[NextSlotIdx].bEnabled;
    }
    return false;
    //return ReturnValue;    
}

final simulated function AllowLeftTransition()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int NextSlotIdx;

    NextSlotIdx = GetSlotIdxToLeft(SlotIdx);
    // End:0x55
    if(NextSlotIdx >= 0)
    {
        return Slots[NextSlotIdx].bEnabled;
    }
    return false;
    //return ReturnValue;    
}

// Export UCoverLink::execGetFireLinkTo(FFrame&, void* const)
native function GetFireLinkTo()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ChkCover[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ChkAction[8388609], ChkType;
    local /*0x35EA0000-0x00000000*/ private int out_FireLinkIdx[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Items[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCoverLink::execHasFireLinkTo(FFrame&, void* const)
native function HasFireLinkTo()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ChkCover[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAllowFallbackLinks[9437185], ReturnValue;


}

// Export UCoverLink::execGetSlotActions(FFrame&, void* const)
native final function GetSlotActions()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Actions[25165825];


}

simulated event SetDisabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewDisabled[8388609];
    local /*0x35EA0000-0x00000000*/ private int SlotIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL CoverReplicator;

    bDisabled = bNewDisabled;
    // End:0x67
    if(bDisabled)
    {
        SlotIdx = 0;
        J0x2D:

        // End:0x67 [Loop If]
        if(SlotIdx < Slots.Length)
        {
            NotifySlotOwnerCoverDisabled(SlotIdx);
            SlotIdx++;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    // End:0xE8
    if(int(Role) == int(ROLE_Authority))
    {
        CoverReplicator = WorldInfo.Game.GetCoverReplicator();
        // End:0xE8
        if(CoverReplicator != none)
        {
            CoverReplicator.NotifyLinkDisabledStateChange(self);
        }
    }
    //return;    
}

simulated event SetSlotEnabled()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bEnable[8388609];

    Slots[SlotIdx].bEnabled = bEnable;
    // End:0x55
    if(!bEnable)
    {
        NotifySlotOwnerCoverDisabled(SlotIdx);
    }
    //return;    
}

simulated function NotifySlotOwnerCoverDisabled()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAIOnly[9437185];
    local /*0x35EA0000-0x00000000*/ private int LeftIdx, RightIdx;

    // End:0x129
    if(((Slots[SlotIdx].SlotOwner != none) && Slots[SlotIdx].SlotOwner.Controller != none) && !bAIOnly || PlayerController(Slots[SlotIdx].SlotOwner.Controller) == none)
    {
        Slots[SlotIdx].SlotOwner.Controller.NotifyCoverDisabled(self, SlotIdx, false);
    }
    LeftIdx = GetSlotIdxToLeft(SlotIdx);
    // End:0x280
    if((((LeftIdx >= 0) && Slots[LeftIdx].SlotOwner != none) && Slots[LeftIdx].SlotOwner.Controller != none) && !bAIOnly || PlayerController(Slots[LeftIdx].SlotOwner.Controller) == none)
    {
        Slots[LeftIdx].SlotOwner.Controller.NotifyCoverDisabled(self, SlotIdx, true);
    }
    RightIdx = GetSlotIdxToRight(SlotIdx);
    // End:0x3D7
    if((((RightIdx >= 0) && Slots[RightIdx].SlotOwner != none) && Slots[RightIdx].SlotOwner.Controller != none) && !bAIOnly || PlayerController(Slots[RightIdx].SlotOwner.Controller) == none)
    {
        Slots[RightIdx].SlotOwner.Controller.NotifyCoverDisabled(self, SlotIdx, true);
    }
    //return;    
}

simulated event SetSlotPlayerOnly()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInPlayerOnly[8388609];

    Slots[SlotIdx].bPlayerOnly = bInPlayerOnly;
    // End:0x70
    if(Slots[SlotIdx].bPlayerOnly)
    {
        NotifySlotOwnerCoverDisabled(SlotIdx, true);
    }
    //return;    
}

function OnModifyCover()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotIndices;
    local /*0x35EA0000-0x00000000*/ private int Idx, SlotIdx;
    local /*0x35EA0000-0x00000000*/ private @NULL CoverReplicator;

    // End:0x50
    if(Action.Slots.Length > 0)
    {
        SlotIndices = Action.Slots;        
    }
    else
    {
        Idx = 0;
        J0x5B:

        // End:0x9F [Loop If]
        if(Idx < Slots.Length)
        {
            SlotIndices[SlotIndices.Length] = Idx;
            Idx++;
            // [Loop Continue]
            goto J0x5B;
        }
    }
    Idx = 0;
    J0xAA:

    // End:0x473 [Loop If]
    if(Idx < SlotIndices.Length)
    {
        SlotIdx = SlotIndices[Idx];
        // End:0x465
        if((SlotIdx >= 0) && SlotIdx < Slots.Length)
        {
            // End:0x156
            if(Action.InputLinks[0].bHasImpulse)
            {
                SetSlotEnabled(SlotIdx, true);                
            }
            else
            {
                // End:0x1A4
                if(Action.InputLinks[1].bHasImpulse)
                {
                    SetSlotEnabled(SlotIdx, false);                    
                }
                else
                {
                    // End:0x2B8
                    if(Action.InputLinks[2].bHasImpulse)
                    {
                        // End:0x2B5
                        if((AutoAdjustSlot(SlotIdx, false) && Slots[SlotIdx].SlotOwner != none) && Slots[SlotIdx].SlotOwner.Controller != none)
                        {
                            Slots[SlotIdx].SlotOwner.Controller.NotifyCoverAdjusted();
                        }                        
                    }
                    else
                    {
                        // End:0x465
                        if(Action.InputLinks[3].bHasImpulse)
                        {
                            // End:0x41E
                            if(int(Action.ManualCoverType) != int(0))
                            {
                                Slots[SlotIdx].CoverType = Action.ManualCoverType;
                                // End:0x41E
                                if((Slots[SlotIdx].SlotOwner != none) && Slots[SlotIdx].SlotOwner.Controller != none)
                                {
                                    Slots[SlotIdx].SlotOwner.Controller.NotifyCoverAdjusted();
                                }
                            }
                            Slots[SlotIdx].bPlayerOnly = Action.bManualAdjustPlayersOnly;
                        }
                    }
                }
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0xAA;
    }
    CoverReplicator = WorldInfo.Game.GetCoverReplicator();
    // End:0x669
    if(CoverReplicator != none)
    {
        // End:0x523
        if(Action.InputLinks[0].bHasImpulse)
        {
            CoverReplicator.NotifyEnabledSlots(self, SlotIndices);            
        }
        else
        {
            // End:0x586
            if(Action.InputLinks[1].bHasImpulse)
            {
                CoverReplicator.NotifyDisabledSlots(self, SlotIndices);                
            }
            else
            {
                // End:0x5EA
                if(Action.InputLinks[2].bHasImpulse)
                {
                    CoverReplicator.NotifyAutoAdjustSlots(self, SlotIndices);                    
                }
                else
                {
                    // End:0x669
                    if(Action.InputLinks[3].bHasImpulse)
                    {
                        CoverReplicator.NotifySetManualCoverTypeForSlots(self, SlotIndices, Action.ManualCoverType);
                    }
                }
            }
        }
    }
    //return;    
}

// Export UCoverLink::execAutoAdjustSlot(FFrame&, void* const)
native final function AutoAdjustSlot()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bOnlyCheckLeans[8388609], ReturnValue;


}

// Export UCoverLink::execIsEnabled(FFrame&, void* const)
native final function IsEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609], CoverReplicator;
    local /*0x35EA0000-0x00000000*/ private int SlotIdx;

    super.OnToggle(inAction);
    // End:0x59
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bDisabled = false;        
    }
    else
    {
        // End:0x9F
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bDisabled = true;            
        }
        else
        {
            bDisabled = !bDisabled;
        }
    }
    SlotIdx = 0;
    J0xC1:

    // End:0x106 [Loop If]
    if(SlotIdx < Slots.Length)
    {
        SetSlotEnabled(SlotIdx, !bDisabled);
        ++SlotIdx;
        // [Loop Continue]
        goto J0xC1;
    }
    CoverReplicator = WorldInfo.Game.GetCoverReplicator();
    // End:0x173
    if(CoverReplicator != none)
    {
        CoverReplicator.NotifyLinkDisabledStateChange(self);
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    super.CreateCheckpointRecord(Record);
    Record.bDisabled = bDisabled;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897], CoverReplicator;

    super.ApplyCheckpointRecord(Record);
    bDisabled = Record.bDisabled;
    CoverReplicator = WorldInfo.Game.GetCoverReplicator();
    // End:0xA8
    if(CoverReplicator != none)
    {
        CoverReplicator.NotifyLinkDisabledStateChange(self);
    }
    //return;    
}

simulated event ShutDown()
{
    super.ShutDown();
    bDisabled = true;
    //return;    
}

// Export UCoverLink::execGetSwatTurnTarget(FFrame&, void* const)
native simulated function GetSwatTurnTarget()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609], Direction;
    local /*0x35EA0000-0x00000000*/ private @NULL out_Info[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCoverLink::execGetCornerTurnTarget(FFrame&, void* const)
native simulated function GetCornerTurnTarget()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609], Direction;
    local /*0x35EA0000-0x00000000*/ private @NULL out_Info[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCoverLink::execGetFirstSwatTurnTarget(FFrame&, void* const)
native simulated function GetFirstSwatTurnTarget()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_Info[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UCoverLink::execGetFirstCornerTurnTarget(FFrame&, void* const)
native simulated function GetFirstCornerTurnTarget()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL out_Info[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function BreakFracturedMeshes()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Origin[8388609];
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609], RBStrength;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FracActor;
    local /*0x35EA0000-0x00000000*/ private byte bWantPhysChunksAndParticles;

    // End:0x11
    if(!bFractureOnTouch)
    {
        return;
    }
    // End:0x11C
    foreach CollidingActors(Class'FracturedStaticMeshActor', FracActor, Radius, Origin, true)
    {
        // End:0x11B
        if((int(FracActor.Physics) == int(0)) && FracActor.IsFracturedByDamageType(DamageType))
        {
            // End:0x11B
            if(FracActor.FractureEffectIsRelevant(false, Instigator, bWantPhysChunksAndParticles))
            {
                FracActor.BreakOffPartsInRadius(Origin, Radius, RBStrength, ((int(bWantPhysChunksAndParticles) == int(1)) ? true : false));
            }
        }        
    }    
    //return;    
}

// Export UCoverLink::execAddCoverSlot(FFrame&, void* const)
native final function AddCoverSlot()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SlotLocation[8388609], SlotRotation;
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bForceSlotUpdate[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL Scout[9437185];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    -1                                    
}

final simulated event GetDebugString()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (("L:" $ GetRightMost(string(self))) @ "S:") $ string(SlotIdx);
    //return ReturnValue;    
}

// Export UCoverLink::execGetLocationDescription(FFrame&, void* const)
native final simulated function GetLocationDescription()
{
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

simulated event GetDebugAbbrev()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "CL";
    //return ReturnValue;    
}

defaultproperties
{
    bAutoSort=true
    bAutoAdjust=true
    LeanTraceDist=64.0000000
    Slots=/* Array type was not detected. */
    InvalidateDistance=64.0000000
    MaxFireLinkDist=2048.0000000
    AlignDist=36.0000000
    AutoCoverSlotInterval=175.0000000
    StandHeight=160.0000000
    MidHeight=70.0000000
    StandingLeanOffset=(X=0.0000000,Y=78.0000000,Z=69.0000000)
    CrouchLeanOffset=(X=0.0000000,Y=70.0000000,Z=19.0000000)
    PopupOffset=(X=0.0000000,Y=0.0000000,Z=70.0000000)
    SlipDist=60.0000000
    TurnDist=512.0000000
    DangerScale=2.0000000
    bSpecialMove=true
    bDestinationOnly=true
    bBuildLongPaths=false
    // Reference: CylinderComponent'Default__CoverLink.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=CollisionCylinder
    Components[3]=none
    CollisionComponent=CollisionCylinder
}