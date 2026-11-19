class LPDAction_SpawnTEng extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0xBD370000-0x00000000*/ private class TEnergyContentClass[65537];
var(0.25_Pct) /*0xBD370000-0x00000400*/ private editfixedsize @NULL DropCount[589825];
var(0.25_Pct) /*0xBD370000-0x00000400*/ private editfixedsize @NULL EnergyMin[589825];
var(0.25_Pct) /*0xBD370000-0x00000400*/ private editfixedsize @NULL EnergyMax[589825];
var(0.25_Pct) /*0xBD370000-0x00000400*/ private editfixedsize @NULL DecayBegin[589825];
var(0.25_Pct) /*0xBD370000-0x00000400*/ private editfixedsize @NULL DecayTime[589825];
var(0.25_Pct) /*0xBD370000-0x00000000*/ private name DropParticles[65537];
var(0.25_Pct) /*0xBD370000-0x00000000*/ private float ParticleScale[65537];
var(0.25_Pct) /*0xBD370000-0x00000000*/ private int Spread[65537];
var(0.25_Pct) /*0xBD370000-0x00000000*/ private float SpreadRate[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CreatedTEng;

event Run()
{
    local /*0x97E50000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL centerLoc, Loc, Extent, NewPickup;
    local /*0x97E50000-0x00000000*/ private int Min, Max, Idx;
    local /*0x97E50000-0x00000000*/ private class TEClass, DroppedTEngClass;
    local /*0x97E50000-0x00000000*/ private @NULL PC, Norm;
    local /*0x97E50000-0x00000000*/ private float Dist;
    local /*0x97E50000-0x00000000*/ private @NULL FactoryOwner;

    // End:0x25
    if(TEnergyContentClass != none)
    {
        TEClass = TEnergyContentClass;        
    }
    else
    {
        PC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
        // End:0xA4
        if(PC != none)
        {
            TEClass = PC.ThermalEnergyClass;
        }
    }
    // End:0xE4
    if(TEClass != none)
    {
        DroppedTEngClass = class<LPThermalEnergyPickup>(TEClass.default.DroppedPickupClass);
    }
    // End:0xF6
    if(DroppedTEngClass == none)
    {
        return 1;
    }
    FactoryOwner = Actor;
    J0x109:

    // End:0x169 [Loop If]
    if((FactoryOwner != none) && FactoryOwner.SpawnedFromActorFactory == none)
    {
        FactoryOwner = FactoryOwner.Owner;
        // [Loop Continue]
        goto J0x109;
    }
    centerLoc = Actor.Location;
    centerLoc += vect(0.0000000, 0.0000000, 10.0000000);
    Extent = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x26A
    if(Class'SPEngine.SPUtil'.static.DistanceToGround(centerLoc, Extent, Norm, Dist))
    {
        centerLoc.Z -= Dist;
        centerLoc.Z += TEClass.default.DroppedPickUpClassCylinderHeight;
    }
    Idx = CurrentIndex;
    J0x27D:

    // End:0x7C2 [Loop If]
    if(float(Idx) < DropCount.GetValue())
    {
        Loc.X = centerLoc.X + ((FRand() - 0.5000000) * float(Spread));
        Loc.Y = centerLoc.Y + ((FRand() - 0.5000000) * float(Spread));
        Loc.Z = centerLoc.Z;
        NewPickup = Actor.Spawn(DroppedTEngClass, Actor,, Loc,,, true);
        // End:0x3E2
        if(NewPickup == none)
        {            
        }
        else
        {
            NewPickup.SetPhysics(2);
            NewPickup.InventoryClass = TEClass;
            NewPickup.Instigator = Pawn(Actor);
            NewPickup.ParticleScale = ParticleScale;
            Min = int(EnergyMin.GetValue());
            Max = int(EnergyMax.GetValue());
            // End:0x52E
            if(Max < Min)
            {
                NewPickup.EnergyCount = int(RandRange(float(Max), float(Min)));                
            }
            else
            {
                NewPickup.EnergyCount = int(RandRange(float(Min), float(Max)));
            }
            NewPickup.DecayBegin = DecayBegin.GetValue();
            NewPickup.DecaySpeed = DecayTime.GetValue();
            NewPickup.LifeSpan = NewPickup.DecayBegin + NewPickup.DecaySpeed;
            NewPickup.SetCustomParticles(DropParticles);
            NewPickup.SpreadRate = SpreadRate;
            NewPickup.bKillDuringLevelTransition = true;
            // End:0x6F3
            if(FactoryOwner != none)
            {
                FactoryOwner.AddToActorFactorySpawnedList(NewPickup);                
            }
            else
            {
                // End:0x785
                if(NewPickup.LifeSpan == float(0))
                {
                    NewPickup.DecaySpeed = 10.0000000;
                    NewPickup.DecayBegin = 20.0000000;
                    NewPickup.LifeSpan = 30.0000000;
                }
            }
            CreatedTEng.AddItem(NewPickup);            
            CurrentIndex = Idx + 1;
            return 0;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x27D;
    }
    CurrentIndex = 0;
    CreatedTEng.Length = 0;
    return 1;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPFloatDifficulty'Default__LPDAction_SpawnTEng.DropCountObj'
    begin object name=DropCountObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DropCount=DropCountObj
    // Reference: SPFloatDifficulty'Default__LPDAction_SpawnTEng.EnergyMinObj'
    begin object name=EnergyMinObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EnergyMin=EnergyMinObj
    // Reference: SPFloatDifficulty'Default__LPDAction_SpawnTEng.EnergyMaxObj'
    begin object name=EnergyMaxObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    EnergyMax=EnergyMaxObj
    // Reference: SPFloatDifficulty'Default__LPDAction_SpawnTEng.DecayBeginObj'
    begin object name=DecayBeginObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=20.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DecayBegin=DecayBeginObj
    // Reference: SPFloatDifficulty'Default__LPDAction_SpawnTEng.DecayTimeObj'
    begin object name=DecayTimeObj class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    DecayTime=DecayTimeObj
    DropParticles="TEnergyDropMedium"
    ParticleScale=1.0000000
    Spread=100
    SpreadRate=2.0000000
}