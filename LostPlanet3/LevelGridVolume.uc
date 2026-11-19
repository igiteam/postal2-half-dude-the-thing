class LevelGridVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume,Physics,Location)
    autoexpandcategories(LevelGridVolume);

enum LevelGridCellShape
{
    LGCS_Box,                       // 0
    LGCS_Hex,                       // 1
    LGCS_MAX                        // 2
};

struct native LevelGridCellCoordinate
{
    var(*) /*0x35EA0000-0x00000000*/ private int X;
    var(*) /*0x35EA0000-0x00000000*/ private int Y;
    var(*) /*0x35EA0000-0x00000000*/ private int Z;

    structdefaultproperties
    {
        X=0
        Y=0
        Z=0
    }
};

var(*) /*0x2E640000-0x00000000*/ private editfixedsize string LevelGridVolumeName[196609];
var(*) /*0x2E640000-0x00000000*/ private byte CellShape[196609];
var(*) /*0x2E640000-0x00000000*/ private int Subdivisions[196611];
var(*) /*0x2E640000-0x00000000*/ private float LoadingDistance[196609];
var(*) /*0x2E640000-0x00000000*/ private float KeepLoadedRange[196609];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL CellConvexElem[537001985];

defaultproperties
{
    Subdivisions[0]=1
    Subdivisions[1]=1
    Subdivisions[2]=1
    LoadingDistance=20480.0000000
    KeepLoadedRange=2048.0000000
    BrushColor=(R=80,G=80,B=80,A=255)
    bColored=true
    // Reference: BrushComponent'Default__LevelGridVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=none
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}