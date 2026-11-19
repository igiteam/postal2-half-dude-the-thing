class LPGFxUIElementSeizeControlPoint extends LPGFxUIElementMPObjective
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Objective;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerInside;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerInsideScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerInsideIconX[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerInsideIconY[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    Objective = LPSeizeControlObjective(AttachedActor);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    Objective = LPSeizeControlObjective(AttachedActor);
    ObjectiveChangedTouch(false);
    ObjectiveChangedState();
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL P;

    super.UpdateObjectiveIcon(DeltaTime);
    // End:0xAC
    if(bPlayerInside || InterpTimer > float(0))
    {
        P = GetLPPC().Pawn;
        // End:0xAC
        if((P == none) || !P.IsAliveAndWell())
        {
            bPlayerInside = false;
            InterpTimer = 0.0000000;
        }
    }
    SetProgress(Objective.GetControlPercent() * 0.0100000);
    //return;    
}

function ObjectiveChangedState()
{
    SetObjectiveState(GetStateString());
    //return;    
}

function ObjectiveChangedTouch()
{
    local /*0x97E50000-0x00000000*/ private bool bIsTouching[8388609];

    // End:0x3D
    if(bPlayerInside != bIsTouching)
    {
        bPlayerInside = bIsTouching;
        InterpTimer = 0.3000000;
    }
    //return;    
}

function GetStateString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float ControlPercent;

    ControlPercent = Objective.GetControlPercent();
    // End:0x49
    if(ControlPercent == 0.0000000)
    {
        return "default";        
    }
    else
    {
        // End:0xCA
        if(Objective.ControlTeamIndex == 0)
        {
            return ((Objective.bIsControlled && ControlPercent == 100.0000000) ? "controlledNevec" : "takeoverNevec");            
        }
        else
        {
            // End:0x14C
            if(Objective.ControlTeamIndex == 1)
            {
                return ((Objective.bIsControlled && ControlPercent == 100.0000000) ? "controlledPirates" : "takeoverPirates");
            }
        }
    }
    return "default";
    //return ReturnValue;    
}

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, NewPosition, CameraLoc, CameraDir, Canvas, UnclippedPosition;

    local /*0x97E50000-0x00000000*/ private bool bOffCamera, bBounded;
    local /*0x97E50000-0x00000000*/ private int IconXSize, IconYSize;
    local /*0x97E50000-0x00000000*/ private @NULL myHUD, DI, Delta2D;
    local /*0x97E50000-0x00000000*/ private float deltaAngle;
    local /*0x97E50000-0x00000000*/ private @NULL CenterPt, IconDistToCenter, UnclippedDistToCenter;
    local /*0x97E50000-0x00000000*/ private float InterpAmount, distToPlayer;

    myHUD = LPHUD(MPHUD.myHUD);
    Canvas = myHUD.Canvas;
    // End:0x7B
    if((Canvas == none) || myHUD == none)
    {
        return false;
    }
    // End:0xDA
    if(InterpTimer > float(0))
    {
        InterpAmount = FMin(DeltaTime / InterpTimer, 1.0000000);
        DI = PointMC.GetDisplayInfo();
    }
    // End:0x338
    if(bPlayerInside)
    {
        // End:0x1A0
        if(InterpTimer == float(0))
        {
            NewPosition.X = OwningManager.BoundsCenterX + PlayerInsideIconX;
            NewPosition.Y = OwningManager.BoundsCenterY + PlayerInsideIconY;
            Scale = PlayerInsideScale * float(100);            
        }
        else
        {
            NewPosition.X = DI.X + (((OwningManager.BoundsCenterX + PlayerInsideIconX) - DI.X) * InterpAmount);
            NewPosition.Y = DI.Y + (((OwningManager.BoundsCenterY + PlayerInsideIconY) - DI.Y) * InterpAmount);
            Scale = DI.XScale + (((PlayerInsideScale * float(100)) - DI.XScale) * InterpAmount);
        }
        SetProximity(0.0000000);
        bBounded = false;        
    }
    else
    {
        Pos3D = GetIconPosition(distToPlayer);
        // End:0x384
        if(CachedProgress == float(0))
        {
            SetProximity(float(int(distToPlayer * 0.0100000)));
        }
        OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
        // End:0x3F6
        if(((Pos3D - CameraLoc) Dot CameraDir) < 0.0000000)
        {
            bOffCamera = true;
            bBounded = true;
        }
        // End:0x442
        if(!bOffCamera)
        {
            myHUD.GetProjectedPosAndScale(Pos3D, NewPosition, Scale);            
        }
        else
        {
            Scale = 1.0000000;
            NewPosition = OwningManager.ProjectOffCamera(Canvas, Pos3D, CameraLoc, CameraDir);
        }
        UnclippedPosition = NewPosition;
        IconXSize = 64;
        IconYSize = 64;
        NewPosition = OwningManager.GetBoundedScreenPosition(Canvas, NewPosition, float(IconXSize), float(IconYSize), bOffCamera);
        Scale = FClamp(1.0000000 / Scale, WorldMinScale, WorldMaxScale) * float(100);
        // End:0x615
        if(!bBounded)
        {
            // End:0x615
            if((Abs(NewPosition.X - UnclippedPosition.X) > float(IconXSize / 2)) || Abs(NewPosition.Y - UnclippedPosition.Y) > float(IconYSize / 2))
            {
                bBounded = true;
            }
        }
        // End:0x78C
        if(InterpTimer > float(0))
        {
            NewPosition.X = DI.X + ((NewPosition.X - DI.X) * InterpAmount);
            NewPosition.Y = DI.Y + ((NewPosition.Y - DI.Y) * InterpAmount);
            Scale = DI.XScale + ((Scale - DI.XScale) * InterpAmount);
            bBounded = false;
        }
        // End:0xC06
        if(bBounded)
        {
            CenterPt.X = Canvas.ClipX / float(2);
            CenterPt.Y = Canvas.ClipY / float(2);
            IconDistToCenter.X = CenterPt.X - NewPosition.X;
            IconDistToCenter.Y = CenterPt.Y - NewPosition.Y;
            UnclippedDistToCenter.X = CenterPt.X - UnclippedPosition.X;
            UnclippedDistToCenter.Y = CenterPt.Y - UnclippedPosition.Y;
            // End:0xABB
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
            IconAngle = deltaAngle + float(90);
            Scale = EdgeIconScale * float(100);            
        }
        else
        {
            IconAngle = 0.0000000;
        }
    }
    InterpTimer = FMax(InterpTimer - DeltaTime, 0.0000000);
    Pos2D = NewPosition;
    myHUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    return bBounded;
    //return ReturnValue;    
}

function ShouldHideUI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.ShouldHideUI() || !Objective.bEnabled;
    //return ReturnValue;    
}

defaultproperties
{
    PlayerInsideScale=1.0000000
    PlayerInsideIconY=-100.0000000
    ObjectiveType="seize"
    ObjectiveStateFunc="setMPSeizePointState"
}