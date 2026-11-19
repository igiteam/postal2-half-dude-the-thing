class LPLightningRod extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x80960000-0x00000400*/ private export @NULL LightningRodComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EditorSprite[537526273];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x41
    if(Base != none)
    {
        LightningRodComponent.MyActor = Base;
    }
    //return;    
}

event BaseChange()
{
    // End:0x3A
    if(Base != none)
    {
        LightningRodComponent.MyActor = Base;        
    }
    else
    {
        LightningRodComponent.MyActor = none;
    }
    //return;    
}

defaultproperties
{
    // Reference: LPLightningRodComponent'Default__LPLightningRod.LPLightningRodComponent0'
    begin object name=LPLightningRodComponent0 class=Class'LPLightningRodComponent'
    end object
    LightningRodComponent=LPLightningRodComponent0
    Components[0]=LPLightningRodComponent0
}