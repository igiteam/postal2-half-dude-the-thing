class LPAICmd_PackHunterMeleeVs extends LPAICmd_PackHunterMelee within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldStartRunInClawSwipeAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool StaticStalkStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CircleCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CirclingRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeForStaticStalk[536870913];

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

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetCanStrikeBeforeReachingMeleeSlot()
{
    local /*0x97E50000-0x00000000*/ private bool bCan[8388609];

    bCanStrikeBeforeReachingMeleeSlot = false;
    //return;    
}

state Stalk
{
    function ShouldTryDashAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StaticStalk_Start()
    {
        // End:0x6C
        if(!StaticStalkStarted)
        {
            Outer.PHPawn.DoSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint', true, false, None, none);
            StaticStalkStarted = true;
        }
        //return;        
    }

    function StaticStalk_Stop()
    {
        // End:0x56
        if(StaticStalkStarted)
        {
            Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterStalkAtMeleePoint');
            StaticStalkStarted = false;
        }
        //return;        
    }

    function ProceeduralStalk_Start()
    {
        Outer.myAIPawn.SetMaxSpeedScale(PackHunterPawn.TuneDataPackHunter.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }
    stop;    
}
