class ParticleLODLevel extends Object
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private int Level[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;
var(*) /*0x35EA0000-0x00000000*/ private bool ConvertedModules;
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL RequiredModule[524289];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array Modules[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TypeDataModule[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SpawnModule[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL EventGenerator[524289];
var(*) /*0x35EA0000-0x00000000*/ private array SpawningModules[268435457];
var(*) /*0x35EA0000-0x00000000*/ private array SpawnModules[268435457];
var(*) /*0x35EA0000-0x00000000*/ private array UpdateModules[268435457];
var(*) /*0x35EA0000-0x00000000*/ private array OrbitModules[268435457];
var(*) /*0x35EA0000-0x00000000*/ private array EventReceiverModules[268435457];
var(*) /*0x35EA0000-0x00000000*/ private int PeakActiveParticles;

defaultproperties
{
    bEnabled=true
    ConvertedModules=true
}