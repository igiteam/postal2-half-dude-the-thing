class TriggeredPath extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x4DCA0000-0x00000000*/ private bool bOpen[65537];
var(*) /*0x4DCA0000-0x00000000*/ private @NULL MyTrigger[65537];

function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bOpen = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bOpen = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bOpen = !bOpen;
            }
        }
    }
    WorldInfo.Game.NotifyNavigationChanged(self);
    //return;    
}

event SpecialHandling()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], ReturnValue, TouchActor;

    // End:0x23
    if(bOpen || MyTrigger == none)
    {
        return self;        
    }
    else
    {
        TouchActor = MyTrigger.SpecialHandling(Other);
        // End:0x77
        if(TouchActor == none)
        {
            TouchActor = MyTrigger;
        }
        return TouchActor;
    }
    //return ReturnValue;    
}

event SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(bOpen)
    {
        return false;        
    }
    else
    {
        // End:0x1B0
        if((MyTrigger != none) && Other.Controller.ActorReachable(MyTrigger))
        {
            // End:0x104
            if(Other.Controller.Focus == Other.Controller.MoveTarget)
            {
                Other.Controller.Focus = MyTrigger;
            }
            Other.Controller.MoveTarget = MyTrigger;
            Other.Controller.CurrentPath = none;
            Other.Controller.NextRoutePath = none;
            return false;            
        }
        else
        {
            Other.Controller.MoveTimer = 1.0000000;
            Other.Controller.bPreparingMove = true;
            Other.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            Other.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            return true;
        }
    }
    //return ReturnValue;    
}

defaultproperties
{
    bSpecialMove=true
    ExtraCost=100
    // Reference: CylinderComponent'Default__TriggeredPath.CollisionCylinder'
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