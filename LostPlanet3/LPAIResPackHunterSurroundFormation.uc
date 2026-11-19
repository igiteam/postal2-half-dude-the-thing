class LPAIResPackHunterSurroundFormation extends LPAIResSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const PackHunterRadius = 180;

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
                if((LPAIPawnPackHunter(FoundPawns[I]) == none) && LPBaseVSPlayerPawn(FoundPawns[I]) == none)
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
    AdjustedRadius = Attribute.FormationRadius - float(180 * 2);
    // End:0xA2
    if(AdjustedRadius > (OuterActorRadius + float(180 * 2)))
    {
        Attribute.MoveConstraintRadiusFactor = AdjustedRadius / Attribute.FormationRadius;        
    }
    else
    {
        Attribute.MoveConstraintRadiusFactor = 1.0000000;
    }
    //return;    
}

defaultproperties
{
    MaxInFormation=3
    ContentClasses=/* Array type was not detected. */
    FormationBlockCheckEnabled=true
    Attribute=(Radius=120.0000000,Height=240.0000000)
    UniqueName="PackHunterFormation"
}