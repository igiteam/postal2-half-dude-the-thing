class LPSM_DongoRollStart extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDongoPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDongoController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StartPosition[536870913];

function IsEnemyInDodgeWindowRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationFormMeatBag, distanceToOpenWindow;
    local /*0x97E50000-0x00000000*/ private @NULL HipPos;

    // End:0x1DD
    if((MyDongoPawn.EnemySelectedByAttackCommand != none) && MyDongoController.CanBeMyEnemy(MyDongoPawn.EnemySelectedByAttackCommand))
    {
        HipPos = MyDongoPawn.Mesh.GetBoneLocation('JO_hip');
        // End:0xDC
        if(HipPos != vect(0.0000000, 0.0000000, 0.0000000))
        {
            StartPosition = HipPos;
        }
        seperationFormMeatBag = VSize(StartPosition - MyDongoPawn.EnemySelectedByAttackCommand.Location);
        distanceToOpenWindow = MyDongoPawn.TuneDataDongo.DistanceAwayToOpenDodgeWindowPof.GetValue() + MyDongoPawn.TuneDataDongo.AdditionalDistanceAwayToOpenFirstDodgeWindowPof.GetValue();
        // End:0x1DD
        if(seperationFormMeatBag < distanceToOpenWindow)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function OpenDodgeWindowIfNeeded()
{
    // End:0x95
    if(!MyDongoPawn.bFirstDodgeWindownOpen && IsEnemyInDodgeWindowRange())
    {
        MyDongoPawn.HandleNotifyPlayerDodgeWindow(3, 0, MyDongoPawn.EnemySelectedByAttackCommand);
        MyDongoPawn.bChargeDodgeWindowOpen = true;
    }
    //return;    
}

function CloseDodgeWindowIfNeeded()
{
    // End:0x95
    if(MyDongoPawn.bFirstDodgeWindownOpen && !IsEnemyInDodgeWindowRange())
    {
        MyDongoPawn.HandleNotifyPlayerDodgeWindow(3, 1, MyDongoPawn.EnemySelectedByAttackCommand);
        MyDongoPawn.bChargeDodgeWindowOpen = false;
    }
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
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_AnimNotifyDodge:
            OpenDodgeWindowIfNeeded();
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyDongoPawn = LPAIPawnDongo(MySPPawn);
    // End:0xE3
    if(MyDongoPawn != none)
    {
        MyDongoController = LPAIControllerDongo(MyDongoPawn.Controller);
        MyDongoPawn.SetChargeCSA(true);
        MyDongoPawn.ZeroMovementVariables();
        MyDongoPawn.SetFreeGrab(true);
        StartPosition = MyDongoPawn.Location;
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MyDongoPawn.TransitioningIntoMovement = 1;
    MyDongoPawn.SetFreeGrab(false);
    CloseDodgeWindowIfNeeded();
    super.SpecialMoveEnded(PrevMove, NextMove);
    MyDongoPawn = none;
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    BlendOutTime=0.0000000
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}