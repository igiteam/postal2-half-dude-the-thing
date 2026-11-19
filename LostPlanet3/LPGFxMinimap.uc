class LPGFxMinimap extends LPGFxMap within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CompassIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TerrainContainerMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TerrainMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NorthIcon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapCenter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapWorldWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapWorldHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapScaleX;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapScaleY;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapMCWidth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapMCHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapSavedScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapInfoInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapXRotation[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentPlayerMapIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MapScaleOverride;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super.Init();
    PlayerIcon = GetObject("player");
    CompassIcon = GetObject("compass");
    MapMC = GetObject("map");
    TerrainContainerMC = GetObject("terrain");
    NorthIcon = GetObject("north");
    MapScaleOverride = 0.0000000;
    CurrentPlayerMapIndex = -1;
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x197
    if(LPPC != none)
    {
        // End:0x197
        if(LoadMapTerrainSwf(LPPC.JobLogInfo.MapRecord.LocalMapDisplayIndex))
        {
            CurrentPlayerMapIndex = LPPC.JobLogInfo.MapRecord.LocalMapDisplayIndex;
        }
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float Scale[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL D, terrainDI, V, LPPC, CurrentViewLoc, CurrentViewRot,
	    NorthRotator;

    local /*0x97E50000-0x00000000*/ private float mapRotation;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x43
    if(LPPC == none)
    {
        return;
    }
    // End:0x69
    if(MapScaleOverride > 0.0000000)
    {
        Scale = MapScaleOverride;
    }
    SPPlayerCameraManager(LPPC.PlayerCamera).GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
    super.Update(Scale);
    Scale = 1.0000000 / Scale;
    D.hasRotation = true;
    D.Rotation = 0.0000000;
    PlayerIcon.SetDisplayInfo(D);
    mapRotation = float(CurrentViewRot.Yaw & 65535) * (-360.0000000 / 65536.0000000);
    D.Rotation = mapRotation;
    CompassIcon.SetDisplayInfo(D);
    // End:0x5D8
    if((TerrainMC != none) && MapInfo != none)
    {
        // End:0x3B7
        if(!bMapInfoInitialized)
        {
            bMapInfoInitialized = true;
            MapMCWidth = TerrainMC.GetFloat("_width");
            MapMCHeight = TerrainMC.GetFloat("_height");
            MapWorldWidth = MapInfo.MapExtent.Y * float(2);
            MapWorldHeight = MapInfo.MapExtent.X * float(2);
            MapCenter.X = MapInfo.MapCenter.X;
            MapCenter.Y = MapInfo.MapCenter.Y;
            MapCenter.Z = 0.0000000;
        }
        // End:0x433
        if(Scale != MapSavedScale)
        {
            MapSavedScale = Scale;
            MapScaleX = (MapWorldWidth * Scale) / MapMCWidth;
            MapScaleY = (MapWorldHeight * Scale) / MapMCHeight;
        }
        V = TransformVector(IconMatrix, MapCenter);
        terrainDI = TerrainMC.GetDisplayInfo();
        terrainDI.hasRotation = true;
        terrainDI.Rotation = mapRotation;
        terrainDI.X = V.X;
        terrainDI.Y = V.Y;
        terrainDI.XScale = MapScaleX * float(100);
        terrainDI.YScale = MapScaleY * float(100);
        TerrainMC.SetDisplayInfo(terrainDI);
        SetFloat("_xrotation", MapXRotation);
    }
    D.hasRotation = false;
    D.hasX = true;
    D.hasY = true;
    D.hasVisible = true;
    D.Visible = true;
    // End:0x7D9
    if(LPPC.Pawn != none)
    {
        NorthRotator.Yaw = int(float(MapInfo.GetNorthAngleFromIndex(CurrentPlayerMapIndex)) * 182.0444000);
        V = LPPC.Pawn.Location;
        V.X += 1000.0000000;
        V = TransformVector(IconMatrix, V);
        V.Z = 0.0000000;
        V = V << NorthRotator;
        V = Normal(V) * (Radius * EdgeIconRadiusPercent);
    }
    D.X = V.X;
    D.Y = V.Y;
    NorthIcon.SetDisplayInfo(D);
    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewMapInfo;

    NewMapInfo = LPMapInfo(ThisWorld.GetMapInfo());
    MapInfo = NewMapInfo;
    // End:0x86
    if(Index != CurrentPlayerMapIndex)
    {
        // End:0x86
        if(LoadMapTerrainSwf(Index))
        {
            CurrentPlayerMapIndex = Index;
        }
    }
    //return;    
}

function LoadMapTerrainSwf()
{
    local /*0x97E50000-0x00000000*/ private int MapIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string externalPath, clipName;

    // End:0xC7
    if((((MapInfo == none) || MapInfo.ContractsMapDisplayEntries.Length <= MapIndex) || MapInfo.ContractsMapDisplayEntries[MapIndex].MapSwfMovie == none) || MapInfo.ContractsMapDisplayEntries[MapIndex].bShowOnMinimap == false)
    {
        return false;
    }
    externalPath = "/ package/" $ Repl(PathName(MapInfo.ContractsMapDisplayEntries[MapIndex].MapSwfMovie), ".", "/");
    clipName = MapInfo.ContractsMapDisplayEntries[MapIndex].movieClipName;
    // End:0x1B1
    if(TerrainMC != none)
    {
        TerrainMC.ActionScriptVoid("removeMovieClip");
    }
    TerrainMC = TerrainContainerMC.CreateEmptyMovieClip("terrain");
    LoadMapSwf(TerrainMC, externalPath, clipName);
    bMapInfoInitialized = false;
    // End:0x29E
    if(MapInfo.ContractsMapDisplayEntries[MapIndex].MapScaleOverride != float(0))
    {
        MapScaleOverride = MapInfo.ContractsMapDisplayEntries[MapIndex].MapScaleOverride;
    }
    // End:0x326
    if(MapInfo.ContractsMapDisplayEntries[MapIndex].IconHeightThreshold != float(0))
    {
        IconHeightThreshold = MapInfo.ContractsMapDisplayEntries[MapIndex].IconHeightThreshold;
    }
    return true;
    //return ReturnValue;    
}

function LoadMapSwf()
{
    local /*0x97E50000-0x00000000*/ private @NULL containerClip[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string swfPath[8388609], clipName;

    ActionScriptVoid("LoadMapSwf");
    //return;    
}

function LoadMapTerrainImage()
{
    //return;    
}

function LoadMapImage()
{
    local /*0x97E50000-0x00000000*/ private @NULL containerClip[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string imgPath[8388609];

    ActionScriptVoid("LoadMapImage");
    //return;    
}

function IsShowingEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsShowingEnemies;
    //return ReturnValue;    
}

defaultproperties
{
    EdgeIconRadiusPercent=1.0000000
}