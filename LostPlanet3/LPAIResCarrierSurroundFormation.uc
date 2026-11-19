class LPAIResCarrierSurroundFormation extends LPAIResSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const CarrierRadius = 290;

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
                if((LPAIPawnCarrier(FoundPawns[I]) == none) && LPBaseVSPlayerPawn(FoundPawns[I]) == none)
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
    AdjustedRadius = Attribute.FormationRadius - float(290 * 2);
    // End:0xA8
    if(AdjustedRadius > (OuterActorRadius + float(290 * 2)))
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
    // End:0x122
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
    }
    J0x122:

    return bCanSee;
    //return ReturnValue;    
}

defaultproperties
{
    MaxInFormation=3
    ContentClasses=/* Array type was not detected. */
    Attribute=(Radius=290.0000000,Height=340.0000000)
    UniqueName="CarrierFormation"
    bDebugRender=true
}