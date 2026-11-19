class LPSeqCond_HasAmmoForWeapon extends SequenceCondition
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x838A0000-0x00000000*/ private class WeaponType[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array objVars;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PC, LPP, W;

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

    // End:0x1C4
    if(PC != none)
    {
        LPP = PC.GetMyPlayerPawn();
        // End:0x1C4
        if(LPP != none)
        {
            W = LPWeapon(LPP.FindInventoryType(WeaponType, true));
            // End:0x1C4
            if(W != none)
            {
                // End:0x17F
                if(LPWeaponGrenade(W) != none)
                {
                    // End:0x17C
                    if(LPWeaponGrenade(W).HasGrenades())
                    {
                        OutputLinks[0].bHasImpulse = true;
                        return;
                    }                    
                }
                else
                {
                    // End:0x1C4
                    if(W.HasAnyAmmo())
                    {
                        OutputLinks[0].bHasImpulse = true;
                        return;
                    }
                }
            }
        }
    }
    OutputLinks[1].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    OutputLinks[0]=(Links=none,LinkDesc="True",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="False",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Player",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Has Ammo For Weapon (LP)"
}