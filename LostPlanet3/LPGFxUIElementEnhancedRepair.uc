class LPGFxUIElementEnhancedRepair extends LPGFxUIActorAttachedElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RepairMC;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RepairComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BaseScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMaxScale[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    InitEnhancedRepairMC();
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    UpdateRepairComp();
    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    //return;    
}

function InitEnhancedRepairMC()
{
    // End:0x23
    if(MoviePlayer != none)
    {
        RepairMC = CreateEnhancedRepairMC();
    }
    UpdateRepairComp();
    //return;    
}

function CreateEnhancedRepairMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPMPHUD;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x97
    if((LPMPHUD != none) && LPMPHUD.MPHUD_Container != none)
    {
        return LPMPHUD.MPHUD_Container.ActionScriptObject("createRepairBar");
    }
    return none;
    //return ReturnValue;    
}

function @NULL UpdateRepairComp()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp;

    // End:0x38
    foreach AttachedActor.ComponentList(Class'LPRepairableBaseComponent', Comp)
    {
        // End:0x38
        break;        
    }    
    RepairComp = Comp;
    // DebugMode: 0
    assert(RepairComp != none);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, myHUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D, DI;
    local /*0x97E50000-0x00000000*/ private bool bHideUI;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0x2E0
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        // End:0x63
        if(RepairMC == none)
        {
            InitEnhancedRepairMC();            
        }
        else
        {
            // End:0x2E0
            if((LPMPHUD != none) && RepairMC != none)
            {
                myHUD = LPHUD(LPMPHUD.myHUD);
                // End:0x2E0
                if(myHUD != none)
                {
                    bHideUI = myHUD.ScoreboardIsShown() || AttachedActor == GetLPPC().Pawn;
                    SetRepairHealth((RepairComp.GetHealth() * 100) / RepairComp.GetHealthMax());
                    bHideUI = bHideUI || UpdateScreenPosition(DeltaTime, Pos2D, Scale);
                    // End:0x1C5
                    if(bHideUI)
                    {
                        Show(false, true);                        
                    }
                    else
                    {
                        Show(true, true);
                        DI = RepairMC.GetDisplayInfo();
                        DI.X = Pos2D.X;
                        DI.Y = Pos2D.Y;
                        DI.XScale = Scale;
                        DI.YScale = Scale;
                        RepairMC.SetDisplayInfo(DI);
                    }
                }
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, NewPosition, CameraLoc, CameraDir, Canvas;

    local /*0x97E50000-0x00000000*/ private int IconXSize, IconYSize;
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, myHUD;
    local /*0x97E50000-0x00000000*/ private float distToPlayer;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x2D
    if(LPMPHUD == none)
    {
        return false;
    }
    myHUD = LPHUD(LPMPHUD.myHUD);
    Canvas = LPMPHUD.myHUD.Canvas;
    // End:0xBD
    if((Canvas == none) || myHUD == none)
    {
        return false;
    }
    Pos3D = AttachedActor.Location;
    // End:0x222
    if((AttachedActor.CollisionComponent != none) && VSizeSq(AttachedActor.CollisionComponent.Bounds.BoxExtent) > float(0))
    {
        Pos3D = AttachedActor.CollisionComponent.Bounds.Origin;
        Pos3D.Z += AttachedActor.CollisionComponent.Bounds.BoxExtent.Z;
    }
    Pos3D += RepairComp.EnhancedRepairUIOffset;
    distToPlayer = VSize(AttachedActor.Location - GetLPPC().Pawn.Location);
    Pos3D.Z += (distToPlayer * 0.0500000);
    myHUD.GetProjectedPosAndScale(Pos3D, NewPosition, Scale);
    IconXSize = 64;
    IconYSize = 64;
    NewPosition = OwningManager.GetBoundedScreenPosition(Canvas, NewPosition, float(IconXSize), float(IconYSize), false);
    Scale = FClamp(1.0000000 / Scale, WorldMinScale, WorldMaxScale) * BaseScale;
    Pos2D = NewPosition;
    myHUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
    return ((Pos3D - CameraLoc) Dot CameraDir) <= 0.0000000;
    //return ReturnValue;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x167
    if(RepairMC != none)
    {
        // End:0xA8
        if(bShow)
        {
            DI = RepairMC.GetDisplayInfo();
            DI.Visible = bShow;
            RepairMC.SetDisplayInfo(DI);
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
                DI = RepairMC.GetDisplayInfo();
                DI.Visible = bShow;
                RepairMC.SetDisplayInfo(DI);
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

function SetRepairHealth()
{
    local /*0x97E50000-0x00000000*/ private int HealthPct[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD;

    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x96
    if((LPMPHUD != none) && LPMPHUD.MPHUD_Container != none)
    {
        LPMPHUD.MPHUD_Container.ActionScriptVoid("setRepairHealth");
    }
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(RepairMC);
    RepairMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

defaultproperties
{
    BaseScale=40.0000000
    WorldMinScale=0.8000000
    WorldMaxScale=1.2000000
}