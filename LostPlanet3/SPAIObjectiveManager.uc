class SPAIObjectiveManager extends ActorComponent
    editinlinenew
    hidecategories(Object,ActorComponent);

struct native SPAIObjectiveGeneratorInfo
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float GenerateFrequency;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class ObjectiveClass;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL KismetObjectiveData;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeToNextGenerate;

    structdefaultproperties
    {
        GenerateFrequency=1.0000000
        ObjectiveClass=none
        KismetObjectiveData=none
        TimeToNextGenerate=0.0000000
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TickFrequency;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array ObjectiveGeneratorInfo;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array Objectives;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array KismetObjectiveGeneratorInfo;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array PendingKismetObjectiveGeneratorInfo;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private int KismetGeneratorInUse;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeToNextTick;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bEnabled;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bCanTick;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bImportantObjectiveAdded;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bEnableDebugLog;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte GameTypeFilter;

// Export USPAIObjectiveManager::execAddObjective(FFrame&, void* const)
native function AddObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL Obj[8388609];


}

// Export USPAIObjectiveManager::execRemoveObjective(FFrame&, void* const)
native function RemoveObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL Obj[8388609];


}

// Export USPAIObjectiveManager::execClearAllObjectives(FFrame&, void* const)
native function ClearAllObjectives();

// Export USPAIObjectiveManager::execCleanInValidObjectives(FFrame&, void* const)
protected native function CleanInValidObjectives();

// Export USPAIObjectiveManager::execGetBestObjective(FFrame&, void* const)
native function GetBestObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL inCurrent[8388609], ReturnValue;


}

// Export USPAIObjectiveManager::execGetGameTypeFilter(FFrame&, void* const)
native function GetGameTypeFilter()
{
    local /*0x03A30000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export USPAIObjectiveManager::execAllObjectives(FFrame&, void* const)
native final iterator function AllObjectives()
{
    local /*0x03A30000-0x00000000*/ private class BaseClass[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Obj[25165825];


}

// Export USPAIObjectiveManager::execAllObjectivesWithAttributes(FFrame&, void* const)
native final iterator function AllObjectivesWithAttributes()
{
    local /*0x03A30000-0x00000000*/ private class BaseClass[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL InAttributes[25296897], Obj;


}

// Export USPAIObjectiveManager::execDisplayDebug(FFrame&, void* const)
native final function DisplayDebug()
{
    local /*0x03A30000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x03A30000-0x00000000*/ private float out_YL[25165825], out_YPos;


}

// Export USPAIObjectiveManager::execCallObjectiveGenerators(FFrame&, void* const)
native function CallObjectiveGenerators()
{
    local /*0x03A30000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPAIObjectiveManager::execCallObjectiveGeneratorsForArray(FFrame&, void* const)
native function CallObjectiveGeneratorsForArray()
{
    local /*0x03A30000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x03A30000-0x00000000*/ private editfixedsize array InObjectiveGeneratorInfo[25165825];


}

// Export USPAIObjectiveManager::execIsValidForGameType(FFrame&, void* const)
protected native function IsValidForGameType()
{
    local /*0x03A30000-0x00000000*/ private @NULL Attribute[25296897];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjectiveManager::execCanTick(FFrame&, void* const)
native final function CanTick()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObjectiveManager::execNotifyTargetAdded(FFrame&, void* const)
native function NotifyTargetAdded()
{
    local /*0x03A30000-0x00000000*/ private @NULL InTarget[8388609], InCurrentObjective;


}

function EnableTicking()
{
    local /*0x03A30000-0x00000000*/ private bool bInEnable[8388609];

    bEnabled = bInEnable;
    //return;    
}

function ResetAllNonKismetTimesToNextGenerate()
{
    local /*0x03A30000-0x00000000*/ private float NewTimeToNextGenerate[8388609];
    local /*0x03A30000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x61 [Loop If]
    if(iter < ObjectiveGeneratorInfo.Length)
    {
        ObjectiveGeneratorInfo[iter].TimeToNextGenerate = NewTimeToNextGenerate;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

protected event PreRemoveObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL InObjective[8388609];

    //return;    
}

event GeneratePendingKismetObjectives()
{
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private @NULL KismetObjectiveData, Attribute, NewObjective;

    I = 0;
    J0x0B:

    // End:0x22D [Loop If]
    if(I < PendingKismetObjectiveGeneratorInfo.Length)
    {
        KismetObjectiveData = PendingKismetObjectiveGeneratorInfo[I].KismetObjectiveData;
        // End:0x21F
        if((KismetObjectiveData != none) && !KismetObjectiveData.IsPendingKill())
        {
            // End:0x21F
            if(((FindKismetObjective(KismetObjectiveData)) == none) && KismetObjectiveData.GeneratedObjectiveClass != none)
            {
                Attribute = KismetObjectiveData.GeneratedObjectiveClass.default.Attribute;
                // End:0x21F
                if(IsValidForGameType(Attribute))
                {
                    Attribute.bStartedViaKismet = true;
                    Attribute.PriorityCategory = KismetObjectiveData.PriorityCategory;
                    Attribute.KismetObjectiveData = KismetObjectiveData;
                    NewObjective = KismetObjectiveData.GeneratedObjectiveClass.static.AllocateAndAddObjective(self, Attribute);
                    NewObjective.Rating = KismetObjectiveData.ObjectiveRating;
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    PendingKismetObjectiveGeneratorInfo.Length = 0;
    //return;    
}

function AddAIObjectiveFromKismet()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], GeneratorInfo;

    // End:0x159
    if(IsValidKismetObjectiveData(InKismetObjectiveData))
    {
        // End:0x159
        if((GetIndexPendingKismetObjectiveData(InKismetObjectiveData)) < 0)
        {
            GeneratorInfo.GenerateFrequency = 1.0000000;
            GeneratorInfo.KismetObjectiveData = InKismetObjectiveData;
            GeneratorInfo.TimeToNextGenerate = 0.0000000;
            GeneratorInfo.ObjectiveClass = InKismetObjectiveData.GeneratedObjectiveClass;
            // End:0x12A
            if(!InKismetObjectiveData.bUseAsGenerator)
            {
                // End:0x127
                if((FindKismetObjective(InKismetObjectiveData)) == none)
                {
                    PendingKismetObjectiveGeneratorInfo.AddItem(GeneratorInfo);                    
                }                
            }
            else
            {
                // End:0x159
                if((GetIndexKismetObjectiveData(InKismetObjectiveData)) < 0)
                {
                    KismetObjectiveGeneratorInfo.AddItem(GeneratorInfo);                    
                }
            }
        }
    }
    //return;    
}

function RemoveAIObjectiveFromKismet()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];
    local /*0x03A30000-0x00000000*/ private int PendingIndex;

    // End:0x81
    if(IsValidKismetObjectiveData(InKismetObjectiveData))
    {
        PendingIndex = GetIndexPendingKismetObjectiveData(InKismetObjectiveData);
        // End:0x5B
        if(PendingIndex > -1)
        {
            PendingKismetObjectiveGeneratorInfo.Remove(PendingIndex, 1);            
        }
        RemoveKismetObjectiveGeneratorInfo(InKismetObjectiveData);
        AbortAllKismetObjectivesFor(InKismetObjectiveData);
    }
    //return;    
}

private final function IsValidKismetObjectiveData()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private class MyControllerClass;

    // End:0x16F
    if((((InKismetObjectiveData != none) && !InKismetObjectiveData.IsPendingKill()) && InKismetObjectiveData.GeneratedObjectiveClass != none) && InKismetObjectiveData.AllowedControllerClasses.Length > 0)
    {
        MyControllerClass = class<SPAIController>(Outer.Class);
        // End:0x16F
        if(MyControllerClass != none)
        {
            I = 0;
            J0xCD:

            // End:0x16F [Loop If]
            if(I < InKismetObjectiveData.AllowedControllerClasses.Length)
            {
                // End:0x161
                if(InKismetObjectiveData.AllowedControllerClasses[I] != none)
                {
                    // End:0x161
                    if(ClassIsChildOf(MyControllerClass, InKismetObjectiveData.AllowedControllerClasses[I]))
                    {
                        return true;
                    }
                }
                ++I;
                // [Loop Continue]
                goto J0xCD;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetIndexPendingKismetObjectiveData()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689], I;

    // End:0x85
    if(IsValidKismetObjectiveData(InKismetObjectiveData))
    {
        I = 0;
        J0x21:

        // End:0x85 [Loop If]
        if(I < PendingKismetObjectiveGeneratorInfo.Length)
        {
            // End:0x77
            if(PendingKismetObjectiveGeneratorInfo[I].KismetObjectiveData == InKismetObjectiveData)
            {
                return I;
            }
            ++I;
            // [Loop Continue]
            goto J0x21;
        }
    }
    return -1;
    //return ReturnValue;    
}

function GetIndexKismetObjectiveData()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689], I;

    // End:0x85
    if(IsValidKismetObjectiveData(InKismetObjectiveData))
    {
        I = 0;
        J0x21:

        // End:0x85 [Loop If]
        if(I < KismetObjectiveGeneratorInfo.Length)
        {
            // End:0x77
            if(KismetObjectiveGeneratorInfo[I].KismetObjectiveData == InKismetObjectiveData)
            {
                return I;
            }
            ++I;
            // [Loop Continue]
            goto J0x21;
        }
    }
    return -1;
    //return ReturnValue;    
}

function FindKismetObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], ReturnValue, Obj;

    // End:0xEF
    if(IsValidKismetObjectiveData(InKismetObjectiveData))
    {
        // End:0xEE
        foreach AllObjectives(Class'SPAIObjective', Obj)
        {
            // End:0xED
            if(Obj.Attribute.bStartedViaKismet && Obj.Attribute.KismetObjectiveData != none)
            {
                // End:0xED
                if(Obj.Attribute.KismetObjectiveData == InKismetObjectiveData)
                {                    
                    return Obj;
                }
            }            
        }        
    }
    return none;
    //return ReturnValue;    
}

function AbortAllKismetObjectivesFor()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], Obj;

    // End:0x103
    if(IsValidKismetObjectiveData(InKismetObjectiveData))
    {
        // End:0x102
        foreach AllObjectives(Class'SPAIObjective', Obj)
        {
            // End:0x101
            if(Obj.Attribute.bStartedViaKismet && Obj.Attribute.KismetObjectiveData != none)
            {
                // End:0x101
                if(Obj.Attribute.KismetObjectiveData == InKismetObjectiveData)
                {
                    Obj.Abort();
                }
            }            
        }        
    }
    //return;    
}

function RemoveKismetObjectiveGeneratorInfo()
{
    local /*0x03A30000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xB6 [Loop If]
    if(I < KismetObjectiveGeneratorInfo.Length)
    {
        // End:0xA8
        if((KismetObjectiveGeneratorInfo[I].KismetObjectiveData != none) && KismetObjectiveGeneratorInfo[I].KismetObjectiveData == InKismetObjectiveData)
        {
            KismetObjectiveGeneratorInfo.Remove(I, 1);            
            I--;
            // [Explicit Break]
            goto J0xB6;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    J0xB6:

    //return;    
}

function ActivateBestObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL CurrentObjective[8388609];
    local /*0x03A30000-0x00000000*/ private bool bForced[9437185];
    local /*0x03A30000-0x00000000*/ private float MinTimeToKeepCurrentObjective[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private bool bActivate;
    local /*0x03A30000-0x00000000*/ private @NULL CandidateObjective, MyController, MyPawn;

    false
    1.0000000
    // End:0x1F
    if(!bEnabled)
    {
        return none;
    }
    // End:0x14A
    if(CurrentObjective != none)
    {
        // End:0x60
        if(!CurrentObjective.IsValid())
        {
            CurrentObjective = none;            
        }
        else
        {
            // End:0x90
            if(CurrentObjective.HasFinished())
            {
                CurrentObjective = none;                
            }
            else
            {
                // End:0xEB
                if(int(CurrentObjective.Status) == int(4))
                {
                    CurrentObjective.SuspendForTime(2.0000000);
                    CurrentObjective = none;                    
                }
                else
                {
                    // End:0x11B
                    if(CurrentObjective.IsSuspended())
                    {
                        CurrentObjective = none;                        
                    }
                    else
                    {
                        // End:0x14A
                        if(!CurrentObjective.CanBeActivated())
                        {
                            CurrentObjective = none;
                        }
                    }
                }
            }
        }
    }
    bActivate = false;
    // End:0x194
    if(CurrentObjective == none)
    {
        CurrentObjective = GetBestObjective(none);
        bActivate = CurrentObjective != none;        
    }
    else
    {
        // End:0x286
        if((bForced || bImportantObjectiveAdded) || (CurrentObjective.ActivationTime + MinTimeToKeepCurrentObjective) < CurrentObjective.Outer.WorldInfo.TimeSeconds)
        {
            CandidateObjective = GetBestObjective(CurrentObjective);
            // End:0x286
            if(CandidateObjective != CurrentObjective)
            {
                CurrentObjective = CandidateObjective;
                bActivate = CurrentObjective != none;
            }
        }
        bActivate = bActivate || !CurrentObjective.IsActive();
    }
    // End:0x3A7
    if(bActivate)
    {
        MyController = CurrentObjective.Outer;
        MyPawn = SPPawn(MyController.Pawn);
        // End:0x3A7
        if((MyPawn != none) && MyPawn.TuneDataBasePawn != none)
        {
            // End:0x388
            if(bEnableDebugLog)
            {
                CurrentObjective.ShowDebugInfo();
            }
            CurrentObjective.Activate();
        }
    }
    bImportantObjectiveAdded = false;
    return CurrentObjective;
    //return ReturnValue;    
}

function ImportantObjectiveAdded()
{
    bImportantObjectiveAdded = true;
    //return;    
}

event StartingGetBestObjective()
{
    //return;    
}

defaultproperties
{
    bEnabled=true
}