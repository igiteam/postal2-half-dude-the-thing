class TriggerStreamingLevel extends Trigger
    placeable
    hidecategories(AnimDependency,Navigation);

struct LevelStreamingData
{
    var(*) /*0x2E790000-0x00000000*/ private bool bShouldBeLoaded[65537];
    var(*) /*0x2E790000-0x00000000*/ private bool bShouldBeVisible[65537];
    var(*) /*0x2E790000-0x00000000*/ private bool bShouldBlockOnLoad[65537];
    var(*) /*0x2E790000-0x00000000*/ private @NULL Level[65537];

    structdefaultproperties
    {
        bShouldBeLoaded=false
        bShouldBeVisible=false
        bShouldBlockOnLoad=false
        Level=none
    }
};

var(*) /*0x4DD10000-0x00000400*/ private editfixedsize array Levels[65537];

event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, PlayerCon;

    local /*0x35EA0000-0x00000000*/ private int Index;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    Index = 0;
    J0x39:

    // End:0x1B3 [Loop If]
    if(Index < Levels.Length)
    {
        // End:0x1A4
        foreach WorldInfo.AllControllers(Class'PlayerController', PlayerCon)
        {
            Levels[Index].Level.bShouldBlockOnLoad = Levels[Index].bShouldBlockOnLoad;
            PlayerCon.LevelStreamingStatusChanged(Levels[Index].Level, Levels[Index].bShouldBeLoaded, Levels[Index].bShouldBeVisible, Levels[Index].bShouldBlockOnLoad);            
        }        
        Index++;
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__TriggerStreamingLevel.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: SpriteComponent'Default__TriggerStreamingLevel.Sprite'
    begin object name=Sprite
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}