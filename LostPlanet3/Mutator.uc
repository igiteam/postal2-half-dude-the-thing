class Mutator extends Info
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x35EA0000-0x00000000*/ private @NULL NextMutator;
var(*) /*0x340B0000-0x00000000*/ private editfixedsize array GroupNames[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUserAdded;

event PreBeginPlay()
{
    // End:0x12
    if(!MutatorIsAllowed())
    {
        Destroy();
    }
    //return;    
}

function MutatorIsAllowed()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return !WorldInfo.IsDemoBuild();
    //return ReturnValue;    
}

event Destroyed()
{
    WorldInfo.Game.RemoveMutator(self);
    super(Actor).Destroyed();
    //return;    
}

function Mutate()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MutateString[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.Mutate(MutateString, Sender);
    }
    //return;    
}

function ModifyLogin()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Portal[25165825], Options;

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.ModifyLogin(Portal, Options);
    }
    //return;    
}

function ModifyPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x37
    if(NextMutator != none)
    {
        NextMutator.ModifyPlayer(Other);
    }
    //return;    
}

function AddMutator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL M[8388609];

    // End:0x25
    if(NextMutator == none)
    {
        NextMutator = M;        
    }
    else
    {
        NextMutator.AddMutator(M);
    }
    //return;    
}

function AlwaysKeep()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(NextMutator != none)
    {
        return NextMutator.AlwaysKeep(Other);
    }
    return false;
    //return ReturnValue;    
}

function IsRelevant()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    bResult = CheckReplacement(Other);
    // End:0x6F
    if(bResult && NextMutator != none)
    {
        bResult = NextMutator.IsRelevant(Other);
    }
    return bResult;
    //return ReturnValue;    
}

function CheckRelevance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    // End:0x18
    if(AlwaysKeep(Other))
    {
        return true;
    }
    bResult = IsRelevant(Other);
    return bResult;
    //return ReturnValue;    
}

function CheckReplacement()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyLogout()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Exiting[8388609];

    // End:0x37
    if(NextMutator != none)
    {
        NextMutator.NotifyLogout(Exiting);
    }
    //return;    
}

function NotifyLogin()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPlayer[8388609];

    // End:0x37
    if(NextMutator != none)
    {
        NextMutator.NotifyLogin(NewPlayer);
    }
    //return;    
}

function DriverEnteredVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], P;

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.DriverEnteredVehicle(V, P);
    }
    //return;    
}

function CanLeaveVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], P;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x41
    if(NextMutator != none)
    {
        return NextMutator.CanLeaveVehicle(V, P);
    }
    return true;
    //return ReturnValue;    
}

function DriverLeftVehicle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL V[8388609], P;

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.DriverLeftVehicle(V, P);
    }
    //return;    
}

function InitMutator()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Options[8388609], ErrorMessage;

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.InitMutator(Options, ErrorMessage);
    }
    //return;    
}

function GetSeamlessTravelActorList()
{
    local /*0x35EA0000-0x00000000*/ private bool bToEntry[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ActorList[25165825];

    // End:0x23
    if(bToEntry)
    {
        ActorList[ActorList.Length] = self;
    }
    // End:0x64
    if(NextMutator != none)
    {
        NextMutator.GetSeamlessTravelActorList(bToEntry, ActorList);
    }
    //return;    
}

function FindPlayerStart()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Player[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InTeam[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string IncomingName[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x4F
    if(NextMutator != none)
    {
        return NextMutator.FindPlayerStart(Player, InTeam, IncomingName);        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

function HandleRestartGame()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (NextMutator != none) && NextMutator.HandleRestartGame();
    //return ReturnValue;    
}

function CheckEndGame()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Winner[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Reason[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (NextMutator == none) || NextMutator.CheckEndGame(Winner, Reason);
    //return ReturnValue;    
}

function OverridePickupQuery()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private class ItemClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x35EA0000-0x00000000*/ private byte bAllowPickup[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (NextMutator != none) && NextMutator.OverridePickupQuery(Other, ItemClass, Pickup, bAllowPickup);
    //return ReturnValue;    
}

function PreventDeath()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killed[8388609], Killer;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (NextMutator != none) && NextMutator.PreventDeath(Killed, Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

function ScoreObjective()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Scorer[8388609];
    local /*0x35EA0000-0x00000000*/ private int Score[8388609];

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.ScoreObjective(Scorer, Score);
    }
    //return;    
}

function ScoreKill()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], Killed;

    // End:0x40
    if(NextMutator != none)
    {
        NextMutator.ScoreKill(Killer, Killed);
    }
    //return;    
}

function NetDamage()
{
    local /*0x35EA0000-0x00000000*/ private int OriginalDamage[8388609], Damage;
    local /*0x35EA0000-0x00000000*/ private @NULL injured[8388609], InstigatedBy, HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];

    // End:0x76
    if(NextMutator != none)
    {
        NextMutator.NetDamage(OriginalDamage, Damage, injured, InstigatedBy, HitLocation, Momentum, DamageType, DamageCauser);
    }
    //return;    
}
