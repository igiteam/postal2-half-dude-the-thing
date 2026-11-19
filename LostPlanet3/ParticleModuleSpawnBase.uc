class ParticleModuleSpawnBase extends ParticleModule
    abstract
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x48AF0000-0x00000000*/ private bool bProcessSpawnRate[65537];
var(*) /*0x0F250000-0x00000000*/ private bool bProcessBurstList[65537];

defaultproperties
{
    bProcessSpawnRate=true
    bProcessBurstList=true
}