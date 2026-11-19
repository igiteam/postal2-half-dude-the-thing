class DynamicPylon extends Pylon
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Lighting,LightColor,Force);

var(*) /*0x35EA0000-0x00000000*/ private bool bMoving;

function PostBeginPlay()
{
    super.PostBeginPlay();
    RebuildDynamicEdges();
    //return;    
}

// Export UDynamicPylon::execRebuildDynamicEdges(FFrame&, void* const)
native function RebuildDynamicEdges();

// Export UDynamicPylon::execFlushDynamicEdges(FFrame&, void* const)
native function FlushDynamicEdges();

event StartedMoving()
{
    bMoving = true;
    FlushDynamicEdges();
    //return;    
}

event StoppedMoving()
{
    bMoving = false;
    RebuildDynamicEdges();
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__DynamicPylon.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=none
    Components[6]=none
    Components[7]=none
    bStatic=false
    CollisionComponent=CollisionCylinder
}