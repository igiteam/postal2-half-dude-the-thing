class LPAICmd_PlayAnimForSmartActor extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TemplateAnimTree[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TemplateAnimName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToAlignTo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SmartObjectInteraction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL User[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __AnimFinished__Delegate;

delegate AnimFinished()
{
    //return;    
}

function SetTemplateAnimTree()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAT[8388609];

    TemplateAnimTree = InAT;
    //return;    
}

function SetTemplateAnimName()
{
    local /*0x97E50000-0x00000000*/ private name InName[8388609];

    TemplateAnimName = InName;
    //return;    
}

function SetAllignActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    ActorToAlignTo = inActor;
    //return;    
}

function SetActorToDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    ActorToDamage = inActor;
    //return;    
}

function SetInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteraction[8388609];

    SmartObjectInteraction = InInteraction;
    //return;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    OnExit();
    //return;    
}

event SPAborted()
{
    OnExit();
    //return;    
}

function OnExit()
{
    // End:0x2E
    if(SmartObjectInteraction != none)
    {
        SmartObjectInteraction.NotifyAnimationDone();
    }
    AnimFinished();
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }

    function SpecialMoveFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        Outer.PopCommand(self);
        //return;        
    }
Begin:

    // End:0x5B
    if(User == none)
    {
        // End:0x5B
        if(SmartObjectInteraction.User != none)
        {
            User = SmartObjectInteraction.User;
        }
    }
    // End:0x8A
    if(User == none)
    {
        Outer.PopCommand(self);
    }
    SpecialMove = LPSM_SmartObjectInteraction(Outer.myAIPawn.GetSpecialMoveInstance(Class'LPSM_SmartObjectInteraction'));
    SpecialMove.InteractionTemplateAnimTree = TemplateAnimTree;
    SpecialMove.InteractionTemplateAnimName = TemplateAnimName;
    SpecialMove.ActorToAlignTo = ActorToAlignTo;
    SpecialMove.User = User;
    Outer.myAIPawn.DoSpecialMove(Class'LPSM_SmartObjectInteraction', true, false, SpecialMoveFinished, ActorToAlignTo);
    J0x1D3:

    // End:0x1F7 [Loop If]
    if(true)
    {
        Outer.Sleep(1.0000000);
        // [Loop Continue]
        goto J0x1D3;
    }
    stop;                    
}

defaultproperties
{
    bInterruptible=false
}