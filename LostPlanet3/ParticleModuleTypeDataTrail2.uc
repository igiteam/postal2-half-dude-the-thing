class ParticleModuleTypeDataTrail2 extends ParticleModuleTypeDataBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x4D6C0000-0x00000000*/ private int TessellationFactor[65537];
var(*) /*0x35EA0000-0x00000000*/ private float TessellationFactorDistance;
var(*) /*0x4D6C0000-0x00000000*/ private float TessellationStrength[65537];
var(*) /*0x4D6C0000-0x00000000*/ private int TextureTile[65537];
var(*) /*0x35EA0000-0x00000000*/ private int Sheets;
var(*) /*0x4D6C0000-0x00000000*/ private int MaxTrailCount[65537];
var(*) /*0x4D6C0000-0x00000000*/ private int MaxParticleInTrailCount[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bClipSourceSegement[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bClearTangents[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderGeometry[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderDirectLine[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderLines[65537];
var(*) /*0x41420000-0x00000000*/ private bool RenderTessellation[65537];

defaultproperties
{
    TessellationFactor=1
    TessellationStrength=25.0000000
    TextureTile=1
    Sheets=1
    MaxTrailCount=1
    bClearTangents=true
    RenderGeometry=true
}