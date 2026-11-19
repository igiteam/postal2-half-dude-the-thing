class SeqAct_HeadTrackingControl extends SequenceAction
    hidecategories(Object);

var(*) /*0x44090000-0x00000000*/ private editfixedsize array TrackControllerName[65537];
var(*) /*0x44090000-0x00000000*/ private float LookAtActorRadius[65537];
var(*) /*0x44090000-0x00000000*/ private bool bDisableBeyondLimit[65537];
var(*) /*0x4B590000-0x00000000*/ private bool bLookAtPawns[65537];
var(*) /*0x44090000-0x00000000*/ private float MaxLookAtTime[65537];
var(*) /*0x44090000-0x00000000*/ private float MinLookAtTime[65537];
var(*) /*0x44090000-0x00000000*/ private float MaxInterestTime[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize array ActorClassesToLookAt[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize array TargetBoneNames[65537];
var(*) /*0x44090000-0x00000000*/ private editfixedsize array LookAtTargets[65537];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} ActorToComponentMap[805437441];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

event Activated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;
    local /*0x35EA0000-0x00000000*/ private int I, NumOfMember;
    local /*0x35EA0000-0x00000000*/ private class ActorClassesToLookAtParam[10];
    local /*0x35EA0000-0x00000000*/ private name TargetBoneNamesParam[10], TrackControllerNameParam;
    local /*0x35EA0000-0x00000000*/ private @NULL TriggerActor, LocalActor;

    I = 0;
    J0x0B:

    // End:0x68 [Loop If]
    if((I < Targets.Length) && TriggerActor == none)
    {
        TriggerActor = Actor(Targets[I]);
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x79
    if(TriggerActor == none)
    {
        return;
    }
    // End:0x332
    if(InputLinks[0].bHasImpulse)
    {
        NumOfMember = Min(TrackControllerName.Length, 10);
        I = 0;
        J0xBE:

        // End:0x10A [Loop If]
        if(I < NumOfMember)
        {
            TrackControllerNameParam[I] = TrackControllerName[I];
            ++I;
            // [Loop Continue]
            goto J0xBE;
        }
        NumOfMember = Min(ActorClassesToLookAt.Length, 10);
        I = 0;
        J0x12D:

        // End:0x179 [Loop If]
        if(I < NumOfMember)
        {
            ActorClassesToLookAtParam[I] = ActorClassesToLookAt[I];
            ++I;
            // [Loop Continue]
            goto J0x12D;
        }
        NumOfMember = Min(TargetBoneNames.Length, 10);
        I = 0;
        J0x19C:

        // End:0x1E8 [Loop If]
        if(I < NumOfMember)
        {
            TargetBoneNamesParam[I] = TargetBoneNames[I];
            ++I;
            // [Loop Continue]
            goto J0x19C;
        }
        // End:0x32E
        foreach TriggerActor.WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x32D
            if(PC.IsLocalPlayerController() == false)
            {
                I = 0;
                J0x261:

                // End:0x32D [Loop If]
                if(I < Targets.Length)
                {
                    LocalActor = Actor(Targets[I]);
                    // End:0x31F
                    if(LocalActor != none)
                    {
                        PC.EnableActorHeadTracking(LocalActor, TrackControllerNameParam, ActorClassesToLookAtParam, bLookAtPawns, MinLookAtTime, MaxLookAtTime, MaxInterestTime, LookAtActorRadius, TargetBoneNamesParam);
                    }
                    ++I;
                    // [Loop Continue]
                    goto J0x261;
                }
            }            
        }                
    }
    else
    {
        // End:0x42F
        foreach TriggerActor.WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x42E
            if(PC.IsLocalPlayerController() == false)
            {
                I = 0;
                J0x3AB:

                // End:0x42E [Loop If]
                if(I < Targets.Length)
                {
                    LocalActor = Actor(Targets[I]);
                    // End:0x420
                    if(LocalActor != none)
                    {
                        PC.DisableActorHeadTracking(LocalActor);
                    }
                    ++I;
                    // [Loop Continue]
                    goto J0x3AB;
                }
            }            
        }        
    }
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    TrackControllerName=/* Array type was not detected. */
    LookAtActorRadius=500.0000000
    bDisableBeyondLimit=true
    bLookAtPawns=true
    MaxLookAtTime=5.0000000
    MinLookAtTime=3.0000000
    MaxInterestTime=7.0000000
    TargetBoneNames=/* Array type was not detected. */
    bCallHandler=false
    bAutoActivateOutputLinks=false
    InputLinks[0]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Enabled",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Disabled",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="HeadTracking Control"
}