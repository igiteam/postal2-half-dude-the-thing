class LPAICmd_PackHunterDefend extends LPAICmd_Defend within LPAIControllerPackHunter;

function Popped()
{
    Outer.EnableAnnounceHeadGlow(false);
    Outer.EnableAnnounceTailGlow(false);
    super.Popped();
    //return;    
}

function DisableGrenadeAssist()
{
    Outer.PHPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    //return;    
}

function EnableGrenadeAssist()
{
    Outer.PHPawn.SetCurrentlyValidTargetForGrenadeAssist();
    //return;    
}

state StateCmdActive
{
    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private byte coreHit;

        coreHit = 3;
        // End:0x1A8
        if(Outer.PHPawn != none)
        {
            AmountOfDamageReceivedDurringThisCommand += AmountOfDamage;
            // End:0x104
            if(Outer.PHPawn.MyCoreData.Length >= HitCoreIndex)
            {
                // End:0x104
                if(Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 0)
                {
                    // End:0x104
                    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                    {
                        AmountOfDamageReceivedDurringThisCommand = float(2147483647);
                    }
                }
            }
            // End:0x1A8
            if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange(TypeOfDamage == Class'LPDamageTypeGrenadeActual', Outer.PHPawn.Location))
            {
                // End:0x1A6
                if((int(coreHit) == int(1)) || int(coreHit) == int(2))
                {
                    Outer.StartAdditiveTailCoreHitAnimation(1.0000000);
                }
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        AmountOfDamageReceivedDurringThisCommand += AmountOfDamage;
        // End:0x3C
        if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
        {
            AmountOfDamageReceivedDurringThisCommand = float(2147483647);
        }
        return HandlePossibilityTookEnoughDamageToCauseBehaviorChange(TypeOfDamage == Class'LPDamageTypeGrenadeActual', Outer.PHPawn.Location);
        //return ReturnValue;        
    }
    stop;    
}
