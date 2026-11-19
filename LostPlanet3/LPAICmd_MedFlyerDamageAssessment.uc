class LPAICmd_MedFlyerDamageAssessment extends LPAICmd_BasicDamageAssessment within LPAIControllerMedFlyer
    config(AI);

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

function CalculateSeperationPointForDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL displacementToWithDrawPoint, rotToWithdrawPoint;
    local /*0x97E50000-0x00000000*/ private int pitchToPointInUU;
    local /*0x97E50000-0x00000000*/ private float distanceAwayTheWithdrawPointShouldBe;

    pitchToPointInUU = int(float(65535) * (Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForDamageAssessmentInDegrees / 360.0000000));
    displacementToWithDrawPoint = Outer.myAIPawn.Location - Outer.MyLPEnemy.Location;
    rotToWithdrawPoint = Rotator(displacementToWithDrawPoint);
    rotToWithdrawPoint.Pitch = pitchToPointInUU;
    displacementToWithDrawPoint = Vector(rotToWithdrawPoint);
    displacementToWithDrawPoint = Normal(displacementToWithDrawPoint);
    distanceAwayTheWithdrawPointShouldBe = ((GetDistanceToFromEnemyBeforeAssessment()) + (Outer.MyKynapseRadius * FactorToIncreasePawnRadiusByForSeperationBeforeDamAss)) + (OtherActorRadius * FactorToIncreasePawnRadiusByForSeperationBeforeDamAss);
    displacementToWithDrawPoint = displacementToWithDrawPoint * distanceAwayTheWithdrawPointShouldBe;
    DesiredDamageAssessmentLocation = displacementToWithDrawPoint + Outer.MyLPEnemy.Location;
    // End:0x223
    if(Outer.IsDestinationInsideAiMesh(DesiredDamageAssessmentLocation))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
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

        super.EndState(NextStateName);
        //return;        
    }

    function IsDamagedAssessmentFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction, totalDurationOfDamAss;

        // End:0x11
        if(!bAssessingDamage)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedAssessingDamage;
        totalDurationOfDamAss = Outer.MedFlyerPawn.TuneDataMedFlyer.MaxDurationOfDamageAssessmentWhenDirectAttack.GetValue();
        // End:0xDA
        if(durationOfAction > totalDurationOfDamAss)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}
