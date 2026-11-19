class SPAIObjective extends Object within SPAIController
    abstract
    hidecategories(Object);

enum SPAIObjectiveGameType
{
    SPAI_OBJ_GAMETYPE_ALL,          // 0
    SPAI_OBJ_GAMETYPE_SINGLE_PLAYER,// 1
    SPAI_OBJ_GAMETYPE_MULTI_PLAYER, // 2
    SPAI_OBJ_GAMETYPE_MAX           // 3
};

enum SPAIObjectiveCategory
{
    SPAI_OBJCAT_Invalid,            // 0
    SPAI_OBJCAT_Relaxed,            // 1
    SPAI_OBJCAT_KismetRelaxed,      // 2
    SPAI_OBJCAT_Alerted,            // 3
    SPAI_OBJCAT_KismetAlerted,      // 4
    SPAI_OBJCAT_Aggressive,         // 5
    SPAI_OBJCAT_KismetAggressive,   // 6
    SPAI_OBJCAT_SquadOrder,         // 7
    SPAI_OBJCAT_KismetSquadOrder,   // 8
    SPAI_OBJCAT_Kismet,             // 9
    SPAI_OBJCAT_MAX                 // 10
};

enum SPAIObjectiveStatus
{
    SPAI_OBJSTATUS_NotStarted,      // 0
    SPAI_OBJSTATUS_Running,         // 1
    SPAI_OBJSTATUS_StartOfResults,  // 2
    SPAI_OBJSTATUS_Finished,        // 3
    SPAI_OBJSTATUS_Failed,          // 4
    SPAI_OBJSTATUS_Aborted,         // 5
    SPAI_OBJSTATUS_MAX              // 6
};

struct native SPAIObjectiveAttributes
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte PriorityCategory;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte GameType;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bRemoveWhenFinished;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bStartedViaKismet;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL KismetObjectiveData;

    structdefaultproperties
    {
        PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_Relaxed
        GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_ALL
        bRemoveWhenFinished=false
        bStartedViaKismet=false
        KismetObjectiveData=none
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float Rating[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Attribute[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte Status[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL CurrentCommand[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeGenerated[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeUpdated[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float ActivationTime[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float UnSuspendTime[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL MyObjectiveManager[524289];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bIsBest[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL OuterSPAIController[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL MyPawn[536870913];

// Export USPAIObjective::execIsActive(FFrame&, void* const)
native function IsActive()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjective::execHasFinished(FFrame&, void* const)
native function HasFinished()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjective::execHasValidObjeciveData(FFrame&, void* const)
native function HasValidObjeciveData()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjective::execIsSuspended(FFrame&, void* const)
native function IsSuspended()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjective::execSuspendForTime(FFrame&, void* const)
native function SuspendForTime()
{
    local /*0x03A30000-0x00000000*/ private float Time[8388609];


}

// Export USPAIObjective::execActivate(FFrame&, void* const)
native function Activate();

// Export USPAIObjective::execSetCurrentCommand(FFrame&, void* const)
native function SetCurrentCommand()
{
    local /*0x03A30000-0x00000000*/ private @NULL Cmd[8388609];


}

// Export USPAIObjective::execCanBeActivated(FFrame&, void* const)
native event CanBeActivated()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjective::execIsValid(FFrame&, void* const)
native event IsValid()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjective::execIsBetterThan(FFrame&, void* const)
native event IsBetterThan()
{
    local /*0x03A30000-0x00000000*/ private @NULL Other[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function GetTimeSeconds()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

event GetHumanReadableName()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(Name);
    //return ReturnValue;    
}

event OnGenerated()
{
    TimeGenerated = Outer.WorldInfo.TimeSeconds;
    TimeUpdated = TimeGenerated;
    //return;    
}

private final event InternalPerformObjective()
{
    // End:0x74
    if(!IsActive())
    {
        PrePerformObjective();
        PerformObjective();
        // End:0x74
        if(int(Status) != int(4))
        {
            ActivationTime = Outer.WorldInfo.TimeSeconds;
        }
    }
    //return;    
}

protected function PerformObjective()
{
    //return;    
}

protected event PostGetBestObjective()
{
    //return;    
}

event ShowDebugInfo()
{
    //return;    
}

protected event DisplayDebug()
{
    local /*0x03A30000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x03A30000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x03A30000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    // End:0x73
    if(bIsBest)
    {
        HUD.Canvas.SetDrawColor(139, 0, 139);        
    }
    else
    {
        HUD.Canvas.SetDrawColor(255, 0, 255);
    }
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText(" --------------- ");
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText("Objective:" $ string(self));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    Canvas.DrawText((((((((("  Pri:" $ string(Attribute.PriorityCategory)) $ " Rating:") $ string(Rating)) $ " CanBeActive:") $ string(CanBeActivated())) $ " Suspended:") $ string(IsSuspended())) $ " Active:") $ string(IsActive()));
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    //return;    
}

protected function PrePerformObjective()
{
    //return;    
}

event OnCommandAborted()
{
    // End:0x20
    if(int(Status) != int(4))
    {
        Status = 5;
    }
    SetCurrentCommand(none);
    //return;    
}

event OnCommandFinished()
{
    Status = 3;
    SetCurrentCommand(none);
    //return;    
}

event Abort()
{
    // End:0x20
    if(int(Status) != int(4))
    {
        Status = 5;
    }
    // End:0x58
    if(CurrentCommand != none)
    {
        Outer.AbortCommand(CurrentCommand);
    }
    SetCurrentCommand(none);
    Attribute.KismetObjectiveData = none;
    //return;    
}

event Update()
{
    local /*0x03A30000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

event InitFromKismet()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];

    //return;    
}

function DrawDebug()
{
    local /*0x03A30000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

private static final function AllocateObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL OuterController[8388609], ReturnValue, NewObjective;

    // End:0xD5
    if(OuterController != none)
    {
        NewObjective = new (OuterController) default.Class;
        // End:0xD5
        if(NewObjective != none)
        {
            NewObjective.OuterSPAIController = OuterController;
            NewObjective.MyPawn = SPPawn(OuterController.Pawn);
            NewObjective.OnGenerated();
            return NewObjective;
        }
    }
    return none;
    //return ReturnValue;    
}

static function @NULL AllocateAndAddObjective()
{
    local /*0x03A30000-0x00000400*/ private @NULL ObjectiveManager[8388609], InAttributes, ReturnValue, NewObjective, OuterController;

    OuterController = SPAIController(ObjectiveManager.Outer);
    // End:0xEE
    if(OuterController != none)
    {
        NewObjective = AllocateObjective(OuterController);
        // End:0xE4
        if(NewObjective != none)
        {
            NewObjective.Attribute = InAttributes;
            NewObjective.MyObjectiveManager = ObjectiveManager;
            ObjectiveManager.AddObjective(NewObjective);
        }
        return NewObjective;
    }
    return none;
    //return ReturnValue;    
}

// Export USPAIObjective::execGenerateObjectives(FFrame&, void* const)
native static event @NULL GenerateObjectives()
{
    local /*0x03A30000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;


}

defaultproperties
{
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_Relaxed,GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_ALL,bRemoveWhenFinished=false,bStartedViaKismet=false,KismetObjectiveData=none)
}