class LPAICmd_DongoThrown extends LPAICmd_SpecialMoveBase within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Tosser;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TossVelocity;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function SetTosser()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTosser[8388609];

    Tosser = InTosser;
    //return;    
}

function SetVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVelocity[8388609];

    TossVelocity = InVelocity;
    //return;    
}

function NotifyCollision()
{
    GotoState('Ragdoll');
    //return;    
}

function OnThrowAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    GotoState('Ragdoll');
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

    function StartAnimation()
    {
        Tosser.TriggerEventClass(Class'LPSeqEvent_VitalSuitWinch', MyPawn, 2);
        Outer.Focus = none;
        MyPawn.bDirectHitWall = true;
        MyPawn.bCollideWorld = true;
        MyPawn.SetCollision(true, false);
        MyPawn.Mesh.ScriptRigidBodyCollisionThreshold = 5.0000000;
        MyPawn.DesiredSpeed = 1000.0000000;
        MyPawn.SetMaxSpeedScale(1000.0000000);
        MyPawn.SetPhysics(4);
        MyPawn.Velocity = TossVelocity;
        MyPawn.Acceleration.Z += float(-980);
        MyPawn.DoSpecialMove(Class'LPSM_DongoLaunchedFromWinch', true, true, OnThrowAnimFinished, Tosser);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        MyPawn.EndCurrentSpecialMove();
        super.EndState(NextStateName);
        //return;        
    }
Begin:

    StartAnimation();
    stop;        
}

state Ragdoll
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function StartRagdoll()
    {
        LPAIPawn(MyPawn).bShouldRagdoll = true;
        MyPawn.SetPhysics(6);
        MyPawn.DesiredSpeed = 1.0000000;
        MyPawn.SetMaxSpeedScale(1.0000000);
        MyPawn.TakeDamage(1000, Tosser.Controller, Outer.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    StartRagdoll();
    stop;        
}
