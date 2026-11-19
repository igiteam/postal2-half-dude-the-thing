class LPAIResManAttackVolume extends LPAIResourceManager
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AccessResource[537395201];

event Init()
{
    AddResource(AccessResource);
    super(SPAIResourceManager).Init();
    //return;    
}

event Update()
{
    super(SPAIResourceManager).Update();
    //return;    
}

function EnableAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    AccessResource.AllowAccess(bEnable);
    //return;    
}

defaultproperties
{
    // Reference: SPAIResLocation'Default__LPAIResManAttackVolume.SPAIResource_Access'
    begin object name=SPAIResource_Access class=Class'SPAI.SPAIResLocation'
        Attributes=(bTestRechability=false,bTestForGround=false)
        UniqueName="AttackVolumeAccess"
        Red=0
    end object
    AccessResource=SPAIResource_Access
}