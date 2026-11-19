class LiftCenter extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x35EA0000-0x00000000*/ private @NULL MyLift;
var(*) /*0x35EA0000-0x00000000*/ private float MaxDist2D;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LiftOffset;
var(*) /*0x35EA0000-0x00000000*/ private bool bJumpLift;
var(*) /*0x35EA0000-0x00000000*/ private float CollisionHeight;
var(*) /*0x2E970000-0x00000000*/ private @NULL LiftTrigger[65537];

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x86
    if((Base == MyLift) && MyLift != none)
    {
        LiftOffset = Location - MyLift.Location;
        MyLift.bIsLift = true;
    }
    //return;    
}

event SpecialHandling()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], ReturnValue;

    // End:0x49
    if(((MyLift == none) || LiftTrigger == none) || LiftTrigger.bRecentlyTriggered)
    {
        return self;        
    }
    else
    {
        return LiftTrigger;
    }
    //return ReturnValue;    
}

event SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(Other.Base == MyLift)
    {
        return false;
    }
    // End:0xB9
    if((Base != MyLift) || Location != (MyLift.Location + LiftOffset))
    {
        SetLocation(MyLift.Location + LiftOffset);
        SetBase(MyLift);
    }
    // End:0x138
    if(!IsZero(MyLift.Velocity) || !ProceedWithMove(Other))
    {
        Other.Controller.WaitForMover(MyLift);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ProceedWithMove()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(Other.Controller == none)
    {
        return false;        
    }
    else
    {
        // End:0xEF
        if((LiftExit(Other.Controller.MoveTarget) != none) && Other.ReachedDestination(self))
        {
            return LiftExit(Other.Controller.MoveTarget).CanBeReachedFromLiftBy(Other);            
        }
        else
        {
            // End:0x2DB
            if((((Location.Z - CollisionHeight) < (((Other.Location.Z - Other.GetCollisionHeight()) + Other.MaxStepHeight) + 2.0000000)) && (Location.Z - CollisionHeight) > ((Other.Location.Z - Other.GetCollisionHeight()) - float(1200))) && (VSize2D(Location - Other.Location) < MaxDist2D) || (IsZero(MyLift.Velocity) && Other.ValidAnchor()) && LiftExit(Other.Anchor) != none)
            {
                return true;
            }
        }
    }
    // End:0x360
    if(((LiftTrigger != none) && !LiftTrigger.bRecentlyTriggered) && IsZero(MyLift.Velocity))
    {
        Other.SetMoveTarget(LiftTrigger);
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    MaxDist2D=400.0000000
    CollisionHeight=50.0000000
    bNeverUseStrafing=true
    bForceNoStrafing=true
    bSpecialMove=true
    bNoAutoConnect=true
    ExtraCost=400
    // Reference: CylinderComponent'Default__LiftCenter.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    bStatic=false
    CollisionComponent=CollisionCylinder
}