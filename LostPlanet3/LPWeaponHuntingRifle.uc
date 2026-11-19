class LPWeaponHuntingRifle extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

// Export ULPWeaponHuntingRifle::execActorCanBePierced(FFrame&, void* const)
native function ActorCanBePierced()
{
    local /*0x97E50000-0x00000000*/ private class CheckClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ClassesToCheckAgainst[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function InstantFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIPawn, StartTrace, EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL RealImpact, AdjustedAimDir;

    SPIPawn = SPInventoryPawn(Instigator);
    // End:0x58C
    if((int(WorldInfo.NetMode) != int(NM_Client)) || (bClientSideInstantHit && Instigator != none) && Instigator.IsLocallyControlled())
    {
        // End:0x22B
        if(((SPIPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.IsBasedOn(SPIPawn))
        {
            SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.SetTraceBlocking(false, SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.BlockNonZeroExtent);
        }
        StartTrace = Instigator.GetWeaponStartTraceLocation();
        AdjustedAimDir = Vector(GetAdjustedAim(StartTrace));
        EndTrace = StartTrace + (AdjustedAimDir * (GetTraceRange()));
        RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
        // End:0x366
        if(((int(Role) == int(ROLE_Authority)) || bClientSideInstantHit) && (int(WorldInfo.NetMode) != int(NM_Standalone)) || RealImpact.HitActor == none)
        {
            SetFlashLocation(RealImpact.HitLocation);
        }
        // End:0x3E7
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            Idx = 0;
            J0x39A:

            // End:0x3E7 [Loop If]
            if(Idx < ImpactList.Length)
            {
                ProcessInstantHit(CurrentFireMode, ImpactList[Idx]);
                Idx++;
                // [Loop Continue]
                goto J0x39A;
            }
        }
        // End:0x589
        if(((SPIPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn != none) && SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.IsBasedOn(SPIPawn))
        {
            SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.SetTraceBlocking(true, SPIPawn.SpecialMoveState.CurSMInfo.InteractionPawn.Mesh.BlockNonZeroExtent);
        }        
    }
    else
    {
        // End:0x5D4
        if((Instigator != none) && Instigator.IsLocallyControlled())
        {
            WeaponFired(CurrentFireMode);
        }
    }
    //return;    
}

simulated function CalcWeaponFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace[8388609], EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList[26214401];
    local /*0x97E50000-0x00000000*/ private @NULL Extent[9437185], ReturnValue, HitLocation, HitNormal, Dir, HitActor,
	    HitInfo, CurrentImpact, Portal;

    local /*0x97E50000-0x00000000*/ private float HitDist;
    local /*0x97E50000-0x00000000*/ private int HitNum, LastHitNum;

    HitNum = 0;
    LastHitNum = 0;
    CurrentImpact.HitActor = none;
    // End:0x58C
    foreach GetTraceOwner().TraceActors(Class'Engine.Actor', HitActor, HitLocation, HitNormal, EndTrace, StartTrace, Extent, HitInfo, 1)
    {
        CurrentImpact.HitActor = HitActor;
        CurrentImpact.HitLocation = HitLocation;
        CurrentImpact.HitNormal = HitNormal;
        CurrentImpact.RayDir = Normal(EndTrace - StartTrace);
        CurrentImpact.StartTrace = StartTrace;
        CurrentImpact.HitInfo = HitInfo;
        ImpactList[ImpactList.Length] = CurrentImpact;
        // End:0x56D
        if(HitActor != none)
        {
            // End:0x2F5
            if(!PassThroughDamage(HitActor))
            {
                // End:0x205
                if(int(WorldInfo.NetMode) != int(NM_Standalone))
                {                    
                    return CurrentImpact;
                }
                // End:0x2E7
                if(!ActorCanBePierced(HitActor.Class, LPTuneDataAmmoPiercing(TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode]).ActorsAllowedToPierce))
                {
                    ProcessInstantHit(CurrentFireMode, CurrentImpact, HitNum + 1);
                    SetFlashLocation(CurrentImpact.HitLocation);                    
                    return CurrentImpact;                    
                }
                else
                {
                    HitNum++;
                }                
            }
            else
            {
                Portal = PortalTeleporter(HitActor);
                // End:0x43D
                if((Portal != none) && Portal.SisterPortal != none)
                {
                    Dir = EndTrace - StartTrace;
                    HitDist = VSize(HitLocation - StartTrace);
                    StartTrace = Portal.TransformHitLocation(HitLocation);
                    EndTrace = StartTrace + Portal.TransformVectorDir(Normal(Dir) * (VSize(Dir) - HitDist));                    
                    return CalcWeaponFire(StartTrace, EndTrace, ImpactList, Extent);
                }
            }
            // End:0x56D
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                // End:0x550
                if(HitNum > LastHitNum)
                {
                    ProcessInstantHit(CurrentFireMode, CurrentImpact, HitNum);
                    // End:0x53A
                    if(HitNum == LPTuneDataAmmoPiercing(TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode]).MaxNumberToPierce)
                    {
                        SetFlashLocation(CurrentImpact.HitLocation);                        
                        return CurrentImpact;
                    }
                    LastHitNum = HitNum;                    
                }
                else
                {
                    ProcessInstantHit(CurrentFireMode, CurrentImpact, 1);
                }
            }
        }
        CurrentImpact.HitActor = none;        
    }    
    CurrentImpact.HitLocation = EndTrace;
    return CurrentImpact;
    //return ReturnValue;    
}

simulated function GetDamageModifier()
{
    local /*0x97E50000-0x00000000*/ private int HitNum[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MultipliedDamage;

    1
    MultipliedDamage = super(SPInventoryWeapon).GetDamageModifier();
    // End:0x5E
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) || HitNum == 1)
    {
        return MultipliedDamage;
    }
    return MultipliedDamage * (LPTuneDataAmmoPiercing(TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode]).DamagePercentAfterFirstHit * 0.0100000);
    //return ReturnValue;    
}

simulated function CalcRemoteImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GivenHitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    AbortWeaponReload(true);
    super(SPInventoryWeapon).CalcRemoteImpactEffects(FireModeNum, GivenHitLocation, bViaReplication);
    //return;    
}

defaultproperties
{
    bAllowTracers=true
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponHuntingRifle.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponHuntingRifle.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="huntingRifle"
    HUDReticleName="huntingRifle"
    HUDReticleName_SecondaryAmmomode="huntingRifle"
    FriendlyName="Hunting Rifle"
    Description="A single shot bolt-action rifle with high accuracy and damage."
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponHuntingRifle.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Hunting Rifle Rounds"
    // Reference: StaticMeshComponent'Default__LPWeaponHuntingRifle.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}