class LPAICmd_FlyerAttackSmartObject extends LPAICmd_AttackSmartObject within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseMoveToPosition;

state MoveToInteractPosition
{
    function HasMoveFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x52
        if(bUseMoveToPosition)
        {
            // End:0x4D
            if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) >= int(3))
            {
                return true;
            }
            return false;            
        }
        else
        {
            // End:0xD0
            if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) >= int(3))
            {
                // End:0xD0
                if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) != int(6))
                {
                    return true;
                }
            }
            return false;
        }
        //return ReturnValue;        
    }

    function HasMoveSucceeded()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4C
        if(bUseMoveToPosition)
        {
            return int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(2);            
        }
        else
        {
            return int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);
        }
        //return ReturnValue;        
    }

    function MoveToSmartActor()
    {
        // End:0x1A
        if(bUseMoveToPosition)
        {
            MoveToSmartActor_Position();            
        }
        else
        {
            MoveToSmartActor_Actor();
        }
        //return;        
    }

    function MoveToSmartActor_Actor()
    {
        local /*0x97E50000-0x00000000*/ private float MaxSeperation, Seperation, Radius, Height;

        Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        // End:0x217
        if(HaveAccessToSmartActor())
        {
            SelectGoToActor(GoToActor, MaxSeperation);
            Seperation = Seperation2DFromActor(GoToActor);
            // End:0x1DE
            if(Seperation > MaxSeperation)
            {
                GoToActor.GetBoundingCylinder(Radius, Height);
                MoveToActorCmd = Outer.CmdMoveToActorFly(GoToActor, GoToActor, 0.0000000, 88.0000000, Height + Outer.MyHeight, Outer.CmdStatus_MoveToActor, 1);
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                MoveToActorCmd.bZeroVelocityOnFinish = true;                
            }
            else
            {
                Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 2;
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        }
        //return;        
    }

    function MoveToSmartActor_Position()
    {
        local /*0x97E50000-0x00000000*/ private float MaxSeperation, Seperation, Radius, Height;
        local /*0x97E50000-0x00000000*/ private @NULL pos;

        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        // End:0x25F
        if(HaveAccessToSmartActor())
        {
            SelectGoToActor(GoToActor, MaxSeperation);
            Seperation = Seperation2DFromActor(GoToActor);
            // End:0x226
            if(Seperation > MaxSeperation)
            {
                GoToActor.GetBoundingCylinder(Radius, Height);
                pos = GoToActor.Location;
                pos.Z += (Height + (Outer.MyHeight * 2.0000000));
                MoveToPositionCmd = Outer.CmdMoveToPositionFly(pos, GoToActor, 10.0000000, Outer.CmdStatus_MoveToPosition, 1);
                MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                MoveToPositionCmd.bZeroVelocityOnFinish = true;                
            }
            else
            {
                Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        }
        //return;        
    }
    stop;    
}

state StartInteracting
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        Outer.Focus = none;
        //return;        
    }
    stop;    
}

defaultproperties
{
    bUseMoveToPosition=true
    bShouldFaceTarget=false
}