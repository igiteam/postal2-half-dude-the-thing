class LPAIResManMapMaster extends Object;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResMortarLocManager[537395201];

event Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWorldInfo[8388609];

    WorldInfo = InWorldInfo;
    AIResMortarLocManager.Init(InWorldInfo);
    //return;    
}

event ScriptDestoryCleanUp()
{
    WorldInfo = none;
    AIResMortarLocManager.ScriptDestoryCleanUp();
    //return;    
}

defaultproperties
{
    // Reference: LPAIResMortarLocManager'Default__LPAIResManMapMaster.LPAIResMortarLocManager'
    begin object name=LPAIResMortarLocManager class=Class'LPAIResMortarLocManager'
    end object
    AIResMortarLocManager=LPAIResMortarLocManager
}