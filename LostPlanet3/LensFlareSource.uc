class LensFlareSource extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x2E5B0000-0x00000400*/ private const export @NULL LensFlareComp[720897];
var(*) /*0x2E5B0000-0x00000000*/ private bool bUseLegacyRendering[65537];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bCurrentlyActive[2097153];

// Export ULensFlareSource::execSetTemplate(FFrame&, void* const)
native final function SetTemplate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTemplate[8388609];


}

simulated event PostBeginPlay()
{
    bCurrentlyActive = LensFlareComp.bIsActive;
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x66
    if(Action.InputLinks[0].bHasImpulse)
    {
        LensFlareComp.SetIsActive(true);
        bCurrentlyActive = true;        
    }
    else
    {
        // End:0xCC
        if(Action.InputLinks[1].bHasImpulse)
        {
            LensFlareComp.SetIsActive(false);
            bCurrentlyActive = false;            
        }
        else
        {
            // End:0x16E
            if(Action.InputLinks[2].bHasImpulse)
            {
                // End:0x142
                if(!bCurrentlyActive)
                {
                    LensFlareComp.SetIsActive(true);
                    bCurrentlyActive = true;                    
                }
                else
                {
                    LensFlareComp.SetIsActive(false);
                    bCurrentlyActive = false;
                }
            }
        }
    }
    LensFlareComp.LastRenderTime = WorldInfo.TimeSeconds;
    ForceNetRelevant();
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x7D
    if(VarName == 'bCurrentlyActive')
    {
        LensFlareComp.SetIsActive(bCurrentlyActive);
        LensFlareComp.LastRenderTime = WorldInfo.TimeSeconds;
    }
    //return;    
}

simulated function SetFloatParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Param[8388609];

    //return;    
}

simulated function SetVectorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];

    //return;    
}

simulated function SetColorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];

    //return;    
}

simulated function SetExtColorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Red[8388609], Green, Blue, Alpha;

    //return;    
}

simulated function SetActorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];

    //return;    
}

defaultproperties
{
    // Reference: LensFlareComponent'Default__LensFlareSource.LensFlareComponent0'
    begin object name=LensFlareComponent0 class=Class'LensFlareComponent'
    end object
    LensFlareComp=LensFlareComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=none
    Components[4]=LensFlareComponent0
    Components[5]=none
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bNoDelete=true
    bHardAttach=true
    bGameRelevant=true
    bEdShouldSnap=true
}