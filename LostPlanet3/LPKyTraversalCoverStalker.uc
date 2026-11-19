class LPKyTraversalCoverStalker extends LPKyTraversalCover within LPAIControllerStalker;

protected event TraversalStrated()
{
    super.TraversalStrated();
    //return;    
}

protected event TraversalFinished()
{
    super.TraversalFinished();
    //return;    
}

protected event TraversalAborted()
{
    super.TraversalAborted();
    //return;    
}

function IsValidCurrentCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SlotLocation, SlotRotation, CoverToEnemy, CoverToEnemyNormal;
    local /*0x97E50000-0x00000000*/ private float DotEnemy, distanceToEnemy;
    local /*0x97E50000-0x00000000*/ private @NULL DirEnemyToSelf;

    // End:0x1F
    if((HasDefendZones()) && bStayAlwaysInCover)
    {
        return 12;
    }
    // End:0x44
    if(Cover.Link == none)
    {
        return 12;
    }
    // End:0x6B
    if(Outer.MainEnemy == none)
    {
        return 12;
    }
    SlotLocation = Cover.Link.GetSlotLocation(Cover.SlotIdx);
    SlotRotation = Cover.Link.GetSlotRotation(Cover.SlotIdx);
    CoverToEnemy = Outer.MainEnemy.Location - SlotLocation;
    CoverToEnemyNormal = Normal(CoverToEnemy);
    DotEnemy = Class'SPEngine.SPUtil'.static.Dot2D(Vector(SlotRotation), CoverToEnemyNormal);
    // End:0x210
    if(DotEnemy < Outer.StalkerPawn.TuneDataStalker.DotProductBadCover)
    {
        return 1;
    }
    DirEnemyToSelf = Normal(Outer.Pawn.Location - Outer.MainEnemy.Location);
    DotEnemy = Class'SPEngine.SPUtil'.static.Dot2D(DirEnemyToSelf, -CoverToEnemyNormal);
    // End:0x31A
    if(DotEnemy < Outer.StalkerPawn.TuneDataStalker.MinDotProductForCoverFromEnemyToCover)
    {
        return 1;
    }
    distanceToEnemy = VSize(CoverToEnemy);
    // End:0x388
    if(distanceToEnemy < Outer.StalkerPawn.TuneDataStalker.DistanceTooCloseToMainEnemy)
    {
        return 6;
    }
    // End:0x3CB
    if(Outer.StalkerPawn.IsGrenadeClose(SlotLocation))
    {
        return 3;
    }
    return 12;
    //return ReturnValue;    
}

protected event ProcessCoverSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FireLinkToEnemy;
    local /*0x97E50000-0x00000000*/ private byte InvalidReason;
    local /*0x97E50000-0x00000000*/ private @NULL SlotLocation, SlotRotation, Slot0Location, SlotLastLocation, CoverToEnemyNormal, CoverToEnemy;

    local /*0x97E50000-0x00000000*/ private bool bHasCoverAction;
    local /*0x97E50000-0x00000000*/ private float CoverRating, distanceToEnemy, DistanceToMe, DistanceToEnemyRating, DistanceToMeRating, CoverActionRating,
	    DotProductRating, DotEnemy, MinCoverSize;

    local /*0x97E50000-0x00000000*/ private int CoverIdx, Idx;
    local /*0x97E50000-0x00000000*/ private bool bCanInvalidateCover, bUseCoversWithoutLineOfFire;

    super.ProcessCoverSlot(Cover);
    bCanInvalidateCover = true;
    // End:0x45
    if(HasDefendZones())
    {
        // End:0x45
        if(bStayAlwaysInCover)
        {
            bCanInvalidateCover = false;
        }
    }
    CoverIdx = Covers.Length;
    Covers.Add(1);    
    Covers[CoverIdx].Cover = Cover;
    SlotLocation = Cover.Link.GetSlotLocation(Cover.SlotIdx);
    SlotRotation = Cover.Link.GetSlotRotation(Cover.SlotIdx);
    Covers[CoverIdx].Location = SlotLocation;
    // End:0x201
    if(!Cover.Link.IsValidClaim(Outer.Pawn, Cover.SlotIdx, true, false))
    {
        SetInvalidReason(CoverIdx, 2);
        return true;
    }
    CoverRating = 0.0000000;
    InvalidReason = IsValidCurrentCover(Cover);
    // End:0x25F
    if(int(InvalidReason) != int(12))
    {
        SetInvalidReason(CoverIdx, InvalidReason);
        return true;
    }
    // End:0x2F1
    if(Outer.CoverIsExposedToAnEnemy(Cover))
    {
        // End:0x2B0
        if(bCanInvalidateCover)
        {
            SetInvalidReason(CoverIdx, 1);
            return true;
        }
        CoverActionRating = -1.0000000;
        SetRatingFactor(CoverIdx, 6, CoverActionRating);
        CoverRating += CoverActionRating;
    }
    Slot0Location = Cover.Link.GetSlotLocation(0);
    SlotLastLocation = Cover.Link.GetSlotLocation(Cover.Link.Slots.Length - 1);
    MinCoverSize = Outer.OverwrittenMinCoverSize;
    // End:0x443
    if(Outer.OverwrittenMinCoverSize < 0.0000000)
    {
        MinCoverSize = Outer.StalkerPawn.TuneDataStalker.MinCoverSize;
    }
    // End:0x489
    if(VSizeSq(SlotLastLocation - Slot0Location) < (MinCoverSize * MinCoverSize))
    {
        SetInvalidReason(CoverIdx, 5);
        return true;
    }
    // End:0x5A0
    if(Outer.MainEnemy != none)
    {
        bHasCoverAction = Outer.CoverActionForEnemy(Cover, Outer.MainEnemy, FireLinkToEnemy, false);
        bUseCoversWithoutLineOfFire = Outer.StalkerPawn.TuneDataStalker.UseCoversWithoutLineOfFire();
        // End:0x5A0
        if(!bUseCoversWithoutLineOfFire && !bHasCoverAction)
        {
            // End:0x5A0
            if(bCanInvalidateCover)
            {
                SetInvalidReason(CoverIdx, 10);
                return true;
            }
        }
    }
    DistanceToMe = VSize(SlotLocation - Outer.Pawn.Location);
    DistanceToMe = FMin(DistanceToMe, GetExplorationRadius());
    DistanceToMeRating = (1.0000000 - (DistanceToMe / (GetExplorationRadius()))) * 0.5000000;
    SetRatingFactor(CoverIdx, 1, DistanceToMeRating);
    CoverRating += DistanceToMeRating;
    // End:0x827
    if(Outer.MainEnemy != none)
    {
        CoverToEnemy = Outer.MainEnemy.Location - SlotLocation;
        CoverToEnemyNormal = Normal(CoverToEnemy);
        distanceToEnemy = VSize(CoverToEnemy);
        DistanceToEnemyRating = CoverEnemyDistanceRating(distanceToEnemy);
        SetRatingFactor(CoverIdx, 2, DistanceToEnemyRating);
        CoverRating += DistanceToEnemyRating;
        DotEnemy = Class'SPEngine.SPUtil'.static.Dot2D(Vector(SlotRotation), CoverToEnemyNormal);
        DotProductRating = CoverDotRating(DotEnemy);
        SetRatingFactor(CoverIdx, 6, DotProductRating);
        CoverRating += DotProductRating;
        // End:0x827
        if(bHasCoverAction)
        {
            CoverActionRating = 1.5000000;
            SetRatingFactor(CoverIdx, 3, CoverActionRating);
            CoverRating += CoverActionRating;
        }
    }
    Idx = 0;
    J0x832:

    // End:0x923 [Loop If]
    if(Idx < CoverRatingsOnTime.Length)
    {
        // End:0x915
        if(CoverRatingsOnTime[Idx].Cover == Cover)
        {
            SetRatingFactor(CoverIdx, CoverRatingsOnTime[Idx].RatingFactor, CoverRatingsOnTime[Idx].Rating);
            CoverRating += CoverRatingsOnTime[Idx].Rating;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x832;
    }
    // End:0x96C
    if(CoverRating <= 0.0000000)
    {
        // End:0x957
        if(!bCanInvalidateCover)
        {
            CoverRating = 0.0100000;            
        }
        else
        {
            SetInvalidReason(CoverIdx, 8);
        }
    }
    Covers[CoverIdx].Rating = CoverRating;
    Covers[CoverIdx].FireLink = FireLinkToEnemy;
    return OnFoundValidCover(CoverIdx);
    //return ReturnValue;    
}

function OnFoundValidCover()
{
    local /*0x97E50000-0x00000000*/ private int CoverIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

private final function CoverEnemyDistanceRating()
{
    local /*0x97E50000-0x00000000*/ private float EnemyDistance[8388609], ReturnValue, Rating;

    // End:0x54
    if(EnemyDistance < Outer.StalkerPawn.GetWeaponShortRange())
    {
        Rating = 0.1000000;        
    }
    else
    {
        // End:0xA8
        if(EnemyDistance < Outer.StalkerPawn.GetWeaponMediumRange())
        {
            Rating = 1.0000000;            
        }
        else
        {
            // End:0xFC
            if(EnemyDistance < Outer.StalkerPawn.GetWeaponLongRange())
            {
                Rating = 1.5000000;                
            }
            else
            {
                Rating = 0.5000000;
            }
        }
    }
    return Rating;
    //return ReturnValue;    
}

private final function CoverDotRating()
{
    local /*0x97E50000-0x00000000*/ private float dotProduct[8388609], ReturnValue, Rating;

    // End:0x68
    if(dotProduct > Outer.StalkerPawn.TuneDataStalker.DotProductGoodCover)
    {
        Rating = 1.0000000;        
    }
    else
    {
        // End:0xD0
        if(dotProduct > Outer.StalkerPawn.TuneDataStalker.DotProductOkCover)
        {
            Rating = 0.5000000;            
        }
        else
        {
            Rating = 0.1000000;
        }
    }
    return Rating;
    //return ReturnValue;    
}
