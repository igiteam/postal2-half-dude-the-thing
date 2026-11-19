class BlockingVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(*) /*0x0A250000-0x00000000*/ private bool bBlockCamera[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bForcedBlockAIs[65537];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x5A
    if(Action.InputLinks[0].bHasImpulse)
    {
        CollisionComponent.SetBlockRigidBody(true);        
    }
    else
    {
        // End:0xB4
        if(Action.InputLinks[1].bHasImpulse)
        {
            CollisionComponent.SetBlockRigidBody(false);            
        }
        else
        {
            // End:0x12C
            if(Action.InputLinks[2].bHasImpulse)
            {
                CollisionComponent.SetBlockRigidBody(!CollisionComponent.BlockRigidBody);
            }
        }
    }
    super.OnToggle(Action);
    //return;    
}

defaultproperties
{
    bBlockCamera=true
    // Reference: BrushComponent'Default__BlockingVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bWorldGeometry=true
    bMovable=false
    bBlockActors=true
    CollisionComponent=BrushComponent0
}