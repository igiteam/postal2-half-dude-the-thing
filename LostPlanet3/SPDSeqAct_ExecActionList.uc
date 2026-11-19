class SPDSeqAct_ExecActionList extends SeqAct_Latent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02AC0000-0x00000000*/ private bool bWaitforActionsToFinish[65537];
var(__OnDestroyed__Delegate) /*0x02AC0000-0x00000400*/ private editfixedsize @NULL ActionList[589825];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL MyActor;
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float ProcessId[536870913];

simulated event GetSPDProcessManager()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689], ProcessManager;

    ProcessManager = none;
    // End:0x4C
    if(MyActor != none)
    {
        ProcessManager = Class'SPDProcessManager'.static.Get(MyActor);
    }
    return ProcessManager;
    //return ReturnValue;    
}

defaultproperties
{
    bCallHandler=false
    InputLinks[0]=(LinkDesc="Do Actions",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Actor for actions",LinkVar="None",PropertyName="MyActor",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Exec Actions (SP)"
}