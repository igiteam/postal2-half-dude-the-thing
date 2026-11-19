class RB_LineImpulseActor extends RigidBodyBase
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3FE90000-0x00000000*/ private editconst float ImpulseStrength[65537];
var(*) /*0x3FE90000-0x00000000*/ private float ImpulseRange[65537];
var(*) /*0x3FE90000-0x00000000*/ private bool bVelChange[65537];
var(*) /*0x3FE90000-0x00000000*/ private bool bStopAtFirstHit[65537];
var(*) /*0x3FE90000-0x00000000*/ private bool bCauseFracture[65537];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL Arrow[524289];
var(*) /*0x35EA0000-0x00000000*/ private travel byte ImpulseCount[2097153];

// Export URB_LineImpulseActor::execFireLineImpulse(FFrame&, void* const)
native final function FireLineImpulse();

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x58
    if(inAction.InputLinks[0].bHasImpulse)
    {
        FireLineImpulse();
        ImpulseCount++;
        bForceNetUpdate = true;
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x21
    if(VarName == 'ImpulseCount')
    {
        FireLineImpulse();
    }
    //return;    
}

defaultproperties
{
    ImpulseStrength=900.0000000
    ImpulseRange=200.0000000
    Components[0]=none
    Components[1]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bEdShouldSnap=true
    NetUpdateFrequency=0.1000000
}