class LPKyTraversalCoverHumanSoldier extends LPKyTraversalCover within LPAIControllerHumanSoldier;

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
    local /*0x97E50000-0x00000000*/ private float DotEnemy;

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
    // End:0x193
    if(!Cover.Link.IsValidClaim(Outer.HumanSoldierPawn, Cover.SlotIdx, true, false))
    {
        return 2;
    }
    CoverToEnemy = Outer.MainEnemy.Location - SlotLocation;
    CoverToEnemyNormal = Normal(CoverToEnemy);
    DotEnemy = Vector(SlotRotation) Dot CoverToEnemyNormal;
    // End:0x269
    if(DotEnemy < Outer.HumanSoldierPawn.TuneDataHumanSoldier.DotProductBadCover)
    {
        return 1;
    }
    // End:0x2AC
    if(Outer.HumanSoldierPawn.IsGrenadeClose(SlotLocation))
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
    local /*0x97E50000-0x00000000*/ private @NULL SlotLocation, SlotRotation, CoverToEnemy, CoverToEnemyNormal;
    local /*0x97E50000-0x00000000*/ private float CoverRating, distanceToEnemy, DistanceToMe, DistanceToEnemyRating, DistanceToMeRating, CoverActionRating,
	    DotProductRating, DotEnemy, FlankingRating;

    local /*0x97E50000-0x00000000*/ private int CoverIdx, Idx;
    local /*0x97E50000-0x00000000*/ private bool bCanInvalidateCover, bHasCoverAction;

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
    CoverRating = 0.0000000;
    InvalidReason = IsValidCurrentCover(Cover);
    // End:0x1D5
    if(int(InvalidReason) != int(12))
    {
        SetInvalidReason(CoverIdx, InvalidReason);
        return true;
    }
    // End:0x2C3
    if(Outer.MainEnemy != none)
    {
        CoverToEnemy = Outer.MainEnemy.Location - SlotLocation;
        distanceToEnemy = VSize(CoverToEnemy);
        // End:0x2C3
        if(distanceToEnemy < Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceToMainEnemyInvalidCover)
        {
            SetInvalidReason(CoverIdx, 6);
            return true;
        }
    }
    // End:0x355
    if(Outer.CoverIsExposedToAnEnemy(Cover))
    {
        // End:0x314
        if(bCanInvalidateCover)
        {
            SetInvalidReason(CoverIdx, 1);
            return true;
        }
        CoverActionRating = -1.0000000;
        SetRatingFactor(CoverIdx, 6, CoverActionRating);
        CoverRating += CoverActionRating;
    }
    DistanceToMe = VSize(SlotLocation - Outer.Pawn.Location);
    DistanceToMe = FMin(DistanceToMe, GetExplorationRadius());
    DistanceToMeRating = (1.0000000 - (DistanceToMe / (GetExplorationRadius()))) * 0.5000000;
    // End:0x463
    if(Outer.bFlankingGuy)
    {
        DistanceToMeRating *= Outer.HumanSoldierPawn.TuneDataHumanSoldier.FlankingGuyFactorDistanceToMeRating;        
    }
    else
    {
        DistanceToMeRating *= Outer.HumanSoldierPawn.TuneDataHumanSoldier.FactorDistanceToMeRating;
    }
    SetRatingFactor(CoverIdx, 1, DistanceToMeRating);
    CoverRating += DistanceToMeRating;
    // End:0x6F9
    if(Outer.MainEnemy != none)
    {
        CoverToEnemyNormal = Normal(CoverToEnemy);
        DistanceToEnemyRating = CoverEnemyDistanceRating(distanceToEnemy);
        SetRatingFactor(CoverIdx, 2, DistanceToEnemyRating);
        CoverRating += DistanceToEnemyRating;
        DotEnemy = Vector(SlotRotation) Dot CoverToEnemyNormal;
        DotProductRating = CoverDotRating(DotEnemy);
        SetRatingFactor(CoverIdx, 6, DotProductRating);
        CoverRating += DotProductRating;
        bHasCoverAction = Outer.CoverActionForEnemy(Cover, Outer.MainEnemy, FireLinkToEnemy);
        // End:0x688
        if(bHasCoverAction)
        {
            CoverActionRating = 2.5000000;
            SetRatingFactor(CoverIdx, 3, CoverActionRating);
            CoverRating += CoverActionRating;
        }
        // End:0x6F9
        if(Outer.bFlankingGuy)
        {
            FlankingRating = CoverFlankingRating(Cover);
            SetRatingFactor(CoverIdx, 10, FlankingRating);
            CoverRating += FlankingRating;
        }
    }
    Idx = 0;
    J0x704:

    // End:0x7F5 [Loop If]
    if(Idx < CoverRatingsOnTime.Length)
    {
        // End:0x7E7
        if(CoverRatingsOnTime[Idx].Cover == Cover)
        {
            SetRatingFactor(CoverIdx, CoverRatingsOnTime[Idx].RatingFactor, CoverRatingsOnTime[Idx].Rating);
            CoverRating += CoverRatingsOnTime[Idx].Rating;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x704;
    }
    // End:0x83E
    if(CoverRating <= 0.0000000)
    {
        // End:0x829
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
    return true;
    //return ReturnValue;    
}

private final function CoverFlankingRating()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerEnemy;
    local /*0x97E50000-0x00000000*/ private float ExposedScale, FlankingRating, DegreesToLOF;
    local /*0x97E50000-0x00000000*/ private @NULL SlotLocation, DirToSlot, DirToMe;
    local /*0x97E50000-0x00000000*/ private bool bSlotInTheLeft, bMeInTheLeft;

    PlayerEnemy = LPPlayerPawn(Outer.MainEnemy);
    // End:0x46
    if(PlayerEnemy == none)
    {
        return 0.0000000;
    }
    FlankingRating = 0.0000000;
    // End:0x115
    if(PlayerEnemy.IsInCover())
    {
        ExposedScale = 1.0000000;
        // End:0x103
        if(PlayerEnemy.CurrentLink.IsExposedTo(PlayerEnemy.CurrentSlotIdx, Cover, ExposedScale))
        {
            FlankingRating = ExposedScale;            
        }
        else
        {
            FlankingRating = 0.0000000;
        }        
    }
    else
    {
        // End:0x22E
        if(PlayerEnemy.HasCombatLineOfFire())
        {
            SlotLocation = Cover.Link.GetSlotLocation(Cover.SlotIdx);
            DegreesToLOF = PlayerEnemy.GetDegreesToLineOfFire(SlotLocation);
            // End:0x1E7
            if(DegreesToLOF > 45.0000000)
            {
                FlankingRating = 0.5000000;                
            }
            else
            {
                // End:0x20C
                if(DegreesToLOF > 60.0000000)
                {
                    FlankingRating = 0.7500000;                    
                }
                else
                {
                    // End:0x22E
                    if(DegreesToLOF > 90.0000000)
                    {
                        FlankingRating = 1.0000000;
                    }
                }
            }
        }
    }
    // End:0x487
    if((FlankingRating > 0.0000000) && PlayerEnemy.HasCombatLineOfFire())
    {
        SlotLocation = Cover.Link.GetSlotLocation(Cover.SlotIdx);
        DirToSlot = Normal(SlotLocation - PlayerEnemy.CombatLineOfFire.StartPos);
        DirToMe = Normal(Outer.HumanSoldierPawn.Location - PlayerEnemy.CombatLineOfFire.StartPos);
        bSlotInTheLeft = Asin(VSize(DirToSlot Cross PlayerEnemy.CombatLineOfFire.AimDir)) > float(0);
        bMeInTheLeft = Asin(VSize(DirToMe Cross PlayerEnemy.CombatLineOfFire.AimDir)) > float(0);
        // End:0x457
        if(bSlotInTheLeft && bMeInTheLeft)
        {
            FlankingRating += 0.5000000;            
        }
        else
        {
            // End:0x487
            if(!bSlotInTheLeft && !bMeInTheLeft)
            {
                FlankingRating += 0.5000000;
            }
        }
    }
    return FlankingRating;
    //return ReturnValue;    
}

private final function CoverEnemyDistanceRating()
{
    local /*0x97E50000-0x00000000*/ private float EnemyDistance[8388609], ReturnValue, Rating;

    // End:0x68
    if(EnemyDistance < Outer.HumanSoldierPawn.TuneDataHumanSoldier.DistanceTooCloseToMainEnemy)
    {
        Rating = 0.0000000;        
    }
    else
    {
        // End:0xBC
        if(EnemyDistance < Outer.HumanSoldierPawn.GetWeaponShortRange())
        {
            Rating = 0.1000000;            
        }
        else
        {
            // End:0x110
            if(EnemyDistance < Outer.HumanSoldierPawn.GetWeaponMediumRange())
            {
                Rating = 1.0000000;                
            }
            else
            {
                // End:0x164
                if(EnemyDistance < Outer.HumanSoldierPawn.GetWeaponLongRange())
                {
                    Rating = 1.5000000;                    
                }
                else
                {
                    Rating = 0.5000000;
                }
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
    if(dotProduct > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DotProductGoodCover)
    {
        Rating = 1.0000000;        
    }
    else
    {
        // End:0xD0
        if(dotProduct > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DotProductOkCover)
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
