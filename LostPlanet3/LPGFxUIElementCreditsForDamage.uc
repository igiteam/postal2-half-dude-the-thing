class LPGFxUIElementCreditsForDamage extends LPGFxUIActorAttachedElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContainerMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CreditMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKilled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRecycle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfDeath;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleFactor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMaxScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconOffset[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int BaseTextSize[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int KillShotTextSize[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToShowAfterDeath[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    InitCreditsMC();
    //return;    
}

function InitCreditsMC()
{
    MPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x92
    if(MPHUD != none)
    {
        ContainerMC = MPHUD.MPHUD_Container;
        // End:0x92
        if(ContainerMC != none)
        {
            CreditMC = CreateCreditsForDamageMC();
            SetCreditsForDamageTextSize(BaseTextSize, KillShotTextSize);
        }
    }
    //return;    
}

function AddCreditAmount()
{
    local /*0x97E50000-0x00000000*/ private int CreditAmount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKillShot[8388609];

    AddEntryToCreditsForDamageMC(CreditMC, CreditAmount, bKillShot);
    bKilled = bKilled || bKillShot;
    // End:0xBE
    if(bKilled)
    {
        TimeOfDeath = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds;
        ActorLocation = AttachedActor.Location;
    }
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    bRecycle = false;
    bKilled = false;
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive, bBounded;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D;

    // End:0x0F
    if(bRecycle)
    {
        return false;
    }
    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0xB9
    if(bKilled)
    {
        bRecycle = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds >= (TimeOfDeath + TimeToShowAfterDeath);
        bShouldBeActive = bShouldBeActive && !bRecycle;        
    }
    else
    {
        bShouldBeActive = bShouldBeActive && AttachedActor != none;
    }
    // End:0x183
    if(bShouldBeActive)
    {
        // End:0x108
        if(ShouldHideUI())
        {
            Show(false, true);            
        }
        else
        {
            bBounded = UpdateScreenPosition(DeltaTime, Pos2D, Scale);
            // End:0x16C
            if(!bBounded)
            {
                SetPositionAndScale(CreditMC, Pos2D, Scale);
            }
            Show(!bBounded, true);
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

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, NewPosition, CameraLoc, CameraDir, myHUD, Canvas,
	    UnclippedPosition;

    local /*0x97E50000-0x00000000*/ private bool bOffCamera, bBounded;
    local /*0x97E50000-0x00000000*/ private int IconXSize, IconYSize;
    local /*0x97E50000-0x00000000*/ private float distToPlayer;

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
    // End:0xC3
    if(!bKilled)
    {
        ActorLocation = AttachedActor.Location;
    }
    Pos3D = GetIconPosition(distToPlayer);
    OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
    // End:0x152
    if(((Pos3D - CameraLoc) Dot CameraDir) < 0.0000000)
    {
        bOffCamera = true;
        bBounded = true;
    }
    // End:0x19E
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
    Scale = FClamp(ScaleFactor / Scale, WorldMinScale, WorldMaxScale) * float(100);
    // End:0x375
    if(!bBounded)
    {
        // End:0x375
        if((Abs(NewPosition.X - UnclippedPosition.X) > float(IconXSize / 2)) || Abs(NewPosition.Y - UnclippedPosition.Y) > float(IconYSize / 2))
        {
            bBounded = true;
        }
    }
    Pos2D = NewPosition;
    myHUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    return bBounded;
    //return ReturnValue;    
}

function GetIconPosition()
{
    local /*0x97E50000-0x00000000*/ private float distToPlayer[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Pos3D;

    Pos3D = ActorLocation;
    distToPlayer = VSize(Pos3D - GetLPPC().Pawn.Location);
    Pos3D.Z += (distToPlayer * 0.0500000);
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

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0xA8
    if(bShow != bVisible)
    {
        DI = CreditMC.GetDisplayInfo();
        DI.Visible = bShow;
        CreditMC.SetDisplayInfo(DI);
        bVisible = bShow;
    }
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    MPHUD.RemoveMovieClip(CreditMC);
    CreditMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

function CreateCreditsForDamageMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((ContainerMC == none) ? none : ContainerMC.ActionScriptObject("createCreditsForDamageMC"));
    //return ReturnValue;    
}

function AddEntryToCreditsForDamageMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int NumCredits[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKillShot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((ContainerMC == none) ? none : ContainerMC.ActionScriptObject("addEntryToCreditsForDamageMC"));
    //return ReturnValue;    
}

function SetCreditsForDamageTextSize()
{
    local /*0x97E50000-0x00000000*/ private int BaseSize[8388609], KillShotSize;

    // End:0x4B
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setCreditsForDamageTextSize");
    }
    //return;    
}

defaultproperties
{
    ScaleFactor=1.5000000
    WorldMinScale=1.2000000
    WorldMaxScale=1.8000000
    IconOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
    BaseTextSize=20
    KillShotTextSize=32
    TimeToShowAfterDeath=5.0000000
}