class LPGFxMap extends GFxObject within GFxMoviePlayer
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ThisWorld;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconMatrix;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte defaultIconType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Radius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EdgeIconRadiusPercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconHeightThreshold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MapIcons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayPawns;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayKismetAddedActors;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayPlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayObjectives;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bContractDisplayAllObjectives;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplaySurveyMaps;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayShopMarkers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayMapMarkers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapRotatesWithView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMapIconsAlreadyHidden;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsShowingEnemies[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheckForEnemies;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SurveyMaps;

function Init()
{
    ThisWorld = Outer.GetPC().WorldInfo;
    MapInfo = LPMapInfo(ThisWorld.GetMapInfo());
    InitMapIcons();
    InitSurveyMaps();
    //return;    
}

function ShouldShowThermalEnergyPockets()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function InitMapIcons()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x89 [Loop If]
    if(I < MapIcons.Length)
    {
        MapIcons[I].ContainerMC = GetObject(MapIcons[I].ContainerMCName);
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GenMapIcons()
{
    local /*0x97E50000-0x00000000*/ private int N[8388609];
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWorldMapContainer[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ReturnValue[92274689], Icons;
    local /*0x97E50000-0x00000000*/ private @NULL IconMC;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL ContainerMC;

    false
    I = 0;
    J0x10:

    // End:0x18D [Loop If]
    if(I < N)
    {
        // End:0x69
        if(bWorldMapContainer)
        {
            ContainerMC = MapIcons[int(Type)].WorldMapContainerMC;            
        }
        else
        {
            ContainerMC = MapIcons[int(Type)].ContainerMC;
        }
        // End:0x17F
        if(ContainerMC != none)
        {
            IconMC = ContainerMC.AttachMovie(MapIcons[int(Type)].IconMCName, MapIcons[int(Type)].IconMCName $ string(MapIcons[int(Type)].IconCount++));
            // End:0x17F
            if(IconMC != none)
            {
                Icons[I] = IconMC;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x10;
    }
    return Icons;
    //return ReturnValue;    
}

function HideAllMapIcons()
{
    local /*0x97E50000-0x00000000*/ private @NULL D;
    local /*0x97E50000-0x00000000*/ private int I, J;

    bIsShowingEnemies = false;
    I = 0;
    J0x17:

    // End:0x2DF [Loop If]
    if(I < 29)
    {
        J = 0;
        J0x32:

        // End:0x2D1 [Loop If]
        if(J < MapIcons[I].IconArray.Length)
        {
            D = MapIcons[I].IconArray[J].Icon.GetDisplayInfo();
            D.Visible = false;
            MapIcons[I].IconArray[J].Icon.SetDisplayInfo(D);
            // End:0x2C3
            if((MapIcons[I].IconArray[J].TargetedActor != none) && MapIcons[I].IconArray[J].TargetedActor.IsPendingKill())
            {
                MapIcons[I].IconArray[J].TargetedActor = none;
                MapIcons[I].IconArray[J].bUsed = false;
                MapIcons[I].IconArray[J].State = 0;
            }
            J++;
            // [Loop Continue]
            goto J0x32;
        }
        I++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function ShouldDisplayMapIcons()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xA5
    if(((LPPC != none) && LPPC.myLPHUD.ShouldDisplayRadar() == false) && !LPPC.bIsInVitalSuit)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function UpdateIconsForMapActors()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MapActors[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL D;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Icons;
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL V, val;
    local /*0x97E50000-0x00000000*/ private byte Type;
    local /*0x97E50000-0x00000000*/ private bool bIconStaysOnEdge, bRotatesWithActor;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewLoc, CurrentViewRot, LPP, ClipInfo;
    local /*0x97E50000-0x00000000*/ private int iconIdx;
    local /*0x97E50000-0x00000000*/ private float HeightDelta;

    SPPlayerCameraManager(Outer.GetPC().PlayerCamera).GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
    I = 0;
    J0x70:

    // End:0xE6C [Loop If]
    if(I < MapActors.Length)
    {
        Type = MapActors[I].IconType;
        bIconStaysOnEdge = MapActors[I].bIconStaysOnEdge;
        bRotatesWithActor = MapActors[I].bRotatesWithActor;
        iconIdx = GetIconIndexForActor(Type, MapActors[I].Actor);
        // End:0x3B7
        if(iconIdx == -1)
        {
            Icons = GenMapIcons(1, Type, MapActors[I].bWorldMapContainer);
            // End:0x1CA
            if(Icons.Length == 0)
            {
                // [Explicit Continue]
                goto J0xE5E;
            }
            // End:0x35D
            foreach Icons(val)
            {
                ClipInfo.Icon = val;
                ClipInfo.TargetedActor = none;
                ClipInfo.bUsed = false;
                ClipInfo.State = 0;
                // End:0x327
                if((MapIcons[int(Type)].ContainerMC != none) && MapIcons[int(Type)].ASTargetMCName != "")
                {
                    ClipInfo.ASTargetMC = val.GetObject(MapIcons[int(Type)].ASTargetMCName);
                }
                MapIcons[int(Type)].IconArray.AddItem(ClipInfo);                                
            }            
            iconIdx = GetIconIndexForActor(Type, MapActors[I].Actor);
            // End:0x3B7
            if(iconIdx == -1)
            {
                // [Explicit Continue]
                goto J0xE5E;
            }
        }
        D = MapIcons[int(Type)].IconArray[iconIdx].Icon.GetDisplayInfo();
        // End:0x490
        if(MapActors[I].Actor != none)
        {
            V = MapActors[I].Actor.Location;            
        }
        else
        {
            V = MapActors[I].NonActorLocation;
        }
        // End:0x513
        if(MapActors[I].bSkipTransform == false)
        {
            V = TransformVector(IconMatrix, V);
        }
        // End:0x5F6
        if(Radius > 0.0000000)
        {
            // End:0x5AC
            if(bIconStaysOnEdge)
            {
                D.Visible = true;
                // End:0x5A9
                if(VSize2D(V) >= (Radius * EdgeIconRadiusPercent))
                {
                    V = (Normal(V) * Radius) * EdgeIconRadiusPercent;
                }                
            }
            else
            {
                D.Visible = VSize2D(V) < (Radius * EdgeIconRadiusPercent);
            }            
        }
        else
        {
            D.Visible = true;
        }
        // End:0x6C1
        if((MapActors[I].Actor != none) && D.Visible)
        {
            // End:0x6C1
            if(bCheckForEnemies && bIsShowingEnemies == false)
            {
                // End:0x6C1
                if(MapActorIsEnemy(MapActors[I].Actor))
                {
                    bIsShowingEnemies = true;
                }
            }
        }
        D.X = V.X;
        D.Y = V.Y;
        D.hasRotation = true;
        // End:0x8D0
        if(bRotatesWithActor && MapActors[I].Actor != none)
        {
            // End:0x844
            if(bMapRotatesWithView)
            {
                D.Rotation = float((CurrentViewRot.Yaw - (MapActors[I].Actor.Rotation.Yaw + 32768)) & 65535) * (-360.0000000 / 65536.0000000);                
            }
            else
            {
                D.Rotation = float((MapActors[I].Actor.Rotation.Yaw + 32768) & 65535) * (360.0000000 / 65536.0000000);
            }            
        }
        else
        {
            D.Rotation = 0.0000000;
        }
        D.hasAlpha = false;
        MapIcons[int(Type)].IconArray[iconIdx].Icon.SetDisplayInfo(D);
        LPP = LPPawn(MapActors[I].Actor);
        // End:0xBF1
        if((LPP != none) && int(LPP.GetRadarIconState()) != int(MapIcons[int(Type)].IconArray[iconIdx].State))
        {
            MapIcons[int(Type)].IconArray[iconIdx].State = LPP.GetRadarIconState();
            J = 0;
            J0xA9C:

            // End:0xBF1 [Loop If]
            if(J < MapIcons[int(Type)].StateKeyframes.Length)
            {
                // End:0xBE3
                if(int(MapIcons[int(Type)].StateKeyframes[J].State) == int(LPP.GetRadarIconState()))
                {
                    MapIcons[int(Type)].IconArray[iconIdx].Icon.GotoAndStop(MapIcons[int(Type)].StateKeyframes[J].KeyframeLabel);
                    // [Explicit Break]
                    goto J0xBF1;
                }
                J++;
                // [Loop Continue]
                goto J0xA9C;
            }
        }
        J0xBF1:

        // End:0xE5E
        if(IconHeightThreshold != float(0))
        {
            // End:0xE5E
            if((int(Type) == int(8)) || int(Type) == int(9))
            {
                LPP = LPPawn(Outer.GetPC().Pawn);
                // End:0xE5E
                if((MapActors[I].Actor != none) && LPP != none)
                {
                    HeightDelta = MapActors[I].Actor.Location.Z - LPP.Location.Z;
                    // End:0xDA4
                    if(HeightDelta > IconHeightThreshold)
                    {
                        ObjectiveGoToAboveState(MapIcons[int(Type)].IconArray[iconIdx].ASTargetMC);                        
                    }
                    else
                    {
                        // End:0xE0F
                        if(HeightDelta < -IconHeightThreshold)
                        {
                            ObjectiveGoToBelowState(MapIcons[int(Type)].IconArray[iconIdx].ASTargetMC);                            
                        }
                        else
                        {
                            ObjectiveGoToLevelState(MapIcons[int(Type)].IconArray[iconIdx].ASTargetMC);
                        }
                    }
                }
            }
        }
        J0xE5E:

        I++;
        // [Loop Continue]
        goto J0x70;
    }
    //return;    
}

function MapActorIsEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, Meta, LPPC, GRI;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x54
    if((TheActor == none) || LPPC == none)
    {
        return false;
    }
    LPP = LPPawn(TheActor);
    // End:0x15C
    if(LPP != none)
    {
        // End:0x159
        if(LPP.IsAlive())
        {
            GRI = LPGRI(LPPC.Pawn.WorldInfo.GRI);
            // End:0x159
            if((GRI != none) && GRI.IsPlayerEnemy(LPPC.Pawn, LPP, true))
            {
                return true;
            }
        }        
    }
    else
    {
        Meta = LPActorInteractionMetaData(TheActor.InteractionMetaData);
        // End:0x1E9
        if((Meta != none) && Meta.IsActorEnemy(TheActor, LPPC.Pawn))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ObjectiveGoToLevelState()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];

    // End:0x37
    if(MC != none)
    {
        MC.GotoAndStop("onLevel");
    }
    //return;    
}

function ObjectiveGoToAboveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];

    // End:0x35
    if(MC != none)
    {
        MC.GotoAndStop("above");
    }
    //return;    
}

function ObjectiveGoToBelowState()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];

    // End:0x35
    if(MC != none)
    {
        MC.GotoAndStop("below");
    }
    //return;    
}

// Export ULPGFxMap::execGetIconIndexForActor(FFrame&, void* const)
native function GetIconIndexForActor()
{
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function SetIconMatrix()
{
    local /*0x97E50000-0x00000000*/ private float Scale[8388609], F;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, CurrentViewLoc, CurrentViewRot;

    LPPC = LPPlayerController(Outer.GetPC());
    SPPlayerCameraManager(LPPC.PlayerCamera).GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
    F = float(-(CurrentViewRot.Yaw + 16384) & 65535) * (3.1415930 / 32768.0000000);
    IconMatrix.XPlane.X = Cos(F) * Scale;
    IconMatrix.XPlane.Y = Sin(F) * Scale;
    IconMatrix.YPlane.X = -Sin(F) * Scale;
    IconMatrix.YPlane.Y = Cos(F) * Scale;
    IconMatrix.WPlane.X = 0.0000000;
    IconMatrix.WPlane.Y = 0.0000000;
    IconMatrix.WPlane.Z = 0.0000000;
    IconMatrix.WPlane.W = 1.0000000;
    IconMatrix.WPlane = TransformVector(IconMatrix, -LPPC.Pawn.Location);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float Scale[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL P, TP, CG, PM, SM, MM;

    local /*0x97E50000-0x00000000*/ private editfixedsize array MapActors;
    local /*0x97E50000-0x00000000*/ private @NULL M;
    local /*0x97E50000-0x00000000*/ private bool bFoundObjectiveMarker;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPPC;
    local /*0x97E50000-0x00000000*/ private float CurrentTime;
    local /*0x97E50000-0x00000000*/ private @NULL PRI, LPBM, ObjectiveMarker, ExitPoint;
    local /*0x97E50000-0x00000000*/ private int Idx, iIndex;
    local /*0x97E50000-0x00000000*/ private @NULL RadarEntry;

    CurrentTime = ThisWorld.TimeSeconds;
    LPPC = LPPlayerController(Outer.GetPC());
    Scale = 1.0000000 / Scale;
    // End:0x9A
    if(LPPC.Pawn == none)
    {
        return;
    }
    SetIconMatrix(Scale);
    // End:0x71F
    if(bDisplayPawns)
    {
        // End:0x71E
        foreach ThisWorld.AllPawns(Class'Engine.Pawn', P)
        {
            // End:0x186
            if(((P.bHidden || P.Health <= 0) || P.IsInvisible()) || P.DrivenVehicle != none)
            {
                continue;                
            }
            // End:0x1C7
            if(!bDisplayPlayerPawn && P == LPPC.Pawn)
            {
                continue;                
            }
            LPP = LPPawn(P);
            // End:0x1F6
            if(LPP == none)
            {
                continue;                
            }
            // End:0x225
            if(LPP.HideFromRadar(LPPC))
            {
                continue;                
            }
            M.IconType = 29;
            // End:0x3AD
            if(int(ThisWorld.NetMode) != int(NM_Standalone))
            {
                // End:0x3AA
                if((LPPlayerPawn(LPP) != none) && LPGRI(ThisWorld.GRI).IsPlayerEnemy(LPP, LPPC.Pawn) == true)
                {
                    PRI = LPPRI(LPP.PlayerReplicationInfo);
                    // End:0x3A6
                    if((PRI != none) && (CurrentTime - PRI.TimeOfLastWeaponDischarge) < float(1))
                    {
                        M.IconType = 1;
                        M.bIconStaysOnEdge = true;                        
                    }
                    else
                    {
                        continue;                        
                    }
                }                
            }
            else
            {
                // End:0x471
                if(LPAIPawnHuman(LPP) != none)
                {
                    // End:0x452
                    if(LPGRI(ThisWorld.GRI).IsPlayerEnemy(LPPC.Pawn, LPP) == true)
                    {
                        M.IconType = 1;                        
                    }
                    else
                    {
                        M.IconType = 2;
                    }
                }
            }
            M.Actor = LPP;
            // End:0x612
            if(LPP.TuneDataPawn != none)
            {
                // End:0x5AA
                if(int(M.IconType) == int(29))
                {
                    M.IconType = LPP.TuneDataPawn.RadarParams.IconType;
                    M.bIconStaysOnEdge = LPP.TuneDataPawn.RadarParams.bIconStaysOnEdge;
                }
                M.bRotatesWithActor = LPP.TuneDataPawn.RadarParams.bRotatesWithActor;                
            }
            else
            {
                // End:0x67E
                if(int(M.IconType) == int(29))
                {
                    M.IconType = defaultIconType;
                    M.bIconStaysOnEdge = false;
                }
                M.bRotatesWithActor = false;
            }
            // End:0x707
            if(P == LPPC.Pawn)
            {
                M.IconType = 10;
                M.bRotatesWithActor = true;
            }
            MapActors.AddItem(M);                        
        }        
    }
    // End:0x954
    if(bDisplayKismetAddedActors)
    {
        M.IconType = 29;
        Idx = 0;
        J0x756:

        // End:0x954 [Loop If]
        if(Idx < LPPC.RadarEntries.Length)
        {
            RadarEntry = LPPC.RadarEntries[Idx];
            // End:0x80F
            if(RadarEntry.Item == none)
            {
                LPPC.RadarEntries.Remove(Idx, 1);                
                Idx--;                
            }
            else
            {
                M.Actor = RadarEntry.Item;
                M.IconType = RadarEntry.RadarParams.IconType;
                M.bIconStaysOnEdge = RadarEntry.RadarParams.bIconStaysOnEdge;
                M.bRotatesWithActor = RadarEntry.RadarParams.bRotatesWithActor;
                MapActors.AddItem(M);                
            }
            ++Idx;
            // [Loop Continue]
            goto J0x756;
        }
    }
    // End:0xAD6
    if(ShouldShowThermalEnergyPockets())
    {
        M.bIconStaysOnEdge = true;
        M.bRotatesWithActor = false;
        M.IconType = 12;
        // End:0xAD5
        foreach LPPC.DynamicActors(Class'LPThermalEnergyPocketActor', TP)
        {
            // End:0xA76
            if(int(ThisWorld.NetMode) == int(NM_Standalone))
            {
                // End:0xA73
                if(TP.ShouldShowOnMap())
                {
                    M.Actor = TP;
                    MapActors.AddItem(M);                    
                }
                // End:0xAD4
                continue;
            }
            // End:0xAD4
            if(TP.bEnabled)
            {
                M.Actor = TP;
                MapActors.AddItem(M);                
            }            
        }        
    }
    // End:0xCE0
    if(int(ThisWorld.NetMode) == int(NM_Standalone))
    {
        M.bIconStaysOnEdge = false;
        M.bRotatesWithActor = false;
        M.IconType = 14;
        // End:0xBC7
        foreach LPPC.DynamicActors(Class'LPAIPawnTurret', CG)
        {
            M.Actor = CG;
            MapActors.AddItem(M);                        
        }        
        M.bIconStaysOnEdge = false;
        M.bRotatesWithActor = false;
        // End:0xCDF
        foreach LPPC.DynamicActors(Class'LPTotemProximityMine', PM)
        {
            // End:0xC83
            if(ClassIsChildOf(PM.Class, Class'LPTotemBiotoxMine'))
            {
                M.IconType = 16;                
            }
            else
            {
                M.IconType = 15;
            }
            M.Actor = PM;
            MapActors.AddItem(M);                        
        }        
    }
    // End:0xF47
    if(bDisplayObjectives)
    {
        M.bIconStaysOnEdge = true;
        M.bRotatesWithActor = false;
        LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
        Idx = 0;
        J0xD5F:

        // End:0xE74 [Loop If]
        if(Idx < LPBM.VisibleObjectiveMarkers.Length)
        {
            ObjectiveMarker = LPBM.VisibleObjectiveMarkers[Idx];
            // End:0xE66
            if(ObjectiveMarker != none)
            {
                // End:0xE66
                if(bContractDisplayAllObjectives || ObjectiveMarker.IsAnyObjectiveTracked())
                {
                    bFoundObjectiveMarker = true;
                    M.Actor = ObjectiveMarker;
                    M.IconType = 8;
                    MapActors.AddItem(M);                    
                }
            }
            ++Idx;
            // [Loop Continue]
            goto J0xD5F;
        }
        // End:0xF47
        if(!bFoundObjectiveMarker)
        {
            ExitPoint = LPBreadcrumbExitPoint(LPBM.FindPathEndBreadcrumb(LPBM.GetObjectiveToTrack(), LPPC));
            // End:0xF47
            if(ExitPoint != none)
            {
                M.IconType = 8;
                M.Actor = ExitPoint;
                MapActors.AddItem(M);                
            }
        }
    }
    // End:0x1045
    if(bDisplayShopMarkers)
    {
        M.bIconStaysOnEdge = false;
        M.bRotatesWithActor = false;
        // End:0x1044
        foreach MapInfo.ShopMarkerList(SM, iIndex)
        {
            // End:0x1043
            if(SM.bEnabled)
            {
                M.IconType = 20;
                M.Actor = SM;
                MapActors.AddItem(M);                
            }            
        }        
    }
    // End:0x115F
    if(bDisplayMapMarkers)
    {
        M.bIconStaysOnEdge = false;
        M.bRotatesWithActor = false;
        // End:0x115E
        foreach MapInfo.MapMarkerList(MM, iIndex)
        {
            // End:0x115D
            if(MM.bEnabled)
            {
                M.IconType = MM.Icon;
                M.Actor = MM;
                MapActors.AddItem(M);                
            }            
        }        
    }
    // End:0x1184
    if(!bMapIconsAlreadyHidden)
    {
        HideAllMapIcons();
        bMapIconsAlreadyHidden = true;
    }
    // End:0x1199
    if((ShouldDisplayMapIcons()) == false)
    {
        return;        
    }
    else
    {
        bMapIconsAlreadyHidden = false;
    }
    UpdateIconsForMapActors(MapActors);
    // End:0x11CF
    if(bDisplaySurveyMaps)
    {
        UpdateSurveyMaps();
    }
    //return;    
}

function InitSurveyMaps()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM, Q;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalQuestCache;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveObj;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int MapIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x11
    if(!bDisplaySurveyMaps)
    {
        return;
    }
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x54
    if(LPPC == none)
    {
        return;
    }
    LPMI = LPMapInfo(LPPC.WorldInfo.GetMapInfo());
    MapIndex = LPPC.JobLogInfo.MapRecord.LocalMapDisplayIndex;
    // End:0x13F
    if((LPMI == none) || LPMI.ContractsMapDisplayEntries[MapIndex].movieClipName == "")
    {
        return;
    }
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x3DA
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuestsInChain('SurveyMaps', LocalQuestCache);
        QuestIdx = 0;
        J0x22D:

        // End:0x3DA [Loop If]
        if(QuestIdx < LocalQuestCache.Length)
        {
            Q = LocalQuestCache[QuestIdx];
            ObjectiveIdx = 0;
            J0x26D:

            // End:0x3CC [Loop If]
            if(ObjectiveIdx < Q.Objectives.Length)
            {
                ObjectiveObj = LPQO_ObjectiveSurveyMapLocation(Q.Objectives[ObjectiveIdx]);
                // End:0x3BE
                if(ObjectiveObj != none)
                {
                    I = 0;
                    J0x2EF:

                    // End:0x3BE [Loop If]
                    if(I < ObjectiveObj.LocalMapLocations.Length)
                    {
                        // End:0x3B0
                        if(LPMI.ContractsMapDisplayEntries[MapIndex].movieClipName == ObjectiveObj.LocalMapLocations[I].MapMovieClipName)
                        {
                            SurveyMaps.AddItem(ObjectiveObj);                            
                            // [Explicit Break]
                            goto J0x3BE;
                        }
                        I++;
                        // [Loop Continue]
                        goto J0x2EF;
                    }
                }
                J0x3BE:

                ObjectiveIdx++;
                // [Loop Continue]
                goto J0x26D;
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x22D;
        }
    }
    //return;    
}

function UpdateSurveyMaps()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveObj;
    local /*0x97E50000-0x00000000*/ private editfixedsize array MapActors;
    local /*0x97E50000-0x00000000*/ private @NULL M, LPMI;
    local /*0x97E50000-0x00000000*/ private int MapIndex;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x11
    if(!bDisplaySurveyMaps)
    {
        return;
    }
    LPPC = LPPlayerController(Outer.GetPC());
    // End:0x54
    if(LPPC == none)
    {
        return;
    }
    // End:0x66
    if(SurveyMaps.Length == 0)
    {
        return;
    }
    LPMI = LPMapInfo(LPPC.WorldInfo.GetMapInfo());
    MapIndex = LPPC.JobLogInfo.MapRecord.LocalMapDisplayIndex;
    // End:0x183
    if(((LPMI == none) || MapIndex > (LPMI.ContractsMapDisplayEntries.Length - 1)) || LPMI.ContractsMapDisplayEntries[MapIndex].movieClipName == "")
    {
        return;
    }
    I = 0;
    J0x18E:

    // End:0x37F [Loop If]
    if(I < SurveyMaps.Length)
    {
        ObjectiveObj = SurveyMaps[I];
        // End:0x371
        if(true)
        {
            J = 0;
            J0x1D2:

            // End:0x371 [Loop If]
            if(J < ObjectiveObj.LocalMapLocations.Length)
            {
                // End:0x363
                if(LPMI.ContractsMapDisplayEntries[MapIndex].movieClipName == ObjectiveObj.LocalMapLocations[J].MapMovieClipName)
                {
                    M.IconType = 13;
                    M.bIconStaysOnEdge = false;
                    M.bRotatesWithActor = false;
                    M.Actor = none;
                    M.NonActorLocation = ObjectiveObj.LocalMapLocations[J].MapLocation;
                    MapActors.AddItem(M);                    
                }
                J++;
                // [Loop Continue]
                goto J0x1D2;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x18E;
    }
    // End:0x3A2
    if(MapActors.Length > 0)
    {
        UpdateIconsForMapActors(MapActors);
    }
    //return;    
}

defaultproperties
{
    defaultIconType=EMapIconTypes.EMapIcon_GenericBlue
    IconHeightThreshold=1000.0000000
    MapIcons=/* Array type was not detected. */
    bDisplayPawns=true
    bDisplayKismetAddedActors=true
    bDisplayObjectives=true
    bDisplayShopMarkers=true
    bDisplayMapMarkers=true
    bMapRotatesWithView=true
}