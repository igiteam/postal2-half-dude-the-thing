class LPAICmd_HSKismet extends LPAICommand within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KismetAction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte LatentAction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCover;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShootAtActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeActor;

function Pushed()
{
    // End:0x6D
    if(int(Outer.Pawn.Physics) == int(7))
    {
        Outer.Pawn.SetPhysics(1);
    }
    super.Pushed();
    //return;    
}

function Popped()
{
    OnExit();
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function OnExit()
{
    GotoState('None');
    Outer.ClearThisLatentAction(KismetAction, bAborted);
    Outer.ClearTimer('MaxTimeReached', self);
    // End:0xAA
    if(KismetAction.TurnOnAIOnFinished)
    {
        Outer.ForceEnableAI();
    }
    KismetAction = none;
    //return;    
}

function GetKismetAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return KismetAction;
    //return ReturnValue;    
}

function SetKismetAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetAction[8388609], Ctrl;

    // End:0xA1
    if(KismetAction != none)
    {
        Outer.AbortCommand(ChildCommand);
        Outer.ClearTimer('MaxTimeReached', self);
        // End:0xA1
        if(KismetAction != InKismetAction)
        {
            Outer.ClearThisLatentAction(KismetAction, true);
        }
    }
    KismetAction = InKismetAction;
    // End:0x11B
    if(InKismetAction.MaxTimeAction > float(0))
    {
        Outer.SetTimer(InKismetAction.MaxTimeAction, false, 'MaxTimeReached', self);
    }
    MoveToActor = InKismetAction.MoveTo;
    ShootAtActor = InKismetAction.ShootAt;
    MeleeActor = InKismetAction.MeleeAt;
    InKismetAction.GetCoverInfo(MoveToCover);
    Ctrl = Controller(MoveToActor);
    // End:0x234
    if((Ctrl != none) && Ctrl.Pawn != none)
    {
        MoveToActor = Ctrl.Pawn;
    }
    Ctrl = Controller(ShootAtActor);
    // End:0x2AD
    if((Ctrl != none) && Ctrl.Pawn != none)
    {
        ShootAtActor = Ctrl.Pawn;
    }
    Ctrl = Controller(MeleeActor);
    // End:0x326
    if((Ctrl != none) && Ctrl.Pawn != none)
    {
        MeleeActor = Ctrl.Pawn;
    }
    // End:0x3B3
    if(KismetAction.InputLinks[0].bHasImpulse)
    {
        // End:0x396
        if(MoveToActor == none)
        {
            Outer.AbortLatentAction(InKismetAction);
            return;
        }
        LatentAction = 0;
        GotoState('MoveTo');        
    }
    else
    {
        // End:0x440
        if(KismetAction.InputLinks[1].bHasImpulse)
        {
            // End:0x423
            if(ShootAtActor == none)
            {
                Outer.AbortLatentAction(InKismetAction);
                return;
            }
            LatentAction = 1;
            GotoState('ShootAt');            
        }
        else
        {
            // End:0x4DF
            if(KismetAction.InputLinks[2].bHasImpulse)
            {
                // End:0x4C2
                if((ShootAtActor == none) || MoveToActor == none)
                {
                    Outer.AbortLatentAction(InKismetAction);
                    return;
                }
                LatentAction = 2;
                GotoState('ShootFromPos');                
            }
            else
            {
                // End:0x583
                if(KismetAction.InputLinks[3].bHasImpulse)
                {
                    // End:0x566
                    if(InKismetAction.FleeFrom.Length <= 0)
                    {
                        Outer.AbortLatentAction(InKismetAction);
                        return;
                    }
                    LatentAction = 3;
                    GotoState('Flee');                    
                }
                else
                {
                    // End:0x5D8
                    if(KismetAction.InputLinks[4].bHasImpulse)
                    {
                        LatentAction = 4;
                        GotoState('Wander');                        
                    }
                    else
                    {
                        // End:0x663
                        if(KismetAction.InputLinks[6].bHasImpulse)
                        {
                            // End:0x649
                            if(MeleeActor == none)
                            {
                                Outer.AbortLatentAction(InKismetAction);
                                return;
                            }
                            LatentAction = 6;
                            GotoState('Melee');
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function MaxTimeReached()
{
    Outer.PopCommand(self);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    stop;                
}

state MoveTo
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function STARTMOVE()
    {
        // End:0x70
        if(MoveToCover.Link != none)
        {
            Outer.CmdMoveToCover(MoveToCover,, 1,,, KismetAction.SpeedScale);            
        }
        else
        {
            Outer.CmdMoveToActor(MoveToActor, none,,, 1,,,,, KismetAction.SpeedScale);
        }
        //return;        
    }
Begin:

    STARTMOVE();
    Outer.PopCommand(self);
    stop;        
}

state ShootAt
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AISetFireTarget(none);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StartShoot()
    {
        // End:0x51
        if(Outer.CoverIsIn())
        {
            Outer.CmdStaticAttackFromCover(ShootAtActor,, 1);            
        }
        else
        {
            Outer.CmdStaticAttackFromOpen(ShootAtActor,, 1);
        }
        //return;        
    }
Begin:

    StartShoot();
    Outer.PopCommand(self);
    stop;        
}

state ShootFromPos
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AISetFireTarget(none);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StartMoveAndShoot()
    {
        local /*0x97E50000-0x00000000*/ private bool bAllowShooting;

        bAllowShooting = true;
        Outer.AISetFireTarget(ShootAtActor);
        // End:0xAD
        if(MoveToCover.Link != none)
        {
            Outer.CmdMoveToCover(MoveToCover,, 1, bAllowShooting,, KismetAction.SpeedScale);            
        }
        else
        {
            Outer.CmdMoveToActor(MoveToActor, none,,, 1,, bAllowShooting,,, KismetAction.SpeedScale);
        }
        //return;        
    }

    function StartShoot()
    {
        // End:0x51
        if(Outer.CoverIsIn())
        {
            Outer.CmdStaticAttackFromCover(ShootAtActor,, 1);            
        }
        else
        {
            Outer.CmdStaticAttackFromOpen(ShootAtActor,, 1);
        }
        //return;        
    }
Begin:

    StartMoveAndShoot();
    StartShoot();
    Outer.PopCommand(self);
    stop;                
}

state Flee
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.CmdFlee(-1.0000000, KismetAction.DistanceFlee * 1.5000000, KismetAction.DistanceFlee, KismetAction.FleeFrom, 1, false);
    Outer.PopCommand(self);
    stop;                
}

state Wander
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.CmdWander(-1.0000000, false, 0.1000000, 0.1000000,, 1);
    Outer.PopCommand(self);
    stop;        
}

state Melee
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StartMelee()
    {
        Outer.CmdStaticCoverAIMelee(MeleeActor,, 1);
        //return;        
    }
Begin:

    StartMelee();
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=false
}