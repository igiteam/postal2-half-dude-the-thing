//=============================================================================
// The light class.
//=============================================================================
class Light extends Actor
	hidecategories(Collision,Force,Karma,Shadow,Sound)
	placeable
	native;

#exec Texture Import File=Textures\light.bmp  Name=S_Light Mips=Off MASKED=1

var (Corona)	float	MinCoronaSize;
var (Corona)	float	MaxCoronaSize;


// Decompiled with UE Explorer.
defaultproperties
{
    MaxCoronaSize=1000.0000000
    bStatic=true
    bHidden=true
    bNoDelete=true
    Texture=Texture'S_Light'
    DrawScale=0.1250000
    bMovable=false
    CollisionRadius=24.0000000
    CollisionHeight=24.0000000
    LightType=1
    LightBrightness=64.0000000
    LightSaturation=255
    LightRadius=64.0000000
    LightPeriod=32
    LightCone=128
}