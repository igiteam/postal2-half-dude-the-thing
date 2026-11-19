class LPAICmd_SpitterTailStingVS extends LPAICmd_SpitterTailSting within LPAIControllerSpitter;

function Pushed()
{
    super.Pushed();
    AttackSeperation_TailSting = Outer.SpitterPawn.AttackSeperation_TailStingVs;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function GetTailStuckTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    LPSMClassStingIn=Class'LPSM_SpitterAttackTailStingVSIn'
    LPSMClassStingHold=none
    LPSMClassStingOut=none
    LPSMClassStingInReactive=Class'LPSM_SpitterAttackTailStingVSInReactive'
    bDoTransitionInToAttack=false
    bDoOffScreenChecks=false
    bCanDoReactiveAttacksDuringTransition=false
    AttackCSA=eSpitterCSA.eSpitterCSA_AttackVs
}