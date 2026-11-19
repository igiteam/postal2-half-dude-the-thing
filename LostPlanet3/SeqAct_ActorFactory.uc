class SeqAct_ActorFactory extends SeqAct_Latent
    hidecategories(Object);

enum EPointSelection
{
    PS_Normal,                      // 0
    PS_Random,                      // 1
    PS_Reverse,                     // 2
    PS_MAX                          // 3
};

var(*) /*0x43E10000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSpawning;
var(*) /*0x43E10000-0x00000000*/ private bool bCheckSpawnCollision[65537];
var(*) /*0x43E10000-0x00000400*/ private editfixedsize @NULL Factory[589825];
var(*) /*0x43E10000-0x00000000*/ private byte PointSelection[65537];
var(*) /*0x43E10000-0x00000000*/ private editfixedsize array SpawnPoints[65537];
var(*) /*0x43E10000-0x00000000*/ private editfixedsize array SpawnLocations[65537];
var(*) /*0x43E10000-0x00000000*/ private editfixedsize array SpawnOrientations[65537];
var(*) /*0x43E10000-0x00000000*/ private int SpawnCount[65537];
var(*) /*0x43E10000-0x00000000*/ private float SpawnDelay[65537];
var(*) /*0x35EA0000-0x00000000*/ private int LastSpawnIdx;
var(*) /*0x35EA0000-0x00000000*/ private int CurrentSpawnIdx;
var(*) /*0x35EA0000-0x00000000*/ private int SpawnedCount;
var(*) /*0x35EA0000-0x00000000*/ private float RemainingDelay;

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 0;
    //return ReturnValue;    
}

function HardReset()
{
    super(SequenceOp).HardReset();
    bIsSpawning = default.bIsSpawning;
    LastSpawnIdx = default.LastSpawnIdx;
    SpawnedCount = default.SpawnCount;
    RemainingDelay = default.RemainingDelay;
    bEnabled = default.bEnabled;
    //return;    
}

defaultproperties
{
    bEnabled=true
    bCheckSpawnCollision=true
    SpawnCount=1
    SpawnDelay=0.5000000
    LastSpawnIdx=-1
    CurrentSpawnIdx=-1
    InputLinks[0]=(LinkDesc="Spawn Actor",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[3]=(LinkDesc="Toggle",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Spawn Point",LinkVar="None",PropertyName="SpawnPoints",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Spawned",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=0,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[2]=(ExpectedType=Class'SeqVar_Int',LinkedVariables=none,LinkDesc="Spawn Count",LinkVar="None",PropertyName="SpawnCount",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[3]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Spawn Location",LinkVar="None",PropertyName="SpawnLocations",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[4]=(ExpectedType=Class'SeqVar_Vector',LinkedVariables=none,LinkDesc="Spawn Direction",LinkVar="None",PropertyName="SpawnOrientations",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Actor Factory"
}