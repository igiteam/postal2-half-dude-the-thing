class DynamicSMActor extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x1EB30000-0x00000400*/ private const export @NULL StaticMeshComponent[720897];
var(*) /*0x2D730000-0x00000400*/ private const export @NULL KynapseObstacleComponent[589825];
var(*) /*0x1EB30000-0x00000400*/ private const export @NULL LightEnvironment[720897];
var(*) /*0x35EA0000-0x00000000*/ private travel StaticMesh ReplicatedMesh[538968065];
var(*) /*0x35EA0000-0x00000000*/ private travel MaterialInterface ReplicatedMaterial0[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel MaterialInterface ReplicatedMaterial1[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bForceStaticDecals[2097153];
var(*) /*0x1EB30000-0x00000000*/ private bool bPawnCanBaseOn[65537];
var(*) /*0x1EB30000-0x00000000*/ private bool bSafeBaseIfAsleep[65537];
var(*) /*0x2D730000-0x00000000*/ private bool bDisableKynapseObstacleOnStartUp[196609];
var(*) /*0x35EA0000-0x00000000*/ private travel Vector ReplicatedMeshTranslation[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel Rotator ReplicatedMeshRotation[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel Vector ReplicatedMeshScale3D[2097153];

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x6B
    if(StaticMeshComponent != none)
    {
        ReplicatedMesh = StaticMeshComponent.StaticMesh;
        bForceStaticDecals = StaticMeshComponent.bForceStaticDecals;
    }
    // End:0x9E
    if(KynapseObstacleComponent == none)
    {
        // End:0x9D
        foreach ComponentList(Class'KynapseObstacleComponent', KynapseObstacleComponent)
        {
            // End:0x9D
            break;            
        }        
    }
    // End:0xB8
    if(bDisableKynapseObstacleOnStartUp)
    {
        DeactivateKynapseHandle();        
    }
    else
    {
        ActivateKynapseHandle();
    }
    //return;    
}

function ActivateKynapseHandle()
{
    // End:0x22
    if(KynapseObstacleComponent != none)
    {
        AttachComponent(KynapseObstacleComponent);
    }
    //return;    
}

function DeactivateKynapseHandle()
{
    // End:0x22
    if(KynapseObstacleComponent != none)
    {
        DetachComponent(KynapseObstacleComponent);
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0xB0
    if(VarName == 'ReplicatedMesh')
    {
        // End:0xAD
        if(ReplicatedMesh != StaticMeshComponent.StaticMesh)
        {
            LightEnvironment.bCastShadows = false;
            LightEnvironment.SetEnabled(true);
            StaticMeshComponent.SetStaticMesh(ReplicatedMesh);
        }        
    }
    else
    {
        // End:0xF3
        if(VarName == 'ReplicatedMaterial0')
        {
            StaticMeshComponent.SetMaterial(0, ReplicatedMaterial0);            
        }
        else
        {
            // End:0x136
            if(VarName == 'ReplicatedMaterial1')
            {
                StaticMeshComponent.SetMaterial(1, ReplicatedMaterial1);                
            }
            else
            {
                // End:0x178
                if(VarName == 'ReplicatedMeshTranslation')
                {
                    StaticMeshComponent.SetTranslation(ReplicatedMeshTranslation);                    
                }
                else
                {
                    // End:0x1BA
                    if(VarName == 'ReplicatedMeshRotation')
                    {
                        StaticMeshComponent.SetRotation(ReplicatedMeshRotation);                        
                    }
                    else
                    {
                        // End:0x203
                        if(VarName == 'ReplicatedMeshScale3D')
                        {
                            StaticMeshComponent.SetScale3D(ReplicatedMeshScale3D / 100.0000000);                            
                        }
                        else
                        {
                            // End:0x246
                            if(VarName == 'bForceStaticDecals')
                            {
                                StaticMeshComponent.SetForceStaticDecals(bForceStaticDecals);                                
                            }
                            else
                            {
                                super.ReplicatedEvent(VarName);
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function OnSetMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForce;

    // End:0x292
    if(int(Action.MeshType) == int(0))
    {
        bForce = (Action.bIsAllowedToMove == StaticMeshComponent.bForceStaticDecals) || Action.bAllowDecalsToReattach;
        // End:0x292
        if((Action.NewStaticMesh != none) && (Action.NewStaticMesh != StaticMeshComponent.StaticMesh) || bForce)
        {
            LightEnvironment.bCastShadows = false;
            LightEnvironment.SetEnabled(true);
            bForceStaticDecals = !Action.bIsAllowedToMove;
            StaticMeshComponent.SetForceStaticDecals(bForceStaticDecals);
            StaticMeshComponent.bAllowDecalAutomaticReAttach = Action.bAllowDecalsToReattach;
            StaticMeshComponent.SetStaticMesh(Action.NewStaticMesh, Action.bAllowDecalsToReattach);
            StaticMeshComponent.bAllowDecalAutomaticReAttach = true;
            ReplicatedMesh = Action.NewStaticMesh;
            ForceNetRelevant();
        }
    }
    //return;    
}

function OnSetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    StaticMeshComponent.SetMaterial(Action.MaterialIndex, Action.NewMaterial);
    // End:0xB4
    if(Action.MaterialIndex == 0)
    {
        ReplicatedMaterial0 = Action.NewMaterial;
        ForceNetRelevant();        
    }
    else
    {
        // End:0x10A
        if(Action.MaterialIndex == 1)
        {
            ReplicatedMaterial1 = Action.NewMaterial;
            ForceNetRelevant();
        }
    }
    //return;    
}

function SetStaticMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMesh[8388609], NewTranslation, NewRotation, NewScale3D;

    StaticMeshComponent.SetStaticMesh(NewMesh);
    StaticMeshComponent.SetTranslation(NewTranslation);
    StaticMeshComponent.SetRotation(NewRotation);
    // End:0xCF
    if(!IsZero(NewScale3D))
    {
        StaticMeshComponent.SetScale3D(NewScale3D);
        ReplicatedMeshScale3D = NewScale3D * 100.0000000;
    }
    ReplicatedMesh = NewMesh;
    ReplicatedMeshTranslation = NewTranslation;
    ReplicatedMeshRotation = NewRotation;
    ForceNetRelevant();
    //return;    
}

simulated function CanBasePawn()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x56
    if(bPawnCanBaseOn || (bSafeBaseIfAsleep && StaticMeshComponent != none) && !StaticMeshComponent.RigidBodyIsAwake())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event Attach()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], P;

    super.Attach(Other);
    // End:0x50
    if(bSafeBaseIfAsleep)
    {
        P = Pawn(Other);
        // End:0x50
        if(P != none)
        {
            SetPhysics(0);
        }
    }
    //return;    
}

event Detach()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL P, Test;
    local /*0x35EA0000-0x00000000*/ private bool bResetPhysics;

    super.Detach(Other);
    P = Pawn(Other);
    // End:0xEA
    if(P != none)
    {
        bResetPhysics = true;
        Idx = 0;
        J0x55:

        // End:0xD8 [Loop If]
        if(Idx < Attached.Length)
        {
            Test = Pawn(Attached[Idx]);
            // End:0xCA
            if((Test != none) && Test != P)
            {
                bResetPhysics = false;
                // [Explicit Break]
                goto J0xD8;
            }
            Idx++;
            // [Loop Continue]
            goto J0x55;
        }
        J0xD8:

        // End:0xEA
        if(bResetPhysics)
        {
            SetPhysics(10);
        }
    }
    //return;    
}

final simulated function SetLightEnvironmentToNotBeDynamic()
{
    // End:0x30
    if(LightEnvironment != none)
    {
        LightEnvironment.bDynamic = false;
    }
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__DynamicSMActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0 class=Class'StaticMeshComponent'
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__DynamicSMActor.KynapseObstacle0'
    begin object name=KynapseObstacle0 class=Class'KynapseObstacleComponent'
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__DynamicSMActor.MyLightEnvironment'
    begin object name=MyLightEnvironment class=Class'DynamicLightEnvironmentComponent'
    end object
    LightEnvironment=MyLightEnvironment
    bPawnCanBaseOn=true
    bDisableKynapseObstacleOnStartUp=true
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bShadowParented=true
    bGameRelevant=true
    bEdShouldSnap=true
    bPathColliding=true
    CollisionComponent=StaticMeshComponent0
}