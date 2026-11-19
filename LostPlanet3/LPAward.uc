class LPAward extends Object;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AwardIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AwardManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AwardTypeIconName;

function InitAward()
{
    local /*0x97E50000-0x00000000*/ private @NULL AwardMgr[8388609];
    local /*0x97E50000-0x00000000*/ private int AwardIdx[8388609];

    AwardManager = AwardMgr;
    AwardIndex = AwardIdx;
    //return;    
}

function GiveAward()
{
    //return;    
}

function GetAwardDefinition()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];

    return AwardManager.AwardDefinitions[AwardIndex];
    //return ReturnValue;    
}

function GetAwardName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return GetAwardDefinition().AwardName;
    //return ReturnValue;    
}

function GetCredits()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetAwardDefinition().Credits;
    //return ReturnValue;    
}

function GetCreditMultiplier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Multiplier;

    Multiplier = ((GetAwardDefinition().CreditMultiplier > float(0)) ? GetAwardDefinition().CreditMultiplier : 1.0000000);
    Multiplier *= ((AwardManager.GlobalCreditMultiplier > float(0)) ? AwardManager.GlobalCreditMultiplier : 1.0000000);
    return Multiplier;
    //return ReturnValue;    
}

function GetAdjustedCredits()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(float(GetCredits()) * (GetCreditMultiplier()));
    //return ReturnValue;    
}

function GetPriority()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetAwardDefinition().Priority;
    //return ReturnValue;    
}

function GetIconName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return GetAwardDefinition().IconName;
    //return ReturnValue;    
}

function GetIconColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetAwardDefinition().IconColor;
    //return ReturnValue;    
}

function GetAwardTypeIconName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return AwardTypeIconName;
    //return ReturnValue;    
}

function GetRequiredCount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetAwardDefinition().RequiredCount;
    //return ReturnValue;    
}

function GetRequirementParam()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetAwardDefinition().RequirementParam;
    //return ReturnValue;    
}

function GetAwardString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return TranslateAwardString("Award");
    //return ReturnValue;    
}

function GetPrerequisiteString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return TranslateAwardString("Prerequisite");
    //return ReturnValue;    
}

function TranslateAwardString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AwardPostfix[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL TransContext, TransTag;
    local /*0x97E50000-0x00000000*/ private editfixedsize string StringToTranslate;

    TransContext = Class'Engine.UIInteraction'.static.GetLocalPlayer(0).GetTranslationContext();
    TransTag = TransContext.GetTranslatorTagFromName('Strings');
    StringToTranslate = (("LostPlanetGame.Awards." $ string(GetAwardName())) $ "_") $ AwardPostfix;
    return TransTag.Translate(StringToTranslate);
    //return ReturnValue;    
}
