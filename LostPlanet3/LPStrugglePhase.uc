class LPStrugglePhase extends Object
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL smStruggleMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTakenDamage;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StartSm()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];

    smStruggleMode = inSMStruggleMode;
    //return;    
}

function StopSM()
{
    smStruggleMode = none;
    //return;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    smStruggleMode.AddWinPoints(TuneData.WinPoints);
    bTakenDamage = false;
    TurnPhysAssetCollisionOffForThisPhaseOnFollower();
    TurnPhysAssetCollisionOffForThisPhaseOnLeader();
    // End:0x124
    if(TuneData.bLockPlayerPitchControllerForPhase)
    {
        smStruggleMode.PlayerPawn.SetPitchControllerTarget(TuneData.PitchToLockPlayerControllerToForPhase, TuneData.BlendTimeToLockPitch);
        smStruggleMode.PlayerPawn.SetPitchControllerLock(true);
    }
    //return;    
}

function TurnPhysAssetCollisionOffForThisPhaseOnFollower()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    // End:0x2B3
    if(TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower.Length > 0)
    {
        I = 0;
        J0x30:

        // End:0x2B3 [Loop If]
        if(I < smStruggleMode.FollowerPawn.Mesh.PhysicsAsset.BodySetup.Length)
        {
            J = 0;
            J0xA7:

            // End:0x2A5 [Loop If]
            if(J < TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower.Length)
            {
                // End:0x297
                if(smStruggleMode.FollowerPawn.Mesh.BoneIsChildOf(smStruggleMode.FollowerPawn.Mesh.PhysicsAsset.BodySetup[I].BoneName, TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower[J]))
                {
                    Body = smStruggleMode.FollowerPawn.Mesh.PhysicsAssetInstance.Bodies[I];
                    Body.SetBlockRigidBody(false);
                    Body.bBlockNonZeroExtent = false;
                    Body.bBlockZeroExtent = false;
                }
                ++J;
                // [Loop Continue]
                goto J0xA7;
            }
            I++;
            // [Loop Continue]
            goto J0x30;
        }
    }
    //return;    
}

function TurnPhysAssetCollisionOnForThisPhaseOnFollower()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    // End:0x2B3
    if(TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower.Length > 0)
    {
        I = 0;
        J0x30:

        // End:0x2B3 [Loop If]
        if(I < smStruggleMode.FollowerPawn.Mesh.PhysicsAsset.BodySetup.Length)
        {
            J = 0;
            J0xA7:

            // End:0x2A5 [Loop If]
            if(J < TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower.Length)
            {
                // End:0x297
                if(smStruggleMode.FollowerPawn.Mesh.BoneIsChildOf(smStruggleMode.FollowerPawn.Mesh.PhysicsAsset.BodySetup[I].BoneName, TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnFollower[J]))
                {
                    Body = smStruggleMode.FollowerPawn.Mesh.PhysicsAssetInstance.Bodies[I];
                    Body.SetBlockRigidBody(true);
                    Body.bBlockNonZeroExtent = true;
                    Body.bBlockZeroExtent = true;
                }
                ++J;
                // [Loop Continue]
                goto J0xA7;
            }
            I++;
            // [Loop Continue]
            goto J0x30;
        }
    }
    //return;    
}

function TurnPhysAssetCollisionOffForThisPhaseOnLeader()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    // End:0x2B3
    if(TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader.Length > 0)
    {
        I = 0;
        J0x30:

        // End:0x2B3 [Loop If]
        if(I < smStruggleMode.PlayerPawn.Mesh.PhysicsAsset.BodySetup.Length)
        {
            J = 0;
            J0xA7:

            // End:0x2A5 [Loop If]
            if(J < TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader.Length)
            {
                // End:0x297
                if(smStruggleMode.PlayerPawn.Mesh.BoneIsChildOf(smStruggleMode.PlayerPawn.Mesh.PhysicsAsset.BodySetup[I].BoneName, TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader[J]))
                {
                    Body = smStruggleMode.PlayerPawn.Mesh.PhysicsAssetInstance.Bodies[I];
                    Body.SetBlockRigidBody(false);
                    Body.bBlockNonZeroExtent = false;
                    Body.bBlockZeroExtent = false;
                }
                ++J;
                // [Loop Continue]
                goto J0xA7;
            }
            I++;
            // [Loop Continue]
            goto J0x30;
        }
    }
    //return;    
}

function TurnPhysAssetCollisionOnForThisPhaseOnLeader()
{
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    // End:0x2B3
    if(TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader.Length > 0)
    {
        I = 0;
        J0x30:

        // End:0x2B3 [Loop If]
        if(I < smStruggleMode.PlayerPawn.Mesh.PhysicsAsset.BodySetup.Length)
        {
            J = 0;
            J0xA7:

            // End:0x2A5 [Loop If]
            if(J < TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader.Length)
            {
                // End:0x297
                if(smStruggleMode.PlayerPawn.Mesh.BoneIsChildOf(smStruggleMode.PlayerPawn.Mesh.PhysicsAsset.BodySetup[I].BoneName, TuneData.BoneNamesOfPhysAssetsToTurnOffForThisPhaseOnLeader[J]))
                {
                    Body = smStruggleMode.PlayerPawn.Mesh.PhysicsAssetInstance.Bodies[I];
                    Body.SetBlockRigidBody(true);
                    Body.bBlockNonZeroExtent = true;
                    Body.bBlockZeroExtent = true;
                }
                ++J;
                // [Loop Continue]
                goto J0xA7;
            }
            I++;
            // [Loop Continue]
            goto J0x30;
        }
    }
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    StruggleTakeDamage();
    TurnPhysAssetCollisionOnForThisPhaseOnFollower();
    TurnPhysAssetCollisionOnForThisPhaseOnLeader();
    // End:0x75
    if(TuneData.bLockPlayerPitchControllerForPhase)
    {
        smStruggleMode.PlayerPawn.SetPitchControllerLock(false);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x48
    if(TuneData.PlayWinPhaseDirectly && smStruggleMode.CheckWinning())
    {
        return true;
    }
    // End:0x92
    if((TuneData.DamagePoints <= 0) && smStruggleMode.bFailed)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

function StruggleTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagePawn;
    local /*0x97E50000-0x00000000*/ private float DamageToApply;

    // End:0x274
    if((TuneData.DamagePoints > 0) && !bTakenDamage)
    {
        DamagePawn = smStruggleMode.GetDamagePawn();
        // End:0x247
        if(DamagePawn != none)
        {
            DamageToApply = float(TuneData.DamagePoints);
            // End:0x109
            if(ClassIsChildOf(DamagePawn.Class, Class'LPBasePlayerPawn'))
            {
                DamageToApply *= LPBasePlayerPawn(DamagePawn).StruggleSettings.DamageFactorPlayer;
            }
            // End:0x18A
            if(!TuneData.bAllowPlayerToDie && DamageToApply > float(DamagePawn.Health))
            {
                DamageToApply = float(DamagePawn.Health - 1);
            }
            DamagePawn.TakeDamage(int(DamageToApply), smStruggleMode.FollowerPawn.Controller, smStruggleMode.FollowerPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), smStruggleMode.ApplyDamageClass,, none);
        }
        bTakenDamage = true;
        smStruggleMode.bDamaged = true;
    }
    //return;    
}

function StruggleStabAttempt()
{
    //return;    
}

function StruggleButton()
{
    //return;    
}

function StruggleDodge()
{
    local /*0x97E50000-0x00000000*/ private byte DodgeDir[8388609];

    //return;    
}

function StruggleVsBlockAttempt()
{
    //return;    
}

function StrugglePlayCameraAnim()
{
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    //return;    
}

function GetTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

function GetTimeSince()
{
    local /*0x97E50000-0x00000000*/ private float InTimeStamp[8388609], ReturnValue;

    return smStruggleMode.PlayerPawn.WorldInfo.TimeSeconds - InTimeStamp;
    //return ReturnValue;    
}
