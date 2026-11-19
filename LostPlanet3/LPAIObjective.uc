class LPAIObjective extends SPAIObjective within LPAIController
    abstract
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLpAiController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPAIPawn;

protected function GetActorRadiusAndHeight()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825], OutHeight;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;

    // End:0xEA
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0xB7
        if(inPawn != none)
        {
            OutRadius = inPawn.CylinderComponent.CollisionRadius;
            OutHeight = inPawn.CylinderComponent.CollisionHeight;            
        }
        else
        {
            inActor.GetBoundingCylinder(OutRadius, OutHeight);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EnemyRange2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize2D(Outer.myAIPawn.Location - Enemy2Test.Location);
    //return ReturnValue;    
}

function IsEnemyAliveAndWell()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn;

    EnemyPawn = Pawn(Enemy2Test);
    // End:0x4B
    if(EnemyPawn != none)
    {
        return EnemyPawn.IsAliveAndWell();
    }
    return true;
    //return ReturnValue;    
}

function EnemySeperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius, Enemy2TestRadius, Enemy2TestHeight;

    GetActorRadiusAndHeight(Enemy2Test, Enemy2TestRadius, Enemy2TestHeight);
    combinedRadius = Outer.MyKynapseRadius + Enemy2TestRadius;
    return (EnemyRange2D(Enemy2Test)) - combinedRadius;
    //return ReturnValue;    
}

static function @NULL IsAttackingEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Obj, LPController;

    LPController = LPAIController(OuterController);
    // End:0x2D
    if(LPController == none)
    {
        return false;
    }
    Obj = LPAIObjectiveAttackActor(LPController.CurrentObjective);
    // End:0x6F
    if(Obj == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event OnGenerated()
{
    super.OnGenerated();
    MyLpAiController = LPAIController(OuterSPAIController);
    MyLPAIPawn = LPAIPawn(MyPawn);
    //return;    
}

function AllowOtherObjectivesToInterrupt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}
