class LPLeechSackBoss extends LPDStaticMesh
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LeechActorClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LeechControllerClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataBoss[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MyActorDestructComponent[537395201];

simulated event PreBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTuneDataBoss;

    super(Actor).PreBeginPlay();
    // End:0xB0
    if(ClassIsChildOf(Owner.Class, Class'LPAIPawnAct1Boss'))
    {
        NewTuneDataBoss = LPAIPawnAct1Boss(Owner).TuneDataBoss;
        // End:0xB0
        if((NewTuneDataBoss != none) && NewTuneDataBoss.LeechSackProperties != none)
        {
            TuneDataBoss = NewTuneDataBoss;
        }
    }
    // End:0x13C
    if(TuneDataBoss != none)
    {
        SetDestructibleProperties(TuneDataBoss.LeechSackProperties);
        MyActorDestructComponent.HitPoints = int(TuneDataBoss.LeechCocoonHealth.GetValue());
    }
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private float CocoonTimer;

    super(DynamicSMActor).PostBeginPlay();
    SetCollision(true, false);
    // End:0xC4
    if(TuneDataBoss != none)
    {
        CocoonTimer = TuneDataBoss.LeechCocoonTime.GetValue();
        // End:0xBA
        if(CocoonTimer > 0.0000000)
        {
            SetTimer(CocoonTimer, false, 'BirthLeech');
            MyActorDestructComponent.__OnDestroyed__Delegate = NotifyBossOnDestroyed;            
        }
        else
        {
            BirthLeech();
        }
    }
    //return;    
}

simulated function BirthLeech()
{
    // End:0xA0
    if(!bDeleteMe && MyActorDestructComponent.HitPoints > 0)
    {
        SpawnLeech();
        MyActorDestructComponent.__OnDestroyed__Delegate = None;
        TakeDamage(100000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    }
    //return;    
}

function NotifyBossOnDestroyed()
{
    Instigator.TriggerEventClass(Class'LPSeqEvent_Act1BossLeechDestroyed', self, 0);
    // End:0x7D
    if(Class'LPAIControllerAct1Boss'.static.GetLeechCount() <= 0)
    {
        Instigator.TriggerEventClass(Class'LPSeqEvent_Act1BossLeechDestroyed', self, 1);
    }
    //return;    
}

simulated function SpawnLeech()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], ToPlayer, LPP, Leech;

    // End:0x3A
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0x3A
        break;        
    }    
    // End:0xBB
    if(LPP != none)
    {
        ToPlayer = Rotator(Location - LPP.Location);
        ToPlayer.Roll = 0;
        ToPlayer.Pitch = 0;
    }
    // End:0xEC
    if(!ClassIsChildOf(Owner.Class, Class'LPAIPawnAct1Boss'))
    {
        return none;
    }
    // End:0x158
    if((Owner.SpawnedFromActorFactory == none) || !ClassIsChildOf(Owner.SpawnedFromActorFactory.Class, Class'SPEngine.SPActorFactoryAI'))
    {
        return none;
    }
    Leech = Class'SPEngine.SPUtil'.static.SpawnActor(SPActorFactoryAI(Owner.SpawnedFromActorFactory), LeechActorClass, LeechControllerClass, Location, ToPlayer);
    // End:0x1DD
    if(Leech == none)
    {
        return none;
    }
    LPAIController(LPAIPawn(Leech).Controller).bStruggleModeDisabled = true;
    return LPAIPawn(Leech);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPActorDestructComponent'Default__LPLeechSackBoss.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    MyActorDestructComponent=SPActorDestructComponent0
    // Reference: StaticMeshComponent'Default__LPLeechSackBoss.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPLeechSackBoss.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPLeechSackBoss.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPLeechSackBoss.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    bAlwaysRelevant=true
    // Reference: LPTeamAssignmentInteractionMetaData'Default__LPLeechSackBoss.IntMetaA'
    begin object name=IntMetaA class=Class'LPTeamAssignmentInteractionMetaData'
        TeamNumber=ELPTeams.LPTeam_Akrid
    end object
    InteractionMetaData=IntMetaA
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}