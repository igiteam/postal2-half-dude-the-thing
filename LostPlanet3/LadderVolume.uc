class LadderVolume extends PhysicsVolume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(*) /*0x2D920000-0x00000000*/ private @NULL WallDir[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LookDir;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ClimbDir;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LadderList[131073];
var(*) /*0x2D920000-0x00000000*/ private bool bNoPhysicalLadder[65537];
var(*) /*0x2D920000-0x00000000*/ private bool bAutoPath[65537];
var(*) /*0x2D920000-0x00000000*/ private bool bAllowLadderStrafing[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingClimber;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL WallDirArrow[524289];

simulated event PostBeginPlay()
{
    local /*0x35EA0000-0x00000000*/ private @NULL L, M, Dir;

    super.PostBeginPlay();
    LookDir = Vector(WallDir);
    // End:0x1EF
    if(!bAutoPath && LookDir.Z != float(0))
    {
        ClimbDir = vect(0.0000000, 0.0000000, 1.0000000);
        L = LadderList;
        J0x7E:

        // End:0x1A8 [Loop If]
        if(L != none)
        {
            M = LadderList;
            J0xA0:

            // End:0x17D [Loop If]
            if(M != none)
            {
                // End:0x152
                if(M != L)
                {
                    Dir = Normal(M.Location - L.Location);
                    // End:0x13E
                    if((Dir Dot ClimbDir) < float(0))
                    {
                        Dir *= float(-1);
                    }
                    ClimbDir += Dir;
                }
                M = M.LadderList;
                // [Loop Continue]
                goto J0xA0;
            }
            L = L.LadderList;
            // [Loop Continue]
            goto J0x7E;
        }
        ClimbDir = Normal(ClimbDir);
        // End:0x1EF
        if((ClimbDir Dot vect(0.0000000, 0.0000000, 1.0000000)) < float(0))
        {
            ClimbDir *= float(-1);
        }
    }
    //return;    
}

function InUse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Ignored[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL StillClimbing;

    // End:0x7B
    foreach TouchingActors(Class'Pawn', StillClimbing)
    {
        // End:0x7A
        if(((StillClimbing != Ignored) && StillClimbing.bCollideActors) && StillClimbing.bBlockActors)
        {            
            return true;
        }        
    }    
    // End:0x1A3
    if(PendingClimber != none)
    {
        // End:0x1A3
        if(((((PendingClimber.Controller == none) || !PendingClimber.bCollideActors) || !PendingClimber.bBlockActors) || Ladder(PendingClimber.Controller.MoveTarget) == none) || Ladder(PendingClimber.Controller.MoveTarget).MyLadder != self)
        {
            PendingClimber = none;
        }
    }
    return (PendingClimber != none) && PendingClimber != Ignored;
    //return ReturnValue;    
}

simulated event PawnEnteredVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], PawnRot;

    super.PawnEnteredVolume(P);
    // End:0x39
    if(!P.CanGrabLadder())
    {
        return;
    }
    PawnRot = P.Rotation;
    PawnRot.Pitch = 0;
    // End:0x135
    if(((Vector(PawnRot) Dot LookDir) > 0.9000000) || (AIController(P.Controller) != none) && Ladder(P.Controller.MoveTarget) != none)
    {
        P.ClimbLadder(self);        
    }
    else
    {
        // End:0x1A1
        if(!P.bDeleteMe && P.Controller != none)
        {
            Spawn(Class'PotentialClimbWatcher', P);
        }
    }
    //return;    
}

simulated event PawnLeavingVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], C;

    // End:0x26
    if(P.OnLadder != self)
    {
        return;
    }
    super.PawnLeavingVolume(P);
    P.OnLadder = none;
    P.EndClimbLadder(self);
    // End:0x9B
    if(P == PendingClimber)
    {
        PendingClimber = none;
    }
    // End:0x1CA
    if(!InUse(P))
    {
        // End:0x1C9
        foreach WorldInfo.AllControllers(Class'Controller', C)
        {
            // End:0x1C8
            if((C.bPreparingMove && Ladder(C.MoveTarget) != none) && Ladder(C.MoveTarget).MyLadder == self)
            {
                C.bPreparingMove = false;
                PendingClimber = C.Pawn;                
                return;
            }            
        }        
    }
    //return;    
}

simulated event PhysicsChangedFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0xC3
    if(((((int(Other.Physics) == int(2)) || int(Other.Physics) == int(9)) || Other.bDeleteMe) || Pawn(Other) == none) || Pawn(Other).Controller == none)
    {
        return;
    }
    Spawn(Class'PotentialClimbWatcher', Other);
    //return;    
}

defaultproperties
{
    ClimbDir=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    bAutoPath=true
    bAllowLadderStrafing=true
    // Reference: BrushComponent'Default__LadderVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionComponent=BrushComponent0
}