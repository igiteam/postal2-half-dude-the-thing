class AnimNodeBlendDirectional extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

var(*) /*0x02D40000-0x00000000*/ private float DirDegreesPerSecond[65537];
var(*) /*0x35EA0000-0x00000000*/ private float DirAngle;
var(*) /*0x02D40000-0x00000000*/ private int SingleAnimAtOrAboveLOD[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RotationOffset;
var(*) /*0x02D40000-0x00000000*/ private bool bUseAcceleration[65537];

defaultproperties
{
    DirDegreesPerSecond=360.0000000
    SingleAnimAtOrAboveLOD=1000
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}