//=============================================================================
// The brush class.
// This is a built-in Unreal class and it shouldn't be modified.
//=============================================================================
class Brush extends Actor
	native;

//-----------------------------------------------------------------------------
// Variables.

// CSG operation performed in editor.
var() enum ECsgOper
{
	CSG_Active,			// Active brush.
	CSG_Add,			// Add to world.
	CSG_Subtract,		// Subtract from world.
	CSG_Intersect,		// Form from intersection with world.
	CSG_Deintersect,	// Form from negative intersection with world.
} CsgOper;

// Outdated.
var const object UnusedLightMesh;
var vector  PostPivot;

// Scaling.
// Outdated : these are only here to allow the "ucc mapconvert" commandlet to work.
//            They are NOT used by the engine/editor for anything else.
var scale MainScale;
var scale PostScale;
var scale TempScale;

// Information.
var() color BrushColor;
var() int	PolyFlags;
var() bool  bColored;


// Decompiled with UE Explorer.
defaultproperties
{
    MainScale=(Scale=(X=1.0000000,Y=1.0000000,Z=1.0000000))
    PostScale=(Scale=(X=1.0000000,Y=1.0000000,Z=1.0000000))
    TempScale=(Scale=(X=1.0000000,Y=1.0000000,Z=1.0000000))
    bStatic=true
    bHidden=true
    bNoDelete=true
    DrawType=3
    bFixedRotationDir=true
    bEdShouldSnap=true
}