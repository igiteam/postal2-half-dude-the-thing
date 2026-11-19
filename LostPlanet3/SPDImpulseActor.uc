class SPDImpulseActor extends SPRB_RadialImpulseActor
    abstract
    hidecategories(AnimDependency,Navigation);

var(__OnDestroyed__Delegate) /*0x029A0000-0x00000000*/ private bool bAutoFire[65537];
var(__OnDestroyed__Delegate) /*0x029A0000-0x00000000*/ private bool bAutoDestroy[65537];

simulated function TriggerImpulse()
{
    super(RB_RadialImpulseActor).TriggerImpulse();
    // End:0x25
    if(bAutoDestroy)
    {
        GotoState('Inactive');
    }
    //return;    
}

event AutoTriggerImpulse()
{
    TriggerImpulse();
    //return;    
}

auto state Active
{Begin:

    Sleep(0.0000000);
    // End:0x1F
    if(bAutoFire)
    {
        TriggerImpulse();
    }
    stop;                    
}

state Inactive
{
    ignores TriggerImpulse;
Begin:

    Sleep(0.0000000);
    Destroy();
    stop;                    
}

defaultproperties
{
    bAutoFire=true
    bAutoDestroy=true
    // Reference: RB_RadialImpulseComponent'Default__SPDImpulseActor.ImpulseComponent0'
    begin object name=ImpulseComponent0
    end object
    ImpulseComponent=ImpulseComponent0
    Components[0]=none
    Components[1]=ImpulseComponent0
    Components[2]=none
    bNoDelete=false
}