class LPSeqAct_HUDDisplay extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0xAD260000-0x00000000*/ private bool bEnableCrosshair[65537];
var(0.25_Pct) /*0xAD260000-0x00000000*/ private bool bForceCrosshair[65537];
var(0.25_Pct) /*0x4A8D0000-0x00000000*/ private bool bEnableDPadCluster[65537];
var(0.25_Pct) /*0x4A8D0000-0x00000000*/ private bool bForceDPADCluster[65537];
var(0.25_Pct) /*0xA8A20000-0x00000000*/ private bool bEnableRadar[65537];
var(0.25_Pct) /*0xA8A20000-0x00000000*/ private bool bForceRadar[65537];
var(0.25_Pct) /*0xD6880000-0x00000000*/ private bool bEnableWeaponsCluster[65537];
var(0.25_Pct) /*0xD6880000-0x00000000*/ private bool bForceWeaponsCluster[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private bool bEnableHUD[65537];
var(0.25_Pct) /*0x68070000-0x00000000*/ private bool bForceHUD[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerTarget;

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC, LPH;

    // End:0x11
    if(PlayerTarget == none)
    {
        return;
    }
    // End:0x66
    if(Pawn(PlayerTarget) != none)
    {
        PC = LPPlayerController(Pawn(PlayerTarget).Controller);        
    }
    else
    {
        PC = LPPlayerController(PlayerTarget);
    }
    // End:0x3EB
    if(((PC != none) && PC.IsLocalPlayerController()) && PC.myLPHUD != none)
    {
        LPH = PC.myLPHUD;
        // End:0x1BC
        if(InputLinks[0].bHasImpulse)
        {
            LPH.SetMasterDisplaySwitchReticle(bEnableCrosshair);
            // End:0x18D
            if(bEnableCrosshair && bForceCrosshair)
            {
                LPH.SetCrosshairActive(true);                
            }
            else
            {
                // End:0x1BC
                if(!bEnableCrosshair)
                {
                    LPH.SetCrosshairActive(false);
                }
            }
        }
        // End:0x277
        if(InputLinks[1].bHasImpulse)
        {
            LPH.SetMasterDisplaySwitchDPAD(bEnableDPadCluster);
            // End:0x247
            if(bEnableDPadCluster && bForceDPADCluster)
            {
                LPH.ShowDPadCluster(true);                
            }
            else
            {
                // End:0x277
                if(!bEnableDPadCluster)
                {
                    LPH.ShowDPadCluster(false);
                }
            }
        }
        // End:0x331
        if(InputLinks[2].bHasImpulse)
        {
            LPH.SetMasterDisplaySwitchRadar(bEnableRadar);
            // End:0x302
            if(bEnableRadar && bForceRadar)
            {
                LPH.ShowRadar(true);                
            }
            else
            {
                // End:0x331
                if(!bEnableRadar)
                {
                    LPH.ShowRadar(false);
                }
            }
        }
        // End:0x3EB
        if(InputLinks[3].bHasImpulse)
        {
            LPH.SetMasterDisplaySwitchWeaponsCluster(bEnableWeaponsCluster);
            // End:0x3BC
            if(bEnableWeaponsCluster && bForceWeaponsCluster)
            {
                LPH.ShowWeaponCluster(true);                
            }
            else
            {
                // End:0x3EB
                if(!bEnableWeaponsCluster)
                {
                    LPH.ShowWeaponCluster(false);
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bEnableCrosshair=true
    bEnableDPadCluster=true
    bEnableRadar=true
    bEnableWeaponsCluster=true
    bEnableHUD=true
    InputLinks[0]=(LinkDesc="Reticle",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="DPAD Cluster",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Radar",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[3]=(LinkDesc="Weapons Cluster",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[4]=(LinkDesc="HUD",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="PlayerTarget",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="HUD Element (LP)"
}