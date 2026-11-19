class LPSeqAct_ToggleThermalPocket extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EThermalPocketSequenceOrder
{
    ThermalPocketSequence_Random,   // 0
    ThermalPocketSequence_Sequential,// 1
    ThermalPocketSequence_MAX       // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ThermalPockets;
var(0.25_Pct) /*0x836A0000-0x00000000*/ private byte SequenceOrder[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecificTargetObject;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentNodeIndex;

event Activated()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ValidPockets;
    local /*0x97E50000-0x00000000*/ private @NULL P;
    local /*0x97E50000-0x00000000*/ private int SpecificTarget;

    // End:0xA3
    if(VariableLinks[0].LinkedVariables.Length < 1)
    {
        ScriptLog("ERROR -- Kismet 'Thermal Pocket Toggle' -- No target thermal pockets specified");
        OutputLinks[1].bHasImpulse = true;
        return;
    }
    // End:0xF1
    if(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI.IsMultiplayerGame())
    {
    }
    // End:0x37E
    if(InputLinks[0].bHasImpulse)
    {
        // End:0x264
        if(int(SequenceOrder) == int(0))
        {
            // End:0x1A3
            foreach ThermalPockets(P)
            {
                // End:0x1A2
                if((P.bEnabled == false) && P.GetEnergyRemaining() > float(0))
                {
                    ValidPockets.AddItem(P);                    
                }                
            }            
            // End:0x22E
            if(ValidPockets.Length == 0)
            {
                ScriptLog("Info -- Kismet 'Thermal Pocket Toggle' -- No valid pockets found to enable");
                OutputLinks[1].bHasImpulse = true;
                return;
            }
            SpecificTarget = Rand(ValidPockets.Length);
            SpecificTargetObject = ValidPockets[SpecificTarget];            
        }
        else
        {
            // End:0x281
            if(CurrentNodeIndex < 0)
            {
                CurrentNodeIndex = 0;                
            }
            else
            {
                // End:0x2A4
                if(CurrentNodeIndex >= ThermalPockets.Length)
                {
                    CurrentNodeIndex = 0;
                }
            }
            SpecificTargetObject = ThermalPockets[CurrentNodeIndex++];
        }
        // End:0x2F5
        if(SpecificTargetObject == none)
        {
            OutputLinks[1].bHasImpulse = true;
            return;
        }
        // End:0x33A
        if(SpecificTargetObject.bEnabled)
        {
            OutputLinks[0].bHasImpulse = true;
            return;
        }
        SpecificTargetObject.SetEnabled(true);
        OutputLinks[0].bHasImpulse = true;        
    }
    else
    {
        // End:0x41F
        if(InputLinks[1].bHasImpulse)
        {
            // End:0x3FD
            foreach ThermalPockets(P)
            {
                // End:0x3FC
                if(P.bEnabled == true)
                {
                    P.SetEnabled(false);
                }                
            }            
            OutputLinks[0].bHasImpulse = true;
        }
    }
    //return;    
}

defaultproperties
{
    bAutoActivateOutputLinks=false
    InputLinks[0]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Success",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Failure",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target Pockets",LinkVar="None",PropertyName="ThermalPockets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Result Pocket",LinkVar="None",PropertyName="SpecificTargetObject",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=0,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Thermal Pocket Toggle (LP)"
}