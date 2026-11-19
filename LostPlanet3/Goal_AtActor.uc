class Goal_AtActor extends PathGoalEvaluator;

var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalActor;
var(*) /*0x35EA0000-0x00000000*/ private float GoalDist;
var(*) /*0x35EA0000-0x00000000*/ private bool bKeepPartial;

static function AtActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], Goal;
    local /*0x35EA0000-0x00000000*/ private float Dist[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Eval, GoalPawn, GoalController;
    local /*0x35EA0000-0x00000000*/ private float AnchorDist;

    // End:0x32D
    if(P != none)
    {
        GoalPawn = Pawn(Goal);
        GoalController = Controller(Goal);
        // End:0xB2
        if(GoalController != none)
        {
            // End:0xA7
            if(GoalController.Pawn != none)
            {
                GoalPawn = GoalController.Pawn;                
            }
            else
            {
                Goal = none;
            }
        }
        // End:0x1AE
        if(GoalPawn != none)
        {
            // End:0x150
            if(GoalPawn.ValidAnchor() && GoalPawn.Anchor.IsUsableAnchorFor(P))
            {
                Goal = GoalPawn.Anchor;                
            }
            else
            {
                Goal = P.GetBestAnchor(GoalPawn, GoalPawn.Location, false, false, AnchorDist);
            }            
        }
        else
        {
            // End:0x230
            if(NavigationPoint(Goal) == none)
            {
                Goal = P.GetBestAnchor(Goal, Goal.Location, false, false, AnchorDist);
                // End:0x230
                if(Goal == none)
                {
                }
            }
        }
        // End:0x32D
        if(Goal != none)
        {
            Eval = Goal_AtActor(P.CreatePathGoalEvaluator(default.Class));
            // End:0x32D
            if(Eval != none)
            {
                Eval.GoalActor = Goal;
                Eval.GoalDist = Dist;
                Eval.bKeepPartial = bReturnPartial;
                P.AddGoalEvaluator(Eval);
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function Recycle()
{
    GoalActor = none;
    GoalDist = default.GoalDist;
    bKeepPartial = default.bKeepPartial;
    super.Recycle();
    //return;    
}

defaultproperties
{
    MaxPathVisits=1024
    CacheIdx=0
}