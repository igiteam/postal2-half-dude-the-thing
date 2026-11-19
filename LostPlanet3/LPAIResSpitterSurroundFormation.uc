class LPAIResSpitterSurroundFormation extends LPAIResSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const SpitterRadius = 490;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ApproximateRelativeFirePos;

function GetResourceExtents()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825];

    super(SPAIResGroupMultiLocation).GetResourceExtents(OutLocation, OutRadius);
    //return;    
}

function DoFormationBlockCheck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I, NumBlockers;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FoundPawns;

    NumBlockers = 0;
    // End:0x12C
    if(GetPawnsAtLocation(FoundPawns, LastExploreOrigin, Attribute.FormationRadius))
    {
        I = 0;
        J0x51:

        // End:0x12C [Loop If]
        if(I < FoundPawns.Length)
        {
            // End:0x11E
            if((FoundPawns[I] != none) && FoundPawns[I] != Outer.GetResourceManagerOwner())
            {
                // End:0x11E
                if((LPAIPawnSpitter(FoundPawns[I]) == none) && LPBaseVSPlayerPawn(FoundPawns[I]) == none)
                {
                    ++NumBlockers;
                    // End:0x11E
                    if(NumBlockers > 2)
                    {
                        return true;
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x51;
        }
    }
    return false;
    //return ReturnValue;    
}

function BeginPlay()
{
    local /*0x97E50000-0x00000000*/ private float AdjustedRadius;

    super.BeginPlay();
    AdjustedRadius = Attribute.FormationRadius - float(490 * 2);
    // End:0xA8
    if(AdjustedRadius > (OuterActorRadius + float(490 * 2)))
    {
        Attribute.MoveConstraintRadiusFactor = AdjustedRadius / Attribute.FormationRadius;        
    }
    else
    {
        Attribute.MoveConstraintRadiusFactor = 1.0000000;
    }
    //return;    
}

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;
    local /*0x97E50000-0x00000000*/ private editfixedsize array BlockingPawns;
    local /*0x97E50000-0x00000000*/ private int I;

    bCanSee = super.IsVisible(FromLocation, TestActor);
    // End:0x19B
    if(bCanSee)
    {
        Class'LPAIUtils'.static.GetPawnsAtLocation(BlockingPawns, FromLocation, Attribute.Radius * 1.2000000);
        I = 0;
        J0x93:

        // End:0x122 [Loop If]
        if(I < BlockingPawns.Length)
        {
            // End:0x114
            if((BlockingPawns[I] != Outer.ResourceManagerOuter) && LPBaseVSPlayerPawn(BlockingPawns[I]) != none)
            {
                bCanSee = false;
                // [Explicit Break]
                goto J0x122;
            }
            ++I;
            // [Loop Continue]
            goto J0x93;
        }
        J0x122:

        // End:0x19B
        if(bCanSee)
        {
            bCanSee = Class'LPAIPawnSpitter'.static.HaveLosForSpitAttackGivenFirePoint(LPAIPawnSpitter(TestActor), FromLocation, ApproximateRelativeFirePos, Outer.ResourceManagerOuter);
        }
    }
    return bCanSee;
    //return ReturnValue;    
}

function IsVitalSuitInTheWay()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], FromLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, ToLocation, NearestLocation, VSLocation;
    local /*0x97E50000-0x00000000*/ private float CombinedRadiusSq;

    ToLocation = Outer.ResourceManagerOuter.Location;
    ToLocation.Z = 0.0000000;
    FromLocation.Z = 0.0000000;
    // End:0x261
    foreach Outer.ResourceManagerOuter.WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', vsPawn)
    {
        VSLocation = vsPawn.Location;
        VSLocation.Z = 0.0000000;
        // End:0x260
        if(((ToLocation - VSLocation) Dot (ToLocation - FromLocation)) > float(0))
        {
            NearestLocation = Class'SPEngine.SPUtil'.static.NearestPointOnLineSegment(FromLocation, ToLocation, VSLocation);
            CombinedRadiusSq = Requester.CylinderComponent.CollisionRadius + vsPawn.CylinderComponent.CollisionRadius;
            CombinedRadiusSq = CombinedRadiusSq * CombinedRadiusSq;
            // End:0x260
            if(VSizeSq2D(NearestLocation - VSLocation) < CombinedRadiusSq)
            {                
                return true;
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    ApproximateRelativeFirePos=(X=-174.2048000,Y=-0.7217330,Z=477.6182000)
    MaxInFormation=3
    ContentClasses=/* Array type was not detected. */
    Attribute=(Radius=490.0000000,Height=340.0000000)
    UniqueName="SpitterFormation"
    bDebugRender=true
}