class LPAIPawnHumanIss extends LPAIPawnHumanNPC
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum EISSProp
{
    EIP_Gun,                        // 0
    EIP_Baton,                      // 1
    EIP_CrossbowBolt,               // 2
    EIP_Knife,                      // 3
    EIP_MAX                         // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StruggleAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Props[524292];

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return StruggleAnimTree;
    //return ReturnValue;    
}

simulated function GetStrugglePlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPlayerPawn(SpecialMoveState.CurSMInfo.InteractionPawn);
    //return ReturnValue;    
}

simulated function OnAnimNotifyISSStruggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    // End:0x54
    if(int(Notify.Action) == int(0))
    {
        ShowProp(Notify.Prop);        
    }
    else
    {
        // End:0xA5
        if(int(Notify.Action) == int(1))
        {
            HideProp(Notify.Prop);
        }
    }
    //return;    
}

simulated function ShowProp()
{
    local /*0x97E50000-0x00000000*/ private byte InProp[8388609];

    // End:0x21
    if(int(InProp) == int(0))
    {
        ShowGun();        
    }
    else
    {
        // End:0x42
        if(int(InProp) == int(1))
        {
            ShowBaton();            
        }
        else
        {
            // End:0x63
            if(int(InProp) == int(2))
            {
                ShowCrossbowBolt();                
            }
            else
            {
                // End:0x81
                if(int(InProp) == int(3))
                {
                    ShowKnife();
                }
            }
        }
    }
    //return;    
}

simulated function HideProp()
{
    local /*0x97E50000-0x00000000*/ private byte InProp[8388609];

    // End:0x21
    if(int(InProp) == int(0))
    {
        HideGun();        
    }
    else
    {
        // End:0x42
        if(int(InProp) == int(1))
        {
            HideBaton();            
        }
        else
        {
            // End:0x63
            if(int(InProp) == int(2))
            {
                HideCrossbowBolt();                
            }
            else
            {
                // End:0x81
                if(int(InProp) == int(3))
                {
                    HideKnife();
                }
            }
        }
    }
    //return;    
}

simulated function ShowKnife()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;

    PlayerPawn = GetStrugglePlayerPawn();
    // End:0x4B
    if(PlayerPawn != none)
    {
        PlayerPawn.ShowKnife('WeaponSocket');
    }
    //return;    
}

simulated function HideKnife()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;

    PlayerPawn = GetStrugglePlayerPawn();
    // End:0x42
    if(PlayerPawn != none)
    {
        PlayerPawn.HideKnife();
    }
    //return;    
}

simulated function @NULL ShowGun()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, GunProp;

    GunProp = Props[0];
    PlayerPawn = GetStrugglePlayerPawn();
    // End:0xEC
    if((GunProp != none) && PlayerPawn != none)
    {
        SPInventoryManager(PlayerPawn.InvManager).DetachWeapons();
        GunProp.SetHidden(false);
        PlayerPawn.Mesh.AttachComponentToSocket(GunProp, 'WeaponSocket');
    }
    //return;    
}

simulated function @NULL HideGun()
{
    local /*0x97E50000-0x00000400*/ private @NULL GunProp;

    GunProp = Props[0];
    // End:0x44
    if(GunProp != none)
    {
        GunProp.SetHidden(true);
    }
    //return;    
}

simulated function @NULL ShowBaton()
{
    local /*0x97E50000-0x00000400*/ private @NULL BatonProp;

    BatonProp = Props[1];
    // End:0x75
    if(BatonProp != none)
    {
        BatonProp.SetHidden(false);
        Mesh.AttachComponentToSocket(BatonProp, 'WeaponSocket');
    }
    //return;    
}

simulated function @NULL HideBaton()
{
    local /*0x97E50000-0x00000400*/ private @NULL GunProp;

    GunProp = Props[1];
    // End:0x44
    if(GunProp != none)
    {
        GunProp.SetHidden(true);
    }
    //return;    
}

simulated function @NULL ShowCrossbowBolt()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, CrossbowProp;

    CrossbowProp = Props[2];
    PlayerPawn = GetStrugglePlayerPawn();
    // End:0xB0
    if((CrossbowProp != none) && PlayerPawn != none)
    {
        CrossbowProp.SetHidden(false);
        PlayerPawn.Mesh.AttachComponentToSocket(CrossbowProp, 'WeaponSocket');
    }
    //return;    
}

simulated function @NULL HideCrossbowBolt()
{
    local /*0x97E50000-0x00000400*/ private @NULL CrossbowProp;

    CrossbowProp = Props[2];
    // End:0x45
    if(CrossbowProp != none)
    {
        CrossbowProp.SetHidden(true);
    }
    //return;    
}

defaultproperties
{
    // Re[0]ference: SkeletalMeshComponent'Default__LPAIPawnHumanIss.GunComp'
    begin object name=GunComp class=Class'Engine.SkeletalMeshComponent'
    end object
    Props=GunComp
    // Reference: SkeletalMeshComponent'Default__LPAIPawnHumanIss.BatonComp'
    begin object name=BatonComp class=Class'Engine.SkeletalMeshComponent'
    end object
    Props=BatonComp
    // Reference: SkeletalMeshComponent'Default__LPAIPawnHumanIss.CrossbowComp'
    begin object name=CrossbowComp class=Class'Engine.SkeletalMeshComponent'
    end object
    Props=CrossbowComp
    // Reference: LPAIResManHuman'Default__LPAIPawnHumanIss.LPAIResManHuman'
    begin object name=LPAIResManHuman
    end object
    AIResourceManager=LPAIResManHuman
    // Reference: LPDamageReactionManagerAIHuman'Default__LPAIPawnHumanIss.DamageReactionManagerHuman'
    begin object name=DamageReactionManagerHuman
    end object
    DamageReactionManager=DamageReactionManagerHuman
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnHumanIss.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnHumanIss.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnHumanIss.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPAIPawnHumanIss.HeadTrackComponent0'
    begin object name=HeadTrackComponent0
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnHumanIss.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnHumanIss.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnHumanIss.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnHumanIss.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnHumanIss.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnHumanIss.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnHumanIss.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    Components[9]=FXActionManagerDefObj0
    Components[10]=LPAIResManHuman
    Components[11]=HeadTrackComponent0
    Components[12]=GunComp
    Components[13]=BatonComp
    Components[14]=CrossbowComp
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnHumanIss.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}