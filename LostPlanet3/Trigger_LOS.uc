class Trigger_LOS extends Trigger
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PCsWithLOS;

simulated event Tick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array losEvents;
    local /*0x35EA0000-0x00000000*/ private @NULL Evt, Player;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL CameraLoc, CameraRot;
    local /*0x35EA0000-0x00000000*/ private float cameraDist;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;

    // End:0x379
    if(FindEventsOfClass(Class'SeqEvent_LOS', losEvents))
    {
        // End:0x378
        foreach WorldInfo.AllControllers(Class'PlayerController', Player)
        {
            // End:0x377
            if(Player.Pawn != none)
            {
                Player.GetPlayerViewPoint(CameraLoc, CameraRot);
                cameraDist = PointDistToLine(Location, Vector(CameraRot), CameraLoc);
                Idx = 0;
                J0xE6:

                // End:0x377 [Loop If]
                if(Idx < losEvents.Length)
                {
                    Evt = SeqEvent_LOS(losEvents[Idx]);
                    // End:0x2D0
                    if((((cameraDist <= Evt.ScreenCenterDistance) && VSize(Player.Pawn.Location - Location) <= Evt.TriggerDistance) && (Normal(Location - CameraLoc) Dot Vector(CameraRot)) > 0.0000000) && !Evt.bCheckForObstructions || Player.LineOfSightTo(self, CameraLoc))
                    {
                        ActivateIndices[0] = 0;
                        // End:0x2CD
                        if((PCsWithLOS.Find(Player) == ) && )
                        {
                            losEvents[Idx].CheckActivate(self, Player.Pawn, false, ActivateIndices);                            
                            PCsWithLOS.AddItem(Player);                            
                        }                        
                    }
                    else
                    {
                        // End:0x369
                        if(PCsWithLOS.Find(Player) != )
                        {                            
                            ActivateIndices[0] = 1;
                            // End:0x369
                            if(losEvents[Idx].CheckActivate(self, Player.Pawn, false, ActivateIndices))
                            {
                                PCsWithLOS.RemoveItem(Player);                                
                            }
                        }
                    }
                    Idx++;
                    // [Loop Continue]
                    goto J0xE6;
                }
            }            
        }        
    }
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__Trigger_LOS.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: SpriteComponent'Default__Trigger_LOS.Sprite'
    begin object name=Sprite
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}