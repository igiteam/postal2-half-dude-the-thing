class FaceFXAsset extends Object
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultSkelMesh[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FaceFXActor[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array RawFaceFXActorBytes[268566529];
var(*) /*0x35EA0000-0x00000000*/ private array RawFaceFXSessionBytes[268566529];
var(*) /*0x22270000-0x00000000*/ private editfixedsize array PreviewMorphSets[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MountedFaceFXAnimSets[536870913];
var(*) /*0x35EA0000-0x00000000*/ init private editfixedsize array ReferencedSoundCues;
var(*) /*0x35EA0000-0x00000000*/ init private editfixedsize array ReferencedAkEvents;
var(*) /*0x35EA0000-0x00000000*/ private int NumLoadErrors;

// Export UFaceFXAsset::execMountFaceFXAnimSet(FFrame&, void* const)
native final function MountFaceFXAnimSet()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSet[8388609];


}

// Export UFaceFXAsset::execUnmountFaceFXAnimSet(FFrame&, void* const)
native final function UnmountFaceFXAnimSet()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSet[8388609];


}
