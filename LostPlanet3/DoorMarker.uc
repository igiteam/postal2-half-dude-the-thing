class DoorMarker extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

enum EDoorType
{
    DOOR_Shoot,                     // 0
    DOOR_Touch,                     // 1
    DOOR_MAX                        // 2
};

var(*) /*0x1DE60000-0x00000000*/ private @NULL MyDoor[65537];
var(*) /*0x1DE60000-0x00000000*/ private byte DoorType[65537];
var(*) /*0x1DE60000-0x00000000*/ private @NULL DoorTrigger[65537];
var(*) /*0x1DE60000-0x00000000*/ private bool bWaitUntilCompletelyOpened[65537];
var(*) /*0x1DE60000-0x00000000*/ private bool bInitiallyClosed[65537];
var(*) /*0x1DE60000-0x00000000*/ private bool bBlockedWhenClosed[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDoorOpen;
var(*) /*0x35EA0000-0x00000000*/ private bool bTempDisabledCollision[537001985];

event PostBeginPlay()
{
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = !bInitiallyClosed;
    super(Actor).PostBeginPlay();
    //return;    
}

function MoverOpened()
{
    bBlocked = !bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = bInitiallyClosed;
    WorldInfo.Game.NotifyNavigationChanged(self);
    //return;    
}

function MoverClosed()
{
    bBlocked = bInitiallyClosed && bBlockedWhenClosed;
    bDoorOpen = !bInitiallyClosed;
    WorldInfo.Game.NotifyNavigationChanged(self);
    //return;    
}

event SpecialHandling()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], ReturnValue, TouchActor;

    // End:0x6A
    if((bDoorOpen || MyDoor == none) || bInitiallyClosed == (bDoorOpen || VSizeSq(MyDoor.Velocity) > 1.0000000))
    {
        return self;        
    }
    else
    {
        // End:0xFB
        if(int(DoorType) == int(1))
        {
            // End:0x9A
            if(DoorTrigger == none)
            {
                return MyDoor;                
            }
            else
            {
                TouchActor = DoorTrigger.SpecialHandling(Other);
                // End:0xEE
                if(TouchActor == none)
                {
                    TouchActor = DoorTrigger;
                }
                return TouchActor;
            }            
        }
        else
        {
            return self;
        }
    }
    //return ReturnValue;    
}

function ProceedWithMove()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x8B
    if((int(DoorType) == int(0)) && Other.Controller.Focus == MyDoor)
    {
        Other.Controller.StopFiring();
    }
    // End:0xB0
    if(bDoorOpen || int(DoorType) != int(0))
    {
        return true;
    }
    Other.Controller.Focus = ((DoorTrigger != none) ? DoorTrigger : MyDoor);
    // End:0x1AF
    if(!Other.Controller.FireWeaponAt(Other.Controller.Focus))
    {
        Other.Controller.MoveTimer = 0.2500000;        
    }
    else
    {
        // End:0x1F9
        if(bWaitUntilCompletelyOpened)
        {
            Other.Controller.WaitForMover(MyDoor);
        }
    }
    return false;
    //return ReturnValue;    
}

event SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x23
    if(bDoorOpen || MyDoor == none)
    {
        return false;        
    }
    else
    {
        // End:0x8F
        if(VSizeSq(MyDoor.Velocity) > 1.0000000)
        {
            Other.Controller.WaitForMover(MyDoor);
            return true;            
        }
        else
        {
            // End:0x264
            if(int(DoorType) == int(0))
            {
                Other.Controller.Focus = ((DoorTrigger != none) ? DoorTrigger : MyDoor);
                // End:0x1DA
                if(!Other.Controller.FireWeaponAt(Other.Controller.Focus))
                {
                    Other.Controller.MoveTimer = 0.2500000;
                    Other.Controller.bPreparingMove = true;
                    return true;                    
                }
                else
                {
                    // End:0x25F
                    if(bWaitUntilCompletelyOpened)
                    {
                        Other.Controller.WaitForMover(MyDoor);
                        Other.Controller.bPreparingMove = true;
                        return true;                        
                    }
                    else
                    {
                        return false;
                    }
                }                
            }
            else
            {
                // End:0x418
                if(((int(DoorType) == int(1)) && DoorTrigger != none) && Other.Controller.ActorReachable(DoorTrigger))
                {
                    // End:0x36C
                    if(Other.Controller.Focus == Other.Controller.MoveTarget)
                    {
                        Other.Controller.Focus = DoorTrigger;
                    }
                    Other.Controller.MoveTarget = DoorTrigger;
                    Other.Controller.CurrentPath = none;
                    Other.Controller.NextRoutePath = none;
                    return false;                    
                }
                else
                {
                    return false;
                }
            }
        }
    }
    //return ReturnValue;    
}

defaultproperties
{
    bInitiallyClosed=true
    bSpecialMove=true
    ExtraCost=100
    // Reference: CylinderComponent'Default__DoorMarker.CollisionCylinder'
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