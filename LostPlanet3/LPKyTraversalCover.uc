class LPKyTraversalCover extends LPKyTraversal within LPAIController
    abstract;

enum EInvalidReason
{
    EIR_None,                       // 0
    EIR_Exposed,                    // 1
    EIR_Claimed,                    // 2
    EIR_GrenadeClose,               // 3
    EIR_SomeoneWantsIt,             // 4
    EIR_TooSmall,                   // 5
    EIR_EnemyTooClose,              // 6
    EIR_GettingDamage,              // 7
    EIR_NegativeRating,             // 8
    EIR_TooFar,                     // 9
    EIR_CanNotFireEnemy,            // 10
    EIR_DamagedNoCA,                // 11
    EIR_MAX                         // 12
};

enum ERatingFactor
{
    ERF_None,                       // 0
    ERF_DistanceToMe,               // 1
    ERF_DistanceToEnemy,            // 2
    ERF_CanFireEnemy,               // 3
    ERF_GettingDamage,              // 4
    ERF_UsedTooLong,                // 5
    ERF_Exposed,                    // 6
    ERF_GrenadeClose,               // 7
    ERF_SomeoneWantsIt,             // 8
    ERF_DamagedNoCA,                // 9
    ERF_Flank,                      // 10
    ERF_MAX                         // 11
};

struct native CoverEvalInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Cover;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rating;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte InvalidReason;
    var(0.25_Pct_1166278655) /*0x97E50000-0x00000000*/ private float RatingFactors[11];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Location;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireLink;

    structdefaultproperties
    {
        Cover=none
        Rating=-1.0000000
        InvalidReason=EInvalidReason.EIR_None
        RatingFactors[0]=0.0000000
        RatingFactors[1]=0.0000000
        RatingFactors[2]=0.0000000
        RatingFactors[3]=0.0000000
        RatingFactors[4]=0.0000000
        RatingFactors[5]=0.0000000
        RatingFactors[6]=0.0000000
        RatingFactors[7]=0.0000000
        RatingFactors[8]=0.0000000
        RatingFactors[9]=0.0000000
        RatingFactors[10]=0.0000000
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        FireLink=none
    }
};

struct native CoverRatingFactor
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte RatingFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string strBrief;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string strDescription;

    structdefaultproperties
    {
        RatingFactor=ERatingFactor.ERF_None
        strBrief=""
        strDescription=""
    }
};

struct native CoverInvalidReason
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte InvalidReason;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string strBrief;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string strDescription;

    structdefaultproperties
    {
        InvalidReason=EInvalidReason.EIR_None
        strBrief=""
        strDescription=""
    }
};

struct native CoverRatingOnTime
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Cover;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rating;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte RatingFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStamp;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTime;

    structdefaultproperties
    {
        Cover=none
        Rating=0.0000000
        RatingFactor=ERatingFactor.ERF_None
        TimeStamp=0.0000000
        MaxTime=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Covers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CoverRatingsOnTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DebugTextOffset;
var(0.25_Pct_1179713535) /*0x97E50000-0x00000000*/ private editfixedsize @NULL InvalidReasons[12];
var(0.25_Pct_1166278655) /*0x97E50000-0x00000000*/ private editfixedsize @NULL RatingFactors[11];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceChangeStartPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMultiMapCacheDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStayAlwaysInCover;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLookingForOpenPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpenPositionFound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstLookForOpenPositionFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLookingForCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastStartPointUpdatedMultimap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VextexToCovers[268566529];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ActualCoverList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendZones;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendCovers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefendNodeFallback;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GoodOpenPosition[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointStartedTraversal[536870913];

// Export ULPKyTraversalCover::execInternalProcessVertex(FFrame&, void* const)
private native final function InternalProcessVertex()
{
    local /*0x97E50000-0x00000000*/ private @NULL VertexInfo[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPKyTraversalCover::execInternalTraversalStarted(FFrame&, void* const)
private native final function InternalTraversalStarted();

// Export ULPKyTraversalCover::execIsValidCandidateCover(FFrame&, void* const)
native function IsValidCandidateCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCover[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Cleanup()
{
    ReleaseDefendNode();
    //return;    
}

protected event TraversalStrated()
{
    local /*0x97E50000-0x00000000*/ private int I;

    Covers.Remove(0, Covers.Length);    
    I = CoverRatingsOnTime.Length - 1;
    J0x2D:

    // End:0xE8 [Loop If]
    if(I >= 0)
    {
        // End:0xDA
        if((Outer.WorldInfo.TimeSeconds - CoverRatingsOnTime[I].TimeStamp) > CoverRatingsOnTime[I].MaxTime)
        {
            CoverRatingsOnTime.Remove(I, 1);                        
        }
        --I;
        // [Loop Continue]
        goto J0x2D;
    }
    bLookingForCover = Outer.AICanUseCover();
    InternalTraversalStarted();
    super.TraversalStrated();
    //return;    
}

protected function HasFoundValidCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x63 [Loop If]
    if(Idx < Covers.Length)
    {
        // End:0x55
        if(Covers[Idx].Rating > 0.0000000)
        {
            return true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

protected event TraversalFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone, CoverSlotMarker;
    local /*0x97E50000-0x00000000*/ private bool bAddedValidCover;

    // End:0x22F
    if((Outer.AICanUseCover() && HasDefendZones()) && !HasFoundValidCover())
    {
        // End:0x15D
        foreach DefendZones(DefendZone)
        {
            // End:0x14B
            foreach DefendZone.DefendCoverSlots(CoverSlotMarker)
            {
                // End:0xA1
                if(!IsValidCandidateCover(CoverSlotMarker))
                {
                    continue;                    
                }
                else
                {
                    // End:0x14A
                    if(Covers.Find('Cover', CoverSlotMarker.OwningSlot) == )
                    {                        
                        ProcessCoverSlot(CoverSlotMarker.OwningSlot);
                        // End:0x14A
                        if(Covers[Covers.Length - 1].Rating > 0.0000000)
                        {
                            bAddedValidCover = true;
                            // [Explicit Continue]
                            goto J0x14B;
                        }
                    }                    
                }
            }
            J0x14B:
            
            // End:0x15C
            if(bAddedValidCover)
            {                
            }
            else
            {                
            }
        }        
        // End:0x22F
        if(!bAddedValidCover)
        {
            // End:0x22E
            foreach DefendCovers(CoverSlotMarker)
            {
                // End:0x22D
                if(Covers.Find('Cover', CoverSlotMarker.OwningSlot) == )
                {                    
                    ProcessCoverSlot(CoverSlotMarker.OwningSlot);
                    // End:0x22D
                    if(Covers[Covers.Length - 1].Rating > 0.0000000)
                    {
                        bAddedValidCover = true;
                        // [Explicit Continue]
                        goto J0x22E;
                    }
                }                
            }
            J0x22E:
            
        }
    }
    // End:0x248
    if(bLookingForOpenPosition)
    {
        bFirstLookForOpenPositionFinished = true;
    }
    // End:0x276
    if(!bLookingForOpenPosition && !HasFoundValidCover())
    {
        SetLookForOpenPosition(true);        
    }
    else
    {
        // End:0x29D
        if(bLookingForOpenPosition && HasFoundValidCover())
        {
            SetLookForOpenPosition(false);
        }
    }
    super.TraversalFinished();
    //return;    
}

event SetLookForOpenPosition()
{
    local /*0x97E50000-0x00000000*/ private bool InLookForOpenPosition[8388609];

    // End:0x47
    if(InLookForOpenPosition != bLookingForOpenPosition)
    {
        bLookingForOpenPosition = InLookForOpenPosition;
        // End:0x47
        if(bLookingForOpenPosition)
        {
            bFirstLookForOpenPositionFinished = false;
        }
    }
    //return;    
}

function IsLookingForOpenPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bLookingForOpenPosition;
    //return ReturnValue;    
}

function IsLookingForCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bLookingForCover;
    //return ReturnValue;    
}

function SetLookForCover()
{
    local /*0x97E50000-0x00000000*/ private bool bLookForCover[8388609];

    bLookingForCover = bLookForCover;
    //return;    
}

function ReleaseDefendNode()
{
    // End:0x39
    if(DefendNodeFallback != none)
    {
        DefendNodeFallback.ClearAccess();
        DefendNodeFallback = none;
    }
    //return;    
}

function FindBestDefendNode()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DefendZone;

    // End:0x19
    if(DefendNodeFallback != none)
    {
        return DefendNodeFallback;
    }
    // End:0xC1
    if(DefendZones.Length > 0)
    {
        // End:0xC0
        foreach DefendZones(DefendZone)
        {
            DefendNodeFallback = DefendZone.GetBestAttackNode(Outer.myAIPawn, Outer.MainEnemy);
            // End:0xBF
            if(DefendNodeFallback != none)
            {                
                return DefendNodeFallback;
            }            
        }        
    }
    // End:0x1C2
    if(DefendNodes.Length > 0)
    {
        DefendNodeFallback = Class'LPDefendVolume'.static.GetDefendNodeForTarget(Outer.myAIPawn, DefendNodes, Outer.MainEnemy);
        // End:0x158
        if(DefendNodeFallback != none)
        {
            return DefendNodeFallback;
        }
        DefendNodeFallback = Class'LPDefendVolume'.static.GetDefendNode(Outer.myAIPawn, DefendNodes, none);
        // End:0x1C2
        if(DefendNodeFallback != none)
        {
            return DefendNodeFallback;
        }
    }
    return none;
    //return ReturnValue;    
}

protected event TraversalAborted()
{
    super.TraversalAborted();
    //return;    
}

protected event ProcessVertex()
{
    local /*0x97E50000-0x00000000*/ private @NULL VertexInfo[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return InternalProcessVertex(VertexInfo);
    //return ReturnValue;    
}

protected event ProcessCoverSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoverSlot[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

protected event ProcessOpenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DirectionFromEnemy;

    // End:0x6D
    if(VSize2D(FromLocation - PointStartedTraversal) < Outer.myAIPawn.TuneDataAIPawn.MinDistanceLosPositionFromMe)
    {
        return true;
    }
    // End:0x102
    if(Outer.SeperationToPawnFromLoc2D(Outer.MainEnemy, FromLocation) < Outer.myAIPawn.TuneDataAIPawn.MinDistanceLosPositionFromEnemy)
    {
        return true;
    }
    // End:0x12B
    if((HasDefendZones()) && !IsInDefendZone(FromLocation))
    {
        return true;
    }
    // End:0x1F9
    if((Outer.MyLPSquad != none) && Outer.MyLPSquad.IsTooCloseToTeammates(Outer.myAIPawn, FromLocation, Outer.myAIPawn.TuneDataAIPawn.MinDistanceLosPositionFromTeammates))
    {
        return true;
    }
    DirectionFromEnemy = Normal(Outer.myAIPawn.Location - Outer.MainEnemy.Location);
    // End:0x290
    if(!CheckLineOfSightForOpenPosition(FromLocation, DirectionFromEnemy))
    {
        return true;
    }
    // End:0x2D2
    if(Outer.myAIPawn.IsGrenadeClose(FromLocation))
    {
        return true;
    }
    bOpenPositionFound = true;
    GoodOpenPosition = FromLocation;
    return false;
    //return ReturnValue;    
}

function CheckLineOfSightForOpenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], DirectionFromEnemy;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.AIHaveLineOfFire(Outer.MainEnemy, FromLocation, false,, true);
    //return ReturnValue;    
}

function IsValidCurrentCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 12;
    //return ReturnValue;    
}

function GetCovers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutCovers[25165825];
    local /*0x97E50000-0x00000000*/ private int I;

    OutCovers.Length = 0;
    I = 0;
    J0x17:

    // End:0x5D [Loop If]
    if(I < Covers.Length)
    {
        OutCovers.AddItem(Covers[I]);        
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

event HasDefendZones()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((DefendZones.Length > 0) || DefendCovers.Length > 0) || DefendNodes.Length > 0;
    //return ReturnValue;    
}

function IsInDefendZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPosition[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone;

    // End:0x12
    if(DefendZones.Length <= 0)
    {
        return true;
    }
    // End:0x58
    foreach DefendZones(DefendZone)
    {
        // End:0x57
        if(DefendZone.EncompassesPoint(InPosition))
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

event GetCoversInDefendZone()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutCovers[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone, DefendCover;

    // End:0x78
    foreach DefendZones(DefendZone)
    {
        // End:0x76
        foreach DefendZone.DefendCoverSlots(DefendCover)
        {
            // End:0x5F
            if(!IsValidCandidateCover(DefendCover))
            {
                continue;                
            }
            else
            {
                OutCovers.AddItem(DefendCover);                                
            }
        }                
    }    
    // End:0xB6
    foreach DefendCovers(DefendCover)
    {
        // End:0xB5
        if(DefendCover != none)
        {
            OutCovers.AddItem(DefendCover);            
        }        
    }    
    //return;    
}

function InDefendZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone, SlotMarker, DefendCover;

    SlotMarker = Cover.Link.Slots[Cover.SlotIdx].SlotMarker;
    // End:0xBB
    foreach DefendZones(DefendZone)
    {
        // End:0xBA
        if(DefendZone.DefendCoverSlots.Find(SlotMarker) != )
        {                        
            return true;
        }        
    }    
    // End:0xEE
    foreach DefendCovers(DefendCover)
    {
        // End:0xED
        if(DefendCover == SlotMarker)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function AddDefendZones()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InDefendZones[8388609], InDefendCovers, InDefendNodes;
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone, DefendCoverLink, DefendCoverSlot, DefendNode;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x5E
    foreach InDefendZones(DefendZone)
    {
        // End:0x3B
        if(DefendZones.Find(DefendZone) != )
        {            
            continue;            
        }
        else
        {
            DefendZones.AddItem(DefendZone);            
            bMultiMapCacheDirty = true;            
        }
    }    
    // End:0x16B
    foreach InDefendCovers(DefendCoverLink)
    {
        I = 0;
        J0x81:

        // End:0x16A [Loop If]
        if(I < DefendCoverLink.Slots.Length)
        {
            DefendCoverSlot = SPGFCoverSlotMarker(DefendCoverLink.Slots[I].SlotMarker);
            // End:0x11F
            if(DefendCovers.Find(DefendCoverSlot) != )
            {                                
            }
            else
            {
                // End:0x13A
                if(!IsValidCandidateCover(DefendCoverSlot))
                {                    
                }
                else
                {
                    DefendCovers.AddItem(DefendCoverSlot);                    
                    bMultiMapCacheDirty = true;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x81;
        }        
    }    
    // End:0x1CA
    foreach InDefendNodes(DefendNode)
    {
        // End:0x1A7
        if(DefendNodes.Find(DefendNode) != )
        {            
            continue;            
        }
        else
        {
            DefendNodes.AddItem(DefendNode);            
            bMultiMapCacheDirty = true;            
        }
    }    
    //return;    
}

function RemoveDefendZones()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InDefendZones[8388609], InDefendCovers, InDefendNodes;
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone, DefendCoverLink, DefendCoverSlot, DefendNode;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x3A
    foreach InDefendZones(DefendZone)
    {
        DefendZones.RemoveItem(DefendZone);        
        bMultiMapCacheDirty = true;        
    }    
    // End:0x100
    foreach InDefendCovers(DefendCoverLink)
    {
        I = 0;
        J0x5D:

        // End:0xFF [Loop If]
        if(I < DefendCoverLink.Slots.Length)
        {
            DefendCoverSlot = DefendCoverLink.Slots[I].SlotMarker;
            DefendCovers.RemoveItem(DefendCoverSlot);            
            bMultiMapCacheDirty = true;
            ++I;
            // [Loop Continue]
            goto J0x5D;
        }        
    }    
    // End:0x13B
    foreach InDefendNodes(DefendNode)
    {
        DefendNodes.RemoveItem(DefendNode);        
        bMultiMapCacheDirty = true;        
    }    
    //return;    
}

function ClearDefendZones()
{
    DefendZones.Remove(0, DefendZones.Length);    
    DefendCovers.Remove(0, DefendCovers.Length);    
    DefendNodes.Remove(0, DefendNodes.Length);    
    bMultiMapCacheDirty = true;
    //return;    
}

function AddDefendCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCover[8388609], DefendCoverSlot;

    DefendCoverSlot = SPGFCoverSlotMarker(InCover.Link.Slots[InCover.SlotIdx].SlotMarker);
    // End:0x96
    if(DefendCovers.Find(DefendCoverSlot) != )
    {        
        return;
    }
    DefendCovers.AddItem(DefendCoverSlot);    
    bMultiMapCacheDirty = true;
    //return;    
}

protected function GetCoverIdx()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return Covers.Find('Cover', Cover);    
    //return ReturnValue;    
}

protected function SetInvalidReason()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private byte InvalidReason[8388609];

    // End:0x76
    if((Idx != -1) && int(Covers[Idx].InvalidReason) == int(0))
    {
        Covers[Idx].InvalidReason = InvalidReason;
    }
    //return;    
}

protected function SetRatingFactor()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private byte RatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private float Rating[8388609];

    // End:0x4F
    if(Idx != -1)
    {
        Covers[Idx].RatingFactors[int(RatingFactor)] = Rating;
    }
    //return;    
}

protected function GetRatingFactor()
{
    local /*0x97E50000-0x00000000*/ private int Idx[8388609];
    local /*0x97E50000-0x00000000*/ private byte RatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Rating;

    Rating = 0.0000000;
    // End:0x5E
    if(Idx != -1)
    {
        Rating = Covers[Idx].RatingFactors[int(RatingFactor)];
    }
    return Rating;
    //return ReturnValue;    
}

function HasRatingOverTime()
{
    local /*0x97E50000-0x00000000*/ private byte InRatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = CoverRatingsOnTime.Length - 1;
    J0x17:

    // End:0x6E [Loop If]
    if(I >= 0)
    {
        // End:0x60
        if(int(CoverRatingsOnTime[I].RatingFactor) == int(InRatingFactor))
        {
            return true;
        }
        --I;
        // [Loop Continue]
        goto J0x17;
    }
    //return ReturnValue;    
}

function ClearRatingOverTime()
{
    local /*0x97E50000-0x00000000*/ private byte InRatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = CoverRatingsOnTime.Length - 1;
    J0x17:

    // End:0x81 [Loop If]
    if(I >= 0)
    {
        // End:0x73
        if(int(CoverRatingsOnTime[I].RatingFactor) == int(InRatingFactor))
        {
            CoverRatingsOnTime.Remove(I, 1);            
        }
        --I;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function SetRatingOverTime()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCover[25296897];
    local /*0x97E50000-0x00000000*/ private byte RatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private float Rating[8388609], InOverTime, SpreadDistance;
    local /*0x97E50000-0x00000000*/ private @NULL RatingOnTime, OtherCover;
    local /*0x97E50000-0x00000000*/ private int OnTimeIdx, SlotIdx;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private float SpreadDistanceSq;
    local /*0x97E50000-0x00000000*/ private @NULL ThisCoverLocation, OtherCoverLocation;

    300.0000000
    // End:0x4F5
    if(InCover.Link != none)
    {
        bFound = false;
        OnTimeIdx = 0;
        J0x42:

        // End:0xEC [Loop If]
        if(OnTimeIdx < CoverRatingsOnTime.Length)
        {
            // End:0xDE
            if(CoverRatingsOnTime[OnTimeIdx].Cover == InCover && int(CoverRatingsOnTime[OnTimeIdx].RatingFactor) == int(RatingFactor))
            {
                bFound = true;
                // [Explicit Break]
                goto J0xEC;
            }
            ++OnTimeIdx;
            // [Loop Continue]
            goto J0x42;
        }
        J0xEC:

        // End:0x1FC
        if(!bFound)
        {
            RatingOnTime.Cover = InCover;
            RatingOnTime.Rating = Rating;
            RatingOnTime.RatingFactor = RatingFactor;
            RatingOnTime.TimeStamp = Outer.WorldInfo.TimeSeconds;
            RatingOnTime.MaxTime = InOverTime;
            CoverRatingsOnTime.AddItem(RatingOnTime);                        
        }
        else
        {
            CoverRatingsOnTime[OnTimeIdx].Rating = Rating;
            CoverRatingsOnTime[OnTimeIdx].RatingFactor = RatingFactor;
            CoverRatingsOnTime[OnTimeIdx].TimeStamp = Outer.WorldInfo.TimeSeconds;
            CoverRatingsOnTime[OnTimeIdx].MaxTime = InOverTime;
        }
        // End:0x4F5
        if(SpreadDistance > 0.0000000)
        {
            SpreadDistanceSq = SpreadDistance * SpreadDistance;
            ThisCoverLocation = InCover.Link.GetSlotLocation(InCover.SlotIdx);
            SlotIdx = 0;
            J0x37B:

            // End:0x4F5 [Loop If]
            if(SlotIdx < InCover.Link.Slots.Length)
            {
                // End:0x3E8
                if(SlotIdx == InCover.SlotIdx)
                {                    
                }
                else
                {
                    OtherCoverLocation = InCover.Link.GetSlotLocation(SlotIdx);
                    // End:0x455
                    if(VSizeSq(ThisCoverLocation - OtherCoverLocation) > SpreadDistanceSq)
                    {                        
                    }
                    else
                    {
                        OtherCover.Link = InCover.Link;
                        OtherCover.SlotIdx = SlotIdx;
                        SetRatingOverTime(OtherCover, RatingFactor, Rating, InOverTime, 0.0000000);
                    }
                }
                ++SlotIdx;
                // [Loop Continue]
                goto J0x37B;
            }
        }
    }
    //return;    
}

function GetInvalidReasonDescription()
{
    local /*0x97E50000-0x00000000*/ private byte InInvalidReason[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x2D
    if((int(InInvalidReason) <= int(0)) || int(InInvalidReason) >= int(12))
    {
        return "";
    }
    return InvalidReasons[int(InInvalidReason)].strDescription;
    //return ReturnValue;    
}

function GetRatingFactorDescription()
{
    local /*0x97E50000-0x00000000*/ private byte InRatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x2D
    if((int(InRatingFactor) <= int(0)) || int(InRatingFactor) >= int(11))
    {
        return "";
    }
    return RatingFactors[int(InRatingFactor)].strDescription;
    //return ReturnValue;    
}

function DrawFlagMeaning()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609], DebugModeAI, CanvasLeft;
    local /*0x97E50000-0x00000000*/ private int Idx, CurrentInvalidReasons, CurrentRatingFactors;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentCover;
    local /*0x97E50000-0x00000000*/ private bool bInvalidReason, bRatingFactor;

    DebugModeAI = LPDebugModeAI(InHUD.GetDebugModeManager().GetDebugMode());
    CanvasLeft = DebugModeAI.GetDebugCanvas().GetCanvasArea(1);
    bInvalidReason = false;
    bRatingFactor = false;
    // End:0x193
    foreach Covers(CurrentCover)
    {
        // End:0x118
        if(int(CurrentCover.InvalidReason) != int(0))
        {
            CurrentInvalidReasons[int(CurrentCover.InvalidReason)] = 1;
            bInvalidReason = true;            
        }
        else
        {
            Idx = 0;
            J0x123:

            // End:0x192 [Loop If]
            if(Idx < int(11))
            {
                // End:0x184
                if(CurrentCover.RatingFactors[Idx] != float(0))
                {
                    CurrentRatingFactors[Idx] = 1;
                    bRatingFactor = true;
                }
                Idx++;
                // [Loop Continue]
                goto J0x123;
            }
        }        
    }    
    // End:0x2AA
    if(bInvalidReason)
    {
        CanvasLeft.Draw2DTextLn("Invalid Node Reasons",, CanvasLeft.BlueColor);
        Idx = 0;
        J0x205:

        // End:0x2AA [Loop If]
        if(Idx < int(12))
        {
            // End:0x29C
            if(CurrentInvalidReasons[Idx] == 1)
            {
                CanvasLeft.DrawProperty(InvalidReasons[Idx].strBrief, InvalidReasons[Idx].strDescription);
            }
            ++Idx;
            // [Loop Continue]
            goto J0x205;
        }
    }
    // End:0x3BA
    if(bRatingFactor)
    {
        CanvasLeft.Draw2DTextLn("Rating Factors",, CanvasLeft.BlueColor);
        Idx = 0;
        J0x315:

        // End:0x3BA [Loop If]
        if(Idx < int(11))
        {
            // End:0x3AC
            if(CurrentRatingFactors[Idx] == 1)
            {
                CanvasLeft.DrawProperty(RatingFactors[Idx].strBrief, RatingFactors[Idx].strDescription);
            }
            ++Idx;
            // [Loop Continue]
            goto J0x315;
        }
    }
    //return;    
}

function DrawDefendZones()
{
    local /*0x97E50000-0x00000000*/ private bool bDraw[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DefendZone;

    // End:0xD2
    foreach DefendZones(DefendZone)
    {
        // End:0x7C
        if(bDraw)
        {
            DefendZone.SetHidden(false);
            DefendZone.BrushComponent.SetHidden(false);            
        }
        else
        {
            DefendZone.SetHidden(true);
            DefendZone.BrushComponent.SetHidden(true);
        }        
    }    
    //return;    
}

function DrawCoverRatings()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

defaultproperties
{
    DebugTextOffset=(X=0.0000000,Y=0.0000000,Z=85.0000000)
    InvalidReasons[1]=(InvalidReason=EInvalidReason.EIR_Exposed,strBrief="EXPS",strDescription="Exposed")
    InvalidReasons[2]=(InvalidReason=EInvalidReason.EIR_Claimed,strBrief="CLAI",strDescription="Claimed")
    InvalidReasons[3]=(InvalidReason=EInvalidReason.EIR_GrenadeClose,strBrief="GREN",strDescription="Grenade close")
    InvalidReasons[4]=(InvalidReason=EInvalidReason.EIR_SomeoneWantsIt,strBrief="WANT",strDescription="Someone Wants It")
    InvalidReasons[5]=(InvalidReason=EInvalidReason.EIR_TooSmall,strBrief="SMAL",strDescription="Too small")
    InvalidReasons[6]=(InvalidReason=EInvalidReason.EIR_EnemyTooClose,strBrief="CLOS",strDescription="Enemy Too Close")
    InvalidReasons[7]=(InvalidReason=EInvalidReason.EIR_GettingDamage,strBrief="DAMA",strDescription="Damaged")
    InvalidReasons[8]=(InvalidReason=EInvalidReason.EIR_NegativeRating,strBrief="NEGA",strDescription="Negative Rating")
    InvalidReasons[9]=(InvalidReason=EInvalidReason.EIR_TooFar,strBrief="TFAR",strDescription="Too Far or Claimed")
    InvalidReasons[10]=(InvalidReason=EInvalidReason.EIR_CanNotFireEnemy,strBrief="FIRE",strDescription="Can Not Fire Enemy")
    InvalidReasons[11]=(InvalidReason=EInvalidReason.EIR_DamagedNoCA,strBrief="NOCA",strDescription="Damaged with no CA")
    RatingFactors[1]=(RatingFactor=ERatingFactor.ERF_DistanceToMe,strBrief="CLME",strDescription="Distance To Me")
    RatingFactors[2]=(RatingFactor=ERatingFactor.ERF_DistanceToEnemy,strBrief="CLEN",strDescription="Distance To Enemy")
    RatingFactors[3]=(RatingFactor=ERatingFactor.ERF_CanFireEnemy,strBrief="FIRE",strDescription="Can Fire Enemy")
    RatingFactors[4]=(RatingFactor=ERatingFactor.ERF_GettingDamage,strBrief="DAMA",strDescription="Damaged")
    RatingFactors[5]=(RatingFactor=ERatingFactor.ERF_UsedTooLong,strBrief="USED",strDescription="Used Too Long")
    RatingFactors[6]=(RatingFactor=ERatingFactor.ERF_Exposed,strBrief="EXPS",strDescription="Exposed")
    RatingFactors[7]=(RatingFactor=ERatingFactor.ERF_GrenadeClose,strBrief="GREN",strDescription="Grenade Close")
    RatingFactors[9]=(RatingFactor=ERatingFactor.ERF_DamagedNoCA,strBrief="NOCA",strDescription="Damaged with no CA")
    RatingFactors[10]=(RatingFactor=ERatingFactor.ERF_Flank,strBrief="FLAN",strDescription="Flanking cover")
    MinDistanceChangeStartPoint=150.0000000
    bFirstTraversal=true
    bMultiMapCacheDirty=true
}