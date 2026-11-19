class LPCSAO_PlayerCollection extends LPCSAO_Player
    dontsortcategories(TemplateAnims,SingleAnims)
    hidecategories(SPContextSensitiveAnimObject,SingleAnims,TemplateAnims,NodeNames,MovementSpeed);

enum EPlayerCSAContext
{
    EPCSA_Default,                  // 0
    EPCSA_UnarmedClass,             // 1
    EPCSA_PistolClass,              // 2
    EPCSA_RifleClass,               // 3
    EPCSA_HeavyClass,               // 4
    EPCSA_MAX                       // 5
};

struct native CSACollectionInfo
{
    var(0.25_Pct) /*0x28F00000-0x00000000*/ private byte context[65537];
    var(0.25_Pct) /*0x28F00000-0x00000000*/ private @NULL CSA[65537];

    structdefaultproperties
    {
        context=EPlayerCSAContext.EPCSA_Default
        CSA=none
    }
};

var(0.25_Pct) /*0x7CEC0000-0x00000000*/ private editfixedsize array CSAs[65537];

event GetAllSingleAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SingleAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], CSA;

    CSA = GetCSAForCurrentState(LPPawn(inPawn));
    // End:0x66
    if(CSA != none)
    {
        CSA.GetAllSingleAnims(SingleAnims, inPawn);
    }
    //return;    
}

event GetAllTemplateAnims()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array TemplateAnims[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], CSA;

    CSA = GetCSAForCurrentState(LPPawn(inPawn));
    // End:0x66
    if(CSA != none)
    {
        CSA.GetAllTemplateAnims(TemplateAnims, inPawn);
    }
    //return;    
}

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], CSA;

    CSA = GetCSAForCurrentState(LPPawn(inPawn));
    // End:0x5D
    if(CSA != none)
    {
        CSA.OnBecomeActive(inPawn);
    }
    //return;    
}

event GetAnimNodeTemplateTree()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue, CSA;

    CSA = GetCSAForCurrentState(LPPawn(inPawn));
    // End:0x54
    if(CSA != none)
    {
        return CSA.AnimNodeTemplateTree;
    }
    return super(SPContextSensitiveAnimObject).GetAnimNodeTemplateTree(inPawn);
    //return ReturnValue;    
}

function GetCSAForCurrentState()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue, W;
    local /*0x97E50000-0x00000000*/ private byte DesiredContext;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL DefaultCSA;
    local /*0x97E50000-0x00000000*/ private class LastWeaponClass;

    DesiredContext = 1;
    // End:0x130
    if(bUsesWeapon)
    {
        DesiredContext = 0;
        W = LPWeapon(inPawn.Weapon);
        // End:0x90
        if(W != none)
        {
            DesiredContext = W.AnimationContext;            
        }
        else
        {
            // End:0x130
            if(inPawn.LastEquippedWeaponClassName != "")
            {
                LastWeaponClass = class<LPWeapon>(FindObject(inPawn.LastEquippedWeaponClassName, Class'Core.Class'));
                // End:0x130
                if(LastWeaponClass != none)
                {
                    DesiredContext = LastWeaponClass.default.AnimationContext;
                }
            }
        }
    }
    Idx = 0;
    J0x13B:

    // End:0x232 [Loop If]
    if(Idx < CSAs.Length)
    {
        // End:0x1B2
        if(int(DesiredContext) == int(CSAs[Idx].context))
        {
            return CSAs[Idx].CSA;
        }
        // End:0x224
        if((DefaultCSA == none) && int(CSAs[Idx].context) == int(0))
        {
            DefaultCSA = CSAs[Idx].CSA;
        }
        Idx++;
        // [Loop Continue]
        goto J0x13B;
    }
    // End:0x281
    if((bUsesWeapon && DefaultCSA == none) && CSAs.Length > 0)
    {
        return CSAs[0].CSA;
    }
    return DefaultCSA;
    //return ReturnValue;    
}

function DoesAllowWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = GetCSAForCurrentState(inPawn);
    // End:0x55
    if(CSA != none)
    {
        return CSA.DoesAllowWeapon(inPawn);
    }
    return true;
    //return ReturnValue;    
}

function DoesAllowGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = GetCSAForCurrentState(inPawn);
    // End:0x55
    if(CSA != none)
    {
        return CSA.DoesAllowGrapplingHook(inPawn);
    }
    return true;
    //return ReturnValue;    
}

function DoesAllowDodge()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = GetCSAForCurrentState(inPawn);
    // End:0x55
    if(CSA != none)
    {
        return CSA.DoesAllowDodge(inPawn);
    }
    return true;
    //return ReturnValue;    
}

function DoesAllowSprint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = GetCSAForCurrentState(inPawn);
    // End:0x55
    if(CSA != none)
    {
        return CSA.DoesAllowSprint(inPawn);
    }
    return true;
    //return ReturnValue;    
}

function GetGroundSpeed()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = GetCSAForCurrentState(inPawn);
    // End:0x55
    if(CSA != none)
    {
        return CSA.GetGroundSpeed(inPawn);
    }
    return 0.0000000;
    //return ReturnValue;    
}

function GetSprintSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CSA;

    CSA = GetCSAForCurrentState(inPawn);
    // End:0x55
    if(CSA != none)
    {
        return CSA.GetSprintSpeedScale(inPawn);
    }
    return 0.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    ExtraPawnClasses=/* Array type was not detected. */
}