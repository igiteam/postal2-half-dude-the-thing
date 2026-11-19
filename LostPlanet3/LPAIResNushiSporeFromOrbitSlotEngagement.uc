class LPAIResNushiSporeFromOrbitSlotEngagement extends LPAIResDefenderRogueFromOrbitSlotEngagement within SPAIResourceManager
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
    MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=0
    MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=0
    AttackTypeValue=/* Array type was not detected. */
    UniqueName="NushiSporeOrbitEngagement"
    MaxUsers=50
}