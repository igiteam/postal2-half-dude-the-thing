//=============================================================================
// A sticky note.  Level designers can place these in the level and then
// view them as a batch in the error/warnings window.
//=============================================================================
class Note extends Actor
	placeable
	native
	hidecategories(Movement,Collision,Force,Karma,LightColor,Lighting,Shadow,Sound);

#exec Texture Import File=Textures\Notes.bmp  Name=S_Note Mips=Off MASKED=1

var() string Text;			// Note text
var() enum ENoteDisplay
{
	ND_Never,
	ND_Selected,
	ND_Always
} DisplayInEditor;			// When we should display note text in editor
var() Color TextColor;		// Color to draw note text in
var() enum EFontSize
{
	FONT_Small,
	FONT_Medium,
	FONT_Large,
	FONT_Huge
} FontSize;					// Size to display text


// Decompiled with UE Explorer.
defaultproperties
{
    DisplayInEditor=1
    TextColor=(R=255,G=255,B=255,A=255)
    FontSize=1
    bStatic=true
    bHidden=true
    bNoDelete=true
    Texture=Texture'S_Note'
    DrawScale=0.1500000
    bMovable=false
}