class SeqEvent_TakeDamage extends SequenceEvent
    hidecategories(Object);

var(*) /*0x447C0000-0x00000000*/ private float MinDamageAmount[65537];
var(*) /*0x447C0000-0x00000000*/ private float DamageThreshold[65537];
var(*) /*0x447C0000-0x00000000*/ private editfixedsize array DamageTypes[65537];
var(*) /*0x447C0000-0x00000000*/ private editfixedsize array IgnoreDamageTypes[65537];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentDamage;
var(*) /*0x447C0000-0x00000000*/ private bool bResetDamageOnToggle[65537];

final function IsValidDamageType()
{
    local /*0x35EA0000-0x00000000*/ private class inDamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private bool bValidDamageType;

    // End:0x8F
    if(DamageTypes.Length > 0)
    {
        bValidDamageType = false;
        Idx = 0;
        J0x27:

        // End:0x7E [Loop If]
        if(Idx < DamageTypes.Length)
        {
            // End:0x70
            if(ClassIsChildOf(inDamageType, DamageTypes[Idx]))
            {
                bValidDamageType = true;
                // [Explicit Break]
                goto J0x7E;
            }
            Idx++;
            // [Loop Continue]
            goto J0x27;
        }
        J0x7E:

        // End:0x8F
        if(!bValidDamageType)
        {
            return false;
        }
    }
    // End:0xF4
    if(IgnoreDamageTypes.Length > 0)
    {
        Idx = 0;
        J0xAA:

        // End:0xF4 [Loop If]
        if(Idx < IgnoreDamageTypes.Length)
        {
            // End:0xE6
            if(ClassIsChildOf(inDamageType, IgnoreDamageTypes[Idx]))
            {
                return false;
            }
            Idx++;
            // [Loop Continue]
            goto J0xAA;
        }
    }
    return true;
    //return ReturnValue;    
}

function HandleDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InOriginator[8388609], InInstigator;
    local /*0x35EA0000-0x00000000*/ private class inDamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private int inAmount[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FloatVar;
    local /*0x35EA0000-0x00000000*/ private bool bAlreadyActivatedThisTick;

    PublishLinkedVariableValues();
    // End:0x1FD
    if(((((InOriginator != none) && bEnabled) && float(inAmount) >= MinDamageAmount) && IsValidDamageType(inDamageType)) && !bPlayerOnly || (InInstigator != none) && InInstigator.IsPlayerOwned())
    {
        CurrentDamage += float(inAmount);
        // End:0x1FD
        if(CurrentDamage >= DamageThreshold)
        {
            bAlreadyActivatedThisTick = bActive && ActivationTime ~= GetWorldInfo().TimeSeconds;
            // End:0x1FD
            if(CheckActivate(InOriginator, InInstigator, false))
            {
                // End:0x1C3
                foreach LinkedVariables(Class'SeqVar_Float', FloatVar, "Damage Taken")
                {
                    // End:0x19A
                    if(bAlreadyActivatedThisTick)
                    {
                        FloatVar.FloatValue += CurrentDamage;
                        // End:0x1C2
                        continue;
                    }
                    FloatVar.FloatValue = CurrentDamage;                    
                }                
                // End:0x1E9
                if(DamageThreshold <= 0.0000000)
                {
                    CurrentDamage = 0.0000000;                    
                }
                else
                {
                    CurrentDamage -= DamageThreshold;
                }
            }
        }
    }
    //return;    
}

function Reset()
{
    super.Reset();
    CurrentDamage = 0.0000000;
    //return;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 2;
    //return ReturnValue;    
}

event Toggled()
{
    // End:0x1C
    if(bResetDamageOnToggle)
    {
        CurrentDamage = 0.0000000;
    }
    super.Toggled();
    //return;    
}

defaultproperties
{
    DamageThreshold=100.0000000
    bResetDamageOnToggle=true
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Instigator",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Float',LinkedVariables=none,LinkDesc="Damage Taken",LinkVar="None",PropertyName="None",bWriteable=true,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Take Damage"
}