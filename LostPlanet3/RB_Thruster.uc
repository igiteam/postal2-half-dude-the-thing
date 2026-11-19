class RB_Thruster extends RigidBodyBase
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3FF70000-0x00000000*/ private bool bThrustEnabled[65537];
var(*) /*0x3FF70000-0x00000000*/ private editconst float ThrustStrength[65537];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bThrustEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bThrustEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bThrustEnabled = !bThrustEnabled;
            }
        }
    }
    //return;    
}

defaultproperties
{
    ThrustStrength=100.0000000
    Components[0]=none
    Components[1]=none
    bHardAttach=true
    bEdShouldSnap=true
}