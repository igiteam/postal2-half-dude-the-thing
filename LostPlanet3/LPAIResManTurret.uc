class LPAIResManTurret extends LPAIResourceManager
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResourceStrike[537395201];

event Init()
{
    AddResource(AIResourceStrike);
    super(SPAIResourceManager).Init();
    //return;    
}

event Update()
{
    super(SPAIResourceManager).Update();
    //return;    
}

function EnableStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AIResourceStrike.AllowAccess(bEnable);
    //return;    
}

defaultproperties
{
    // Reference: LPAIResourceStrike'Default__LPAIResManTurret.SPAIResource_Strike'
    begin object name=SPAIResource_Strike class=Class'LPAIResourceStrike'
        Red=0
    end object
    AIResourceStrike=SPAIResource_Strike
}