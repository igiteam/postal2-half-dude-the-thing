class Teleporter extends NavigationPoint
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(*) /*0x4BB80000-0x00000000*/ private editfixedsize string URL[2162689];
var(*) /*0x4BB80000-0x00000000*/ private name ProductRequired[65537];
var(*) /*0x4BB80000-0x00000000*/ private bool bChangesVelocity[2162689];
var(*) /*0x4BB80000-0x00000000*/ private bool bChangesYaw[2162689];
var(*) /*0x4BB80000-0x00000000*/ private bool bReversesX[2162689];
var(*) /*0x4BB80000-0x00000000*/ private bool bReversesY[2162689];
var(*) /*0x4BB80000-0x00000000*/ private bool bReversesZ[2162689];
var(*) /*0x4BB80000-0x00000000*/ private bool bEnabled[2162689];
var(*) /*0x4BB80000-0x00000000*/ private bool bCanTeleportVehicles[65537];
var(*) /*0x4BB80000-0x00000000*/ private @NULL TargetVelocity[2162689];
var(*) /*0x35EA0000-0x00000000*/ private float LastFired;

// Export UTeleporter::execCanTeleport(FFrame&, void* const)
native function CanTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PostBeginPlay()
{
    // End:0x16
    if(URL ~= "")
    {
        SetCollision(false, false);
    }
    super(Actor).PostBeginPlay();
    //return;    
}

simulated event Accept()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Incoming[8388609], Source;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL NewRot, oldRot;
    local /*0x35EA0000-0x00000000*/ private float Mag;
    local /*0x35EA0000-0x00000000*/ private @NULL oldDir, C;

    // End:0x11
    if(Incoming == none)
    {
        return false;
    }
    Disable('Touch');
    NewRot = Incoming.Rotation;
    // End:0x14A
    if(bChangesYaw)
    {
        oldRot = Incoming.Rotation;
        NewRot.Yaw = Rotation.Yaw;
        // End:0x14A
        if(Source != none)
        {
            NewRot.Yaw += ((32768 + Incoming.Rotation.Yaw) - Source.Rotation.Yaw);
        }
    }
    // End:0x42F
    if(Pawn(Incoming) != none)
    {
        // End:0x1F7
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x1F6
            foreach WorldInfo.AllControllers(Class'Controller', C)
            {
                // End:0x1F5
                if(C.Enemy == Incoming)
                {
                    C.EnemyJustTeleported();
                }                
            }            
        }
        // End:0x228
        if(!Pawn(Incoming).SetLocation(Location))
        {
            return false;
        }
        // End:0x34A
        if((int(Role) == int(ROLE_Authority)) || (WorldInfo.TimeSeconds - LastFired) > 0.5000000)
        {
            NewRot.Roll = 0;
            Pawn(Incoming).SetRotation(NewRot);
            Pawn(Incoming).SetViewRotation(NewRot);
            Pawn(Incoming).ClientSetRotation(NewRot);
            LastFired = WorldInfo.TimeSeconds;
        }
        // End:0x40B
        if(Pawn(Incoming).Controller != none)
        {
            Pawn(Incoming).Controller.MoveTimer = -1.0000000;
            Pawn(Incoming).SetAnchor(self);
            Pawn(Incoming).SetMoveTarget(self);
        }
        Incoming.PlayTeleportEffect(false, true);        
    }
    else
    {
        // End:0x462
        if(!Incoming.SetLocation(Location))
        {
            Enable('Touch');
            return false;
        }
        // End:0x497
        if(bChangesYaw)
        {
            Incoming.SetRotation(NewRot);
        }
    }
    Enable('Touch');
    // End:0x4DA
    if(bChangesVelocity)
    {
        Incoming.Velocity = TargetVelocity;        
    }
    else
    {
        // End:0x5F6
        if(bChangesYaw)
        {
            // End:0x52E
            if(int(Incoming.Physics) == int(1))
            {
                oldRot.Pitch = 0;
            }
            oldDir = Vector(oldRot);
            Mag = Incoming.Velocity Dot oldDir;
            Incoming.Velocity = (Incoming.Velocity - (Mag * oldDir)) + (Mag * Vector(Incoming.Rotation));
        }
        // End:0x63B
        if(bReversesX)
        {
            Incoming.Velocity.X *= -1.0000000;
        }
        // End:0x680
        if(bReversesY)
        {
            Incoming.Velocity.Y *= -1.0000000;
        }
        // End:0x6C5
        if(bReversesZ)
        {
            Incoming.Velocity.Z *= -1.0000000;
        }
    }
    Incoming.PostTeleport(self);
    return true;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x22
    if(!bEnabled || Other == none)
    {
        return;
    }
    // End:0xA7
    if((CanTeleport(Other)) && !Other.PreTeleport(self))
    {
        PendingTouch = Other.PendingTouch;
        Other.PendingTouch = self;
    }
    //return;    
}

simulated event PostTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], D, Dest;
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0xFC
    if((InStr(URL, "/") >= 0) || InStr(URL, "#") >= 0)
    {
        // End:0xF9
        if(((int(Role) == int(ROLE_Authority)) && Pawn(Other) != none) && Pawn(Other).IsHumanControlled())
        {
            WorldInfo.Game.SendPlayer(PlayerController(Pawn(Other).Controller), URL);
        }        
    }
    else
    {
        // End:0x190
        foreach AllActors(Class'Teleporter', D)
        {
            // End:0x18F
            if((string(D.Tag) ~= URL) && D != self)
            {
                Dest[I] = D;
                I++;
                // End:0x18F
                if(I > 16)
                {
                    // End:0x190
                    break;
                }
            }            
        }        
        I = Rand(I);
        // End:0x236
        if(Dest[I] != none)
        {
            // End:0x203
            if(Other.IsA('Pawn'))
            {
                Other.PlayTeleportEffect(true, true);
            }
            Dest[I].Accept(Other, self);
        }
    }
    //return;    
}

event SpecialHandling()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], ReturnValue;

    // End:0x116
    if(((bEnabled && Other.Controller.RouteCache.Length > 1) && Teleporter(Other.Controller.RouteCache[1]) != none) && string(Other.Controller.RouteCache[1].Tag) ~= URL)
    {
        // End:0x114
        if(IsOverlapping(Other))
        {
            PostTouch(Other);
        }
        return self;
    }
    return none;
    //return ReturnValue;    
}

defaultproperties
{
    bChangesYaw=true
    bEnabled=true
    // Reference: CylinderComponent'Default__Teleporter.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bCollideActors=true
    CollisionComponent=CollisionCylinder
}