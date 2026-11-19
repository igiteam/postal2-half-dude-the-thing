class LPSeqAct_OpenShop extends SeqAct_Latent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

struct ShopItemSoundInfo
{
    var(0.25_Pct) /*0xB7F00000-0x00000400*/ private editfixedsize @NULL ShopObj[589825];
    var(0.25_Pct) /*0xB7F00000-0x00000000*/ private @NULL Dialogue[65537];

    structdefaultproperties
    {
        ShopObj=none
        Dialogue=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie;
var(0.25_Pct) /*0x82F10000-0x00000000*/ private byte ShopType[65537];
var(0.25_Pct) /*0x82F10000-0x00000000*/ private editfixedsize array GenericShopOpenDialogue[65537];
var(0.25_Pct) /*0x82F10000-0x00000000*/ private editfixedsize array NewItemShopOpenDialogue[65537];
var(0.25_Pct) /*0x82F10000-0x00000000*/ private editfixedsize array GenericItemPurchasedDialogue[65537];
var(0.25_Pct) /*0x82F10000-0x00000000*/ private editfixedsize array SpecificItemPurchasedDialogue[65537];
var(0.25_Pct) /*0x82F10000-0x00000000*/ private editfixedsize array GenericShopCloseDialogue[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShopOwner[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL myAudioComponent[537395201];
var(0.25_Pct) /*0x82F10000-0x00000000*/ private bool bStopAllOwnerSoundsBeforePlaying[65537];

static event GetObjClassVersion()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

function GetRandomSound()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SoundList[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x12
    if(SoundList.Length == 0)
    {
        return none;
    }
    Idx = Rand(SoundList.Length);
    return SoundList[Idx];
    //return ReturnValue;    
}

function GetSpecificPurchasedSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShopItemObjective[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL CurItem;

    Idx = 0;
    J0x0B:

    // End:0xCF [Loop If]
    if(Idx < SpecificItemPurchasedDialogue.Length)
    {
        CurItem = LPQO_ObjectiveShopItem(SpecificItemPurchasedDialogue[Idx].ShopObj.GetQuestObject());
        // End:0xC1
        if((CurItem != none) && CurItem == ShopItemObjective)
        {
            return SpecificItemPurchasedDialogue[Idx].Dialogue;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}

function StartShop()
{
    local /*0x97E50000-0x00000000*/ private bool bNewItemsAvailable[8388609];

    // End:0x11
    if(ShopOwner == none)
    {
        return;
    }
    myAudioComponent = none;
    StopSounds();
    // End:0x88
    if(bNewItemsAvailable)
    {
        myAudioComponent = Class'AkAudio.AkComponent'.static.CreateAkComponent(GetRandomSound(NewItemShopOpenDialogue), ShopOwner, 'None', false, true);        
    }
    else
    {
        myAudioComponent = Class'AkAudio.AkComponent'.static.CreateAkComponent(GetRandomSound(GenericShopOpenDialogue), ShopOwner, 'None', false, true);
    }
    myAudioComponent.bAutoDestroy = false;
    myAudioComponent.Play();
    //return;    
}

function PurchasedItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShopItemObjective[8388609];

    // End:0x11
    if(ShopOwner == none)
    {
        return;
    }
    StopSounds();
    myAudioComponent.PlayEvent = GetSpecificPurchasedSound(ShopItemObjective);
    // End:0xA3
    if(myAudioComponent.PlayEvent == none)
    {
        myAudioComponent.PlayEvent = GetRandomSound(GenericItemPurchasedDialogue);
    }
    myAudioComponent.Play();
    //return;    
}

function StopShop()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x11
    if(ShopOwner == none)
    {
        return;
    }
    StopSounds();
    myAudioComponent.PlayEvent = GetRandomSound(GenericShopCloseDialogue);
    myAudioComponent.bAutoDestroy = true;
    myAudioComponent.Play();
    myAudioComponent = none;
    // End:0x122
    if(int(ShopType) == int(3))
    {
        PC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
        // End:0x122
        if(PC != none)
        {
            PC.CheckForMasterHunstmanAchievement();
        }
    }
    //return;    
}

function StopSounds()
{
    // End:0x52
    if((myAudioComponent != none) && myAudioComponent.IsPlaying())
    {
        myAudioComponent.Stop();
    }
    // End:0x87
    if(bStopAllOwnerSoundsBeforePlaying)
    {
        LPPawn(ShopOwner).StopSoundsOnPawn();
    }
    //return;    
}

defaultproperties
{
    bStopAllOwnerSoundsBeforePlaying=true
    InputLinks[0]=(LinkDesc="Open",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Done",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'Engine.SeqVar_Object',LinkedVariables=none,LinkDesc="ShopOwner",LinkVar="None",PropertyName="ShopOwner",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Open Shop (LP)"
}