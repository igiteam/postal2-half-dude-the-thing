class LPToxicCloudBiotoxGrenade extends LPToxicCloud
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

function InitCloudParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL BiotoxTuneData, GLauncherOwner, AkridOwner;

    GLauncherOwner = LPProj_GLauncherBiotox(Owner);
    // End:0x1BD
    if(GLauncherOwner != none)
    {
        BiotoxTuneData = LPTuneDataBiotoxGrenade(GLauncherOwner.TuneDataGrenade);
        // End:0x1BA
        if(BiotoxTuneData != none)
        {
            DamageUpdateRate = BiotoxTuneData.DamageUpdateRate;
            DamageInitialDelay = BiotoxTuneData.DamageInitialDelay;
            DamageAmount = BiotoxTuneData.DamagePerSecond * DamageUpdateRate;
            bDamageIncappedEnemies = BiotoxTuneData.bDamageIncappedEnemies;
            bDamageInstigator = BiotoxTuneData.bDamageInstigator;
            CloudMaxHeight = BiotoxTuneData.CloudHeight;
            CloudMaxRadius = BiotoxTuneData.CloudRadius;
            CloudDuration = BiotoxTuneData.CloudDuration;
        }        
    }
    else
    {
        AkridOwner = LPProj_AkridBase(Owner);
        // End:0x208
        if(AkridOwner != none)
        {
            AkridOwner.UpdateCloudParams(self);
        }
    }
    //return;    
}

defaultproperties
{
    DamageType=Class'LPDamageTypeBiotoxGrenade'
    // Reference: SPDrawCylinderComponent'Default__LPToxicCloudBiotoxGrenade.DrawCylinderObj'
    begin object name=DrawCylinderObj
    end object
    DrawCylinder=DrawCylinderObj
}