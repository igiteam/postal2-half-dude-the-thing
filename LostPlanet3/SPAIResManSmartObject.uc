class SPAIResManSmartObject extends SPAIResourceManager
    editinlinenew;

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private editfixedsize @NULL AccessResource[537395201];

event Init()
{
    AddResource(AccessResource);
    super.Init();
    //return;    
}

event Update()
{
    super.Update();
    //return;    
}

function EnableAccess()
{
    local /*0x03A30000-0x00000000*/ private bool bEnable[8388609];

    AccessResource.AllowAccess(bEnable);
    //return;    
}

defaultproperties
{
    // Reference: SPAIResLocation'Default__SPAIResManSmartObject.SPAIResource_Access'
    begin object name=SPAIResource_Access class=Class'SPAIResLocation'
        Attributes=(bTestRechability=false,bTestForGround=false)
        UniqueName="SmartObjectAccess"
        Red=0
    end object
    AccessResource=SPAIResource_Access
}