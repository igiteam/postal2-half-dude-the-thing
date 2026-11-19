class LPDamageReactionManagerDefenderHive extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDefenderHivePawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceGetStunned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceHitReaction;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceThreshold;

    super.InitWithPawn(inPawn);
    MyDefenderHivePawn = LPAIPawnDefenderHive(inPawn);
    DistanceThreshold = MyDefenderHivePawn.TuneDataDefenderHive.DistanceGrenadeStunned.GetValue();
    SqDistanceGetStunned = DistanceThreshold * DistanceThreshold;
    DistanceThreshold = MyDefenderHivePawn.TuneDataDefenderHive.DistanceGrenadeReaction.GetValue();
    SqDistanceHitReaction = DistanceThreshold * DistanceThreshold;
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x89
    if(class<LPDamageTypeBallistic>(MyDefenderHivePawn.TakeDamageParams.DamageType) != none)
    {
        MyDefenderHivePawn.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FacingDir, DeltaToDamager, grenWep, theBoom;

    // End:0x148
    if(bIsVSMeleeDamage)
    {
        // End:0x145
        if(CoreTag != none)
        {
            // End:0x143
            if(CoreTag.GetCoreId() == 4)
            {
                FacingDir = Vector(MyAkridPawn.Rotation);
                FacingDir.Z = 0.0000000;
                DeltaToDamager = MyAkridPawn.TakeDamageParams.DamageCauser.Location - MyAkridPawn.Location;
                DeltaToDamager.Z = 0.0000000;
                // End:0x140
                if((FacingDir Dot DeltaToDamager) > 0.0000000)
                {
                    return false;
                }                
            }
            else
            {
                return false;
            }
        }        
    }
    else
    {
        // End:0x244
        if(CoreTag != none)
        {
            // End:0x244
            if(CoreTag.GetCoreId() == 7)
            {
                theBoom = LPExplosionActor(MyAkridPawn.TakeDamageParams.DamageCauser);
                // End:0x244
                if(theBoom != none)
                {
                    grenWep = LPProj_Grenade(theBoom.TheWeaponThatSpawnedMe);
                    // End:0x244
                    if(grenWep != none)
                    {
                        // End:0x242
                        if(MyDefenderHivePawn.DoesAkridHaveThisGrenadeStuckToThisCore(7, grenWep))
                        {
                            return true;                            
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }
    }
    return super(LPDamageReactionManagerAI).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function SetDefaultDamageReaction()
{
    // End:0x26
    if(MyDefenderHivePawn.Health <= 0)
    {
        return;
    }
    // End:0x53
    if(HitCoreIndex >= 0)
    {
        SetAIReactionDelegate(DHD_CoreHitReaction);        
    }
    else
    {
        SetAIReactionDelegate(DHD_NonCoreHitReaction);
    }
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x71
    if(LPC != none)
    {
        LPC.NotifyOfCoreHit(HitCoreIndex, PotentialDamage, MyDefenderHivePawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x68
    if(LPC != none)
    {
        LPC.NotifyOfNonCoreHit(PotentialDamage, MyDefenderHivePawn.TakeDamageParams.DamageType);
    }
    //return;    
}
