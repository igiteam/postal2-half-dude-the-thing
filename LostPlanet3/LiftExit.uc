class LiftExit extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x2E980000-0x00000000*/ private @NULL MyLiftCenter[65537];
var(*) /*0x2E980000-0x00000000*/ private bool bExitOnly[65537];

function CanBeReachedFromLiftBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (Location.Z < (Other.Location.Z + Other.GetCollisionHeight())) && Other.LineOfSightTo(self);
    //return ReturnValue;    
}

function WaitForLift()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0xAF
    if(MyLiftCenter != none)
    {
        Other.SetDesiredRotation(Rotator(Location - Other.Location));
        Other.Controller.WaitForMover(MyLiftCenter.MyLift);
    }
    //return;    
}

event SuggestMovePreparation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    // End:0x37
    if((MyLiftCenter == none) || Other.Controller == none)
    {
        return false;
    }
    // End:0x10E
    if(int(Other.Physics) == int(4))
    {
        // End:0x10C
        if(Other.AirSpeed > float(0))
        {
            Other.Controller.MoveTimer = 2.0000000 + (VSize(Location - Other.Location) / Other.AirSpeed);
        }
        return false;
    }
    // End:0x1AC
    if((Other.Base == MyLiftCenter.Base) || Other.ReachedDestination(MyLiftCenter))
    {
        // End:0x194
        if(CanBeReachedFromLiftBy(Other))
        {
            return false;
        }
        WaitForLift(Other);
        return true;        
    }
    else
    {
        // End:0x33C
        if(MyLiftCenter != none)
        {
            // End:0x307
            foreach WorldInfo.AllControllers(Class'Controller', C)
            {
                // End:0x306
                if((((C.Pawn != none) && C.PendingMover == MyLiftCenter.MyLift) && WorldInfo.GRI.OnSameTeam(C, Other.Controller)) && C.Pawn.ReachedDestination(self))
                {
                    WaitForLift(Other);                    
                    return true;
                }                
            }            
            Other.Controller.ReadyForLift();
        }
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bNeverUseStrafing=true
    bForceNoStrafing=true
    bSpecialMove=true
    // Reference: CylinderComponent'Default__LiftExit.CollisionCylinder'
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