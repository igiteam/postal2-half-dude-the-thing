class Note extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36040000-0x00000000*/ init private editfixedsize string Text[65537];

defaultproperties
{
    Components[0]=none
    Components[1]=none
    bStatic=true
    bHidden=true
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bMovable=false
}