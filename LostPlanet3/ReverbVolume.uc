class ReverbVolume extends Volume
    placeable
    dontsortcategories(ReverbVolume)
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume,Toggle);

enum ReverbPreset
{
    REVERB_Default,                 // 0
    REVERB_Bathroom,                // 1
    REVERB_StoneRoom,               // 2
    REVERB_Auditorium,              // 3
    REVERB_ConcertHall,             // 4
    REVERB_Cave,                    // 5
    REVERB_Hallway,                 // 6
    REVERB_StoneCorridor,           // 7
    REVERB_Alley,                   // 8
    REVERB_Forest,                  // 9
    REVERB_City,                    // 10
    REVERB_Mountains,               // 11
    REVERB_Quarry,                  // 12
    REVERB_Plain,                   // 13
    REVERB_ParkingLot,              // 14
    REVERB_SewerPipe,               // 15
    REVERB_Underwater,              // 16
    REVERB_SmallRoom,               // 17
    REVERB_MediumRoom,              // 18
    REVERB_LargeRoom,               // 19
    REVERB_MediumHall,              // 20
    REVERB_LargeHall,               // 21
    REVERB_Plate,                   // 22
    REVERB_MAX                      // 23
};

struct native ReverbSettings
{
    var(*) /*0x41F20000-0x00000000*/ private bool bApplyReverb[65537];
    var(*) /*0x41F20000-0x00000000*/ private byte ReverbType[65537];
    var(*) /*0x41F20000-0x00000000*/ private float Volume[65537];
    var(*) /*0x41F20000-0x00000000*/ private float FadeTime[65537];

    structdefaultproperties
    {
        bApplyReverb=true
        ReverbType=ReverbPreset.REVERB_Default
        Volume=0.5000000
        FadeTime=2.0000000
    }
};

struct InteriorSettings
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsWorldInfo;
    var(*) /*0x2B720000-0x00000000*/ private float ExteriorVolume[65537];
    var(*) /*0x2B720000-0x00000000*/ private float ExteriorTime[65537];
    var(*) /*0x2B720000-0x00000000*/ private float ExteriorLPF[65537];
    var(*) /*0x2B720000-0x00000000*/ private float ExteriorLPFTime[65537];
    var(*) /*0x2B720000-0x00000000*/ private float InteriorVolume[65537];
    var(*) /*0x2B720000-0x00000000*/ private float InteriorTime[65537];
    var(*) /*0x2B720000-0x00000000*/ private float InteriorLPF[65537];
    var(*) /*0x2B720000-0x00000000*/ private float InteriorLPFTime[65537];

    structdefaultproperties
    {
        bIsWorldInfo=false
        ExteriorVolume=1.0000000
        ExteriorTime=0.5000000
        ExteriorLPF=1.0000000
        ExteriorLPFTime=0.5000000
        InteriorVolume=1.0000000
        InteriorTime=0.5000000
        InteriorLPF=1.0000000
        InteriorLPFTime=0.5000000
    }
};

var(*) /*0x41F40000-0x00000000*/ private float Priority[65537];
var(*) /*0x4CFC0000-0x00000000*/ private bool bEnabled[2162689];
var(*) /*0x41F40000-0x00000000*/ private @NULL Settings[65537];
var(*) /*0x41F40000-0x00000000*/ private @NULL AmbientZoneSettings[65537];
var(*) /*0x35EA0000-0x00000100*/ private @NULL NextLowerPriorityVolume[537001985];

defaultproperties
{
    bEnabled=true
    Settings=(bApplyReverb=true,ReverbType=ReverbPreset.REVERB_Default,Volume=0.5000000,FadeTime=2.0000000)
    AmbientZoneSettings=(bIsWorldInfo=false,ExteriorVolume=1.0000000,ExteriorTime=0.5000000,ExteriorLPF=1.0000000,ExteriorLPFTime=0.5000000,InteriorVolume=1.0000000,InteriorTime=0.5000000,InteriorLPF=1.0000000,InteriorLPFTime=0.5000000)
    BrushColor=(R=255,G=255,B=0,A=255)
    bColored=true
    // Reference: BrushComponent'Default__ReverbVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}