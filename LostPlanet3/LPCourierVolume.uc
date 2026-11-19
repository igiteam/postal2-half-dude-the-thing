class LPCourierVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPCI, LPP;

    local /*0x97E50000-0x00000000*/ private bool bTouchedByCarrier;

    bTouchedByCarrier = false;
    LPP = LPPawn(Other);
    // End:0x71
    if(LPP != none)
    {
        // End:0x70
        foreach LPP.CourierItems(LPCI)
        {
            bTouchedByCarrier = true;            
        }        
    }
    // End:0x9D
    if(bTouchedByCarrier)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveTouched', Other);
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPCI, LPP;
    local /*0x97E50000-0x00000000*/ private bool bUnTouchedByCarrier;

    bUnTouchedByCarrier = false;
    LPP = LPPawn(Other);
    // End:0x91
    if(LPP != none)
    {
        // End:0x90
        foreach LPP.CourierItems(LPCI)
        {
            LPCI.UnTouchedDestination(self);
            bUnTouchedByCarrier = true;            
        }        
    }
    // End:0xBD
    if(bUnTouchedByCarrier)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveUntouched', Other);
    }
    //return;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__LPCourierVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}