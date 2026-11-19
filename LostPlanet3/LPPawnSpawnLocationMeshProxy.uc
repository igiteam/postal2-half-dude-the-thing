class LPPawnSpawnLocationMeshProxy extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PreviewSkelMesh[524289];
var(0.25_Pct) /*0x81650000-0x00000000*/ private @NULL SpawnOffset[65537];
var(0.25_Pct) /*0x81650000-0x00000000*/ private @NULL SpawnRotation[65537];

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPPawnSpawnLocationMeshProxy.ProxyMesh0'
    begin object name=ProxyMesh0 class=Class'Engine.SkeletalMeshComponent'
    end object
    Components[0]=ProxyMesh0
    Components[1]=none
    bHidden=true
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bAlwaysRelevant=true
    bReplicateInstigator=true
    bGameRelevant=true
    bMovable=false
    bCollideActors=true
}