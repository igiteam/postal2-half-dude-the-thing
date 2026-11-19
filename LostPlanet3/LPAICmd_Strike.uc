class LPAICmd_Strike extends LPAICommand within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPhysicalStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyForStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyEnemyRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyEnemyHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeStatus[536870913];

function Pushed()
{
    super.Pushed();
    Outer.Focus = none;
    // End:0x6E
    if(bPhysicalStrike)
    {
        Outer.myAIPawn.EnableLineSweepHitTester(true);
    }
    TriggerStrikeEvent();
    //return;    
}

function Popped()
{
    ForceCloseAllDodgeWindows();
    super.Popped();
    // End:0x58
    if(bPhysicalStrike)
    {
        Outer.myAIPawn.EnableLineSweepHitTester(false);
    }
    //return;    
}

event SPAborted()
{
    ForceCloseAllDodgeWindows();
    super.SPAborted();
    //return;    
}

function ForceCloseAllDodgeWindows()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl;

    // End:0xB1
    if(EnemyForStrike != none)
    {
        PlayerCtrl = LPPlayerController(EnemyForStrike.Controller);
        // End:0xB1
        if((PlayerCtrl != none) && PlayerCtrl.SpecialDodgeActor == Outer.myAIPawn)
        {
            PlayerCtrl.NotifyCloseAllDodgeWindows();
        }
    }
    Outer.myAIPawn.NotifyAllPlayerDodgeWindowsClosed();
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    StrikeStatus = LPAICmdStatus_Strike(ReturnStatus);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    EnemyForStrike = InEnemy;
    // End:0xE4
    if(EnemyForStrike != none)
    {
        MyEnemyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(EnemyForStrike);
        MyEnemyHeight = EnemyForStrike.CylinderComponent.CollisionHeight;
        Outer.PawnLookAtActor(EnemyForStrike);
        Outer.MyLPEnemy = EnemyForStrike;        
    }
    else
    {
        MyEnemyRadius = -1.0000000;
        MyEnemyHeight = -1.0000000;
    }
    //return;    
}

function IsMyEnemyAlive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.CanBeMyEnemy(EnemyForStrike);
    //return ReturnValue;    
}

function EnemyRange2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize2D(Outer.myAIPawn.Location - (EnemyForStrikeLocation()));
    //return ReturnValue;    
}

function EnemyZDiff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Abs(Outer.myAIPawn.Location.Z - EnemyForStrikeLocation().Z);
    //return ReturnValue;    
}

function EnemySeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius, Seperation;

    combinedRadius = Outer.MyKynapseRadius + MyEnemyRadius;
    Seperation = (EnemyRange2D()) - combinedRadius;
    return Seperation;
    //return ReturnValue;    
}

function EnemySeperation2DTight()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = Outer.myAIPawn.CylinderComponent.CollisionRadius + EnemyForStrike.CylinderComponent.CollisionRadius;
    return (EnemyRange2D()) - combinedRadius;
    //return ReturnValue;    
}

function ConvertRangeToSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float RangeToConvert[8388609], ReturnValue, combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + MyEnemyRadius;
    return RangeToConvert - combinedRadius;
    //return ReturnValue;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsMyEnemyAlive();
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x26
    if(IsMyEnemyAlive())
    {
        GotoState(StateName, 'Begin');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

function PushStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x24
    if(IsMyEnemyAlive())
    {
        PushState(StateName);        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

event EnemyForStrikeLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EnemyForStrike.Location;
    //return ReturnValue;    
}

function IsInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5B
    if((Seperation >= Range.Min) && Seperation <= Range.Max)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

defaultproperties
{
    bPhysicalStrike=true
}