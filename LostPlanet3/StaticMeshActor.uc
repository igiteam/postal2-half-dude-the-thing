class StaticMeshActor extends StaticMeshActorBase
    placeable
    hidecategories(AnimDependency,Navigation);

struct native PreCombinedStaticMeshActor
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Mesh;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PrePivot;
    var(*) /*0x35EA0000-0x00000000*/ private float DrawScale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL DrawScale3D;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ComponentScale3D;

    structdefaultproperties
    {
        Mesh=none
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        PrePivot=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DrawScale=0.0000000
        DrawScale3D=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ComponentScale3D=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x4A210000-0x00000400*/ private const export @NULL StaticMeshComponent[720897];
var(*) /*0x4A220000-0x00000000*/ private bool bDisableAutoBaseOnProcBuilding[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bProxy;
var(*) /*0x35EA0000-0x00000000*/ private bool bHiddenByProxy;
var(*) /*0x35EA0000-0x00000000*/ private bool OldCastShadow;
var(*) /*0x35EA0000-0x00000000*/ private bool OldAcceptsLights;
var(*) /*0x2D730000-0x00000000*/ private bool IgnoreDuringMapSizing[65537];
var(*) /*0x14820000-0x00000000*/ private bool bIgnoreCookOut[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte OldCollisionType;
var(*) /*0x4A220000-0x00000000*/ private editfixedsize array PreCombinedStaticMeshActors[65537];

event PreBeginPlay()
{
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__StaticMeshActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0 class=Class'StaticMeshComponent'
    end object
    StaticMeshComponent=StaticMeshComponent0
    Components[0]=StaticMeshComponent0
    CollisionComponent=StaticMeshComponent0
}