class RB_RadialImpulseActor extends RigidBodyBase
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderComponent[524289];
var(*) /*0x3FF10000-0x00000400*/ private const export @NULL ImpulseComponent[720897];
var(*) /*0x35EA0000-0x00000000*/ private travel byte ImpulseCount[2097153];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x41
    if(inAction.InputLinks[0].bHasImpulse)
    {
        TriggerImpulse();
    }
    //return;    
}

simulated function TriggerImpulse()
{
    ImpulseComponent.FireImpulse(Location);
    ImpulseCount++;
    bForceNetUpdate = true;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x3F
    if(VarName == 'ImpulseCount')
    {
        ImpulseComponent.FireImpulse(Location);
    }
    //return;    
}

defaultproperties
{
    // Reference: RB_RadialImpulseComponent'Default__RB_RadialImpulseActor.ImpulseComponent0'
    begin object name=ImpulseComponent0 class=Class'RB_RadialImpulseComponent'
    end object
    ImpulseComponent=ImpulseComponent0
    Components[0]=none
    Components[1]=ImpulseComponent0
    Components[2]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bEdShouldSnap=true
    NetUpdateFrequency=0.1000000
}