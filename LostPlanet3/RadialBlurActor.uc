class RadialBlurActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3F7C0000-0x00000400*/ private export @NULL RadialBlur[589825];

defaultproperties
{
    // Reference: RadialBlurComponent'Default__RadialBlurActor.RadialBlurComp'
    begin object name=RadialBlurComp class=Class'RadialBlurComponent'
    end object
    RadialBlur=RadialBlurComp
    Components[0]=RadialBlurComp
    Components[1]=none
}