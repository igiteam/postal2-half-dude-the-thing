class LPAIObjectiveKismetGotoFleePoint extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FleePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool RotateToFaceSameDirectionAsFleePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool InterpolateToExactPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInvulnerableWhenFleeing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHaveValidData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToFaceWhileMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToAvoidWhileMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpeedScale;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Move[524289];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function GetActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], ReturnValue;

    // End:0x40
    if(Controller(inActor) != none)
    {
        return Controller(inActor).Pawn;
    }
    return inActor;
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData, FleeTo;
    local /*0x97E50000-0x00000000*/ private int I;

    super(SPAIObjective).InitFromKismet(InKismetObjectiveData);
    CmdStatus_Move.SetDefaults();
    KismetData = LPAIOD_GotoFleePoint(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    FleePoint.Length = 0;
    // End:0x28C
    if(bHaveValidData)
    {
        I = 0;
        J0x89:

        // End:0x164 [Loop If]
        if(I < KismetData.FleePoints.Length)
        {
            // End:0x156
            if(KismetData.FleePoints[I] != none)
            {
                FleeTo = GetActor(KismetData.FleePoints[I]);
                // End:0x156
                if(FleePoint.Find(FleeTo) == )
                {                    
                    FleePoint.AddItem(FleeTo);                    
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x89;
        }
        RotateToFaceSameDirectionAsFleePoint = KismetData.RotateToFaceSameDirectionAsFleePoint;
        InterpolateToExactPosition = KismetData.InterpolateToExactPosition;
        bInvulnerableWhenFleeing = KismetData.bInvulnerableWhenFleeing;
        ActorToFaceWhileMoving = GetActor(KismetData.ActorToFaceWhileMoving);
        ActorToAvoidWhileMoving = GetActor(KismetData.ActorToAvoidWhileMoving);
        SpeedScale = KismetData.PercentageSpeed / float(100);
        bHaveValidData = FleePoint.Length > 0;
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetGotoFleePoint', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetGotoFleePoint(CurObjective);
            // End:0x82
            if(Obj != none)
            {                
                return Obj;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL AllocateAndAddObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, Obj;

    Obj = FindExistingObjective(InObjectiveManager, InAttributes);
    // End:0x54
    if(Obj != none)
    {
        Obj.Abort();
    }
    InObjectiveManager.ImportantObjectiveAdded();
    return super(SPAIObjective).AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return ReturnValue;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = Outer.CmdGotoFleePoint(FleePoint, RotateToFaceSameDirectionAsFleePoint, InterpolateToExactPosition, ActorToFaceWhileMoving, ActorToAvoidWhileMoving, SpeedScale,, 0);
    // End:0xD2
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
        Outer.myAIPawn.bInvulnerableWhenFleeing = bInvulnerableWhenFleeing;
    }
    //return;    
}

event Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPAIObjective).Update(DeltaTime);
    MyObjectiveManager.ImportantObjectiveAdded();
    //return;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIObjectiveKismetGotoFleePoint.LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0'
    begin object name=LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0 class=Class'LPAICmdStatus_MoveToPosition'
    end object
    CmdStatus_Move=LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0
    Attribute=(bRemoveWhenFinished=true)
}