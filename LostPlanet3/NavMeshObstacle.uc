class NavMeshObstacle extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    implements(Interface_NavMeshPathObstacle);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;

    structdefaultproperties
    {
        bEnabled=false
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavMeshPathObstacle[268566529];
var(*) /*0x349E0000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x349E0000-0x00000000*/ private bool bPreserveInternalGeo[65537];

event GetObstacleBoudingShape()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Shape[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private float Scale;
    local /*0x35EA0000-0x00000000*/ private @NULL Offset;

    Scale = 200.0000000 * DrawScale;
    Offset.X = Scale * DrawScale3D.X;
    Offset.Y = Scale * DrawScale3D.Y;
    Shape.AddItem(Location + (Offset >> Rotation));    
    Offset.X = -Scale * DrawScale3D.X;
    Offset.Y = Scale * DrawScale3D.Y;
    Shape.AddItem(Location + (Offset >> Rotation));    
    Offset.X = -Scale * DrawScale3D.X;
    Offset.Y = -Scale * DrawScale3D.Y;
    Shape.AddItem(Location + (Offset >> Rotation));    
    Offset.X = Scale * DrawScale3D.X;
    Offset.Y = -Scale * DrawScale3D.Y;
    Shape.AddItem(Location + (Offset >> Rotation));    
    return true;
    //return ReturnValue;    
}

// Export UNavMeshObstacle::execRegisterObstacle(FFrame&, void* const)
native function RegisterObstacle();

// Export UNavMeshObstacle::execUnRegisterObstacle(FFrame&, void* const)
native function UnRegisterObstacle();

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x21
    if(bEnabled)
    {
        RegisterObstacle();
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    SetEnabled(bEnabled);
    //return;    
}

function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bInEnabled[8388609];

    // End:0x1A
    if(bInEnabled)
    {
        RegisterObstacle();        
    }
    else
    {
        UnRegisterObstacle();
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    SetEnabled(Record.bEnabled);
    //return;    
}

defaultproperties
{
    Components[0]=none
    // Reference: DrawBoxComponent'Default__NavMeshObstacle.DrawBox0'
    begin object name=DrawBox0 class=Class'DrawBoxComponent'
    end object
    Components[1]=DrawBox0
}