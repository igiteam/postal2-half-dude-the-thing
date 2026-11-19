class LPAIInteraction_BaseAttackActor extends SPAIInteraction
    abstract
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AIController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AIPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToAlignWith[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayAnimCmd[536870913];

function SetAlignActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    ActorToAlignWith = inActor;
    //return;    
}

function HasFailed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HasFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function Finish()
{
    GotoState('Finished');
    //return;    
}

function Fail()
{
    GotoState('Failed');
    //return;    
}

auto state StartState
{Begin:

    AttackData = LPAIInteractionData_BaseAttackActor(Data);
    // End:0x35
    if(AttackData == none)
    {
        Fail();
    }
    AIPawn = LPAIPawn(User);
    AIController = LPAIController(AIPawn.Controller);
    GotoState('StartAttack');
    stop;                
}

state StartAttack
{
    function NotifyAnimationDone()
    {
        Finish();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x5C
        if((PlayAnimCmd != none) && AIController != none)
        {
            AIController.AbortCommand(PlayAnimCmd);
        }
        PlayAnimCmd = none;
        //return;        
    }

    function StartAnimation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Loc;

        // End:0x136
        if(AIController != none)
        {
            Loc = AIPawn.Location;
            AIController.IsValidLobStrikePosition(Loc, AttackData.ActorToAttack);
            PlayAnimCmd = AIController.CmdPlayAnimForSmartActor(AttackData.AttackAnimation.TemplateAnimTree, AttackData.AttackAnimation.TemplateAnimName, self, AttackData.ActorToAttack, ActorToAlignWith,, 1);            
        }
        else
        {
            Fail();
        }
        //return;        
    }
Begin:

    StartAnimation();
    J0x0A:

    // End:0x20 [Loop If]
    if(true)
    {
        Sleep(1.0000000);
        // [Loop Continue]
        goto J0x0A;
    }
    stop;                
}

state Finished
{
    function HasFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function HasFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x16 [Loop If]
    if(true)
    {
        Sleep(5.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;        
}

state Failed
{
    function HasFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function HasFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x16 [Loop If]
    if(true)
    {
        Sleep(5.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;        
}
