class LPAwardManager extends Object
    config(Awards);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StatManager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GlobalCreditMultiplier[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AwardDefinitions[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Awards[536870913];

simulated function InitAwardManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];

    MyPC = LPPC;
    MyPRI = LPPRI(LPPC.PlayerReplicationInfo);
    // End:0x95
    if(MyPC != none)
    {
        StatManager = MyPC.GetStatManager();
        // End:0x95
        if(StatManager != none)
        {
            ConstructAwards();
        }
    }
    //return;    
}

simulated function ConstructAwards()
{
    local /*0x97E50000-0x00000000*/ private class AwardClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string AwardClassPath;
    local /*0x97E50000-0x00000000*/ private @NULL Award;
    local /*0x97E50000-0x00000000*/ private int AwardIndex;

    // End:0x137
    if(Awards.Length == 0)
    {
        AwardIndex = 0;
        J0x1B:

        // End:0x137 [Loop If]
        if(AwardIndex < AwardDefinitions.Length)
        {
            AwardClassPath = "LostPlanetGame." $ AwardDefinitions[AwardIndex].AwardClassName;
            AwardClass = class<LPAward>(FindObject(AwardClassPath, Class'Core.Class'));
            AwardClass = ((AwardClass != none) ? AwardClass : Class'LPAward');
            Award = new (self) AwardClass;
            Awards.AddItem(Award);            
            Award.InitAward(self, AwardIndex);
            AwardIndex++;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    //return;    
}

simulated function GiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Award;

    Award = GetAward(AwardName);
    // End:0x4E
    if(Award != none)
    {
        Award.GiveAward();        
    }
    //return;    
}

function ServerGiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];

    GiveAward(AwardName);
    // End:0x60
    if(!GetMyPlayerController().IsLocalPlayerController())
    {
        MyPC.ClientGiveAward(AwardName);
    }
    //return;    
}

simulated function GetAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = GetAwardIndex(AwardName);
    // End:0x40
    if(Idx >= 0)
    {
        return Awards[Idx];
    }
    return none;
    //return ReturnValue;    
}

simulated function GetAwardDefinition()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NullAward;

    Idx = GetAwardIndex(AwardName);
    // End:0x40
    if(Idx >= 0)
    {
        return AwardDefinitions[Idx];
    }
    return NullAward;
    //return ReturnValue;    
}

simulated function GetAwardIndex()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x37
    if(AwardName != 'None')
    {
        return AwardDefinitions.Find('AwardName', AwardName);        
    }
    return -1;
    //return ReturnValue;    
}

simulated function GetAwardsOfClass()
{
    local /*0x97E50000-0x00000000*/ private class AwardClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private @NULL Award;

    // End:0x5B
    foreach Awards(Award)
    {
        // End:0x5A
        if(ClassIsChildOf(Award.Class, AwardClass))
        {
            Result.AddItem(Award);            
        }        
    }    
    return Result;
    //return ReturnValue;    
}

simulated function GetAwardParam()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetAwardDefinition(AwardName).RequirementParam;
    //return ReturnValue;    
}

simulated function GetAwardRequiredCount()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return float(GetAwardDefinition(AwardName).RequiredCount);
    //return ReturnValue;    
}

static simulated function GetDefaultAwardParam()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LocalPC;

    LocalPC = LPPlayerController(Class'Engine.UIInteraction'.static.GetLocalPlayer(0).Actor);
    // End:0x96
    if(LocalPC != none)
    {
        return LocalPC.GetAwardManager().GetAwardParam(AwardName);
    }
    return 0.0000000;
    //return ReturnValue;    
}

function GetMyPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if(MyPC == none)
    {
        // End:0x4F
        if(MyPRI != none)
        {
            MyPC = LPPlayerController(MyPRI.Owner);
        }
        // End:0x5E
        if(MyPC == none)
        {
        }
    }
    return MyPC;
    //return ReturnValue;    
}

defaultproperties
{
    AwardDefinitions=/* Array type was not detected. */
}