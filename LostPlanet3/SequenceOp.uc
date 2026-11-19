class SequenceOp extends SequenceObject
    abstract
    hidecategories(Object);

struct native SeqOpInputLink
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LinkDesc;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasImpulse;
    var(*) /*0x35EA0000-0x00000000*/ private int QueuedActivations;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDisabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDisabledPIE;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LinkedOp;
    var(*) /*0x35EA0000-0x00000000*/ private int DrawY;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private float ActivateDelay;
    var(*) /*0x35EA0000-0x00000000*/ private bool bMoving[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMax;
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMin;
    var(*) /*0x35EA0000-0x00000000*/ private int OverrideDelta;

    structdefaultproperties
    {
        LinkDesc=""
        bHasImpulse=false
        QueuedActivations=0
        bDisabled=false
        bDisabledPIE=false
        LinkedOp=none
        DrawY=0
        bHidden=false
        ActivateDelay=0.0000000
        bMoving=false
        bClampedMax=false
        bClampedMin=false
        OverrideDelta=0
    }
};

struct native SeqOpOutputInputLink
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LinkedOp;
    var(*) /*0x35EA0000-0x00000000*/ private int InputLinkIdx;

    structdefaultproperties
    {
        LinkedOp=none
        InputLinkIdx=0
    }
};

struct native SeqOpOutputLink
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Links;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LinkDesc;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHasImpulse;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDisabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDisabledPIE;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LinkedOp;
    var(*) /*0x35EA0000-0x00000000*/ private float ActivateDelay;
    var(*) /*0x35EA0000-0x00000000*/ private int DrawY;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private bool bMoving[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMax;
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMin;
    var(*) /*0x35EA0000-0x00000000*/ private int OverrideDelta;
    var(*) /*0x35EA0000-0x00000000*/ private float PIEActivationTime[536870913];
    var(*) /*0x35EA0000-0x00000100*/ private globalconfig bool bIsActivated[536870913];

    structdefaultproperties
    {
        Links=none
        LinkDesc=""
        bHasImpulse=false
        bDisabled=false
        bDisabledPIE=false
        LinkedOp=none
        ActivateDelay=0.0000000
        DrawY=0
        bHidden=false
        bMoving=false
        bClampedMax=false
        bClampedMin=false
        OverrideDelta=0
        PIEActivationTime=0.0000000
        bIsActivated=false
    }
};

struct native SeqVarLink
{
    var(*) /*0x35EA0000-0x00000000*/ private class ExpectedType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LinkedVariables;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LinkDesc;
    var(*) /*0x35EA0000-0x00000000*/ private name LinkVar;
    var(*) /*0x35EA0000-0x00000000*/ private name PropertyName;
    var(*) /*0x35EA0000-0x00000000*/ private bool bWriteable;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSequenceNeverReadsOnlyWritesToThisVar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bModifiesLinkedObject;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private int MinVars;
    var(*) /*0x35EA0000-0x00000000*/ private int MaxVars;
    var(*) /*0x35EA0000-0x00000000*/ private int DrawX;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedProperty[537001985];
    var(*) /*0x35EA0000-0x00000000*/ private bool bAllowAnyType;
    var(*) /*0x35EA0000-0x00000000*/ private bool bMoving[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMax;
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMin;
    var(*) /*0x35EA0000-0x00000000*/ private int OverrideDelta;

    structdefaultproperties
    {
        ExpectedType=Class'SequenceVariable'
        LinkedVariables=none
        LinkDesc=""
        LinkVar="None"
        PropertyName="None"
        bWriteable=false
        bSequenceNeverReadsOnlyWritesToThisVar=false
        bModifiesLinkedObject=false
        bHidden=false
        MinVars=1
        MaxVars=255
        DrawX=0
        CachedProperty=none
        bAllowAnyType=false
        bMoving=false
        bClampedMax=false
        bClampedMin=false
        OverrideDelta=0
    }
};

struct native SeqEventLink
{
    var(*) /*0x35EA0000-0x00000000*/ private class ExpectedType;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LinkedEvents;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LinkDesc;
    var(*) /*0x35EA0000-0x00000000*/ private int DrawX;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private bool bMoving[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMax;
    var(*) /*0x35EA0000-0x00000000*/ private bool bClampedMin;
    var(*) /*0x35EA0000-0x00000000*/ private int OverrideDelta;

    structdefaultproperties
    {
        ExpectedType=Class'SequenceEvent'
        LinkedEvents=none
        LinkDesc=""
        DrawX=0
        bHidden=false
        bMoving=false
        bClampedMax=false
        bClampedMin=false
        OverrideDelta=0
    }
};

var(*) /*0x35EA0000-0x00000100*/ private globalconfig bool bIsActivated[536870913];
var(*) /*0x35EA0000-0x00000100*/ private globalconfig bool bIsCurrentDebuggerOp[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bActive;
var(*) /*0x35EA0000-0x00000000*/ private bool bLatentExecution[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bAutoActivateOutputLinks;
var(*) /*0x35EA0000-0x00000000*/ private bool bHaveMovingVarConnector[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHaveMovingInputConnector[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHaveMovingOutputConnector[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingVarConnectorRecalc[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingInputConnectorRecalc[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPendingOutputConnectorRecalc[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsBreakpointSet;
var(*) /*0x35EA0000-0x00000100*/ private globalconfig bool bIsHiddenBreakpointSet[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float PIEActivationTime[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ActivatorSeqOp[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int LastActivatedInputLink[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int LastActivatedOutputLink[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InputLinks;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OutputLinks;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VariableLinks;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EventLinks;
var(*) /*0x35EA0000-0x00000100*/ private int PlayerIndex[536870913];
var(*) /*0x35EA0000-0x00000100*/ private byte GamepadID[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int ActivateCount[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int SearchTag[537001985];

// Export USequenceOp::execHasLinkedOps(FFrame&, void* const)
native final function HasLinkedOps()
{
    local /*0x35EA0000-0x00000000*/ private bool bConsiderInputLinks[9437185], ReturnValue;


}

// Export USequenceOp::execGetLinkedObjects(FFrame&, void* const)
native final function GetLinkedObjects()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array out_Objects[25165825];
    local /*0x35EA0000-0x00000000*/ private class ObjectType[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bRecurse[9437185];


}

// Export USequenceOp::execGetObjectVars(FFrame&, void* const)
native final function GetObjectVars()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array objVars[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string inDesc[9437185];


}

// Export USequenceOp::execGetInterpDataVars(FFrame&, void* const)
native final function GetInterpDataVars()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array outIData[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string inDesc[9437185];


}

// Export USequenceOp::execGetBoolVars(FFrame&, void* const)
native final function GetBoolVars()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize array boolVars[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string inDesc[9437185];


}

// Export USequenceOp::execLinkedVariables(FFrame&, void* const)
native final iterator function LinkedVariables()
{
    local /*0x35EA0000-0x00000000*/ private class VarClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutVariable[25165825];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string inDesc[9437185];


}

// Export USequenceOp::execActivateOutputLink(FFrame&, void* const)
native final function ActivateOutputLink()
{
    local /*0x35EA0000-0x00000000*/ private int OutputIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USequenceOp::execActivateNamedOutputLink(FFrame&, void* const)
native final function ActivateNamedOutputLink()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string LinkDesc[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event Activated()
{
    //return;    
}

event Deactivated()
{
    //return;    
}

event VersionUpdated()
{
    local /*0x35EA0000-0x00000000*/ private int OldVersion[8388609], NewVersion;

    //return;    
}

// Export USequenceOp::execPopulateLinkedVariableValues(FFrame&, void* const)
native final function PopulateLinkedVariableValues();

// Export USequenceOp::execPublishLinkedVariableValues(FFrame&, void* const)
native final function PublishLinkedVariableValues();

function Reset()
{
    //return;    
}

function HardReset()
{
    Reset();
    bActive = false;
    //return;    
}

function GetPawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609], ReturnValue, P, C;

    P = Pawn(TheActor);
    // End:0x38
    if(P != none)
    {
        return P;        
    }
    else
    {
        C = Controller(TheActor);
        return ((C != none) ? C.Pawn : none);
    }
    //return ReturnValue;    
}

function GetController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609], ReturnValue, P, C;

    C = Controller(TheActor);
    // End:0x38
    if(C != none)
    {
        return C;        
    }
    else
    {
        P = Pawn(TheActor);
        return ((P != none) ? P.Controller : none);
    }
    //return ReturnValue;    
}

// Export USequenceOp::execForceActivateInput(FFrame&, void* const)
native final function ForceActivateInput()
{
    local /*0x35EA0000-0x00000000*/ private int InputIdx[8388609];


}

// Export USequenceOp::execForceActivateOutput(FFrame&, void* const)
native final function ForceActivateOutput()
{
    local /*0x35EA0000-0x00000000*/ private int OutputIdx[8388609];


}

defaultproperties
{
    bAutoActivateOutputLinks=true
    InputLinks[0]=(LinkDesc="In",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    PlayerIndex=-1
    GamepadID=255
}