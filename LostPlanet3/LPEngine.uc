class LPEngine extends SPEngine
    transient
    config(Engine);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MPMapPrefixes[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentLoadMapName[131073];

defaultproperties
{
    MPMapPrefixes=/* Array type was not detected. */
    DefaultMaterial=Material'EngineMaterials.DefaultMaterial'
}