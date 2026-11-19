//////////////////////////////////////////////////////////////////////
// 12/2/13 MrD	- New MuzzleFlash to replace old staticmesh ones... //
//////////////////////////////////////////////////////////////////////
class Muzzleflash_light extends Light;


function tick(float deltatime){



  
  self.LightBrightness -= 20.0;
  if (self.LightBrightness <= 0)
     self.Destroy();

}


// Decompiled with UE Explorer.
defaultproperties
{
    bStatic=false
    bNoDelete=false
    bDynamicLight=true
    RemoteRole=2
    CollisionRadius=5.0000000
    CollisionHeight=5.0000000
    LightBrightness=128.0000000
    LightHue=42
    LightSaturation=127
    LightRadius=25.0000000
    LightPeriod=100
    bDirectional=true
}