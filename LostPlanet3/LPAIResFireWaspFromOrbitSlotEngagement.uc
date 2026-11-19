class LPAIResFireWaspFromOrbitSlotEngagement extends LPAIResMedFlyerFromOrbitSlotEngagement within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    super.Init();
    //return;    
}

function SetFromTuneData()
{
    super.SetFromTuneData();
    //return;    
}

function Destroy()
{
    super.Destroy();
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    //return;    
}

defaultproperties
{
    AttackTypeValue=/* Array type was not detected. */
    UniqueName="FireWaspOrbitEngagement"
    MaxUsers=10
}