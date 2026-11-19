class LPAIObjectiveFlee extends LPAIObjective within LPAIController
    hidecategories(Object,Object);

struct FleeDistancesEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ActorClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Seperation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxExploreDistance;

    structdefaultproperties
    {
        ActorClass=none
        Seperation=0.0000000
        MaxExploreDistance=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSeperationFromEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxFleeDistance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FleeDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FleeBeginTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FleeDistances;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTryToLeaveFleeEarly;

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Flee";
    //return ReturnValue;    
}

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function OnCommandFinished()
{
    FleeBeginTime = 0.0000000;
    super(SPAIObjective).OnCommandFinished();
    MyObjectiveManager.ImportantObjectiveAdded();
    //return;    
}

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(LPAICmd_MoveToActorKismet(Outer.GetActiveCommand()) != none)
    {
        return false;        
    }
    else
    {
        // End:0x44
        if(!HasEnemies())
        {
            return false;
        }
    }
    return super(SPAIObjective).CanBeActivated();
    //return ReturnValue;    
}

protected function BuidFleeFromList()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[25165825];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate;

    I = 0;
    J0x0B:

    // End:0xCC [Loop If]
    if(I < Outer.TargetList.Length)
    {
        EnemyCandidate = Outer.TargetList[I].Actor;
        // End:0xBE
        if(Outer.CanBeMyEnemy(EnemyCandidate))
        {
            FleeFrom.AddItem(EnemyCandidate);            
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private float Seperation, ExploreDistance;

    BuidFleeFromList(FleeFrom);
    FleeBeginTime = Outer.WorldInfo.TimeSeconds;
    Seperation = MinSeperationFromEnemy;
    ExploreDistance = MaxFleeDistance;
    SetupDistances(FleeFrom, Seperation, ExploreDistance);
    Cmd = Outer.CmdFlee(FleeDuration, ExploreDistance, Seperation, FleeFrom);
    // End:0x11C
    if(Cmd != none)
    {
        Cmd.SetSPAIObjective(self);        
    }
    else
    {
        Status = 4;
    }
    //return;    
}

function SetupDistances()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[8388609];
    local /*0x97E50000-0x00000000*/ private float Seperation[25165825], ExploreDistance;
    local /*0x97E50000-0x00000000*/ private int I, J;

    // End:0x1A0
    if((FleeDistances.Length > 0) && FleeFrom.Length > 0)
    {
        I = 0;
        J0x2D:

        // End:0x1A0 [Loop If]
        if(I < FleeFrom.Length)
        {
            J = 0;
            J0x50:

            // End:0x192 [Loop If]
            if(J < FleeDistances.Length)
            {
                // End:0x184
                if(ClassIsChildOf(FleeFrom[I].Class, FleeDistances[J].ActorClass))
                {
                    // End:0x120
                    if(FleeDistances[J].Seperation > Seperation)
                    {
                        Seperation = FleeDistances[J].Seperation;
                    }
                    // End:0x184
                    if(FleeDistances[J].MaxExploreDistance > ExploreDistance)
                    {
                        ExploreDistance = FleeDistances[J].MaxExploreDistance;
                    }
                }
                ++J;
                // [Loop Continue]
                goto J0x50;
            }
            ++I;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    //return;    
}

function HasEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private float Seperation, ExploreDistance;

    I = 0;
    J0x0B:

    // End:0xCC [Loop If]
    if(I < Outer.TargetList.Length)
    {
        EnemyCandidate = Outer.TargetList[I].Actor;
        // End:0xBE
        if(Outer.CanBeMyEnemy(EnemyCandidate))
        {
            FleeFrom.AddItem(EnemyCandidate);            
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x185
    if(FleeFrom.Length > 0)
    {
        Seperation = MinSeperationFromEnemy;
        ExploreDistance = MaxFleeDistance;
        SetupDistances(FleeFrom, Seperation, ExploreDistance);
        I = 0;
        J0x132:

        // End:0x185 [Loop If]
        if(I < FleeFrom.Length)
        {
            // End:0x177
            if((EnemySeperation(FleeFrom[I])) < Seperation)
            {
                return true;
            }
            ++I;
            // [Loop Continue]
            goto J0x132;
        }
    }
    return false;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, Obj;

    Obj = FindFleeObjective(InObjectiveManager, InAttributes);
    // End:0x51
    if(Obj == none)
    {
        CreateNewFleeObjective(InObjectiveManager, InAttributes);
    }
    //return;    
}

static function @NULL FindFleeObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective;

    // End:0x61
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveFlee', InAttributes, CurObjective)
    {
        // End:0x60
        if(CurObjective != none)
        {            
            return LPAIObjectiveFlee(CurObjective);
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL CreateNewFleeObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes;

    default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return;    
}

event Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPAIObjective).Update(DeltaTime);
    // End:0x4E
    if((IsActive()) && bTryToLeaveFleeEarly)
    {
        MyObjectiveManager.ImportantObjectiveAdded();
    }
    //return;    
}

defaultproperties
{
    MinSeperationFromEnemy=1000.0000000
    MaxFleeDistance=10000.0000000
    FleeDuration=4.0000000
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_Alerted)
}