class SPDProcessManager extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum SPDActionState
{
    SPDActionState_InProgress,      // 0
    SPDActionState_Done,            // 1
    SPDActionState_Abort,           // 2
    SPDActionState_MAX              // 3
};

enum SPDProcessType
{
    SPDProcessType_Generic,         // 0
    SPDProcessType_Destruct,        // 1
    SPDProcessType_OnSpawn,         // 2
    SPDProcessType_MAX              // 3
};

struct native SPDDamage
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Location;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Rotation;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int DamageAmount;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL InstigatedBy;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL HitLocation;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Momentum;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private class DamageType;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private export @NULL HitInfo;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool IsValid;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool ShowDebug;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000400*/ private export @NULL Component[524289];
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL DamageCauser;

    structdefaultproperties
    {
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        DamageAmount=0
        InstigatedBy=none
        HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Momentum=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DamageType=none
        HitInfo=(Material=none,PhysMaterial=none,Item=0,LevelIndex=0,BoneName="None",HitComponent=none)
        IsValid=false
        ShowDebug=false
        Component=none
        DamageCauser=none
    }
};

struct native SPDProcessState
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float ProcessId;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL ActionList;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int CurAction;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int CountActions;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool Active;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool ExecutingLatent;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private byte ProcessType;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Actor;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private export @NULL DamageInfo;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int StackIdx;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private byte ProcessData[128];

    structdefaultproperties
    {
        ProcessId=0.0000000
        ActionList=none
        CurAction=0
        CountActions=0
        Active=false
        ExecutingLatent=false
        ProcessType=SPDProcessType.SPDProcessType_Generic
        Actor=none
        DamageInfo=(Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),DamageAmount=0,InstigatedBy=none,HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),Momentum=(X=0.0000000,Y=0.0000000,Z=0.0000000),DamageType=none,HitInfo=(Material=none,PhysMaterial=none,Item=0,LevelIndex=0,BoneName="None",HitComponent=none),IsValid=false,ShowDebug=false,Component=none,DamageCauser=none)
        StackIdx=0
        ProcessData[0]=0
        ProcessData[1]=0
        ProcessData[2]=0
        ProcessData[3]=0
        ProcessData[4]=0
        ProcessData[5]=0
        ProcessData[6]=0
        ProcessData[7]=0
        ProcessData[8]=0
        ProcessData[9]=0
        ProcessData[10]=0
        ProcessData[11]=0
        ProcessData[12]=0
        ProcessData[13]=0
        ProcessData[14]=0
        ProcessData[15]=0
        ProcessData[16]=0
        ProcessData[17]=0
        ProcessData[18]=0
        ProcessData[19]=0
        ProcessData[20]=0
        ProcessData[21]=0
        ProcessData[22]=0
        ProcessData[23]=0
        ProcessData[24]=0
        ProcessData[25]=0
        ProcessData[26]=0
        ProcessData[27]=0
        ProcessData[28]=0
        ProcessData[29]=0
        ProcessData[30]=0
        ProcessData[31]=0
        ProcessData[32]=0
        ProcessData[33]=0
        ProcessData[34]=0
        ProcessData[35]=0
        ProcessData[36]=0
        ProcessData[37]=0
        ProcessData[38]=0
        ProcessData[39]=0
        ProcessData[40]=0
        ProcessData[41]=0
        ProcessData[42]=0
        ProcessData[43]=0
        ProcessData[44]=0
        ProcessData[45]=0
        ProcessData[46]=0
        ProcessData[47]=0
        ProcessData[48]=0
        ProcessData[49]=0
        ProcessData[50]=0
        ProcessData[51]=0
        ProcessData[52]=0
        ProcessData[53]=0
        ProcessData[54]=0
        ProcessData[55]=0
        ProcessData[56]=0
        ProcessData[57]=0
        ProcessData[58]=0
        ProcessData[59]=0
        ProcessData[60]=0
        ProcessData[61]=0
        ProcessData[62]=0
        ProcessData[63]=0
        ProcessData[64]=0
        ProcessData[65]=0
        ProcessData[66]=0
        ProcessData[67]=0
        ProcessData[68]=0
        ProcessData[69]=0
        ProcessData[70]=0
        ProcessData[71]=0
        ProcessData[72]=0
        ProcessData[73]=0
        ProcessData[74]=0
        ProcessData[75]=0
        ProcessData[76]=0
        ProcessData[77]=0
        ProcessData[78]=0
        ProcessData[79]=0
        ProcessData[80]=0
        ProcessData[81]=0
        ProcessData[82]=0
        ProcessData[83]=0
        ProcessData[84]=0
        ProcessData[85]=0
        ProcessData[86]=0
        ProcessData[87]=0
        ProcessData[88]=0
        ProcessData[89]=0
        ProcessData[90]=0
        ProcessData[91]=0
        ProcessData[92]=0
        ProcessData[93]=0
        ProcessData[94]=0
        ProcessData[95]=0
        ProcessData[96]=0
        ProcessData[97]=0
        ProcessData[98]=0
        ProcessData[99]=0
        ProcessData[100]=0
        ProcessData[101]=0
        ProcessData[102]=0
        ProcessData[103]=0
        ProcessData[104]=0
        ProcessData[105]=0
        ProcessData[106]=0
        ProcessData[107]=0
        ProcessData[108]=0
        ProcessData[109]=0
        ProcessData[110]=0
        ProcessData[111]=0
        ProcessData[112]=0
        ProcessData[113]=0
        ProcessData[114]=0
        ProcessData[115]=0
        ProcessData[116]=0
        ProcessData[117]=0
        ProcessData[118]=0
        ProcessData[119]=0
        ProcessData[120]=0
        ProcessData[121]=0
        ProcessData[122]=0
        ProcessData[123]=0
        ProcessData[124]=0
        ProcessData[125]=0
        ProcessData[126]=0
        ProcessData[127]=0
    }
};

var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL DestructibleProperties;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL DestructibleActor;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private export @NULL DestructibleDamageInfo;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int CurProcess;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private editfixedsize export array ActiveProcessList;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private editfixedsize export array PendingProcessList;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private byte ActionState;

// Export USPDProcessManager::execGetWorldInfo(FFrame&, void* const)
native static final function GetWorldInfo()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPDProcessManager::execSPDDamageSetDefault(FFrame&, void* const)
native function SPDDamageSetDefault()
{
    local /*0x01C00000-0x00000000*/ private @NULL DamageInfo[25165825];


}

// Export USPDProcessManager::execCreateProcess(FFrame&, void* const)
native function CreateProcess()
{
    local /*0x01C00000-0x00000000*/ private @NULL ActionList[8388609], Actor, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ProcessType[9437185];
    local /*0x01C00000-0x00000000*/ private float ProcessId[26214401];

    0                                
}

// Export USPDProcessManager::execActivatePending(FFrame&, void* const)
native function ActivatePending();

// Export USPDProcessManager::execExecuteActiveProcess(FFrame&, void* const)
native function ExecuteActiveProcess()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export USPDProcessManager::execPostExecute(FFrame&, void* const)
native function PostExecute();

// Export USPDProcessManager::execAddOnDestructProcess(FFrame&, void* const)
native function AddOnDestructProcess();

// Export USPDProcessManager::execAbortAllProcess(FFrame&, void* const)
native function AbortAllProcess();

// Export USPDProcessManager::execAbortAllProcessForActor(FFrame&, void* const)
native function AbortAllProcessForActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609];


}

// Export USPDProcessManager::execFindFirstActiveProcess(FFrame&, void* const)
native function FindFirstActiveProcess()
{
    local /*0x01C00000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x01C00000-0x00000000*/ private byte Type[8388609];
    local /*0x01C00000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPDProcessManager::execFindFirstPendingProcess(FFrame&, void* const)
native function FindFirstPendingProcess()
{
    local /*0x01C00000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x01C00000-0x00000000*/ private byte Type[8388609];
    local /*0x01C00000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPDProcessManager::execPushFloat(FFrame&, void* const)
native function PushFloat()
{
    local /*0x01C00000-0x00000000*/ private float F[8388609];


}

// Export USPDProcessManager::execPushInt(FFrame&, void* const)
native function PushInt()
{
    local /*0x01C00000-0x00000000*/ private int I[8388609];


}

// Export USPDProcessManager::execPushVector(FFrame&, void* const)
native function PushVector()
{
    local /*0x01C00000-0x00000000*/ private @NULL V[25165825];


}

// Export USPDProcessManager::execPushObjectRef(FFrame&, void* const)
native function PushObjectRef()
{
    local /*0x01C00000-0x00000000*/ private @NULL Object[8388609];


}

// Export USPDProcessManager::execPushBool(FFrame&, void* const)
native function PushBool()
{
    local /*0x01C00000-0x00000000*/ private bool B[8388609];


}

// Export USPDProcessManager::execPopFloat(FFrame&, void* const)
native function PopFloat()
{
    local /*0x01C00000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USPDProcessManager::execPopInt(FFrame&, void* const)
native function PopInt()
{
    local /*0x01C00000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPDProcessManager::execPopVector(FFrame&, void* const)
native function PopVector()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPDProcessManager::execPopObjectRef(FFrame&, void* const)
native function PopObjectRef()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPDProcessManager::execPopBool(FFrame&, void* const)
native function PopBool()
{
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPDProcessManager::execDumpErrorInfo(FFrame&, void* const)
native function DumpErrorInfo();

static simulated function Get()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], ReturnValue, SPGRID, ProcessManager;

    SPGRID = SPGRIDestructible(GetWorldInfo().GRI);
    // End:0x43
    if(SPGRID == none)
    {
        return none;
    }
    // End:0x86
    if(SPGRID.ActiveSPDProcessManager != none)
    {
        return SPGRID.ActiveSPDProcessManager;
    }
    // End:0xD2
    if(Actor == none)
    {
        ProcessManager = GetWorldInfo().Spawn(Class'SPDProcessManager');        
    }
    else
    {
        ProcessManager = Actor.Spawn(Class'SPDProcessManager');
    }
    SPGRID.ActiveSPDProcessManager = ProcessManager;
    ProcessManager.bKillDuringLevelTransition = true;
    return ProcessManager;
    //return ReturnValue;    
}

function MakeInActive()
{
    local /*0x01C00000-0x00000000*/ private @NULL SPGRID;

    SPGRID = SPGRIDestructible(GetWorldInfo().GRI);
    // End:0x43
    if(SPGRID == none)
    {
        return;
    }
    // End:0x87
    if(SPGRID.ActiveSPDProcessManager == self)
    {
        SPGRID.ActiveSPDProcessManager = none;
    }
    //return;    
}

simulated function HasActions()
{
    local /*0x01C00000-0x00000000*/ private editfixedsize array List[8388609];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x5F [Loop If]
    if(Idx < List.Length)
    {
        // End:0x51
        if(List[Idx].HasActions())
        {
            return true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function AddActionListWithDamageInfo()
{
    local /*0x01C00000-0x00000000*/ private @NULL ActionList[8388609], Actor;
    local /*0x01C00000-0x00000000*/ private byte ProcessType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL DamageInfo[8388609];
    local /*0x01C00000-0x00000000*/ private float ProcessId[26214401];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x27
    if(!ActionList.HasActions())
    {
        return false;
    }
    CreateProcess(ActionList, Actor, DamageInfo, ProcessType, ProcessId);
    return true;
    //return ReturnValue;    
}

simulated function HasProcessOfTypeForActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x01C00000-0x00000000*/ private byte ProcessType[8388609];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if((FindFirstActiveProcess(inActor, ProcessType)) > -1)
    {
        return true;        
    }
    else
    {
        // End:0x56
        if((FindFirstPendingProcess(inActor, ProcessType)) > -1)
        {
            return true;            
        }
        else
        {
            return false;
        }
    }
    //return ReturnValue;    
}

simulated event AddActionList()
{
    local /*0x01C00000-0x00000000*/ private @NULL ActionList[8388609], Actor;
    local /*0x01C00000-0x00000000*/ private byte ProcessType[8388609];
    local /*0x01C00000-0x00000000*/ private bool bForceExecute[9437185];
    local /*0x01C00000-0x00000000*/ private float ProcessId[26214401];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private @NULL DamageInfo;
    local /*0x01C00000-0x00000000*/ private bool bRetValue;

    false    
    // End:0x2C
    if(!ActionList.HasActions())
    {
        return false;
    }
    SPDDamageSetDefault(DamageInfo);
    DamageInfo.Location = Actor.Location;
    DamageInfo.Rotation = Actor.Rotation;
    bRetValue = AddActionListWithDamageInfo(ActionList, Actor, ProcessType, DamageInfo, ProcessId);
    // End:0x112
    if(bForceExecute)
    {
        GotoState('ExecutingDestroy');
    }
    return bRetValue;
    //return ReturnValue;    
}

event AddActionListFromKismet()
{
    local /*0x01C00000-0x00000000*/ private @NULL ActionList[8388609], Actor;
    local /*0x01C00000-0x00000000*/ private float ProcessId[26214401];
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(Actor == none)
    {
        return false;
    }
    AbortAllProcessForActor(Actor);
    return AddActionList(ActionList, Actor, 0, true, ProcessId);
    //return ReturnValue;    
}

singular function @NULL AddDestruct()
{
    local /*0x01C00000-0x00000000*/ private @NULL SrcActor[8388609], Component, Props;
    local /*0x01C00000-0x00000000*/ private int Damage[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    // End:0x31
    if((Props == none) || SrcActor == none)
    {
        GotoState('FinishedDestroy');
        return;
    }
    // End:0x57
    if(!Props.bEnableCommands)
    {
        return;
    }
    DestructibleActor = SrcActor;
    DestructibleProperties = Props;
    SPDDamageSetDefault(DestructibleDamageInfo);
    DestructibleDamageInfo.Location = SrcActor.Location;
    DestructibleDamageInfo.Rotation = SrcActor.Rotation;
    DestructibleDamageInfo.DamageAmount = Damage;
    DestructibleDamageInfo.InstigatedBy = InstigatedBy;
    DestructibleDamageInfo.HitLocation = HitLocation;
    DestructibleDamageInfo.Momentum = Momentum;
    DestructibleDamageInfo.DamageType = DamageType;
    DestructibleDamageInfo.HitInfo = HitInfo;
    DestructibleDamageInfo.IsValid = true;
    DestructibleDamageInfo.Component = Component;
    DestructibleDamageInfo.DamageCauser = DamageCauser;
    AddOnDestructProcess();
    //return;    
}

simulated function SPDHurtRadius()
{
    local /*0x01C00000-0x00000000*/ private float BaseDamage[8388609], DamageRadius, PlayerDamage, PlayerDamageRadius;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private float Momentum[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HurtOrigin[8388609], IgnoredActor, InstigatedByController;
    local /*0x01C00000-0x00000000*/ private bool bDoFullDamage[9437185], ReturnValue;
    local /*0x01C00000-0x00000000*/ private @NULL Victim, PlayerPawn;
    local /*0x01C00000-0x00000000*/ private float MaxRadius;
    local /*0x01C00000-0x00000000*/ private bool bUsingDamageRadius, bCausedDamage;

    ((Instigator != none) ? Instigator.Controller : none);    
    // End:0x45
    if(bHurtEntry)
    {
        return false;
    }
    bHurtEntry = true;
    bCausedDamage = false;
    // End:0x96
    if(PlayerDamageRadius > DamageRadius)
    {
        MaxRadius = PlayerDamageRadius;
        bUsingDamageRadius = false;        
    }
    else
    {
        MaxRadius = DamageRadius;
        bUsingDamageRadius = true;
    }
    // End:0x4C8
    foreach VisibleCollidingActors(Class'Engine.Actor', Victim, MaxRadius, HurtOrigin)
    {
        PlayerPawn = Pawn(Victim);
        // End:0x34A
        if((PlayerPawn == none) && PlayerController(PlayerPawn.Controller) == none)
        {
            // End:0x347
            if(((!Victim.bWorldGeometry && Victim != self) && Victim != IgnoredActor) && Victim.bProjTarget || NavigationPoint(Victim) == none)
            {
                // End:0x274
                if(bUsingDamageRadius)
                {
                    Victim.TakeRadiusDamage(InstigatedByController, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bDoFullDamage, self);
                    bCausedDamage = bCausedDamage || Victim.bProjTarget;                    
                }
                else
                {
                    // End:0x347
                    if(VSize(Victim.Location - HurtOrigin) <= DamageRadius)
                    {
                        Victim.TakeRadiusDamage(InstigatedByController, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bDoFullDamage, self);
                        bCausedDamage = bCausedDamage || Victim.bProjTarget;
                    }
                }
            }
            // End:0x4C7
            continue;
        }
        // End:0x42D
        if(bUsingDamageRadius)
        {
            // End:0x42A
            if(VSize(Victim.Location - HurtOrigin) <= PlayerDamageRadius)
            {
                Victim.TakeRadiusDamage(InstigatedByController, PlayerDamage, PlayerDamageRadius, DamageType, Momentum, HurtOrigin, bDoFullDamage, self);
                bCausedDamage = bCausedDamage || Victim.bProjTarget;
            }
            // End:0x4C7
            continue;
        }
        Victim.TakeRadiusDamage(InstigatedByController, PlayerDamage, PlayerDamageRadius, DamageType, Momentum, HurtOrigin, bDoFullDamage, self);
        bCausedDamage = bCausedDamage || Victim.bProjTarget;        
    }    
    bHurtEntry = false;
    return bCausedDamage;
    //return ReturnValue;    
}

function DoDestruct()
{
    local /*0x01C00000-0x00000000*/ private @NULL SrcActor[8388609], Props;
    local /*0x01C00000-0x00000000*/ private int Damage[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    AddDestruct(SrcActor, none, Props, Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    GotoState('ExecutingDestroy');
    //return;    
}

function @NULL DoComponentDestruct()
{
    local /*0x01C00000-0x00000000*/ private @NULL SrcActor[8388609], Component, Props;
    local /*0x01C00000-0x00000000*/ private int Damage[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    AddDestruct(SrcActor, Component, Props, Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    GotoState('ExecutingDestroy');
    //return;    
}

event Tick()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];

    //return;    
}

auto state Waiting
{Begin:

    stop;                
}

state ExecutingDestroy
{
    function DoDestruct()
    {
        local /*0x01C00000-0x00000000*/ private @NULL SrcActor[8388609], Props;
        local /*0x01C00000-0x00000000*/ private int Damage[8388609];
        local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
        local /*0x01C00000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

        AddDestruct(SrcActor, none, Props, Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        //return;        
    }

    function @NULL DoComponentDestruct()
    {
        local /*0x01C00000-0x00000000*/ private @NULL SrcActor[8388609], Component, Props;
        local /*0x01C00000-0x00000000*/ private int Damage[8388609];
        local /*0x01C00000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x01C00000-0x00000000*/ private class DamageType[8388609];
        local /*0x01C00000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

        AddDestruct(SrcActor, Component, Props, Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        //return;        
    }

    event Tick()
    {
        local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];

        ActivatePending();
        ActionState = ExecuteActiveProcess(ElapsedTime);
        PostExecute();
        // End:0x6F
        if((int(ActionState) == int(1)) && PendingProcessList.Length < 1)
        {
            MakeInActive();
            GotoState('FinishedDestroy');
        }
        //return;        
    }
    stop;    
}

state FinishedDestroy
{
    ignores DoDestruct;
Begin:

    MakeInActive();
    DestructibleProperties = none;
    DestructibleActor = none;
    SPDDamageSetDefault(DestructibleDamageInfo);
    Destroy();
    stop;        
}

defaultproperties
{
    ActionState=SPDActionState.SPDActionState_Done
}