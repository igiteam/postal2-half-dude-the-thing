class LPSP_StruggleAnimControl extends LPStrugglePhaseAnim
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL tuneDataAnimControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AdditiveAnimIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyAnimNode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OtherAnimNode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PushButtonMeter;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    tuneDataAnimControl = LPTuneDataStrugglePhaseAnimControl(TuneData);
    AdditiveAnimIndex = -1;
    // End:0x13B
    if(tuneDataAnimControl.AdditiveTemplateName != 'None')
    {
        AdditiveAnimIndex = inSMStruggleMode.AnimationTemplateNodeNames.Find(tuneDataAnimControl.AdditiveTemplateName);        
        // End:0x13B
        if(AdditiveAnimIndex == -1)
        {
            AdditiveAnimIndex = inSMStruggleMode.AnimationTemplateNodeNames.Length;
            inSMStruggleMode.AnimationTemplateNodeNames.AddItem(tuneDataAnimControl.AdditiveTemplateName);            
        }
    }
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL FollowerSpecialMove;
    local /*0x97E50000-0x00000000*/ private float startPctg;
    local /*0x97E50000-0x00000000*/ private int additiveFollowerAnimIndex;

    super.Start(PrevPhaseName);
    // End:0x164
    if(AdditiveAnimIndex != -1)
    {
        MyAnimNode = smStruggleMode.PlayAdditive(0, AdditiveAnimIndex);
        // End:0x156
        if(tuneDataAnimControl.AdditiveFollowerTemplateName != 'None')
        {
            FollowerSpecialMove = LPSM_FollowerStruggleMode(smStruggleMode.FollowerSMInstance);
            additiveFollowerAnimIndex = FollowerSpecialMove.AdditiveAnimIndexes[smStruggleMode.GetPhaseIndex(tuneDataAnimControl.PhaseName)];
            OtherAnimNode = smStruggleMode.PlayAdditive(1, additiveFollowerAnimIndex);            
        }
        else
        {
            OtherAnimNode = none;
        }        
    }
    else
    {
        // End:0x22B
        if(!tuneDataAnim.bIsLooping)
        {
            MyAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.MySequence;
            OtherAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.OtherTargetSequence;            
        }
        else
        {
            MyAnimNode = none;
            OtherAnimNode = none;
        }
    }
    startPctg = GetStartPctg();
    PushButtonMeter = startPctg;
    // End:0x38F
    if(MyAnimNode != none)
    {
        MyAnimNode.StopAnim();
        // End:0x2C4
        if(OtherAnimNode != none)
        {
            OtherAnimNode.StopAnim();
        }
        MyAnimNode.SetPosition(startPctg * MyAnimNode.AnimSeq.SequenceLength, false);
        // End:0x38F
        if(OtherAnimNode != none)
        {
            OtherAnimNode.SetPosition(startPctg * MyAnimNode.AnimSeq.SequenceLength, false);
        }
    }
    // End:0x3DF
    if(smStruggleMode.bLocalPlayer && tuneDataAnimControl.ShowPressButtonHUD)
    {
        DisplayStruggleMessage();
    }
    //return;    
}

function DisplayStruggleMessage()
{
    smStruggleMode.GetLeadersController().DisplayStruggleMessage(true);
    //return;    
}

function GetStartPctg()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x4A
    if(tuneDataAnim.AnimStartPctg >= 0.0000000)
    {
        return tuneDataAnim.AnimStartPctg;        
    }
    else
    {
        return 0.5000000;
    }
    //return ReturnValue;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    // End:0x7C
    if(smStruggleMode.bLocalPlayer && tuneDataAnimControl.ShowPressButtonHUD)
    {
        smStruggleMode.GetLeadersController().DisplayStruggleMessage(false);
    }
    // End:0xC4
    if(AdditiveAnimIndex != -1)
    {
        smStruggleMode.PlayerPawn.StopAdditiveAnim();
    }
    // End:0x125
    if(tuneDataAnimControl.AdditiveFollowerTemplateName != 'None')
    {
        smStruggleMode.FollowerPawn.StopAdditiveAnim();
    }
    MyAnimNode = none;
    OtherAnimNode = none;
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bFinished;
    local /*0x97E50000-0x00000000*/ private float PlayBackRate, MoveDelta;

    bFinished = super.Update(DeltaTime);
    // End:0x2B
    if(bFinished)
    {
    }
    // End:0x1A6
    if((MyAnimNode != none) && MyAnimNode.AnimSeq != none)
    {
        PlayBackRate = GetPlaybackRate(PushButtonMeter);
        MoveDelta = ((PlayBackRate * MyAnimNode.AnimSeq.RateScale) * MyAnimNode.SkelComponent.GlobalAnimRateScale) * DeltaTime;
        MyAnimNode.SetPosition(MyAnimNode.CurrentTime + MoveDelta, false);
        // End:0x1A6
        if(OtherAnimNode != none)
        {
            OtherAnimNode.SetPosition(OtherAnimNode.CurrentTime + MoveDelta, false);
        }
    }
    return bFinished;
    //return ReturnValue;    
}

function GetPlaybackRate()
{
    local /*0x97E50000-0x00000000*/ private float pushMeter[8388609], ReturnValue, PlayBackRate;

    PlayBackRate = tuneDataAnimControl.FactorAnimFollowMeter * (pushMeter - (MyAnimNode.CurrentTime / MyAnimNode.AnimSeq.SequenceLength));
    PlayBackRate = FClamp(PlayBackRate, tuneDataAnimControl.MinPlayBackRate, tuneDataAnimControl.MaxPlayBackRate);
    return PlayBackRate;
    //return ReturnValue;    
}

function GetMeterValue()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return PushButtonMeter;
    //return ReturnValue;    
}

function AddValueToButtonMeter()
{
    local /*0x97E50000-0x00000000*/ private float Increment[8388609];

    PushButtonMeter += Increment;
    PushButtonMeter = FClamp(PushButtonMeter, 0.0000000, 1.0000000);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], DebugUtil, StartPos, EndPos;
    local /*0x97E50000-0x00000000*/ private float Width, Length;
    local /*0x97E50000-0x00000000*/ private @NULL LineColor, PlayerCamera, X, Y, Z, CameraPos,
	    CameraRotation;

    local /*0x97E50000-0x00000000*/ private float Red, Green;

    PlayerCamera = smStruggleMode.GetLeadersController().PlayerCamera;
    CameraPos = PlayerCamera.CameraCache.POV.Location;
    CameraRotation = PlayerCamera.CameraCache.POV.Rotation;
    GetAxes(CameraRotation, X, Y, Z);
    DebugUtil = Class'SPEngine.SPDebugUtil'.static.GetSPDebugUtil();
    Length = tuneDataAnimControl.FeedbackLength;
    StartPos = ((CameraPos + (X * tuneDataAnimControl.FeedbackOffset.X)) + (Y * tuneDataAnimControl.FeedbackOffset.Y)) - (Z * tuneDataAnimControl.FeedbackOffset.Z);
    EndPos = StartPos + (vect(0.0000000, 0.0000000, 1.0000000) * Length);
    Width = tuneDataAnimControl.FeedbackWidth;
    LineColor = MakeColor(255, 255, 255, 255);
    DebugUtil.DrawDebugCylinder(StartPos, EndPos, Width, 4, LineColor);
    EndPos = StartPos + ((vect(0.0000000, 0.0000000, 1.0000000) * PushButtonMeter) * Length);
    Red = ((PushButtonMeter > 0.5000000) ? (float(1) - ((PushButtonMeter - 0.5000000) * 2.0000000)) * 255.0000000 : 255.0000000);
    Green = ((PushButtonMeter > 0.5000000) ? 255.0000000 : (PushButtonMeter * 2.0000000) * 255.0000000);
    LineColor = MakeColor(byte(Red), byte(Green), 0, 255);
    Width = Width * 0.6000000;
    DebugUtil.DrawDebugCylinder(StartPos, EndPos, Width, 40, LineColor);
    // End:0x70C
    if((MyAnimNode != none) && MyAnimNode.AnimSeq != none)
    {
        EndPos = StartPos + (((vect(0.0000000, 0.0000000, 1.0000000) * MyAnimNode.CurrentTime) / MyAnimNode.AnimSeq.SequenceLength) * Length);
        Red = (((MyAnimNode.CurrentTime / MyAnimNode.AnimSeq.SequenceLength) > 0.5000000) ? (float(1) - (((MyAnimNode.CurrentTime / MyAnimNode.AnimSeq.SequenceLength) - 0.5000000) * 2.0000000)) * 255.0000000 : 255.0000000);
        Green = (((MyAnimNode.CurrentTime / MyAnimNode.AnimSeq.SequenceLength) > 0.5000000) ? 255.0000000 : ((MyAnimNode.CurrentTime / MyAnimNode.AnimSeq.SequenceLength) * 2.0000000) * 255.0000000);
        LineColor = MakeColor(byte(Red), byte(Green), 0, 255);
        Width = Width * 0.4000000;
        DebugUtil.DrawDebugCylinder(StartPos, EndPos, Width, 40, LineColor);
    }
    //return;    
}
