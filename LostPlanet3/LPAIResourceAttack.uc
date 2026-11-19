class LPAIResourceAttack extends SPAIResLocation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxAttackAttempters;

function Init()
{
    Outer.GetUserRadiusAndHeight(Outer.ResourceManagerOuter, Attributes.Radius, Attributes.Height);
    Attributes.Height *= float(2);
    Attributes.MoveThreshold = Attributes.Radius;
    super.Init();
    //return;    
}

defaultproperties
{
    MaxAttackAttempters=1
    Attributes=(RevokeReachTimeTolerance=0.1000000,TestForBlockers=false,bTestRechability=false,bTestForGround=false)
}