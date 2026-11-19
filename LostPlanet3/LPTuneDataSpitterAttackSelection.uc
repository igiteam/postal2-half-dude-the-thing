class LPTuneDataSpitterAttackSelection extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x8A160000-0x00000000*/ private editfixedsize @NULL AttackSelection_PlayerOnFoot[65537];
var(0.25_Pct) /*0x8A160000-0x00000000*/ private editfixedsize @NULL AttackSelection_UtilityRig[65537];

defaultproperties
{
    AttackSelection_PlayerOnFoot=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASPOF_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASPOF_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASPOF_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASPOF_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_Probablility_Spit_DefaultObject'
    begin object name=ASPOF_Probablility_Spit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_Spit=ASPOF_Probablility_Spit_DefaultObject,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_Probablility_TailSting_DefaultObject'
    begin object name=ASPOF_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASPOF_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASPOF_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASPOF_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_Probablility_TalonAttack_DefaultObject'
    begin object name=ASPOF_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASPOF_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASPOF_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASPOF_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=none,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TauntDuration_DefaultObject'
    begin object name=ASPOF_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASPOF_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASPOF_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASPOF_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASPOF_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASPOF_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TimeBetweenHunkerAndSpit_DefaultObject'
    begin object name=ASPOF_TimeBetweenHunkerAndSpit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSpit=ASPOF_TimeBetweenHunkerAndSpit_DefaultObject,TimeBetweenHunkerAndSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASPOF_TimeBetweenHunkerAndSting_DefaultObject'
    begin object name=ASPOF_TimeBetweenHunkerAndSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenHunkerAndSting=ASPOF_TimeBetweenHunkerAndSting_DefaultObject)
    AttackSelection_UtilityRig=(TimeBetweenAttack_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_TimeBetweenAttack_Min_DefaultObject'
    begin object name=ASVS_TimeBetweenAttack_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=2.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Min=ASVS_TimeBetweenAttack_Min_DefaultObject,TimeBetweenAttack_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_TimeBetweenAttack_Max_DefaultObject'
    begin object name=ASVS_TimeBetweenAttack_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=3.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenAttack_Max=ASVS_TimeBetweenAttack_Max_DefaultObject,Probablility_Spit=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_Probablility_Spit_DefaultObject'
    begin object name=ASVS_Probablility_Spit_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=50.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_Spit=ASVS_Probablility_Spit_DefaultObject,Probablility_TailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_Probablility_TailSting_DefaultObject'
    begin object name=ASVS_Probablility_TailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TailSting=ASVS_Probablility_TailSting_DefaultObject,Probablility_QuickTailSting=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_Probablility_QuickTailSting_DefaultObject'
    begin object name=ASVS_Probablility_QuickTailSting_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=25.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTailSting=ASVS_Probablility_QuickTailSting_DefaultObject,Probablility_TalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_Probablility_TalonAttack_DefaultObject'
    begin object name=ASVS_Probablility_TalonAttack_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_TalonAttack=ASVS_Probablility_TalonAttack_DefaultObject,Probablility_QuickTalonAttack=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_Probablility_TalonAttackQuick_DefaultObject'
    begin object name=ASVS_Probablility_TalonAttackQuick_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    Probablility_QuickTalonAttack=ASVS_Probablility_TalonAttackQuick_DefaultObject,Probablility_ChargeAttack=none,bEnableTaunt=false,TauntDuration=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_TauntDuration_DefaultObject'
    begin object name=ASVS_TauntDuration_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=1.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TauntDuration=ASVS_TauntDuration_DefaultObject,TimeBetweenTaunt_Min=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_TimeBetweenTaunt_Min_DefaultObject'
    begin object name=ASVS_TimeBetweenTaunt_Min_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=10.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Min=ASVS_TimeBetweenTaunt_Min_DefaultObject,TimeBetweenTaunt_Max=// Reference: SPFloatDifficulty'Default__LPTuneDataSpitterAttackSelection.ASVS_TimeBetweenTaunt_Max_DefaultObject'
    begin object name=ASVS_TimeBetweenTaunt_Max_DefaultObject class=Class'SPEngine.SPFloatDifficulty'
        baseValue=15.0000000
        overrideByScale=(easy=(MP_CrossPlatformScale=1.0000000),Normal=(MP_CrossPlatformScale=1.0000000),hard=(MP_CrossPlatformScale=1.0000000))
    end object
    TimeBetweenTaunt_Max=ASVS_TimeBetweenTaunt_Max_DefaultObject,TimeBetweenHunkerAndSpit=none,TimeBetweenHunkerAndSting=none)
}