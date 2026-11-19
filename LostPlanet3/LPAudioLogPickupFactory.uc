class LPAudioLogPickupFactory extends LPCustomizablePickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

var(0.25_Pct) /*0x7C460000-0x00000000*/ private bool bAutoPlayMessage[65537];

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], MailMessage, MailMessageDynamicData;

    super.PickedUpItem(P);
    // End:0x18C
    if(QuestEntry != none)
    {
        MailMessage = LPQO_ObjectiveMailMessage(QuestEntry.GetQuestObject());
        // End:0x18C
        if(MailMessage != none)
        {
            MailMessageDynamicData = LPQDD_MailMessage(MailMessage.DynamicData_ObjectiveBase);
            // End:0xC4
            if(MailMessageDynamicData != none)
            {
                MailMessageDynamicData.bFoundFromPickUp = true;
            }
            // End:0x146
            if(bAutoPlayMessage && LPMailMessageDataAudio(MailMessage.Message) != none)
            {
                LPPlayerController(P.Controller).PlayMailMessage(MailMessage);
            }
            LPPlayerController(P.Controller).PickedUpMessage(MailMessage);
        }
    }
    //return;    
}

function CompleteQuestOnPickup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Objective, ManualTriggerPrereq;

    // End:0xFF
    if(QuestEntry != none)
    {
        Objective = SPQO_Objective(QuestEntry.GetQuestObject());
        // End:0xFF
        if((Objective != none) && Objective.Prerequisite != none)
        {
            ManualTriggerPrereq = SPQP_ManualTrigger(Objective.Prerequisite);
            // End:0xFF
            if(ManualTriggerPrereq != none)
            {
                // End:0xFF
                if(int(Objective.GetQuestStatus()) == int(1))
                {
                    ManualTriggerPrereq.Unlock();
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bAutoPlayMessage=true
    // Reference: LPLocTextSelector'Default__LPAudioLogPickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName
    end object
    PickupName=TxtSelectorName
    bDisableOnQuestEntryCompletion=true
    PickUpSpecialMoveClass=Class'LPSM_PlayerPickUpAudioLog'
    // Reference: StaticMeshComponent'Default__LPAudioLogPickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPAudioLogPickupFactory.PSC0'
    begin object name=PSC0
    end object
    FXParticles=PSC0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAudioLogPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPAudioLogPickupFactory.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=PickupLightEnvironment
    Components[6]=StaticMeshComponent0
    Components[7]=PSC0
    CollisionComponent=CollisionCylinder
}