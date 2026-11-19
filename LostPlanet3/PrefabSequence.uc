class PrefabSequence extends Sequence
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL OwnerPrefab;

// Export UPrefabSequence::execSetOwnerPrefab(FFrame&, void* const)
native final function SetOwnerPrefab()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InOwner[8388609];


}

// Export UPrefabSequence::execGetOwnerPrefab(FFrame&, void* const)
native final function GetOwnerPrefab()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    ObjName="PrefabSequence"
    bDeletable=false
}