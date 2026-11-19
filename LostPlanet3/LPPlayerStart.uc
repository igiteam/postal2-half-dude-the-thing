class LPPlayerStart extends SPPlayerStart
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Collision,Collision,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SpawnVolumes;
var(0.25_Pct) /*0x81C10000-0x00000000*/ private bool bConsiderDisabledForEnemies[65537];

simulated function AddSpawnVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL SV[8388609];

    // End:0x32
    if(SpawnVolumes.Find(SV) < )
    {        
        SpawnVolumes.AddItem(SV);        
    }
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__LPPlayerStart.CollisionCylinder'
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