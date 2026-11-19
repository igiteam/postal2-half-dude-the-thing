class LPUnlockable extends SPSerializableDynamicDataContainer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UnlockData;

// Export ULPUnlockable::execGetUnlockData(FFrame&, void* const)
native simulated function GetUnlockData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPUnlockable::execSetUnlockName(FFrame&, void* const)
native simulated function SetUnlockName()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];


}

// Export ULPUnlockable::execGetUnlockName(FFrame&, void* const)
native simulated function GetUnlockName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];


}

// Export ULPUnlockable::execIsUnlocked(FFrame&, void* const)
native simulated function IsUnlocked()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPUnlockable::execSetUnlockStatus(FFrame&, void* const)
native simulated function SetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609];


}

// Export ULPUnlockable::execLock(FFrame&, void* const)
native simulated function Lock();

// Export ULPUnlockable::execUnlock(FFrame&, void* const)
native simulated function Unlock();

defaultproperties
{
    // Reference: LPUnlockableSerializableData'Default__LPUnlockable.LPUnlockableSerializableData_DefObj'
    begin object name=LPUnlockableSerializableData_DefObj class=Class'LPUnlockableSerializableData'
    end object
    SerializableDynamicData=LPUnlockableSerializableData_DefObj
}