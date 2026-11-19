class AnimNodeFrame extends AnimObject
    hidecategories(Object);

var(*) /*0x02D90000-0x00000000*/ private int SizeX[65537];
var(*) /*0x02D90000-0x00000000*/ private int SizeY[65537];
var(*) /*0x02D90000-0x00000000*/ private int BorderWidth[65537];
var(*) /*0x02D90000-0x00000000*/ private bool bDrawBox[65537];
var(*) /*0x02D90000-0x00000000*/ private bool bFilled[65537];
var(*) /*0x02D90000-0x00000000*/ private bool bTileFill[65537];
var(*) /*0x02D90000-0x00000000*/ private @NULL BorderColor[65537];
var(*) /*0x02D90000-0x00000000*/ private @NULL FillColor[65537];
var(*) /*0x02D90000-0x00000000*/ private @NULL FillTexture[65537];
var(*) /*0x02D90000-0x00000000*/ private @NULL FillMaterial[65537];
var(*) /*0x02D90000-0x00000000*/ private editfixedsize string ObjComment[65537];

defaultproperties
{
    SizeX=128
    SizeY=64
    BorderWidth=1
    bDrawBox=true
    bFilled=true
    BorderColor=(R=0,G=0,B=0,A=255)
    FillColor=(R=255,G=255,B=255,A=16)
}