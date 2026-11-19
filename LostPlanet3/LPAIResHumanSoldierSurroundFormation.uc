class LPAIResHumanSoldierSurroundFormation extends LPAIResSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const HumanRadius = 30;

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x66
    if(TestActor != none)
    {
        // End:0x64
        if(TestActor.FastTrace(TestActor.Location, FromLocation, vect(0.0000000, 0.0000000, 0.0000000), true))
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function ExplorationFinished()
{
    super.ExplorationFinished();
    // End:0x5E
    if(int(FormationExplorer.ExpState) == int(3))
    {
        FormationExplorer.ClearAllPositions();
        bNewSpansAvailable = true;
    }
    //return;    
}

defaultproperties
{
    MaxInFormation=3
    ContentClasses=/* Array type was not detected. */
    FormationBlockCheckEnabled=true
    Attribute=(Radius=120.0000000,Height=240.0000000)
    UniqueName="HumanSoldierFormation"
}