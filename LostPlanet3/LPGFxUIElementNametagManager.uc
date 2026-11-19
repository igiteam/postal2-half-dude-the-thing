class LPGFxUIElementNametagManager extends LPGFxUIElementWorldObjectManager;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagHoverDist[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagHoverDistScale[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AfterDeathDuration[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeDuration[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PaintTagDist[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationShowAfterPainted[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OnScreenIconScale[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EdgeIconScale[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowIconsOnlyAtEdges[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTracedThisFrame;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageShakeMaxDistance[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageIndicateDuration[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NametagDistSmallest[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NametagScaleSmallest[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NametagDistBiggest[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NametagScaleBiggest[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NametagIconDist[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LocalPlayerIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUDPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NextCanTracePawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OwnerLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastOwnerPawn;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElementWorldObjectManager).Init(MP);
    ParentHUDPlayer = LPGFxMoviePlayerHUD(MoviePlayer);
    //return;    
}

function NotifyMPHUDLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMPHUD_Container[8388609];

    OnEnable();
    //return;    
}

function ShutDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElementWorldObjectManager).ShutDown(MP);
    NextCanTracePawn = none;
    //return;    
}

function OnEnable()
{
    AddAllPlayers();
    //return;    
}

function AddAllPlayers()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawnIter, World;

    World = GetLPPC().WorldInfo;
    // End:0x83
    if(World != none)
    {
        // End:0x82
        foreach World.AllPawns(Class'LPBasePlayerPawn', PlayerPawnIter)
        {
            AddNametag(PlayerPawnIter);            
        }        
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bRetval;
    local /*0x97E50000-0x00000000*/ private @NULL ownerPawn, PC;

    PC = GetLPPC();
    // End:0xB3
    if(PC != none)
    {
        ownerPawn = PC.Pawn;
        // End:0xB3
        if(ownerPawn == none)
        {
            ownerPawn = Pawn(PC.PlayerCamera.ViewTarget.Target);
        }
    }
    // End:0xEA
    if(ownerPawn != none)
    {
        OwnerLocation = ownerPawn.Location;
    }
    // End:0x11E
    if(ownerPawn != LastOwnerPawn)
    {
        ResetAllClips();
        LastOwnerPawn = ownerPawn;
    }
    bTracedThisFrame = false;
    bRetval = super(SPGFxUIElementWorldObjectManager).Update(DeltaTime);
    // End:0x162
    if(!bTracedThisFrame)
    {
        NextCanTracePawn = none;
    }
    return bRetval;
    //return ReturnValue;    
}

function ResetAllClips()
{
    local /*0x97E50000-0x00000000*/ private @NULL Tag, at;

    // End:0x77
    foreach Attachments(at)
    {
        Tag = LPGFxUIElementNametag(at.UIElement);
        // End:0x76
        if(Tag != none)
        {
            Tag.bVisible = true;
        }        
    }    
    //return;    
}

function ShouldShowIcons()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AddNametag()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttachedPawn[8388609];

    AddElementForActor(AttachedPawn);
    //return;    
}

function GetBoundedTextScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Text[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ScreenPos[8388609];
    local /*0x97E50000-0x00000000*/ private float TextWidth[8388609], textHeight;
    local /*0x97E50000-0x00000000*/ private bool bClampToEdge[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Result, UnclampedPosition;

    Result = ScreenPos;
    TextWidth = 0.0000000;
    textHeight = 64.0000000;
    Result.X -= BoundsCenterX;
    Result.Y -= BoundsCenterY;
    UnclampedPosition = Result;
    Result.X = FClamp(Result.X, -BoundsExtentX, BoundsExtentX - TextWidth);
    Result.Y = FClamp(Result.Y, -BoundsExtentY + textHeight, BoundsExtentY);
    // End:0x3F3
    if(bClampToEdge && Result == UnclampedPosition)
    {
        // End:0x1B3
        if(Result.X == float(0))
        {
            Result.X = 1.0000000;
        }
        // End:0x1F9
        if(Result.Y == float(0))
        {
            Result.Y = 1.0000000;
        }
        Result.X *= (float(2) * (BoundsExtentX + BoundsExtentY));
        Result.Y *= (float(2) * (BoundsExtentX + BoundsExtentY));
        UnclampedPosition = Result;
        Result.X = FClamp(Result.X, -BoundsExtentX, BoundsExtentX - TextWidth);
        Result.Y *= (Result.X / UnclampedPosition.X);
        UnclampedPosition = Result;
        Result.Y = FClamp(Result.Y, -BoundsExtentY + textHeight, BoundsExtentY);
        Result.X *= (Result.Y / UnclampedPosition.Y);
    }
    Result.X += BoundsCenterX;
    Result.Y += BoundsCenterY;
    return Result;
    //return ReturnValue;    
}

function IsTeamGame()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OwnerPC;

    OwnerPC = GetLPPC();
    // End:0x8C
    if((OwnerPC != none) && OwnerPC.WorldInfo != none)
    {
        return LPGRI_TDM_MP(OwnerPC.WorldInfo.GRI) != none;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

defaultproperties
{
    TagHoverDist=15.0000000
    TagHoverDistScale=0.0300000
    AfterDeathDuration=5.0000000
    FadeDuration=0.3000000
    PaintTagDist=2500.0000000
    DurationShowAfterPainted=1.5000000
    OnScreenIconScale=0.7500000
    EdgeIconScale=0.5000000
    DamageShakeMaxDistance=5.0000000
    DamageIndicateDuration=0.7000000
    NametagDistSmallest=10000.0000000
    NametagScaleSmallest=1.0000000
    NametagDistBiggest=500.0000000
    NametagScaleBiggest=1.3330000
    NametagIconDist=10000.0000000
    UIElementClass=Class'LPGFxUIElementNametag'
}