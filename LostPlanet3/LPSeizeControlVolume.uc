class LPSeizeControlVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyObjective;

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x52
    if(MyObjective != none)
    {
        MyObjective.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    // End:0x37
    if(MyObjective != none)
    {
        MyObjective.UnTouch(Other);
    }
    //return;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__LPSeizeControlVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}