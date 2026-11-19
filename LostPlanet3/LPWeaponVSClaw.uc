class LPWeaponVSClaw extends LPVSInventoryParts
    hidecategories(AnimDependency,Navigation);

function InitFromPlayerControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x85
    if(vsPlayerPawn != none)
    {
        super.InitFromPlayerControlledVs();
        BlendPerBoneAnimNode = vsPlayerPawn.RightArmClawBlendPerBone;
        PartSlotNodeInfo = vsPlayerPawn.RightArmClawAnimInfo;
    }
    //return;    
}

simulated state PrimaryAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(Actor).Tick(DeltaTime);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

state AlternateAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super.Tick(DeltaTime);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSClaw.WeaponMesh'
    begin object name=WeaponMesh
    end object
    WeaponMeshComp=WeaponMesh
    AimOriginSocket="CameraSocket"
    // Reference: SPTuneDataEventDefSoundBase'Default__LPWeaponVSClaw.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
        PlaybackDistanceOverride=(OverrideType=SPFloatScaleOverrideType.SPFSDOverride_ByValue,OverrideValue=100000000000000000.0000000)
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    CCDControlName="CCDControl_DrillArm"
}