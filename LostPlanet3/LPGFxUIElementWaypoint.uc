class LPGFxUIElementWaypoint extends LPGFxUIActorAttachedElement
    config(UI);

enum EWaypointDisplayState
{
    EWDS_Off,                       // 0
    EWDS_On,                        // 1
    EWDS_TurningOff,                // 2
    EWDS_MAX                        // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte HUDState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WaypointDisplayState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WaypointManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUDPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL mcWaypoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyWaypointMarker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeAlpha;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeOutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrevBounded[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconAngle;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    WaypointManager = LPGFxUIElementWaypointManager(OwningManager);
    ParentHUDPlayer = LPGFxMoviePlayerHUD(MoviePlayer);
    FadeAlpha = 1.0000000;
    HUDState = 0;
    WaypointDisplayState = 0;
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    MyWaypointMarker = LPBreadcrumb(TheActor);
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    //return;    
}

function ASSetWaypointEdgeMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bEdgeMode[8388609];

    MoviePlayer.ActionScriptVoid("setPofWaypointEdgeMode");
    //return;    
}

function ASSetWaypointEdgeArrowDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private float degrees[8388609];

    MoviePlayer.ActionScriptVoid("setPofWaypointEdgeArrowDirection");
    //return;    
}

function SetWaypointScale()
{
    local /*0x97E50000-0x00000000*/ private float XScale[8388609], YScale;

    // End:0x71
    if(mcWaypoint != none)
    {
        mcWaypoint.SetFloat("_xscale", XScale);
        mcWaypoint.SetFloat("_yscale", YScale);
    }
    //return;    
}

function SetWaypointColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TempObject[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609], G, B;

    MoviePlayer.ActionScriptVoid("setMovieClipColor");
    //return;    
}

function CreatePOFWaypointMarker()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createPofWaypointMarker");
    //return ReturnValue;    
}

function SetPOFWaypointUmbilicalState()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentWayPoint[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string WayPointStateName[8388609];

    MoviePlayer.ActionScriptVoid("setPofWaypointUmbilical");
    //return;    
}

function SetUmbilicalState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    // End:0x129
    if(((bForce || int(HUDState) != int(NewState)) && MyWaypointMarker != none) && mcWaypoint != none)
    {
        HUDState = NewState;
        switch(NewState)
        {
            // End:0x78
            case 2:
            // End:0xB2
            case 3:
                SetPOFWaypointUmbilicalState(mcWaypoint, "umbilical");
                SetWaypointScale(125.0000000, 125.0000000);
                // End:0x129
                break;
            // End:0xEC
            case 1:
                SetPOFWaypointUmbilicalState(mcWaypoint, "umbilical");
                SetWaypointScale(175.0000000, 175.0000000);
                // End:0x129
                break;
            // End:0xF1
            case 4:
            // End:0xFFFF
            default:
                SetPOFWaypointUmbilicalState(mcWaypoint, "umbilical");
                SetWaypointScale(125.0000000, 125.0000000);
                // End:0x129
                break;
                break;
        }
    }
    //return;    
}

function Activated()
{
    local /*0x97E50000-0x00000000*/ private byte InState[8388609];

    // End:0xEA
    if(MoviePlayer != none)
    {
        // End:0x32
        if(mcWaypoint == none)
        {
            mcWaypoint = CreatePOFWaypointMarker();
        }
        // End:0xEA
        if(mcWaypoint != none)
        {
            MyWaypointMarker.ClearTimer('Deactivated', self);
            WaypointDisplayState = 1;
            SetUmbilicalState(InState);
            TurnOnWaypoint(mcWaypoint);
            SetWaypointColor(mcWaypoint, 141.0000000, 198.0000000, 63.0000000);
            SetVisible(true);
            bPrevBounded = false;
            ASSetWaypointEdgeMode(mcWaypoint, false);
        }
    }
    //return;    
}

private final function Deactivated()
{
    // End:0x83
    if(mcWaypoint != none)
    {
        MyWaypointMarker.ClearTimer('Deactivated', self);
        WaypointDisplayState = 0;
        SetVisible(false);
        WaypointManager.RemoveElementForActor(MyWaypointMarker);
        MyWaypointMarker = none;
    }
    //return;    
}

function TurnOff()
{
    // End:0x5A
    if(mcWaypoint != none)
    {
        MyWaypointMarker.SetTimer(FadeOutTime, false, 'Deactivated', self);
        WaypointDisplayState = 2;
        TurnOffWaypoint(mcWaypoint);
    }
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    // End:0x38
    if(MyWaypointMarker != none)
    {
        MyWaypointMarker.ClearTimer('Deactivated', self);
    }
    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(mcWaypoint);
    mcWaypoint = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

function SetVisible()
{
    local /*0x97E50000-0x00000000*/ private bool Bin[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x88
    if(mcWaypoint != none)
    {
        DI = mcWaypoint.GetDisplayInfo();
        DI.Visible = Bin;
        mcWaypoint.SetDisplayInfo(DI);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bSuperActive;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, HUD, Pos2D;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL DI;
    local /*0x97E50000-0x00000000*/ private float distToPlayer;
    local /*0x97E50000-0x00000000*/ private bool bBounded;
    local /*0x97E50000-0x00000000*/ private @NULL LPBM;
    local /*0x97E50000-0x00000000*/ private bool bFirstBreadcrumb, bAllowEdgeMode;

    bSuperActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0x3E8
    if(mcWaypoint != none)
    {
        // End:0x3CE
        if(bSuperActive && int(WaypointDisplayState) != int(0))
        {
            LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
            // End:0x3CB
            if(LPMPHUD != none)
            {
                HUD = LPHUD(LPMPHUD.myHUD);
                // End:0x3CB
                if(HUD != none)
                {
                    LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
                    // End:0x12B
                    if(LPBM != none)
                    {
                        // End:0x12B
                        if(MyWaypointMarker == LPBM.FirstDisplayedBreadcrumb)
                        {
                            bFirstBreadcrumb = true;
                        }
                    }
                    bAllowEdgeMode = bFirstBreadcrumb;
                    bBounded = UpdateScreenPosition(Pos2D, Scale);
                    Show(true, true);
                    DI = mcWaypoint.GetDisplayInfo();
                    DI.X = Pos2D.X;
                    DI.Y = Pos2D.Y;
                    // End:0x259
                    if(bBounded != bPrevBounded)
                    {
                        ASSetWaypointEdgeMode(mcWaypoint, bBounded);
                        bPrevBounded = bBounded;
                    }
                    // End:0x282
                    if(bBounded)
                    {
                        ASSetWaypointEdgeArrowDirection(mcWaypoint, IconAngle);
                    }
                    // End:0x2ED
                    if((ShouldShowWaypointDistance()) && bFirstBreadcrumb)
                    {
                        distToPlayer = MyWaypointMarker.DisplayDistanceToPlayer;
                        SetPOFWaypointDistance(mcWaypoint, "" $ string(int(distToPlayer)));                        
                    }
                    else
                    {
                        SetPOFWaypointDistance(mcWaypoint, "");
                    }
                    // End:0x342
                    if(!bBounded || bAllowEdgeMode)
                    {
                        DI.Visible = true;                        
                    }
                    else
                    {
                        DI.Visible = false;
                    }
                    DI.Alpha = MyWaypointMarker.DisplayAlpha * 100.0000000;
                    mcWaypoint.SetDisplayInfo(DI);
                }
            }            
        }
        else
        {
            // End:0x3E8
            if(mcWaypoint != none)
            {
                SetVisible(false);
            }
        }
    }
    return bSuperActive;
    //return ReturnValue;    
}

function ShouldShowWaypointDistance()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(HUDState)
    {
        // End:0x18
        case 1:
        // End:0x1D
        case 3:
        // End:0x22
        case 2:
        // End:0x39
        case 4:
            return int(WaypointDisplayState) == int(1);
        // End:0xFFFF
        default:
            return false;
            break;
    }
    return false;
    //return ReturnValue;    
}

function TurnOnWaypoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Waypoint[8388609];

    // End:0x41
    if(Waypoint != none)
    {
        MoviePlayer.ActionScriptVoid("turnPofWaypointOn");
    }
    //return;    
}

function TurnOffWaypoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Waypoint[8388609];

    // End:0x42
    if(Waypoint != none)
    {
        MoviePlayer.ActionScriptVoid("turnPofWaypointOff");
    }
    //return;    
}

function SetPOFWaypointDistance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Waypoint[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Distance3D[8388609];

    // End:0x66
    if(mcWaypoint != none)
    {
        // End:0x66
        if((Waypoint != none) && MyWaypointMarker != none)
        {
            MoviePlayer.ActionScriptVoid("setPofWaypointDistance");
        }
    }
    //return;    
}

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, NewPosition, CameraLoc, CameraDir, Canvas, UnclippedPosition;

    local /*0x97E50000-0x00000000*/ private bool bOffCamera, bBounded;
    local /*0x97E50000-0x00000000*/ private int IconXSize, IconYSize;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, HUD, Delta2D;
    local /*0x97E50000-0x00000000*/ private float deltaAngle;
    local /*0x97E50000-0x00000000*/ private @NULL CenterPt, IconDistToCenter, UnclippedDistToCenter;

    Pos3D = MyWaypointMarker.Location;
    Pos3D += TransformVectorByRotation(MyWaypointMarker.Rotation, vect(0.0000000, -50.0000000, 0.0000000));
    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x96
    if(LPMPHUD == none)
    {
        return false;
    }
    HUD = LPHUD(LPMPHUD.myHUD);
    Canvas = LPMPHUD.myHUD.Canvas;
    // End:0x126
    if((Canvas == none) || HUD == none)
    {
        return false;
    }
    OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
    // End:0x198
    if(((Pos3D - CameraLoc) Dot CameraDir) < 0.0000000)
    {
        bOffCamera = true;
        bBounded = true;
    }
    // End:0x1E4
    if(!bOffCamera)
    {
        HUD.GetProjectedPosAndScale(Pos3D, NewPosition, Scale);        
    }
    else
    {
        NewPosition = OwningManager.ProjectOffCamera(Canvas, Pos3D, CameraLoc, CameraDir);
    }
    UnclippedPosition = NewPosition;
    IconXSize = 64;
    IconYSize = 64;
    NewPosition = OwningManager.GetBoundedScreenPosition(Canvas, NewPosition, float(IconXSize), float(IconYSize), bOffCamera);
    // End:0x374
    if(!bBounded)
    {
        // End:0x374
        if((Abs(NewPosition.X - UnclippedPosition.X) > float(IconXSize / 2)) || Abs(NewPosition.Y - UnclippedPosition.Y) > float(IconYSize / 2))
        {
            bBounded = true;
        }
    }
    // End:0x7D5
    if(bBounded)
    {
        CenterPt.X = Canvas.ClipX / float(2);
        CenterPt.Y = Canvas.ClipY / float(2);
        IconDistToCenter.X = CenterPt.X - NewPosition.X;
        IconDistToCenter.Y = CenterPt.Y - NewPosition.Y;
        UnclippedDistToCenter.X = CenterPt.X - UnclippedPosition.X;
        UnclippedDistToCenter.Y = CenterPt.Y - UnclippedPosition.Y;
        // End:0x6A3
        if((bOffCamera && Abs(UnclippedDistToCenter.X) < Abs(IconDistToCenter.X)) && Abs(UnclippedDistToCenter.Y) < Abs(IconDistToCenter.Y))
        {
            Delta2D.X = NewPosition.X - UnclippedPosition.X;
            Delta2D.Y = NewPosition.Y - UnclippedPosition.Y;            
        }
        else
        {
            Delta2D.X = UnclippedPosition.X - NewPosition.X;
            Delta2D.Y = UnclippedPosition.Y - NewPosition.Y;
        }
        Delta2D = Normal(Delta2D);
        deltaAngle = Atan2(Delta2D.Y, Delta2D.X) * 57.2957800;
        IconAngle = deltaAngle - float(90);        
    }
    else
    {
        IconAngle = 0.0000000;
    }
    Pos2D = NewPosition;
    HUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    return bBounded;
    //return ReturnValue;    
}

defaultproperties
{
    FadeOutTime=2.0000000
}