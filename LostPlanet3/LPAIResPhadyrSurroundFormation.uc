class LPAIResPhadyrSurroundFormation extends LPAIResSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const PhadyrRadius = 50;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationRangedExplorer[536870913];

function ShutDown()
{
    super.ShutDown();
    // End:0x24
    if(FormationRangedExplorer != none)
    {
        FormationRangedExplorer = none;
    }
    //return;    
}

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
                if((LPAIPawnPhadyr(FoundPawns[I]) == none) && LPBaseVSPlayerPawn(FoundPawns[I]) == none)
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

event StartExploration()
{
    // End:0x279
    if(MaxInFormation > 0)
    {
        // End:0x61
        if(!IsPawnClassLoaded())
        {
            // End:0x57
            if(FormationExplorer != none)
            {
                FormationExplorer.Destroy();
                FormationExplorer = none;
            }
            FindValidContentClass();
        }
        // End:0x279
        if(IsPawnClassLoaded())
        {
            // End:0xD5
            if(FormationExplorer == none)
            {
                FormationRangedExplorer = Class'LPSurroundRangedFormationExplorer'.static.CreateRangedFromPawnClassName(CurrentContentClasses.PawnClassName);
                FormationExplorer = FormationRangedExplorer;
            }
            // End:0x279
            if(FormationExplorer != none)
            {
                FormationExplorer.SetSectors(int(float(MaxInFormation) * SectorsPerAttackerFactor));
                FormationExplorer.SetSearchDistances(Attribute.MinFormationRadius, Attribute.MaxFormationRadius, Attribute.FormationRadius);
                FormationExplorer.SetLosFunction(IsVisible);
                FormationExplorer.SetFinishCallBack(ExplorationFinished);
                LastExploreOrigin = Outer.GetOuterLocation();
                bIsExploring = true;
                bNewSpansAvailable = false;
                FormationExplorer.StartExploration(Outer.GetResourceManagerOwner());
                bStarted = true;
            }
        }
    }
    //return;    
}

defaultproperties
{
    MaxInFormation=6
    ContentClasses=/* Array type was not detected. */
    Attribute=(Radius=50.0000000,Height=100.0000000)
    UniqueName="PhadyrMeleeFormation"
}