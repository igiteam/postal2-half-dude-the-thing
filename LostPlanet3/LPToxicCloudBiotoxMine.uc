class LPToxicCloudBiotoxMine extends LPToxicCloud
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

function InitCloudParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL Totem;

    Totem = LPTotemBiotoxMine(Owner);
    // End:0x2A4
    if(Totem != none)
    {
        DamageUpdateRate = Totem.BiotoxTuneData.DamageUpdateRate;
        DamageInitialDelay = Totem.BiotoxTuneData.DamageInitialDelay;
        bDamageIncappedEnemies = Totem.BiotoxTuneData.bDamageIncappedEnemies;
        CloudMaxHeight = Totem.BiotoxTuneData.CloudHeight;
        CloudMaxRadius = Totem.BiotoxTuneData.CloudRadius.GetValue(Totem.Perk.MyPlayerController);
        CloudDuration = Totem.BiotoxTuneData.CloudDuration.GetValue(Totem.Perk.MyPlayerController);
        CloudSound = Totem.BiotoxTuneData.CloudSound;
        DamageAmount = 25.0000000 * DamageUpdateRate;
        DissipateTime = 5.0000000;
        SmokeLifespan = 5.0000000;
    }
    //return;    
}

defaultproperties
{
    DamageType=Class'LPDamageTypeBiotoxMine'
    bDamageInstigator=true
    // Reference: SPDrawCylinderComponent'Default__LPToxicCloudBiotoxMine.DrawCylinderObj'
    begin object name=DrawCylinderObj
    end object
    DrawCylinder=DrawCylinderObj
}