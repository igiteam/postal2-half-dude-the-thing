class LPAIResManDefendVolume extends LPAIResourceManager
    editinlinenew;

function CreateDefendNodeResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Res;

    Res = new (self) Class'LPAIResDefendVolumeLocation';
    Res.Init();
    AddResource(Res);
    return Res;
    //return ReturnValue;    
}

event Init()
{
    super(SPAIResourceManager).Init();
    //return;    
}

event Update()
{
    super(SPAIResourceManager).Update();
    //return;    
}
