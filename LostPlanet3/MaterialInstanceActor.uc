class MaterialInstanceActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation,Movement,Advanced,Collision,Display,Actor,Attachment);

var(*) /*0x310C0000-0x00000000*/ private @NULL MatInst[65537];

defaultproperties
{
    Components[0]=none
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bNoDelete=true
}