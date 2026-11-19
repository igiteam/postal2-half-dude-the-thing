class LPSmartAmmoPickupFactory extends LPCustomizablePickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

var(0.25_Pct) /*0x88DA0000-0x00000000*/ private int MinPercentageOfDifferenceToGive[65537];
var(0.25_Pct) /*0x88DA0000-0x00000000*/ private int MaxPercentageOfDifferenceToGive[65537];
var(0.25_Pct) /*0x88DA0000-0x00000000*/ private bool bGivesGrenades[65537];

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], LPP, LPW, AmmoTuneData;
    local /*0x97E50000-0x00000000*/ private int MaxAmmo, CurrentAmmo, AmmoToGive;
    local /*0x97E50000-0x00000000*/ private float AmmoDiff, AmmoPct;
    local /*0x97E50000-0x00000000*/ private bool bMultiplayer;
    local /*0x97E50000-0x00000000*/ private int Index, MaxIndex;

    super.PickedUpItem(P);
    LPP = LPPlayerPawn(P);
    // End:0x5DC
    if(LPP != none)
    {
        bMultiplayer = int(WorldInfo.NetMode) != int(NM_Standalone);
        // End:0x5DB
        foreach LPP.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0x1F0
            if(LPWeaponGrenade(LPW) != none)
            {
                // End:0x1EC
                if(bGivesGrenades)
                {
                    AmmoToGive = LPW.GetMaxAmmoForWeapon() - LPW.AmmoLeftForWeapon;
                    // End:0x1EC
                    if(AmmoToGive > 0)
                    {
                        LPW.AddAmmo(AmmoToGive);
                        LPW.AddAmmoMessage(AmmoToGive);
                        LPP.ShowGrenades(LPW.AmmoLeftForWeapon, class<LPWeaponGrenade>(LPW.Class));
                    }
                }
                continue;                
            }
            MaxIndex = ((bMultiplayer) ? LPW.TuneDataBaseWeapon.SupportedAmmoTypes.Length : 1);
            Index = 0;
            J0x249:

            // End:0x5DA [Loop If]
            if(Index < MaxIndex)
            {
                AmmoTuneData = LPTuneDataAmmoDefault(LPW.TuneDataBaseWeapon.SupportedAmmoTypes[Index]);
                // End:0x345
                if(LPW.AmmoTypeInfo.CurrentAmmoMode == Index)
                {
                    MaxAmmo = LPW.GetMaxAmmoForWeapon();
                    CurrentAmmo = LPW.AmmoLeftForWeapon;                    
                }
                else
                {
                    MaxAmmo = LPW.GetMaxAmmoForWeapon(AmmoTuneData) + ((Index == 0) ? LPW.GetAmmoPerMagazineOverride() : AmmoTuneData.AmmoPerMagazine);
                    CurrentAmmo = SPInventoryAmmoType(LPW.AmmoTypes[Index]).AmmoLeftForWeapon;
                }
                // End:0x5CC
                if((MaxAmmo > CurrentAmmo) && ((Index == 0) || CurrentAmmo > 0) || (bMultiplayer && LPP.SavedController.GetMetagameManager().IsUnlocked(AmmoTuneData.UnlockName)) && !LPW.IsPreOrderWeapon())
                {
                    AmmoDiff = float(MaxAmmo - CurrentAmmo);
                    AmmoPct = float(Rand(MaxPercentageOfDifferenceToGive - MinPercentageOfDifferenceToGive) + MinPercentageOfDifferenceToGive) * 0.0100000;
                    AmmoToGive = Max(int(AmmoPct * AmmoDiff), 1);
                    LPW.AddAmmoOfType(AmmoToGive, Index);
                    LPW.AddAmmoMessage(AmmoToGive, Index);
                }
                Index++;
                // [Loop Continue]
                goto J0x249;
            }            
        }        
    }
    //return;    
}

simulated function HasRoomForAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPW, AmmoTuneData;
    local /*0x97E50000-0x00000000*/ private int MaxAmmo, CurrentAmmo;
    local /*0x97E50000-0x00000000*/ private bool bMultiplayer;
    local /*0x97E50000-0x00000000*/ private int Index, MaxIndex;

    LPP = LPPlayerPawn(P);
    // End:0x3FE
    if((LPP != none) && int(Role) == int(ROLE_Authority))
    {
        bMultiplayer = int(WorldInfo.NetMode) != int(NM_Standalone);
        // End:0x3FD
        foreach LPP.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0xE8
            if(!bGivesGrenades && LPWeaponGrenade(LPW) != none)
            {
                continue;                
            }
            MaxIndex = ((bMultiplayer) ? LPW.TuneDataBaseWeapon.SupportedAmmoTypes.Length : 1);
            Index = 0;
            J0x141:

            // End:0x3FC [Loop If]
            if(Index < MaxIndex)
            {
                AmmoTuneData = LPTuneDataAmmoDefault(LPW.TuneDataBaseWeapon.SupportedAmmoTypes[Index]);
                // End:0x23D
                if(LPW.AmmoTypeInfo.CurrentAmmoMode == Index)
                {
                    MaxAmmo = LPW.GetMaxAmmoForWeapon();
                    CurrentAmmo = LPW.AmmoLeftForWeapon;                    
                }
                else
                {
                    MaxAmmo = LPW.GetMaxAmmoForWeapon(AmmoTuneData) + ((Index == 0) ? LPW.GetAmmoPerMagazineOverride() : AmmoTuneData.AmmoPerMagazine);
                    CurrentAmmo = SPInventoryAmmoType(LPW.AmmoTypes[Index]).AmmoLeftForWeapon;
                }
                // End:0x3EE
                if((MaxAmmo > CurrentAmmo) && ((Index == 0) || CurrentAmmo > 0) || (bMultiplayer && LPP.SavedController.GetMetagameManager().IsUnlocked(AmmoTuneData.UnlockName)) && !LPW.IsPreOrderWeapon())
                {                    
                    return true;
                }
                Index++;
                // [Loop Continue]
                goto J0x141;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], LPP;

    LPP = LPPlayerPawn(P);
    // End:0x56
    if(!HasRoomForAmmo(LPP))
    {
        LPP.ClientNotifyAmmoFull();        
    }
    else
    {
        super(LPPickupFactory).GiveTo(P);
    }
    //return;    
}

function GiveToImmediately()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    // End:0x32
    if(HasRoomForAmmo(LPPlayerPawn(P)))
    {
        super.GiveToImmediately(P);
    }
    //return;    
}

auto state Pickup
{
    simulated function ValidTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return super.ValidTouch(Other);
        //return ReturnValue;        
    }
    J0x00:
    // End:0x19 [Loop If]
    if(true)
    {
        CheckTouching();
        Sleep(0.5000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;            
}

defaultproperties
{
    MinPercentageOfDifferenceToGive=30
    MaxPercentageOfDifferenceToGive=70
    bGivesGrenades=true
    // Reference: LPLocTextSelector'Default__LPSmartAmmoPickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName
    end object
    PickupName=TxtSelectorName
    PickUpSpecialMoveClass=Class'LPSM_PlayerPickUpAmmoInfinite'
    // Reference: StaticMeshComponent'Default__LPSmartAmmoPickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPSmartAmmoPickupFactory.PSC0'
    begin object name=PSC0
    end object
    FXParticles=PSC0
    // Reference: DynamicLightEnvironmentComponent'Default__LPSmartAmmoPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPSmartAmmoPickupFactory.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=PickupLightEnvironment
    Components[6]=StaticMeshComponent0
    Components[7]=PSC0
    CollisionComponent=CollisionCylinder
}