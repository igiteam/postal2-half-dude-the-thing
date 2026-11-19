class AIController extends Controller
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private bool bAdjustFromWalls;
var(*) /*0x35EA0000-0x00000000*/ private bool bReverseScriptedRoute;
var(*) /*0x35EA0000-0x00000000*/ private float Skill;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScriptedMoveTarget;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScriptedRoute;
var(*) /*0x35EA0000-0x00000000*/ private int ScriptedRouteIndex;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ScriptedFocus;

event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    // End:0x19
    if(bDeleteMe)
    {
        return;
    }
    // End:0x7B
    if(WorldInfo.Game != none)
    {
        Skill += WorldInfo.Game.GameDifficulty;
    }
    Skill = FClamp(Skill, 0.0000000, 3.0000000);
    //return;    
}

function Reset()
{
    super.Reset();
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string T;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    super.DisplayDebug(HUD, out_YL, out_YPos);
    // End:0x53A
    if(HUD.ShouldDisplayDebug('AI'))
    {
        Canvas.DrawColor.B = 255;
        // End:0x190
        if(((Pawn != none) && MoveTarget != none) && Pawn.ReachedDestination(MoveTarget))
        {
            Canvas.DrawText((((("     Skill " $ string(Skill)) $ " NAVIGATION MoveTarget ") $ (GetItemName(string(MoveTarget)))) $ "(REACHED) MoveTimer ") $ string(MoveTimer), false);            
        }
        else
        {
            Canvas.DrawText((((("     Skill " $ string(Skill)) $ " NAVIGATION MoveTarget ") $ (GetItemName(string(MoveTarget)))) $ " MoveTimer ") $ string(MoveTimer), false);
        }
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText((((("      Destination " $ string(GetDestinationPosition())) $ " Focus ") $ (GetItemName(string(Focus)))) $ " Preparing Move ") $ string(bPreparingMove), false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText((("     RouteGoal " $ (GetItemName(string(RouteGoal)))) $ " RouteDist ") $ string(RouteDist), false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        I = 0;
        J0x3DC:

        // End:0x4B7 [Loop If]
        if(I < RouteCache.Length)
        {
            // End:0x460
            if(RouteCache[I] == none)
            {
                // End:0x45A
                if(I > 5)
                {
                    T = (T $ "--") $ (GetItemName(string(RouteCache[I - 1])));
                }
                // [Explicit Break]
                goto J0x4B7;                
            }
            else
            {
                // End:0x4A9
                if(I < 5)
                {
                    T = (T $ (GetItemName(string(RouteCache[I])))) $ "-";
                }
            }
            I++;
            // [Loop Continue]
            goto J0x3DC;
        }
        J0x4B7:

        Canvas.DrawText("     RouteCache: " $ T, false);
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    //return;    
}

event SetTeam()
{
    local /*0x35EA0000-0x00000000*/ private int inTeamIdx[8388609];

    WorldInfo.Game.ChangeTeam(self, inTeamIdx, true);
    //return;    
}

simulated event GetPlayerViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    // End:0x62
    if(Pawn != none)
    {
        out_Location = Pawn.Location;
        out_Rotation = Pawn.Rotation;        
    }
    else
    {
        super.GetPlayerViewPoint(out_Location, out_Rotation);
    }
    //return;    
}

function OnAIMoveToActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609], destActor, ObjVar;

    ClearLatentAction(Class'SeqAct_AIMoveToActor', true, Action);
    destActor = Action.PickDestination(Pawn);
    // End:0x1AF
    if(destActor != none)
    {
        ScriptedRoute = Route(destActor);
        // End:0xE5
        if(ScriptedRoute != none)
        {
            // End:0xB1
            if(ScriptedRoute.RouteList.Length == 0)
            {                
            }
            else
            {
                ScriptedRouteIndex = 0;
                // End:0xE2
                if(!IsInState('ScriptedRouteMove'))
                {
                    PushState('ScriptedRouteMove');
                }
            }            
        }
        else
        {
            ScriptedMoveTarget = destActor;
            // End:0x11E
            if(!IsInState('ScriptedMove'))
            {
                PushState('ScriptedMove');
            }
        }
        ScriptedFocus = none;
        // End:0x1AB
        foreach Action.LinkedVariables(Class'SeqVar_Object', ObjVar, "Look At")
        {
            ScriptedFocus = Actor(ObjVar.GetObjectValue());
            // End:0x1AA
            if(ScriptedFocus != none)
            {
                // End:0x1AB
                break;
            }            
        }                
    }
    //return;    
}

function NotifyWeaponFired()
{
    local /*0x35EA0000-0x00000000*/ private @NULL W[8388609];
    local /*0x35EA0000-0x00000000*/ private byte FireMode[8388609];

    //return;    
}

function NotifyWeaponFinishedFiring()
{
    local /*0x35EA0000-0x00000000*/ private @NULL W[8388609];
    local /*0x35EA0000-0x00000000*/ private byte FireMode[8388609];

    //return;    
}

function CanFireWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Wpn[8388609];
    local /*0x35EA0000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

state ScriptedMove
{
    event PoppedState()
    {
        // End:0x2F
        if(ScriptedRoute == none)
        {
            ClearLatentAction(Class'SeqAct_AIMoveToActor', ScriptedMoveTarget == none);
        }
        ScriptedMoveTarget = none;
        //return;        
    }

    event PushedState()
    {
        // End:0x2E
        if(Pawn != none)
        {
            Pawn.SetMovementPhysics();
        }
        //return;        
    }
    J0x00:
    // End:0xCA [Loop If]
    if(((Pawn != none) && ScriptedMoveTarget != none) && !Pawn.ReachedDestination(ScriptedMoveTarget))
    {
        // End:0x79
        if(ActorReachable(ScriptedMoveTarget))
        {
            MoveToward(ScriptedMoveTarget, ScriptedFocus);            
        }
        else
        {
            MoveTarget = FindPathToward(ScriptedMoveTarget);
            // End:0xBC
            if(MoveTarget != none)
            {
                MoveToward(MoveTarget, ScriptedFocus);                
            }
            else
            {
                ScriptedMoveTarget = none;
            }
        }
        // [Loop Continue]
        goto J0x00;
    }
    PopState();
    stop;            
}

state ScriptedRouteMove
{
    event PoppedState()
    {
        ClearLatentAction(Class'SeqAct_AIMoveToActor', ScriptedRoute == none);
        ScriptedRoute = none;
        //return;        
    }
    J0x00:
    // End:0x178 [Loop If]
    if((((Pawn != none) && ScriptedRoute != none) && ScriptedRouteIndex < ScriptedRoute.RouteList.Length) && ScriptedRouteIndex >= 0)
    {
        ScriptedMoveTarget = ScriptedRoute.RouteList[ScriptedRouteIndex].Actor;
        // End:0xC8
        if(ScriptedMoveTarget != none)
        {
            PushState('ScriptedMove');
        }
        // End:0x15F
        if((Pawn != none) && Pawn.ReachedDestination(ScriptedRoute.RouteList[ScriptedRouteIndex].Actor))
        {
            // End:0x151
            if(bReverseScriptedRoute)
            {
                ScriptedRouteIndex--;                
            }
            else
            {
                ScriptedRouteIndex++;
            }            
        }
        else
        {
            ScriptedRoute = none;
            PopState();
        }
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x285
    if(((Pawn != none) && ScriptedRoute != none) && ScriptedRoute.RouteList.Length > 0)
    {
        switch(ScriptedRoute.RouteType)
        {
            // End:0x1FA
            case 0:
                PopState();
                // End:0x282
                break;
            // End:0x249
            case 1:
                bReverseScriptedRoute = !bReverseScriptedRoute;
                // End:0x231
                if(bReverseScriptedRoute)
                {
                    ScriptedRouteIndex--;                    
                }
                else
                {
                    ScriptedRouteIndex++;
                }
                goto 'Begin';
                // End:0x282
                break;
            // End:0x266
            case 2:
                ScriptedRouteIndex = 0;
                goto 'Begin';
                // End:0x282
                break;
            // End:0xFFFF
            default:
                ScriptedRoute = none;
                PopState();
                // End:0x282
                break;
                break;
        }        
    }
    else
    {
        ScriptedRoute = none;
        PopState();
    }
    ScriptedRoute = none;
    PopState();
    stop;            
}

defaultproperties
{
    bAdjustFromWalls=true
    bCanDoSpecial=true
    MinHitWall=-0.5000000
}