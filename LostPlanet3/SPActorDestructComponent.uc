class SPActorDestructComponent extends SPBaseActorDestructComponent
    editinlinenew
    hidecategories(Object,Object);

var(__OnDestroyed__Delegate) /*0x02520000-0x00000000*/ private @NULL Properties[65537];
var(__OnDestroyed__Delegate) /*0x02520000-0x00000000*/ private int HitPoints[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float FloatDamageRemainder[536870913];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool bDestroyed[536870913];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool bDisable[536870913];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool bBeginPlayDone[536870913];
//var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private editfixedsize delegate<@NULL> __OnDestroyed__Delegate;

simulated delegate OnDestroyed()
{
    //return;    
}

// Export USPActorDestructComponent::execGetWorldInfo(FFrame&, void* const)
native static final function GetWorldInfo()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPActorDestructComponent::execSpeedToDamage(FFrame&, void* const)
native function SpeedToDamage()
{
    local /*0x01C00000-0x00000000*/ private float Speed[8388609];
    local /*0x01C00000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPActorDestructComponent::execGetProperties(FFrame&, void* const)
native simulated function GetProperties()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPActorDestructComponent::execSetProperties(FFrame&, void* const)
native simulated function SetProperties()
{
    local /*0x01C00000-0x00000000*/ private @NULL NewProperties[8388609];


}

// Export USPActorDestructComponent::execCanDoDamageType(FFrame&, void* const)
native function CanDoDamageType()
{
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];


}

event NotifyDamage()
{
    local /*0x01C00000-0x00000000*/ private float Damage[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    ServerOnlyTakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

function NotifyLanded()
{
    local /*0x01C00000-0x00000000*/ private @NULL HitNormal[25296897], FloorActor;
    local /*0x01C00000-0x00000000*/ private int Damage;

    Damage = SpeedToDamage(Owner.Velocity.Z);
    // End:0xA0
    if(Damage > 0)
    {
        ServerOnlyTakeDamage(float(Damage), none, Owner.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.DmgType_Fell');
    }
    //return;    
}

function GetPawnOwner()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689], Pawn;

    Pawn = Pawn(Owner);
    return Pawn;
    //return ReturnValue;    
}

function FloatingPointAdjustDamage()
{
    local /*0x01C00000-0x00000000*/ private float Damage[8388609];
    local /*0x01C00000-0x00000000*/ private int ReturnValue[92274689], intDamage, extraDamage;

    intDamage = int(Damage);
    FloatDamageRemainder += (Damage - float(intDamage));
    extraDamage = int(FloatDamageRemainder);
    intDamage += extraDamage;
    FloatDamageRemainder = FloatDamageRemainder - float(extraDamage);
    return intDamage;
    //return ReturnValue;    
}

simulated event BeginPlay()
{
    local /*0x01C00000-0x00000000*/ private @NULL ProcessManager;
    local /*0x01C00000-0x00000000*/ private int I;

    // End:0x140
    if((Properties != none) && Properties.OnSpawnActionList.Length > 0)
    {
        ProcessManager = Class'SPDProcessManager'.static.Get(Owner);
        // End:0x140
        if(ProcessManager != none)
        {
            // End:0x140
            if(!ProcessManager.HasProcessOfTypeForActor(Owner, 2))
            {
                I = 0;
                J0xB1:

                // End:0x140 [Loop If]
                if(I < Properties.OnSpawnActionList.Length)
                {
                    ProcessManager.AddActionList(Properties.OnSpawnActionList[I], Owner, 2, true);
                    ++I;
                    // [Loop Continue]
                    goto J0xB1;
                }
            }
        }
    }
    //return;    
}

simulated function CauseDestruction()
{
    local /*0x01C00000-0x00000000*/ private float Damage[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, ProcessManager;

    // End:0x31
    if((bDestroyed || bDisable) || Properties == none)
    {
        return;
    }
    // End:0x109
    if((int(Owner.WorldInfo.NetMode) == int(NM_DedicatedServer)) || int(Owner.WorldInfo.NetMode) == int(NM_ListenServer))
    {
        // End:0x109
        if(int(Owner.RemoteRole) != int(ROLE_None))
        {
            Owner.MulticastDestructComponentDestruction(HitLocation, DamageType);
        }
    }
    ProcessManager = Class'SPDProcessManager'.static.Get(Owner);
    // End:0x1BC
    if(ProcessManager != none)
    {
        ProcessManager.DoDestruct(Owner, Properties, int(Damage), InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    bDestroyed = true;
    HitPoints = -1;
    OnDestroyed();
    //return;    
}

simulated function ClientCauseDestruction()
{
    local /*0x01C00000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];

    // End:0x60
    if(int(Owner.Role) < int(ROLE_Authority))
    {
        CauseDestruction(float(HitPoints), none, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
    }
    //return;    
}

event ServerOnlyTakeDamage()
{
    local /*0x01C00000-0x00000000*/ private float DamageAmount[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x01C00000-0x00000000*/ private int RemainingHitPoints;
    local /*0x01C00000-0x00000000*/ private @NULL Pawn;

    // End:0x31
    if((bDisable || bDestroyed) || Owner == none)
    {
        return;
    }
    // End:0x71
    if((Properties == none) || !Properties.CanHandleDamageType(DamageType))
    {
        return;
    }
    // End:0xC6
    if((DamageType != none) && !DamageType.static.DoesDamageTypeHurtMyClass(Owner.Class))
    {
        return;
    }
    Pawn = GetPawnOwner();
    DamageAmount = float(FloatingPointAdjustDamage(DamageAmount));
    // End:0x133
    if(Pawn != none)
    {
        RemainingHitPoints = Pawn.Health;        
    }
    else
    {
        RemainingHitPoints = int(float(HitPoints) - DamageAmount);
        HitPoints = RemainingHitPoints;
    }
    // End:0x1D1
    if((RemainingHitPoints <= 0) && Properties != none)
    {
        CauseDestruction(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

event GetHitPoints()
{
    local /*0x01C00000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL Pawn;

    Pawn = GetPawnOwner();
    // End:0x45
    if(Pawn != none)
    {
        return Pawn.Health;        
    }
    else
    {
        return HitPoints;
    }
    //return ReturnValue;    
}

defaultproperties
{
    HitPoints=100
}