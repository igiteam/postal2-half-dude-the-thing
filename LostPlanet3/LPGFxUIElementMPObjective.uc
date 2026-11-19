class LPGFxUIElementMPObjective extends LPGFxUIActorAttachedElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContainerMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PointMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EdgeMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StateTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IconAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIconInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsBounded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ObjectiveType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ObjectiveStateFunc;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleFactor[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EdgeIconScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMinScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WorldMaxScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconOffset[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CachedIconAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CachedProgress;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CachedProximity;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    InitObjectiveMC();
    //return;    
}

function InitObjectiveMC()
{
    MPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
    // End:0x96
    if(MPHUD != none)
    {
        ContainerMC = MPHUD.MPHUD_Container;
        // End:0x96
        if(ContainerMC != none)
        {
            PointMC = CreatePointMC();
            EdgeMC = CreateEdgeMC();
            bIconInit = false;
        }
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
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive, bBounded;
    local /*0x97E50000-0x00000000*/ private float Scale;
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D;

    bShouldBeActive = super(SPGFxUIActorAttachedElement).Update(DeltaTime);
    // End:0xE7
    if(bShouldBeActive)
    {
        UpdateObjectiveIcon(DeltaTime);
        // End:0x5A
        if(ShouldHideUI())
        {
            Show(false, true);            
        }
        else
        {
            Show(true, true);
            bBounded = UpdateScreenPosition(DeltaTime, Pos2D, Scale);
            SetPositionAndScale(((bBounded) ? EdgeMC : PointMC), Pos2D, Scale);
            SetBounded(bBounded);
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

// Export ULPGFxUIElementMPObjective::execSetPositionAndScale(FFrame&, void* const)
native function SetPositionAndScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL GFxObj[8388609], Pos2D;
    local /*0x97E50000-0x00000000*/ private float Scale[8388609];


}

function InitObjectiveIcon()
{
    ObjectiveChangedState();
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x19
    if(ContainerMC == none)
    {
        InitObjectiveMC();
    }
    // End:0x3E
    if(!bIconInit)
    {
        InitObjectiveIcon();
        bIconInit = true;
    }
    // End:0x9E
    if(StateTimer > float(0))
    {
        StateTimer -= DeltaTime;
        // End:0x83
        if(StateTimer < float(0))
        {
            StateTimer = 0.0000000;
        }
        // End:0x9E
        if(StateTimer == float(0))
        {
            OnStateTimer();
        }
    }
    //return;    
}

function ObjectiveChangedState()
{
    //return;    
}

function ObjectiveChangedTouch()
{
    local /*0x97E50000-0x00000000*/ private bool bIsTouching[8388609];

    //return;    
}

function OnStateTimer()
{
    //return;    
}

// Export ULPGFxUIElementMPObjective::execUpdateScreenPosition(FFrame&, void* const)
native function UpdateScreenPosition()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pos2D[25165825];
    local /*0x97E50000-0x00000000*/ private float Scale[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGFxUIElementMPObjective::execGetIconPosition(FFrame&, void* const)
native function GetIconPosition()
{
    local /*0x97E50000-0x00000000*/ private float distToPlayer[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function ShouldHideUI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL myHUD;
    local /*0x97E50000-0x00000000*/ private bool bHide;
    local /*0x97E50000-0x00000000*/ private @NULL P;

    bHide = false;
    P = GetLPPC().Pawn;
    bHide = (P == none) || !P.IsAliveAndWell();
    // End:0xFC
    if(!bHide && MPHUD != none)
    {
        myHUD = LPHUD(MPHUD.myHUD);
        // End:0xFC
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
    local /*0x97E50000-0x00000000*/ private bool bBounded[8388609];

    // End:0x6A
    if(bBounded != bIsBounded)
    {
        SetMPObjectiveVisibility(PointMC, !bBounded);
        SetMPObjectiveVisibility(EdgeMC, bBounded);
        bIsBounded = bBounded;
    }
    // End:0x81
    if(bBounded)
    {
        UpdateEdgeIconRotation();
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    // End:0xA7
    if(bIsVisible != bShow)
    {
        // End:0x57
        if(!bIsBounded || !bShow)
        {
            SetMPObjectiveVisibility(PointMC, bShow);
        }
        // End:0x92
        if(bIsBounded || !bShow)
        {
            SetMPObjectiveVisibility(EdgeMC, bShow);
        }
        bIsVisible = bShow;
    }
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

    return CreateMPObjectivePoint(ObjectiveType);
    //return ReturnValue;    
}

function CreateEdgeMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CreateMPObjectiveEdgePoint(ObjectiveType);
    //return ReturnValue;    
}

function UpdateEdgeIconRotation()
{
    // End:0x48
    if(IconAngle != CachedIconAngle)
    {
        RotateMPObjectiveEdgePoint(EdgeMC, int(IconAngle));
        CachedIconAngle = IconAngle;
    }
    //return;    
}

function SetObjectiveState()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string State[8388609];

    SetMPObjectiveState(PointMC, State);
    SetMPObjectiveEdgeState(EdgeMC, ObjectiveType, State);
    //return;    
}

function ShowProgress()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ShowMPObjectiveProgress(PointMC, bShow);
    //return;    
}

function SetProgress()
{
    local /*0x97E50000-0x00000000*/ private float Progress[8388609];

    // End:0x46
    if(Progress != CachedProgress)
    {
        SetMPObjectiveProgress(PointMC, Progress);
        CachedProgress = Progress;
    }
    //return;    
}

function ShowProximity()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ShowMPObjectiveProximity(PointMC, bShow);
    //return;    
}

event SetProximity()
{
    local /*0x97E50000-0x00000000*/ private float Distance[8388609];

    // End:0x4A
    if(Distance != float(CachedProximity))
    {
        SetMPObjectiveProximity(PointMC, Distance);
        CachedProximity = int(Distance);
    }
    //return;    
}

function CreateMPObjectivePoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Type[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((ContainerMC == none) ? none : ContainerMC.ActionScriptObject("createMPObjectivePoint"));
    //return ReturnValue;    
}

function CreateMPObjectiveEdgePoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Type[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ((ContainerMC == none) ? none : ContainerMC.ActionScriptObject("createMPObjectiveEdgePoint"));
    //return ReturnValue;    
}

function RotateMPObjectiveEdgePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL EdgePoint[8388609];
    local /*0x97E50000-0x00000000*/ private int degrees[8388609];

    // End:0x4A
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("rotateMPObjectiveEdgePoint");
    }
    //return;    
}

function SetMPObjectiveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string State[8388609];

    // End:0x37
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid(ObjectiveStateFunc);
    }
    //return;    
}

function SetMPObjectiveEdgeState()
{
    local /*0x97E50000-0x00000000*/ private @NULL EdgePoint[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Type[8388609], State;

    // End:0x4C
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPObjectiveEdgePointColor");
    }
    //return;    
}

function SetMPObjectiveVisibility()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x4D
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPObjectivePointVisibility");
    }
    //return;    
}

function ShowMPObjectiveProgress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x45
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("showObjectiveProgress");
    }
    //return;    
}

function SetMPObjectiveProgress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private float Progress[8388609];

    // End:0x46
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPObjectiveProgress");
    }
    //return;    
}

function ShowMPObjectiveProximity()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x4A
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("showMPObjectProximityMeter");
    }
    //return;    
}

function SetMPObjectiveProximity()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private float Distance[8388609];

    // End:0x47
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("setMPObjectiveProximity");
    }
    //return;    
}

function DeleteMPObjectiveMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];

    // End:0x46
    if(ContainerMC != none)
    {
        ContainerMC.ActionScriptVoid("deleteMPObjectivePoint");
    }
    //return;    
}

defaultproperties
{
    ScaleFactor=1.0000000
    EdgeIconScale=1.0000000
    WorldMinScale=0.8000000
    WorldMaxScale=1.2000000
}