class LPSentinelSearchTarget extends LPNote
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    Components[0]=none
    Components[1]=none
    Components[2]=none
    // Reference: CylinderComponent'Default__LPSentinelSearchTarget.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[3]=CollisionCylinder
    bCollideActors=true
}