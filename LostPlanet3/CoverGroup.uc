class CoverGroup extends Info
    placeable
    hidecategories(AnimDependency,Navigation,Movement,Collision)
    classgroup(Cover);

enum ECoverGroupFillAction
{
    CGFA_Overwrite,                 // 0
    CGFA_Add,                       // 1
    CGFA_Remove,                    // 2
    CGFA_Clear,                     // 3
    CGFA_Cylinder,                  // 4
    CGFA_MAX                        // 5
};

var(*) /*0x14AB0000-0x00000000*/ private editfixedsize array CoverLinkRefs[65537];
var(*) /*0x14AB0000-0x00000000*/ private float AutoSelectRadius[65537];
var(*) /*0x14AB0000-0x00000000*/ private float AutoSelectHeight[65537];

// Export UCoverGroup::execEnableGroup(FFrame&, void* const)
native function EnableGroup();

// Export UCoverGroup::execDisableGroup(FFrame&, void* const)
native function DisableGroup();

// Export UCoverGroup::execToggleGroup(FFrame&, void* const)
native function ToggleGroup();

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x41
    if(Action.InputLinks[0].bHasImpulse)
    {
        EnableGroup();
    }
    // End:0x82
    if(Action.InputLinks[1].bHasImpulse)
    {
        DisableGroup();
    }
    // End:0xC4
    if(Action.InputLinks[2].bHasImpulse)
    {
        ToggleGroup();
    }
    //return;    
}

defaultproperties
{
    Components[0]=none
    Components[1]=none
    bStatic=true
}