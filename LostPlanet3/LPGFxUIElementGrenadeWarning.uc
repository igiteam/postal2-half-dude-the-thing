class LPGFxUIElementGrenadeWarning extends LPGFxUIActorAttachedElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EdgeMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Grenade;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIconInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float distToPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SenseRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleFactor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EdgeIconMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EdgeIconMaxScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMaxScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconOffset[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HUDCenterOffset[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HUDRadius[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    Grenade = LPProj_Grenade(AttachedActor);
    InitGrenadeMC();
    //return;    
}

function InitGrenadeMC()
{
    MPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x53
    if(MPHUD != none)
    {
        PointMC = CreatePointMC();
        EdgeMC = CreateEdgeMC();
    }
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    bIconInit = false;
    super(SPGFxUIActorAttachedElement).SetActive(bSet, bImmediate);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    Grenade = LPProj_Grenade(AttachedActor);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float Scale, EdgeScale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D, EdgePos2D;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0xD0
    if(((Grenade == none) || Grenade.bExploded) || Grenade.bIsGlued)
    {
        // End:0xAC
        if(Index >= 0)
        {
            OwningManager.RemoveElementForIndex(Index);
        }
        bShouldBeActive = false;
        SetActive(false, true);
        Show(false, true);
    }
    // End:0x207
    if(bShouldBeActive)
    {
        UpdateGrenadeIcon();
        // End:0x103
        if(ShouldHideUI())
        {
            Show(false, true);            
        }
        else
        {
            Show(true, true);
            SetBounded(UpdateScreenPosition(DeltaTime, Pos2D, EdgePos2D, Scale, EdgeScale));
            SetPositionAndScale(PointMC, Pos2D, Scale);
            SetPositionAndScale(EdgeMC, EdgePos2D, EdgeScale);
            SetGrenadeWarningVisibility(PointMC, Grenade.LastRenderTime >= (Grenade.WorldInfo.TimeSeconds - 0.0500000));
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function SetPositionAndScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL GFxObj[8388609], Pos2D;
    local /*0x97E50000-0x00000000*/ private float Scale[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = GFxObj.GetDisplayInfo();
    DI.X = Pos2D.X;
    DI.Y = Pos2D.Y;
    DI.XScale = Scale;
    DI.YScale = Scale;
    GFxObj.SetDisplayInfo(DI);
    //return;    
}

function InitGrenadeIcon()
{
    //return;    
}

function UpdateGrenadeIcon()
{
    // End:0x19
    if(MPHUD == none)
    {
        InitGrenadeMC();
    }
    // End:0x3E
    if(!bIconInit)
    {
        InitGrenadeIcon();
        bIconInit = true;
    }
    //return;    
}

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825], EdgePos2D;
    local /*0x97E50000-0x00000000*/ private float Scale[25165825], EdgeScale;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, NewPosition, CameraLoc, CameraDir, myHUD, Canvas;

    local /*0x97E50000-0x00000000*/ private bool bOffCamera, bBounded;
    local /*0x97E50000-0x00000000*/ private float deltaAngle;
    local /*0x97E50000-0x00000000*/ private @NULL CenterPt, IconDistToCenter;

    // End:0x11
    if(MPHUD == none)
    {
        return false;
    }
    myHUD = LPHUD(MPHUD.myHUD);
    Canvas = myHUD.Canvas;
    // End:0x8C
    if((Canvas == none) || myHUD == none)
    {
        return false;
    }
    Pos3D = GetIconPosition();
    OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
    // End:0x112
    if(((Pos3D - CameraLoc) Dot CameraDir) < 0.0000000)
    {
        bOffCamera = true;
        bBounded = true;
    }
    // End:0x15E
    if(!bOffCamera)
    {
        myHUD.GetProjectedPosAndScale(Pos3D, NewPosition, Scale);        
    }
    else
    {
        Scale = 1.0000000;
        NewPosition = OwningManager.ProjectOffCamera(Canvas, Pos3D, CameraLoc, CameraDir);
    }
    Scale = FClamp(ScaleFactor / Scale, WorldMinScale, WorldMaxScale) * float(100);
    CenterPt.X = Canvas.ClipX / float(2);
    CenterPt.Y = Canvas.ClipY / float(2);
    IconDistToCenter.X = CenterPt.X - NewPosition.X;
    IconDistToCenter.Y = CenterPt.Y - NewPosition.Y;
    // End:0x3CC
    if(!bBounded)
    {
        // End:0x3CC
        if(((IconDistToCenter.X * IconDistToCenter.X) + (IconDistToCenter.Y * IconDistToCenter.Y)) > (HUDRadius * HUDRadius))
        {
            bBounded = true;
        }
    }
    // End:0x5B6
    if(bBounded)
    {
        IconAngle = (Atan2(IconDistToCenter.Y, IconDistToCenter.X) * 57.2957800) - float(90);
        deltaAngle = (IconAngle - float(90)) * 0.0174533;
        EdgePos2D.X = (CenterPt.X + HUDCenterOffset.X) + (Cos(deltaAngle) * HUDRadius);
        EdgePos2D.Y = (CenterPt.Y + HUDCenterOffset.Y) + (Sin(deltaAngle) * HUDRadius);
        EdgeScale = (((GetSenseRange()) > 0.0000000) ? distToPlayer / (GetSenseRange()) : 1.0000000);
        EdgeScale = (EdgeIconMinScale + (FMax(0.0000000, 1.0000000 - EdgeScale) * (EdgeIconMaxScale - EdgeIconMinScale))) * 100.0000000;        
    }
    else
    {
        EdgeScale = 1.0000000;
        EdgePos2D = NewPosition;
        IconAngle = 0.0000000;
    }
    Pos2D = NewPosition;
    myHUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    myHUD.TransformHUDPosToScaleformStagePos(EdgePos2D.X, EdgePos2D.Y);
    return bBounded;
    //return ReturnValue;    
}

function GetSenseRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x8F
    if(SenseRange <= float(0))
    {
        LPP = LPBasePlayerPawn(GetLPPC().Pawn);
        // End:0x8F
        if(LPP != none)
        {
            SenseRange = LPP.TuneDataBasePlayerPawn.GrenadeWarningSenseRange;
        }
    }
    return SenseRange;
    //return ReturnValue;    
}

function GetIconPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Pos3D;

    Pos3D = Grenade.GetVisibleLocation();
    distToPlayer = VSize(Pos3D - GetLPPC().Pawn.Location);
    Pos3D += IconOffset;
    return Pos3D;
    //return ReturnValue;    
}

function ShouldHideUI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL myHUD;
    local /*0x97E50000-0x00000000*/ private bool bHide;

    bHide = false;
    // End:0x85
    if(MPHUD != none)
    {
        myHUD = LPHUD(MPHUD.myHUD);
        // End:0x85
        if(myHUD != none)
        {
            bHide = myHUD.ScoreboardIsShown();
        }
    }
    return bHide;
    //return ReturnValue;    
}

function SetBounded()
{
    local /*0x97E50000-0x00000000*/ private bool bBounded[8388609], bEdgeVisible;

    bEdgeVisible = false;
    // End:0x38
    if(bBounded)
    {
        bEdgeVisible = SenseRange >= distToPlayer;
    }
    SetGrenadeWarningVisibility(EdgeMC, bEdgeVisible);
    UpdateEdgeIconRotation();
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    SetGrenadeWarningVisibility(PointMC, bShow);
    SetGrenadeWarningVisibility(EdgeMC, bShow);
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    MPHUD.RemoveMovieClip(PointMC);
    MPHUD.RemoveMovieClip(EdgeMC);
    PointMC = none;
    EdgeMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

function CreatePointMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CreateGrenadeWarningPoint();
    //return ReturnValue;    
}

function CreateEdgeMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CreateGrenadeWarningEdgePoint();
    //return ReturnValue;    
}

function UpdateEdgeIconRotation()
{
    RotateGrenadeWarningEdgePoint(EdgeMC, int(IconAngle));
    //return;    
}

function CreateGrenadeWarningPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((MPHUD == none) ? none : MPHUD.ActionScriptObject("createGrenadeWarningPoint"));
    //return ReturnValue;    
}

function CreateGrenadeWarningEdgePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((MPHUD == none) ? none : MPHUD.ActionScriptObject("createGrenadeWarningEdgePoint"));
    //return ReturnValue;    
}

function RotateGrenadeWarningEdgePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL EdgePoint[8388609];
    local /*0x97E50000-0x00000000*/ private int degrees[8388609];

    // End:0x4D
    if(MPHUD != none)
    {
        MPHUD.ActionScriptVoid("rotateGrenadeWarningEdgePoint");
    }
    //return;    
}

function SetGrenadeWarningVisibility()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    DI = MC.GetDisplayInfo();
    DI.Visible = bShow;
    MC.SetDisplayInfo(DI);
    //return;    
}

defaultproperties
{
    ScaleFactor=1.0000000
    EdgeIconMinScale=1.2000000
    EdgeIconMaxScale=2.4000000
    WorldMinScale=0.8000000
    WorldMaxScale=1.2000000
    HUDRadius=150.0000000
}