class KynapseObstacleComponent extends ActorComponent
    collapsecategories
    hidecategories(Object);

enum EObstacleType
{
    EOT_All,                        // 0
    EOT_Box,                        // 1
    EOT_Barrel,                     // 2
    EOT_Rock,                       // 3
    EOT_Smoke,                      // 4
    EOT_DestructibleCover_Small,    // 5
    EOT_DestructibleCover_Large,    // 6
    EOT_FrozenAkrid_Small,          // 7
    EOT_FrozenAkrid_Large,          // 8
    EOT_MAX                         // 9
};

struct native ObstacleData
{
    var(*) /*0x35EA0000-0x00000010*/ private @NULL ShapePolyline[536870913];
    var(*) /*0x35EA0000-0x00000010*/ private @NULL KynapseObstacle[536870913];

    structdefaultproperties
    {
        ShapePolyline=none
        KynapseObstacle=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ObstacleDataArray[537001985];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL StaticMeshComponent[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL ObstacleBrushComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL obstacleRotation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL obstacleTranslation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float obstacleScale[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL obstacleScale3D[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsFracturedMesh;
var(*) /*0x2D850000-0x00000000*/ private byte ObstacleType[65537];
