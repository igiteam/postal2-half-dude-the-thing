class LPToxicCloudNoxiousDemise extends LPToxicCloud
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

function InitCloudParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPPC, Perk;

    LPP = LPPlayerPawn(Instigator);
    // End:0x381
    if(LPP != none)
    {
        Perk = LPPerkNoxiousDemise(LPP.GetEnabledPerk(13));
        // End:0x381
        if(Perk != none)
        {
            LPPC = LPPlayerController(LPP.Controller);
            DamageUpdateRate = Perk.NoxiousTuneData.DamageUpdateRate;
            DamageInitialDelay = Perk.NoxiousTuneData.DamageInitialDelay;
            bDamageIncappedEnemies = Perk.NoxiousTuneData.bDamageIncappedEnemies;
            CloudMaxHeight = Perk.NoxiousTuneData.CloudHeight;
            CloudMaxRadius = Perk.NoxiousTuneData.CloudRadius.GetValue(LPPC);
            CloudDuration = Perk.NoxiousTuneData.CloudDuration.GetValue(LPPC);
            bDebugDrawDamageRadius = Perk.NoxiousTuneData.bDebugDrawDamageRadius;
            SmokeLifespan = Perk.NoxiousTuneData.SmokeLifespan;
            CloudSound = Perk.NoxiousTuneData.ActivateSound;
            DamageAmount = ((LPPC.IsUnlockedMP('NoxiousDemise_Toxicity')) ? 25.0000000 : 15.0000000) * DamageUpdateRate;
            DissipateTime = 2.0000000;
            CloudParticleBaseRadius = 210.0000000;
            CloudParticleBaseHeight = 70.0000000;
        }
    }
    //return;    
}

defaultproperties
{
    DamageType=Class'LPDamageTypeNoxiousDemise'
    // Reference: SPDrawCylinderComponent'Default__LPToxicCloudNoxiousDemise.DrawCylinderObj'
    begin object name=DrawCylinderObj
    end object
    DrawCylinder=DrawCylinderObj
}