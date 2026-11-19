class KynapseWorld extends KynapseObject
    hidecategories(Object,Object)
    autoexpandcategories(KynapseWorld);

var(accidentRatio) /*0x01BE0000-0x00000000*/ private float OneMeter[65537];
var(accidentRatio) /*0x01BE0000-0x00000000*/ private int MaxAperiodicTask[65537];
var(accidentRatio) /*0x01BE0000-0x00000000*/ private int MaxPeriodicTask[65537];
var(accidentRatio) /*0x01BE0000-0x00000000*/ private float GlobalTpf[65537];
var(accidentRatio) /*0x01BE0000-0x00000000*/ private bool HasConnectivityGraph[65537];
var(accidentRatio) /*0x01BE0000-0x00000000*/ private bool HasObstacleManagement[65537];
var(accidentRatio) /*0x01BE0000-0x00000000*/ private editfixedsize array PathdataFamilies[65537];
var(accidentRatio) /*0x01BE0000-0x00000400*/ private editfixedsize array WorldServices[589825];

defaultproperties
{
    OneMeter=100.0000000
    MaxAperiodicTask=64
    MaxPeriodicTask=64
    GlobalTpf=0.0050000
    HasConnectivityGraph=true
    HasObstacleManagement=true
    WorldServices=/* Array type was not detected. */
}