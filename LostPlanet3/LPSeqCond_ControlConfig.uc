class LPSeqCond_ControlConfig extends SequenceCondition
    forcescriptorder(true)
    hidecategories(Object);

event Activated()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array objVars;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL PC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ControllerConfig;

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

    // End:0x21E
    if(PC != none)
    {
        ControllerConfig = PC.GetControlConfigurationString();
        switch(ControllerConfig)
        {
            // End:0x108
            case "ALTERNATE SPRINT":
                OutputLinks[1].bHasImpulse = true;
                // End:0x21E
                break;
            // End:0x141
            case "ALTERNATE COVER":
                OutputLinks[2].bHasImpulse = true;
                // End:0x21E
                break;
            // End:0x174
            case "Default 2":
                OutputLinks[3].bHasImpulse = true;
                // End:0x21E
                break;
            // End:0x1B0
            case "ALTERNATE SPRINT 2":
                OutputLinks[4].bHasImpulse = true;
                // End:0x21E
                break;
            // End:0x1EB
            case "ALTERNATE COVER 2":
                OutputLinks[5].bHasImpulse = true;
                // End:0x21E
                break;
            // End:0x1F7
            case "Default":
            // End:0xFFFF
            default:
                OutputLinks[0].bHasImpulse = true;
                // End:0x21E
                break;
                break;
        }
    }
    //return;    
}

defaultproperties
{
    OutputLinks[0]=(Links=none,LinkDesc="Default",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Alternate Sprint",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Alternate Cover",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Default 2 (PS3 only)",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[4]=(Links=none,LinkDesc="Alternate Sprint 2 (PS3 only)",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[5]=(Links=none,LinkDesc="Alternate Cover 2 (PS3 only) ",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Player",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="ControlConfig (LP)"
}