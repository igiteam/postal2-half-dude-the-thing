class EmitterSpawnable extends Emitter
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private travel ParticleSystem ParticleTemplate[2097153];

simulated event SetTemplate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTemplate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDestroyOnFinish[9437185];

    super.SetTemplate(NewTemplate, bDestroyOnFinish);
    ParticleTemplate = NewTemplate;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x78
    if(VarName == 'ParticleTemplate')
    {
        SetTemplate(ParticleTemplate, bDestroyOnSystemFinish);
        ParticleSystemComponent.ActivateSystem();
        // End:0x75
        if((ParticleTemplate == none) && bDestroyOnSystemFinish)
        {
            Destroy();
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__EmitterSpawnable.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    bDestroyOnSystemFinish=true
    Components[0]=none
    Components[1]=ParticleSystemComponent0
    Components[2]=none
    bNoDelete=false
    bNetTemporary=true
}