class LPAIObjectiveFlyerlAttackSmartObjects extends LPAIObjectiveAttackSmartObjects within LPAIControllerMedFlyer
    config(AI)
    hidecategories(Object,Object);

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "Flyer Attack Smart Object";
    //return ReturnValue;    
}

function GetBestPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteractionData[8388609], Best;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CandidateActor, Candidate;
    local /*0x97E50000-0x00000000*/ private float mindistsq, DistSq;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private bool bFound;

    mindistsq = 2147484000.0000000 * float(2147483647);
    bFound = false;
    // End:0x226
    if(InInteractionData != none)
    {
        I = 0;
        J0x3E:

        // End:0x18B [Loop If]
        if(I < InInteractionData.ActorsToStandOn.Length)
        {
            // End:0x17D
            if(InInteractionData.ActorsToStandOn[I] != none)
            {
                CandidateActor = InInteractionData.ActorsToStandOn[I];
                // End:0x17D
                if(GetPositionFromGotoActor(CandidateActor, Candidate))
                {
                    DistSq = VSizeSq(Candidate - Outer.myAIPawn.Location);
                    // End:0x17D
                    if(DistSq < mindistsq)
                    {
                        Best = Candidate;
                        DistSq = mindistsq;
                        bFound = true;
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x3E;
        }
        // End:0x226
        if(!bFound && InInteractionData.MySmartActor != none)
        {
            CandidateActor = InInteractionData.MySmartActor;
            // End:0x226
            if(GetPositionFromGotoActor(CandidateActor, Candidate))
            {
                Best = Candidate;
                bFound = true;
            }
        }
    }
    return bFound;
    //return ReturnValue;    
}

function GetReachDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.MedFlyerPawn.TuneDataMedFlyer.MaxNodeDistanceForAttackObjectiveFlyCanReachCheck;
    //return ReturnValue;    
}

function GetPositionFromGotoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], pos;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Radius, Height;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;

    inActor.GetBoundingCylinder(Radius, Height);
    pos = inActor.Location;
    pos.Z += Height;
    bSuccess = IsFlyPositionReachable(pos);
    return bSuccess;
    //return ReturnValue;    
}

function IsFlyPositionReachable()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CmdAttackSmartObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteractionData[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    CmdStatus_Interact
    0
    // End:0x65
    if(int(CmdOption) == int(0))
    {
        Outer.AbortCommand(Outer.CommandList);
    }
    LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Interact_Error = 0;
    LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Error = 0;
    myCommand = LPAICmd_FlyerAttackSmartObject(Class'LPAICmd_FlyerAttackSmartObject'.static.InitObjectiveCommand(Outer, self));
    // End:0x157
    if(myCommand != none)
    {
        myCommand.SetInteractionData(InteractionData);
        myCommand.SetReturnCmdStatus(CmdStatus);        
    }
    else
    {
        // End:0x1BA
        if(CmdStatus != none)
        {
            LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Interact_Error = 1;
            LPAICmdStatus_InteractWithSmartObject(CmdStatus).Cmd_Error = 1;
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_InteractWithSmartObject'Default__LPAIObjectiveFlyerlAttackSmartObjects.LPAICmdStatus_InteractWithSmartObject0'
    begin object name=LPAICmdStatus_InteractWithSmartObject0
    end object
    CmdStatus_Interact=LPAICmdStatus_InteractWithSmartObject0
}