class LPAmmoPickupActor extends LPSkeletalMeshActor
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x7B780000-0x00000000*/ private int MinPercentageOfDifferenceToGive[65537];
var(0.25_Pct) /*0x7B780000-0x00000000*/ private int MaxPercentageOfDifferenceToGive[65537];
var(0.25_Pct) /*0x7B780000-0x00000000*/ private bool bGivesGrenades[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PickupActorName;

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPW;

    local /*0x97E50000-0x00000000*/ private bool bCanPickUp;
    local /*0x97E50000-0x00000000*/ private int MaxAmmoForWeapon, MaxAmmo, CurrentAmmo;

    LPP = LPPlayerPawn(Other);
    // End:0x2CC
    if((LPP != none) && int(Role) == int(ROLE_Authority))
    {
        // End:0xC6
        if(!FastTrace(LPP.Location, Location + vect(0.0000000, 0.0000000, 16.0000000)) && !FastTrace(LPP.GetPawnViewLocation(), Location + vect(0.0000000, 0.0000000, 16.0000000)))
        {
            return;
        }
        // End:0x294
        foreach LPP.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            MaxAmmoForWeapon = LPW.GetMaxAmmoForWeapon();
            // End:0x14D
            if(MaxAmmoForWeapon < 0)
            {
                continue;                
            }
            // End:0x1C2
            if(LPW.AmmoTypeInfo.CurrentAmmoMode == 0)
            {
                MaxAmmo = MaxAmmoForWeapon;
                CurrentAmmo = LPW.AmmoLeftForWeapon;                
            }
            else
            {
                MaxAmmo = LPW.GetMaxAmmoForWeapon(LPW.TuneDataBaseWeapon.SupportedAmmoTypes[0]);
                CurrentAmmo = SPInventoryAmmoType(LPW.AmmoTypes[0]).AmmoLeftForWeapon;
            }
            // End:0x284
            if(MaxAmmo == CurrentAmmo)
            {
                continue;                
            }
            bCanPickUp = true;
            // End:0x294
            break;            
        }        
        // End:0x2CC
        if(bCanPickUp)
        {
            LPP.ClientNotifyProximityToInteractivePickup(none, self, PickupActorName);
        }
    }
    //return;    
}

function PickupAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], LPW;
    local /*0x97E50000-0x00000000*/ private int MaxAmmo, CurrentAmmo, AmmoToGive;
    local /*0x97E50000-0x00000000*/ private float AmmoDiff, AmmoPct;
    local /*0x97E50000-0x00000000*/ private int MaxAmmoForWeapon;

    // End:0x35D
    if(LPP != none)
    {
        // End:0x352
        foreach LPP.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            MaxAmmoForWeapon = LPW.GetMaxAmmoForWeapon();
            // End:0x96
            if(MaxAmmoForWeapon < 0)
            {
                continue;                
            }
            // End:0x152
            if(LPWeaponGrenade(LPW) != none)
            {
                // End:0x14E
                if(bGivesGrenades)
                {
                    AmmoToGive = MaxAmmoForWeapon - LPW.AmmoLeftForWeapon;
                    // End:0x14E
                    if(AmmoToGive > 0)
                    {
                        LPW.AddAmmo(AmmoToGive);
                        LPW.AddAmmoMessage(AmmoToGive);
                    }
                }
                continue;                
            }
            // End:0x1C7
            if(LPW.AmmoTypeInfo.CurrentAmmoMode == 0)
            {
                MaxAmmo = MaxAmmoForWeapon;
                CurrentAmmo = LPW.AmmoLeftForWeapon;                
            }
            else
            {
                MaxAmmo = LPW.GetMaxAmmoForWeapon(LPW.TuneDataBaseWeapon.SupportedAmmoTypes[0]);
                CurrentAmmo = SPInventoryAmmoType(LPW.AmmoTypes[0]).AmmoLeftForWeapon;
            }
            // End:0x289
            if(MaxAmmo == CurrentAmmo)
            {
                continue;                
            }
            AmmoDiff = float(MaxAmmo - CurrentAmmo);
            AmmoPct = float(Rand(MaxPercentageOfDifferenceToGive - MinPercentageOfDifferenceToGive) + MinPercentageOfDifferenceToGive) * 0.0100000;
            AmmoToGive = Max(int(AmmoPct * AmmoDiff), 1);
            LPW.AddAmmo(AmmoToGive);
            LPW.AddAmmoMessage(AmmoToGive);            
        }        
        DisableAmmoPickup();
    }
    //return;    
}

function DisableAmmoPickup()
{
    SetHidden(true);
    SetCollision(false, false);
    CollisionComponent.SetBlockRigidBody(false);
    CollisionComponent.SetTraceBlocking(false, false);
    SkeletalMeshComponent.SetBlockRigidBody(false);
    SkeletalMeshComponent.SetTraceBlocking(false, false);
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bHidden = bHidden;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    // End:0x2A
    if(Record.bHidden)
    {
        DisableAmmoPickup();
    }
    //return;    
}

defaultproperties
{
    MinPercentageOfDifferenceToGive=30
    MaxPercentageOfDifferenceToGive=70
    bGivesGrenades=true
    PickupActorName="AMMO"
    // Reference: SPHeadTrackComponent'Default__LPAmmoPickupActor.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPAmmoPickupActor.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAmmoPickupActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPAmmoPickupActor.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: CylinderComponent'Default__LPAmmoPickupActor.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    Components[4]=CollisionCylinder0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_TouchAllButWeapons
    bNoDelete=false
    bGameRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
    CollisionComponent=CollisionCylinder0
}