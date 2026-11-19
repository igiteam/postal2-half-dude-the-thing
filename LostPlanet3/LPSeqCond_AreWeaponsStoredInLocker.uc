class LPSeqCond_AreWeaponsStoredInLocker extends SequenceCondition
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array objVars;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private int weaponCount, GrenadeCount;

    GetObjectVars(objVars, "Player");
    Idx = 0;
    J0x26:

    // End:0x84 [Loop If]
    if(Idx < objVars.Length)
    {
        PC = LPPlayerController(objVars[Idx]);
        // End:0x76
        if(PC != none)
        {
            // [Explicit Break]
            goto J0x84;
        }
        Idx++;
        // [Loop Continue]
        goto J0x26;
    }
    J0x84:

    // End:0x134
    if(PC != none)
    {
        Idx = 0;
        J0x9E:

        // End:0x134 [Loop If]
        if(Idx < PC.StoredWeaponsList.Length)
        {
            // End:0x11B
            if(PC.StoredWeaponsList[Idx].bCanEquip == true)
            {
                weaponCount++;                
            }
            else
            {
                GrenadeCount++;
            }
            Idx++;
            // [Loop Continue]
            goto J0x9E;
        }
    }
    // End:0x17A
    if((weaponCount >= 4) || GrenadeCount >= 2)
    {
        OutputLinks[0].bHasImpulse = true;        
    }
    else
    {
        OutputLinks[1].bHasImpulse = true;
    }
    //return;    
}

defaultproperties
{
    OutputLinks[0]=(Links=none,LinkDesc="True",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="False",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Player",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Are Weapons Stored In Locker (LP)"
}