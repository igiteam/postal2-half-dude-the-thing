class LPAct1BossShell extends LPCoreShield
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MyActorDestructComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DamageStateComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HitPointsMax[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDestroyForNextPhase[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBossPawn[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __GetOwnerMeshDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __GetOwnerDamageComponentDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetOwnerDamageComponentDelegate__Delegate;

function ShouldSaveForCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetShellDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int HitPoints;
    local /*0x97E50000-0x00000000*/ private float Percent, Factor;

    HitPoints = MyActorDestructComponent.HitPoints;
    // End:0x47
    if(float(HitPoints) == HitPointsMax)
    {
        return 0.0000000;
    }
    Percent = 1.0000000 - (float(HitPoints) / HitPointsMax);
    Factor = GetRangeValueByPct(vect2d(0.2000000, 1.0000000), Percent);
    return Factor;
    //return ReturnValue;    
}

delegate @NULL GetOwnerMeshDelegate()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    // End:0x26
    if(StaticMeshComponent.StaticMesh == none)
    {
        return none;
    }
    return StaticMeshComponent;
    //return ReturnValue;    
}

delegate @NULL GetOwnerDamageComponentDelegate()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return DamageStateComponent;
    //return ReturnValue;    
}

delegate @NULL SetOwnerDamageComponentDelegate()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp[8388609];

    DamageStateComponent = Comp;
    //return;    
}

function PostBeginPlay()
{
    super(DynamicSMActor).PostBeginPlay();
    //return;    
}

protected simulated function InternalAttachToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], ret;

    ret = super.InternalAttachToPawn(MyAkrid, AttachSocket, ShieldId);
    // End:0x59
    if(ret)
    {
        MyBossPawn = LPAIPawnAct1Boss(MyAkridPawn);
    }
    return ret;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x5E
    if((MyBossPawn != none) && MyBossPawn.bApplyIntroDamageFilter)
    {
        DamageAmount *= MyBossPawn.IntroDamageFilter;
    }
    super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

defaultproperties
{
    // Reference: SPActorDestructComponent'Default__LPAct1BossShell.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    MyActorDestructComponent=SPActorDestructComponent0
    // Reference: StaticMeshComponent'Default__LPAct1BossShell.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAct1BossShell.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPAct1BossShell.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    // Reference: SPDamageStateComponent'Default__LPAct1BossShell.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[4]=DamageStateComponentDefObj
    // Reference: LPAct1BossShellInteractionMetaData'Default__LPAct1BossShell.IMeta0'
    begin object name=IMeta0 class=Class'LPAct1BossShellInteractionMetaData'
    end object
    InteractionMetaData=IMeta0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}