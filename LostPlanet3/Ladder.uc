class Ladder extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x35EA0000-0x00000000*/ private @NULL MyLadder;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LadderList;

event SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(MyLadder == none)
    {
        return false;
    }
    // End:0x68
    if(!MyLadder.InUse(Other))
    {
        MyLadder.PendingClimber = Other;
        return false;
    }
    Other.Controller.bPreparingMove = true;
    Other.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bSpecialMove=true
    bNotBased=true
    // Reference: CylinderComponent'Default__Ladder.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    CollisionComponent=CollisionCylinder
}