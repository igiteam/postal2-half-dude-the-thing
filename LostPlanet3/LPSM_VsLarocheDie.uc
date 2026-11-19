class LPSM_VsLarocheDie extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyVSPawn, Winch;

    MyVSPawn = LPAIPawnVsLaroche(MySPPawn);
    Winch = LPWeaponVSWinch(MyVSPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x118
    if(Winch.GrabbedPawn != none)
    {
        // End:0xF8
        if(int(MyVSPawn.WorldInfo.NetMode) != int(NM_Client))
        {
            Winch.GrabbedPawn.DoVSCrushTossAction(MyVSPawn);
        }
        Winch.GrabbedPawn = none;
    }
    // End:0x156
    if(int(MyVSPawn.WorldInfo.NetMode) != int(NM_Client))
    {
    }
    BlendOutTime = -1.0000000;
    bEndSpecialMoveOnAnimFinish = false;
    MyVSPawn.Health = 0;
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0xFD
    if((MyVSPawn != none) && MyVSPawn.Health > MyVSPawn.TuneDataVSPlayerPawn.MinHealthForEntry)
    {
        MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('VSRepaired', 'None', MyVSPawn, none, none);
        MyVSPawn.EndSpecialMove(Class);
    }
    super.Tick(DeltaTime);
    //return;    
}

function AllowRegen()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x71
    if((MyVSPawn != none) && MyVSPawn.Health < 1)
    {
        MyVSPawn.Health = 1;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(MySPPawn);
    MyVSPawn.ClearTimer('AllowRegen', self);
    // End:0xC3
    if(MyVSPawn.Health > 0)
    {
        MyVSPawn.TriggerEventClass(Class'LPSeqEvent_VSRegenerated', MyVSPawn);
        MyVSPawn.GotoState('None');        
    }
    BlendOutTime = 0.2500000;
    SpecialMoveEndedStopAnimation(PrevMove, NextMove);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    BlendOutTime=-1.0000000
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}