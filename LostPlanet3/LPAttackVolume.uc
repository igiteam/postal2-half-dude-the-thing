class LPAttackVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x7C420000-0x00000000*/ private editfixedsize array AllowedTouchers[65537];
var(0.25_Pct) /*0x7C420000-0x00000000*/ private editfixedsize array ExcludedTouchers[65537];
var(0.25_Pct) /*0xAFC00000-0x00000400*/ private editfixedsize array ScriptedAttack[589825];
var(0.25_Pct) /*0x7C420000-0x00000000*/ private bool bEnableDebug[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ResourceManager[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ResourceName[131073];

// Export ULPAttackVolume::execFindClassIndexFor(FFrame&, void* const)
private native final function FindClassIndexFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Toucher[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array InTypes[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAttackVolume::execGetBestGoToActor(FFrame&, void* const)
native function GetBestGoToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;


}

// Export ULPAttackVolume::execGetScriptedAttackIndex(FFrame&, void* const)
protected native function GetScriptedAttackIndex()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPAttackVolume::execGetUseInfo(FFrame&, void* const)
protected native function GetUseInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], GoToActor, TemplateAnimTree;
    local /*0x97E50000-0x00000000*/ private name TemplateAnimName[25165825];
    local /*0x97E50000-0x00000000*/ private int AttackIndex[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAttackVolume::execGetUserTypes(FFrame&, void* const)
native function GetUserTypes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array UserTypes[25165825];
    local /*0x97E50000-0x00000000*/ private bool bAppend[9437185];

    false                
}

// Export ULPAttackVolume::execIsOnNavMesh(FFrame&, void* const)
native function IsOnNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], DesiredPos;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function hide()
{
    SetHidden(true);
    BrushComponent.SetHidden(true);
    //return;    
}

function Draw()
{
    SetHidden(false);
    BrushComponent.SetHidden(false);
    //return;    
}

function CanBeUsedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (GetScriptedAttackIndex(inPawn)) > -1;
    //return ReturnValue;    
}

function IsScriptedAttackUsableBy()
{
    local /*0x97E50000-0x00000000*/ private int ScriptedAttackIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bUseable;

    bUseable = false;
    // End:0x7C
    if((ScriptedAttackIndex < ScriptedAttack.Length) && ScriptedAttack[ScriptedAttackIndex] != none)
    {
        bUseable = ScriptedAttack[ScriptedAttackIndex].IsCurrentlyUsableBy(Requester);
    }
    return bUseable;
    //return ReturnValue;    
}

function GetAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], ReturnValue;

    // End:0x4A
    if(IsAccessPossible(Requester))
    {
        return ResourceManager.GetAccess('AttackVolumeAccess', Requester);
    }
    return none;
    //return ReturnValue;    
}

// Export ULPAttackVolume::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event IsTouching()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL A;

    // End:0x33
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        // End:0x32
        if(A == Other)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

protected event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsPendingKill())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL A;

    // End:0x2C
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        NotifyActorOfUnTouch(A);        
    }    
    super(Actor).Destroyed();
    //return;    
}

simulated event PostBeginPlay()
{
    super(TriggerVolume).PostBeginPlay();
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    NotifyActorOfTouch(Other);
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).UnTouch(Other);
    NotifyActorOfUnTouch(Other);
    //return;    
}

function NotifyActorOfTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], inPawn;

    // End:0x61
    if(ShouldNotifyForThisType(Other))
    {
        inPawn = LPPawn(Other);
        // End:0x61
        if(inPawn != none)
        {
            inPawn.OnTouchAttackVolume(self);
        }
    }
    //return;    
}

function NotifyActorOfUnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], inPawn;

    // End:0x61
    if(ShouldNotifyForThisType(Other))
    {
        inPawn = LPPawn(Other);
        // End:0x61
        if(inPawn != none)
        {
            inPawn.OnUnTouchAttackVolume(self);
        }
    }
    //return;    
}

function IsAllowedToucher()
{
    local /*0x97E50000-0x00000000*/ private @NULL Toucher[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(Toucher != none)
    {
        // End:0x24
        if(AllowedTouchers.Length == 0)
        {
            return true;            
        }
        else
        {
            // End:0x4C
            if(FindClassIndexFor(Toucher, AllowedTouchers) > -1)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsExcludedToucher()
{
    local /*0x97E50000-0x00000000*/ private @NULL Toucher[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(Toucher != none)
    {
        // End:0x24
        if(ExcludedTouchers.Length == 0)
        {
            return false;            
        }
        else
        {
            // End:0x4C
            if(FindClassIndexFor(Toucher, ExcludedTouchers) > -1)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldNotifyForThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL Toucher[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (IsAllowedToucher(Toucher)) && !IsExcludedToucher(Toucher);
    //return ReturnValue;    
}

auto state LPAttackVolumeDefaultState
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL A;

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x3F
        foreach TouchingActors(Class'Engine.Actor', A)
        {
            NotifyActorOfTouch(A);            
        }        
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPAIResManAttackVolume'Default__LPAttackVolume.LPAIResManAttackVolume'
    begin object name=LPAIResManAttackVolume class=Class'LPAIResManAttackVolume'
    end object
    ResourceManager=LPAIResManAttackVolume
    ResourceName="AttackVolumeAccess"
    // Reference: BrushComponent'Default__LPAttackVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=LPAIResManAttackVolume
    CollisionComponent=BrushComponent0
}