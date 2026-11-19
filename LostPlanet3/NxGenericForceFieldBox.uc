class NxGenericForceFieldBox extends NxGenericForceField
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderComponent[524289];
var(*) /*0x36DA0000-0x00000000*/ private editconst @NULL BoxExtent[65537];

// Export UNxGenericForceFieldBox::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();

defaultproperties
{
    // Reference: DrawBoxComponent'Default__NxGenericForceFieldBox.DrawBox0'
    begin object name=DrawBox0 class=Class'DrawBoxComponent'
    end object
    RenderComponent=DrawBox0
    BoxExtent=(X=200.0000000,Y=200.0000000,Z=200.0000000)
    Components[0]=DrawBox0
    Components[1]=none
}