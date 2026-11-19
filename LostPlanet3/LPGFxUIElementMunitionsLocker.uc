class LPGFxUIElementMunitionsLocker extends LPGFxUIActorAttachedElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MLMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconWorldMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconWorldMaxScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableFade[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeNearDistance[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeFarDistance[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeSpeed[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeAlpha;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconOffset[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x36
    if(MoviePlayer != none)
    {
        MLMC = CreateMunitionsLockerIconMC();
    }
    //return;    
}

function CreateMunitionsLockerIconMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createMLockerPoint");
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, HUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D, DI;
    local /*0x97E50000-0x00000000*/ private bool bBounded, bHideMunitionsLockerIcon;
    local /*0x97E50000-0x00000000*/ private float distToPlayer;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0x44C
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        Scale = 0.0000000;
        // End:0x44C
        if(LPMPHUD != none)
        {
            HUD = LPHUD(LPMPHUD.myHUD);
            // End:0x44C
            if(HUD != none)
            {
                bHideMunitionsLockerIcon = HUD.ScoreboardIsShown();
                // End:0x24D
                if(bEnableFade)
                {
                    // End:0x24D
                    if((AttachedActor != none) && GetLPPC().Pawn != none)
                    {
                        distToPlayer = VSize(AttachedActor.Location - GetLPPC().Pawn.Location);
                        // End:0x1F9
                        if((distToPlayer > FadeFarDistance) || distToPlayer < FadeNearDistance)
                        {
                            // End:0x1F6
                            if(FadeAlpha > 0.0000000)
                            {
                                FadeAlpha -= (FadeSpeed * DeltaTime);
                                // End:0x1F6
                                if(FadeAlpha < 0.0000000)
                                {
                                    FadeAlpha = 0.0000000;
                                }
                            }                            
                        }
                        else
                        {
                            // End:0x24D
                            if(FadeAlpha < 1.0000000)
                            {
                                FadeAlpha += (FadeSpeed * DeltaTime);
                                // End:0x24D
                                if(FadeAlpha > 1.0000000)
                                {
                                    FadeAlpha = 1.0000000;
                                }
                            }
                        }
                    }
                }
                bBounded = UpdateScreenPosition(Pos2D, Scale);
                // End:0x290
                if(bHideMunitionsLockerIcon)
                {
                    Show(false, true);                    
                }
                else
                {
                    Show(true, true);
                    DI = MLMC.GetDisplayInfo();
                    DI.X = Pos2D.X;
                    DI.Y = Pos2D.Y;
                    // End:0x376
                    if(!bBounded)
                    {
                        Scale = FMax((1.0000000 / Scale) * IconWorldMaxScale, IconWorldMinScale);
                    }
                    DI.XScale = Scale * float(100);
                    DI.YScale = Scale * float(100);
                    DI.Alpha = FadeAlpha * float(100);
                    DI.Visible = !bBounded;
                    MLMC.SetDisplayInfo(DI);
                }
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, NewPosition, CameraLoc, CameraDir, Canvas, UnclippedPosition;

    local /*0x97E50000-0x00000000*/ private bool bOffCamera, bBounded;
    local /*0x97E50000-0x00000000*/ private int IconXSize, IconYSize;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, HUD;

    // End:0x11
    if(AttachedActor == none)
    {
        return false;
    }
    Pos3D = AttachedActor.Location;
    Pos3D += TransformVectorByRotation(AttachedActor.Rotation, IconOffset);
    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0xA3
    if(LPMPHUD == none)
    {
        return false;
    }
    HUD = LPHUD(LPMPHUD.myHUD);
    Canvas = LPMPHUD.myHUD.Canvas;
    // End:0x133
    if((Canvas == none) || HUD == none)
    {
        return false;
    }
    OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
    // End:0x1A5
    if(((Pos3D - CameraLoc) Dot CameraDir) < 0.0000000)
    {
        bOffCamera = true;
        bBounded = true;
    }
    // End:0x1F1
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
    // End:0x381
    if(!bBounded)
    {
        // End:0x381
        if((Abs(NewPosition.X - UnclippedPosition.X) > float(IconXSize / 2)) || Abs(NewPosition.Y - UnclippedPosition.Y) > float(IconYSize / 2))
        {
            bBounded = true;
        }
    }
    Pos2D = NewPosition;
    HUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    return bBounded;
    //return ReturnValue;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x167
    if(MLMC != none)
    {
        // End:0xA8
        if(bShow)
        {
            DI = MLMC.GetDisplayInfo();
            DI.Visible = bShow;
            MLMC.SetDisplayInfo(DI);
            // End:0xA5
            if(!bImmediate)
            {
            }            
        }
        else
        {
            // End:0xC9
            if(!bImmediate && ShouldDisplayOutro)
            {                
            }
            else
            {
                DI = MLMC.GetDisplayInfo();
                DI.Visible = bShow;
                MLMC.SetDisplayInfo(DI);
                // End:0x15B
                if(bPendingInactive)
                {
                    SetActive(false, true);
                }
            }
            ShouldDisplayOutro = false;
        }
    }
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(MLMC);
    MLMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    IconWorldMinScale=0.2000000
    IconWorldMaxScale=4.0000000
    bEnableFade=true
    FadeNearDistance=800.0000000
    FadeFarDistance=5000.0000000
    FadeSpeed=3.0000000
    IconOffset=(X=0.0000000,Y=-50.0000000,Z=0.0000000)
}