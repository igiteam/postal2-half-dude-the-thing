class LPGFxUIElementDNATag extends LPGFxUIActorAttachedElement
    config(UI);

enum eDNATagState
{
    TagState_Partial,               // 0
    TagState_Tagging,               // 1
    TagState_Complete,              // 2
    TagState_MAX                    // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TagMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TagState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagPercent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagVisibleRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastVisibilityCheckTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VisibilityCheckInterval;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bObscured;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideIfPistolNotEquipped[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideIfDNATaggerNotActive[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleFactor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMaxScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeightAboveActor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TagOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CompletionTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToShowAfterCompletion[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CachedPercent;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], DNATagger;

    super(SPGFxUIElement).Init(MP);
    InitDNATagMC();
    DNATagger = GetDNATagger();
    TagVisibleRange = ((DNATagger != none) ? DNATagger.HUDIconVisibleRange : 0.0000000);
    InitTagOffset();
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    super(SPGFxUIActorAttachedElement).SetAttachedActor(TheActor, theIndex);
    TagState = 0;
    TagPercent = 0.0000000;
    InitTagOffset();
    //return;    
}

function InitDNATagMC()
{
    // End:0x2F
    if(MoviePlayer != none)
    {
        TagMC = CreateDNATagMC();
        TagState = 0;
    }
    //return;    
}

function InitTagOffset()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    TagOffset = vect(0.0000000, 0.0000000, 0.0000000);
    P = LPPawn(AttachedActor);
    // End:0x7F
    if(P != none)
    {
        TagOffset = P.TuneDataPawn.DNATagUIOffset;
    }
    //return;    
}

function IsDNATaggerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DNATagger;

    // End:0x5F
    if(bHideIfPistolNotEquipped)
    {
        DNATagger = GetDNATagger();
        // End:0x32
        if(DNATagger == none)
        {
            return false;
        }
        // End:0x5F
        if(bHideIfDNATaggerNotActive)
        {
            return DNATagger.IsDNATaggerActive();
        }
    }
    return true;
    //return ReturnValue;    
}

function GetDNATagger()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], P;

    P = GetLPPC().Pawn;
    return ((P != none) ? LPWeaponPistol(P.Weapon) : none);
    //return ReturnValue;    
}

function GetTagPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Class'LPWeaponPistol'.static.GetTagPercent(AttachedActor);
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD, myHUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D, DI;
    local /*0x97E50000-0x00000000*/ private bool bBounded, bHideUI;

    bShouldBeActive = (super(SPGFxUIActorAttachedElement).Update(DeltaTime) && AttachedActor != none) && Class'LPWeaponPistol'.static.ShouldShowDNATag(AttachedActor);
    // End:0x3FA
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        myHUD = ((LPMPHUD != none) ? LPHUD(LPMPHUD.myHUD) : none);
        // End:0xE1
        if(TagMC == none)
        {
            InitDNATagMC();
        }
        // End:0x3F7
        if((myHUD != none) && TagMC != none)
        {
            // End:0x196
            if(TagPercent < float(100))
            {
                TagPercent = GetTagPercent();
                SetTagIconPercent(TagMC, Round(TagPercent));
                // End:0x196
                if(TagPercent >= float(100))
                {
                    CompletionTime = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds;
                }
            }
            // End:0x206
            if((TagPercent >= float(100)) && (Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds - CompletionTime) > TimeToShowAfterCompletion)
            {
                SetActive(false, true);
                return false;
            }
            bBounded = UpdateScreenPosition(Pos2D, Scale);
            bHideUI = ((myHUD.ScoreboardIsShown() || bBounded) || bObscured) || !IsDNATaggerActive();
            // End:0x2A2
            if(bHideUI)
            {
                Show(false, true);                
            }
            else
            {
                Show(true, true);
                Scale = FMax((ScaleFactor / Scale) * WorldMaxScale, WorldMinScale) * float(100);
                DI = TagMC.GetDisplayInfo();
                DI.X = Pos2D.X;
                DI.Y = Pos2D.Y;
                DI.XScale = Scale;
                DI.YScale = Scale;
                TagMC.SetDisplayInfo(DI);
            }
        }        
    }
    else
    {
        TagPercent = 0.0000000;
        SetActive(false, true);
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pos3D, UnclippedPosition, NewPosition, CameraLoc, CameraDir;

    local /*0x97E50000-0x00000000*/ private int IconXSize, IconYSize;
    local /*0x97E50000-0x00000000*/ private float distToPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL Canvas, myHUD, LPMPHUD, LPPC, P;

    Scale = 1.0000000;
    LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    myHUD = ((LPMPHUD != none) ? LPHUD(LPMPHUD.myHUD) : none);
    Canvas = ((myHUD != none) ? myHUD.Canvas : none);
    // End:0xDB
    if(((LPMPHUD == none) || Canvas == none) || myHUD == none)
    {
        return true;
    }
    LPPC = GetLPPC();
    P = LPPC.Pawn;
    Pos3D = AttachedActor.Location;
    // End:0x1C5
    if(AttachedActor.bHardAttach && Pawn(AttachedActor) != none)
    {
        Pos3D = Pawn(AttachedActor).Mesh.GetPosition();        
    }
    else
    {
        // End:0x302
        if((AttachedActor.CollisionComponent != none) && VSizeSq(AttachedActor.CollisionComponent.Bounds.BoxExtent) > float(0))
        {
            Pos3D = AttachedActor.CollisionComponent.Bounds.Origin;
            Pos3D.Z += AttachedActor.CollisionComponent.Bounds.BoxExtent.Z;
        }
    }
    distToPlayer = VSize(Pos3D - ((P != none) ? P.Location : LPPC.LastKnownPawnLocation));
    Pos3D.Z += (HeightAboveActor + (distToPlayer * 0.0500000));
    Pos3D += TagOffset;
    // End:0x3DF
    if((TagVisibleRange > float(0)) && distToPlayer > TagVisibleRange)
    {
        return true;
    }
    OwningManager.GetCameraViewPoint(CameraLoc, CameraDir);
    // End:0x43B
    if(((Pos3D - CameraLoc) Dot CameraDir) < 0.0000000)
    {
        return true;
    }
    myHUD.GetProjectedPosAndScale(Pos3D, UnclippedPosition, Scale);
    IconXSize = 64;
    IconYSize = 64;
    NewPosition = OwningManager.GetBoundedScreenPosition(Canvas, UnclippedPosition, float(IconXSize), float(IconYSize), false);
    // End:0x583
    if((Abs(NewPosition.X - UnclippedPosition.X) > float(IconXSize / 2)) || Abs(NewPosition.Y - UnclippedPosition.Y) > float(IconYSize / 2))
    {
        return true;
    }
    // End:0x63B
    if(AttachedActor.WorldInfo.TimeSeconds >= (LastVisibilityCheckTime + VisibilityCheckInterval))
    {
        // End:0x5FE
        if(P != none)
        {
            bObscured = !IsActorVisible(AttachedActor);
        }
        LastVisibilityCheckTime = AttachedActor.WorldInfo.TimeSeconds;
    }
    Pos2D = NewPosition;
    myHUD.TransformHUDPosToScaleformStagePos(Pos2D.X, Pos2D.Y);
    return false;
    //return ReturnValue;    
}

function IsActorVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Nesting, P, Hive;
    local /*0x97E50000-0x00000000*/ private float LastRenderTime;

    Nesting = LPDestructibleNesting(inActor);
    P = LPPawn(inActor);
    Hive = LPHiveSpawnPoint(inActor);
    // End:0xC9
    if((Nesting != none) && Nesting.CollisionComponent != none)
    {
        LastRenderTime = Nesting.CollisionComponent.LastRenderTime;        
    }
    else
    {
        // End:0x13E
        if((P != none) && P.Mesh != none)
        {
            LastRenderTime = P.Mesh.LastRenderTime;            
        }
        else
        {
            // End:0x1B0
            if((Hive != none) && Hive.VisibleMesh != none)
            {
                LastRenderTime = Hive.VisibleMesh.LastRenderTime;
            }
        }
    }
    return (AttachedActor.WorldInfo.TimeSeconds - LastRenderTime) < VisibilityCheckInterval;
    //return ReturnValue;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0xB7
    if(bShow != bVisible)
    {
        // End:0xB7
        if(TagMC != none)
        {
            DI = TagMC.GetDisplayInfo();
            DI.Visible = bShow;
            TagMC.SetDisplayInfo(DI);
            bVisible = bShow;
        }
    }
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    LPGFxMoviePlayerHUD(MoviePlayer).RemoveMovieClip(TagMC);
    TagMC = none;
    super(SPGFxUIElement).ShutDown(MP);
    //return;    
}

function CreateDNATagMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createDNATag");
    //return ReturnValue;    
}

function SetTagIconPercent()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int Percent[8388609];

    // End:0x5B
    if(CachedPercent != Percent)
    {
        CachedPercent = Percent;
        MoviePlayer.ActionScriptVoid("setDNATagPercent");
    }
    //return;    
}

function SetTagIconColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private int R[8388609], G, B;

    LPGFxMoviePlayerHUD(MoviePlayer).SetMovieClipColor(MC, R, G, B);
    //return;    
}

defaultproperties
{
    VisibilityCheckInterval=0.2500000
    ScaleFactor=1.2000000
    WorldMinScale=1.0000000
    WorldMaxScale=1.4000000
    HeightAboveActor=10.0000000
    TimeToShowAfterCompletion=5.0000000
    CachedPercent=-1
}