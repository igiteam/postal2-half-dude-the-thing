class DecalActorBase extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation)
    classgroup(Decals)
    implements(EditorLinkSelectionInterface);

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IEditorLinkSelectionInterface[268566529];
var(*) /*0x16540000-0x00000400*/ private const export @NULL Decal[720897];

defaultproperties
{
    // Reference: DecalComponent'Default__DecalActorBase.NewDecalComponent'
    begin object name=NewDecalComponent class=Class'DecalComponent'
    end object
    Decal=NewDecalComponent
    Components[0]=NewDecalComponent
    Components[1]=none
    Components[2]=none
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=true
    bMovable=false
}