class LPFXAction_RepairScreenMinigame extends LPFXActionBase
    abstract;

struct native StickInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float deadZoneRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeadZoned;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL currentStickPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL sweetSpotCartesian;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL sweetSpotPolar;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float sweetSpotRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float sweetSpotRumbleRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float sweetSpotRumbleStrength;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float sweetSpotLockTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStickSweetSpotToOuter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL distanceFromSweetSpot;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpinnerRotationSpeed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpinnerRotationDir;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpinnerRotation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpinnerRotationLastGood;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL debugStickPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL debugSpinnerPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float debugSpinnerRadius;

    structdefaultproperties
    {
        deadZoneRadius=0.0000000
        bDeadZoned=false
        currentStickPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        sweetSpotCartesian=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        sweetSpotPolar=none
        sweetSpotRadius=0.0000000
        sweetSpotRumbleRadius=0.0000000
        sweetSpotRumbleStrength=0.0000000
        sweetSpotLockTime=0.0000000
        bStickSweetSpotToOuter=false
        distanceFromSweetSpot=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        SpinnerRotationSpeed=0.0000000
        SpinnerRotationDir=0.0000000
        SpinnerRotation=0.0000000
        SpinnerRotationLastGood=0.0000000
        debugStickPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        debugSpinnerPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        debugSpinnerRadius=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FFWaveform;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Sticks[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RequiredTimeInLockedSweetSpot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrawRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DRAWSEGMENTS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool GlobalTurnOffHeadTracking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForeground;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PawnRepairSoundComponent[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VerticalScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VerticalScaleDelta;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float lastGoodPercent;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL FXAManager[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialMove;

// Export ULPFXAction_RepairScreenMinigame::execTick(FFrame&, void* const)
native event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPFXAction_RepairScreenMinigame::execEnd(FFrame&, void* const)
native event End();

// Export ULPFXAction_RepairScreenMinigame::execShutDown(FFrame&, void* const)
native event ShutDown();

// Export ULPFXAction_RepairScreenMinigame::execCalculateDistanceFromSweetSpot(FFrame&, void* const)
native final function CalculateDistanceFromSweetSpot()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL S[25165825];


}

// Export ULPFXAction_RepairScreenMinigame::execCalculateSpinnerSpeed(FFrame&, void* const)
native final function CalculateSpinnerSpeed()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL S[25165825];


}

function Init()
{
    super(SPFXActionBase).Init();
    FXAManager = FXActionManager();
    DrawRadius = 100.0000000;
    DRAWSEGMENTS = 16.0000000;
    //return;    
}

function Begin()
{
    local /*0x97E50000-0x00000000*/ private @NULL scaleVec;

    // End:0xC34
    if(!IsActive() || VerticalScaleDelta < 0.0000000)
    {
        Sticks[0].deadZoneRadius = 0.2000000;
        Sticks[0].bDeadZoned = false;
        Sticks[0].debugStickPos.X = DrawRadius * float(2);
        Sticks[0].debugStickPos.Y = 200.0000000;
        Sticks[0].debugSpinnerPos.X = DrawRadius * float(2);
        Sticks[0].debugSpinnerPos.Y = Sticks[0].debugStickPos.Y + (DrawRadius * float(3));
        Sticks[0].debugSpinnerRadius = DrawRadius / float(2);
        Sticks[0].sweetSpotRadius = 0.2000000;
        Sticks[0].sweetSpotRumbleRadius = 0.4000000;
        Sticks[0].bStickSweetSpotToOuter = true;
        Sticks[0].sweetSpotRumbleStrength = 0.0000000;
        Sticks[0].SpinnerRotation = 0.0000000;
        Sticks[0].SpinnerRotationSpeed = 0.0000000;
        Sticks[0].SpinnerRotationDir = 1.0000000;
        ChooseNewSweetSpot(Sticks[0]);
        Sticks[1].deadZoneRadius = 0.2000000;
        Sticks[1].bDeadZoned = false;
        Sticks[1].debugStickPos.X = (Sticks[0].debugStickPos.X + (float(4) * DrawRadius)) + float(32);
        Sticks[1].debugStickPos.Y = Sticks[0].debugStickPos.Y;
        Sticks[1].debugSpinnerPos.X = Sticks[0].debugSpinnerPos.X;
        Sticks[1].debugSpinnerPos.Y = Sticks[0].debugSpinnerPos.Y;
        Sticks[1].debugSpinnerRadius = Sticks[0].debugSpinnerRadius * 0.8000000;
        Sticks[1].sweetSpotRadius = 0.2000000;
        Sticks[1].sweetSpotRumbleRadius = 0.4000000;
        Sticks[1].sweetSpotRumbleStrength = 0.0000000;
        Sticks[1].bStickSweetSpotToOuter = true;
        Sticks[1].SpinnerRotation = 0.0000000;
        Sticks[1].SpinnerRotationSpeed = 0.0000000;
        Sticks[1].SpinnerRotationDir = -1.0000000;
        ChooseNewSweetSpot(Sticks[1]);
        RequiredTimeInLockedSweetSpot = 0.7500000;
        LPP = LPPlayerPawn(FXAManager.Owner);
        // End:0xC25
        if(LPP != none)
        {
            // End:0x6AE
            if(LPP.IsLocallyControlled())
            {
                MyController = LPPlayerController(LPP.Controller);
            }
            VerticalScale = 0.0000000;
            VerticalScaleDelta = 4.0000000;
            scaleVec = vect(1.0000000, 1.0000000, 1.0000000);
            scaleVec.Z = VerticalScale;
            SpecialMove = LPSM_PlayerRepairMinigame(LPP.GetCurrentSpecialMoveInstance());
            // End:0x756
            if(SpecialMove == none)
            {
                BeginShutdown();
                return;
            }
            LPP.EnableRepairScreenProjection('RepairWristProjector', scaleVec, false);
            // End:0x938
            if(LPP.RepairScreenProjectionMinigameMaterialInstance != none)
            {
                LPP.RepairScreenProjectionMinigameMaterialInstance.SetScalarParameterValue('IconSwitch', 0.0000000);
                LPP.RepairScreenProjectionMinigameMaterialInstance.SetScalarParameterValue('RightLockColorState', 0.0000000);
                LPP.RepairScreenProjectionMinigameMaterialInstance.SetScalarParameterValue('LeftLockColorState', 0.0000000);
                LPP.RepairScreenProjectionMinigameMaterialInstance.SetScalarParameterValue('RightLockSwitch', 0.0000000);
                LPP.RepairScreenProjectionMinigameMaterialInstance.SetScalarParameterValue('TE_BlinkSpeed', 1.0000000);
                LPP.RepairScreenProjectionMinigameMaterialInstance.SetScalarParameterValue('TE_Glow_Intensity', 3.0000000);
            }
            bForeground = false;
            // End:0x99C
            if(LPP.IsLocallyControlled())
            {
                LPP.RepairScreenProjectionComponent.SetDepthPriorityGroup(1);
            }
            GlobalTurnOffHeadTracking = false;
            // End:0xA41
            if(LPP.HeadTrackComponent != none)
            {
                GlobalTurnOffHeadTracking = LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking;
                LPP.HeadTrackComponent.m_GlobalTurnOffHeadTracking = true;
            }
            // End:0xB27
            if(PawnRepairSoundComponent == none)
            {
                PawnRepairSoundComponent = AudioComponent(LPP.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('PlayerVSRepair', 'None', LPP, LPP.Mesh, none));
                // End:0xB24
                if(PawnRepairSoundComponent != none)
                {
                    PawnRepairSoundComponent.bAutoDestroy = false;
                    PawnRepairSoundComponent.bStopWhenOwnerDestroyed = true;
                }                
            }
            else
            {
                // End:0xBAD
                if(!PawnRepairSoundComponent.IsPlaying() || PawnRepairSoundComponent.IsFadingOut())
                {
                    PawnRepairSoundComponent.Stop();
                    PawnRepairSoundComponent.Play();
                }
            }
            // End:0xC25
            if(LPP.IsLocallyControlled())
            {
                // End:0xC25
                if(!MyController.IsForceFeedbackWaveformPlaying(FFWaveform))
                {
                    MyController.ClientPlayForceFeedbackWaveform(FFWaveform);
                }
            }
        }
        lastGoodPercent = 1.0000000;
    }
    super(SPFXActionBase).Begin();
    //return;    
}

function BeginShutdown()
{
    VerticalScaleDelta = -4.0000000;
    //return;    
}

function ChooseNewSweetSpot()
{
    local /*0x97E50000-0x00000000*/ private @NULL S[25165825];
    local /*0x97E50000-0x00000000*/ private float Angle, Radius;

    Angle = (2.0000000 * 3.1415930) * FRand();
    // End:0x6A
    if(S.bStickSweetSpotToOuter)
    {
        Radius = 1.0000000 - S.sweetSpotRadius;        
    }
    else
    {
        Radius = S.deadZoneRadius + ((float(1) - ((float(2) * S.sweetSpotRadius) + S.deadZoneRadius)) * FRand());
        Radius = S.deadZoneRadius + FClamp(Radius, 0.0000000, 1.0000000 - S.deadZoneRadius);
    }
    S.sweetSpotPolar.Radius = Radius;
    S.sweetSpotPolar.Yaw = Angle;
    S.sweetSpotCartesian.X = Sin(Angle) * Radius;
    S.sweetSpotCartesian.Y = Cos(Angle) * Radius;
    //return;    
}

function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], Can;
    local /*0x97E50000-0x00000000*/ private float TY, TW, TH;

    Can = H.Canvas;
    // End:0x4A
    if((Can == none) || MyController == none)
    {
        return;
    }
    DrawAnalogStick(Can, Sticks[0], TY, TW, TH);
    DrawAnalogStick(Can, Sticks[1], TY, TW, TH);
    //return;    
}

function DebugDrawCircle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Canvas[8388609];
    local /*0x97E50000-0x00000000*/ private float X[8388609], Y, R, Segments, StartAngle;

    local /*0x97E50000-0x00000000*/ private bool bDrawStart[9437185];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float Cosine, Sine, Angle, Increment, X1, Y1,
	    X2, Y2;

    DRAWSEGMENTS
    0.0000000
    false
    Increment = (2.0000000 * 3.1415930) / Segments;
    Angle = StartAngle;
    Cosine = Cos(Angle) * R;
    Sine = Sin(Angle) * R;
    X1 = X + Cosine;
    Y1 = Y + Sine;
    // End:0x177
    if(bDrawStart)
    {
        Canvas.Draw2DLine(X1, Y1, X1 + (Cos(Angle) * (R * 1.2000000)), Y1 + (Sin(Angle) * (R * 1.2000000)), Canvas.DrawColor);
    }
    I = 1;
    J0x182:

    // End:0x2C5 [Loop If]
    if(float(I) < (Segments + float(1)))
    {
        Angle += Increment;
        Cosine = Cos(Angle) * R;
        Sine = Sin(Angle) * R;
        X2 = X + Cosine;
        Y2 = Y + Sine;
        Canvas.Draw2DLine(X1, Y1, X2, Y2, Canvas.DrawColor);
        X1 = X2;
        Y1 = Y2;
        ++I;
        // [Loop Continue]
        goto J0x182;
    }
    //return;    
}

function DrawAnalogStick()
{
    local /*0x97E50000-0x00000000*/ private @NULL Can[8388609], S;
    local /*0x97E50000-0x00000000*/ private float TY[25165825], TW, TH, AngleL, AngleR, Rot;

    local /*0x97E50000-0x00000000*/ private @NULL vecRot, vecUp, rotRot;

    Can.StrLen("O", TW, TH);
    TY = S.debugStickPos.Y + DrawRadius;
    // End:0x13AE
    if(true)
    {
        Can.SetDrawColor(255, 255, 255, 255);
        DebugDrawCircle(Can, S.debugStickPos.X, S.debugStickPos.Y, DrawRadius);
        Can.SetDrawColor(128, 128, 128, 128);
        DebugDrawCircle(Can, S.debugStickPos.X, S.debugStickPos.Y, S.deadZoneRadius * DrawRadius);
        Can.SetDrawColor(255, 255, 0, 255);
        vecUp = vect(0.0000000, 1.0000000, 0.0000000);
        vecRot.X = S.currentStickPos.X;
        vecRot.Y = S.currentStickPos.Y;
        vecRot.Z = 0.0000000;
        rotRot = Rotator(vecRot);
        vecRot = TransformVectorByRotation(rotRot, vecUp);
        vecRot *= DrawRadius;
        Can.SetDrawColor(255, 255, 255, 255);
        Can.Draw2DLine(S.debugStickPos.X, S.debugStickPos.Y, S.debugStickPos.X + vecRot.Y, S.debugStickPos.Y + vecRot.X, Can.DrawColor);
        Can.SetDrawColor(0, 255, 0, 255);
        Can.SetPos(S.debugStickPos.X - DrawRadius, TY);
        Can.DrawText(((("Sweet Angle(" @ string(S.sweetSpotPolar.Yaw)) @ "), Rad(") @ string(S.sweetSpotPolar.Radius)) @ ")");
        TY += TH;
        Can.DrawText(((("Stick Pos  (" @ string(S.currentStickPos.X)) @ ", ") @ string(S.currentStickPos.Y)) @ ")");
        TY += TH;
        // End:0xDF9
        if(S.bStickSweetSpotToOuter)
        {
            Can.SetDrawColor(0, 255, 255, 255);
            AngleL = S.sweetSpotPolar.Yaw - S.sweetSpotRadius;
            AngleR = S.sweetSpotPolar.Yaw + S.sweetSpotRadius;
            Can.Draw2DLine(S.debugStickPos.X, S.debugStickPos.Y, S.debugStickPos.X + (DrawRadius * Sin(AngleL)), S.debugStickPos.Y - (DrawRadius * Cos(AngleL)), Can.DrawColor);
            Can.Draw2DLine(S.debugStickPos.X, S.debugStickPos.Y, S.debugStickPos.X + (DrawRadius * Sin(AngleR)), S.debugStickPos.Y - (DrawRadius * Cos(AngleR)), Can.DrawColor);
            Can.SetDrawColor(0, 128, 128, 128);
            AngleL = S.sweetSpotPolar.Yaw - S.sweetSpotRumbleRadius;
            AngleR = S.sweetSpotPolar.Yaw + S.sweetSpotRumbleRadius;
            Can.Draw2DLine(S.debugStickPos.X, S.debugStickPos.Y, S.debugStickPos.X + (DrawRadius * Sin(AngleL)), S.debugStickPos.Y - (DrawRadius * Cos(AngleL)), Can.DrawColor);
            Can.Draw2DLine(S.debugStickPos.X, S.debugStickPos.Y, S.debugStickPos.X + (DrawRadius * Sin(AngleR)), S.debugStickPos.Y - (DrawRadius * Cos(AngleR)), Can.DrawColor);
            Can.SetDrawColor(0, 255, 0, 255);
            Can.SetPos(S.debugStickPos.X - DrawRadius, TY);
            Can.DrawText(("Angular Dst(" @ string(S.distanceFromSweetSpot.X)) @ ")");
            TY += TH;            
        }
        else
        {
            Can.SetDrawColor(0, 255, 255, 255);
            DebugDrawCircle(Can, S.debugStickPos.X + (S.sweetSpotCartesian.X * DrawRadius), S.debugStickPos.Y - (S.sweetSpotCartesian.Y * DrawRadius), S.sweetSpotRadius * DrawRadius);
            Can.SetDrawColor(0, 128, 128, 128);
            DebugDrawCircle(Can, S.debugStickPos.X + (S.sweetSpotCartesian.X * DrawRadius), S.debugStickPos.Y - (S.sweetSpotCartesian.Y * DrawRadius), S.sweetSpotRumbleRadius * DrawRadius);
            Can.SetDrawColor(0, 255, 0, 255);
            Can.SetPos(S.debugStickPos.X - DrawRadius, TY);
            Can.DrawText(((("Angular Dst(" @ string(S.distanceFromSweetSpot.X)) @ "), Radial(") @ string(S.distanceFromSweetSpot.Y)) @ ")");
            TY += TH;
        }
        Can.SetDrawColor(0, 255, 0, 255);
        Can.SetPos(S.debugStickPos.X - DrawRadius, TY);
        Can.DrawText(("Sweet Spot Locked(" @ string(S.sweetSpotLockTime)) @ ")");
        TY += TH;
        Rot = S.SpinnerRotation;
        Rot *= (float(2) * 3.1415930);
        Can.SetDrawColor(255, 0, 0, 255);
        DebugDrawCircle(Can, S.debugSpinnerPos.X, S.debugSpinnerPos.Y, S.debugSpinnerRadius, 5.0000000, Rot, true);
    }
    //return;    
}

defaultproperties
{
    // Reference: ForceFeedbackWaveform'Default__LPFXAction_RepairScreenMinigame.FFWave0'
    begin object name=FFWave0 class=Class'Engine.ForceFeedbackWaveform'
        bIsLooping=true
        Samples=/* Array type was not detected. */
    end object
    FFWaveform=FFWave0
    bIsTickable=true
}