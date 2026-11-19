class LPTuneDataTotem extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA7890000-0x00000000*/ private bool bDrawDebugExplosionRadius[65537];
var(0.25_Pct) /*0xA7890000-0x00000000*/ private int MineHealth[65537];
var(0.25_Pct) /*0xA7890000-0x00000000*/ private int MineSinkDepth[65537];
var(0.25_Pct) /*0xA7890000-0x00000000*/ private int MineSinkRate[65537];
var(0.25_Pct) /*0xA7890000-0x00000000*/ private float MineRadius[65537];

defaultproperties
{
    bDrawDebugExplosionRadius=true
    MineHealth=100
    MineSinkDepth=15
    MineSinkRate=20
    MineRadius=30.0000000
}