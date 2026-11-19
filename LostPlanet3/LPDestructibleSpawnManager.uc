class LPDestructibleSpawnManager extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x7E120000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x7E120000-0x00000000*/ private bool bSpawnNearSelf[65537];
var(0.25_Pct) /*0x7E120000-0x00000000*/ private bool bSpawnRandom[65537];
var(0.25_Pct) /*0x7E120000-0x00000000*/ private int MaxAlive[65537];
var(0.25_Pct) /*0x7E120000-0x00000000*/ private float SpawnCheckInterval[65537];
var(0.25_Pct) /*0x7E120000-0x00000000*/ private name DestructiblePropertyName[65537];
var(0.25_Pct) /*0x7E120000-0x00000000*/ private editfixedsize array EnemyTypes[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ManagedDestructibles[536870913];

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetEnabled(bEnabled);
    //return;    
}

function InitManagedDestructibles()
{
    local /*0x97E50000-0x00000000*/ private @NULL DObject, DProperties;

    ManagedDestructibles.Length = 0;
    // End:0x106
    foreach DynamicActors(Class'SPGameFramework.SPGFDestructibleObject', DObject)
    {
        // End:0x105
        if(DObject.IsAlive() && DObject.UserDestructComponent != none)
        {
            DProperties = SPDestructibleProperties(DObject.UserDestructComponent.GetProperties());
            // End:0x105
            if(DProperties != none)
            {
                // End:0x105
                if(DProperties.Name == DestructiblePropertyName)
                {
                    ManagedDestructibles.AddItem(DObject);                    
                }
            }
        }        
    }    
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x45
    if(inAction.InputLinks[0].bHasImpulse)
    {
        SetEnabled(true);        
    }
    else
    {
        // End:0x8A
        if(inAction.InputLinks[1].bHasImpulse)
        {
            SetEnabled(false);            
        }
        else
        {
            // End:0xD8
            if(inAction.InputLinks[2].bHasImpulse)
            {
                SetEnabled(!bEnabled);
            }
        }
    }
    //return;    
}

function SetEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bNewEnabled[8388609];

    bEnabled = bNewEnabled;
    // End:0x50
    if(bEnabled)
    {
        InitManagedDestructibles();
        SetTimer(SpawnCheckInterval, true, 'TrySpawn');
        TrySpawn();        
    }
    else
    {
        ManagedDestructibles.Length = 0;
        ClearTimer('TrySpawn');
    }
    //return;    
}

function TrySpawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL A;
    local /*0x97E50000-0x00000000*/ private class EnemyType;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectToDestroy, DestructProperties;
    local /*0x97E50000-0x00000000*/ private class DamageTypeToUse;
    local /*0x97E50000-0x00000000*/ private float MinDistance, CurDistance;
    local /*0x97E50000-0x00000000*/ private int NumAlive, I;

    // End:0x1D
    if(ManagedDestructibles.Length == 0)
    {
        SetEnabled(false);
        return;
    }
    NumAlive = 0;
    // End:0x91
    foreach EnemyTypes(EnemyType)
    {
        // End:0x8F
        foreach DynamicActors(EnemyType, A)
        {
            // End:0x8E
            if(Pawn(A).IsAliveAndWell())
            {
                NumAlive++;
            }            
        }                
    }    
    // End:0x354
    if(NumAlive < MaxAlive)
    {
        ObjectToDestroy = ManagedDestructibles[0];
        // End:0x1BA
        if(bSpawnNearSelf)
        {
            MinDistance = VSize(ObjectToDestroy.Location - Location);
            I = 1;
            J0x10B:

            // End:0x1B7 [Loop If]
            if(I < ManagedDestructibles.Length)
            {
                CurDistance = VSize(ManagedDestructibles[I].Location - Location);
                // End:0x1A9
                if(CurDistance < MinDistance)
                {
                    MinDistance = CurDistance;
                    ObjectToDestroy = ManagedDestructibles[I];
                }
                I++;
                // [Loop Continue]
                goto J0x10B;
            }            
        }
        else
        {
            // End:0x200
            if(bSpawnRandom)
            {
                I = int(FRand() * float(ManagedDestructibles.Length));
                ObjectToDestroy = ManagedDestructibles[I];
            }
        }
        DestructProperties = SPDestructibleProperties(ObjectToDestroy.UserDestructComponent.GetProperties());
        // End:0x2F4
        if((DestructProperties.OnBreakActionLists.Length > 0) && DestructProperties.OnBreakActionLists[0].DamageTypes.Length > 0)
        {
            DamageTypeToUse = class<LPDamageType>(DestructProperties.OnBreakActionLists[0].DamageTypes[0]);
        }
        ManagedDestructibles.RemoveItem(ObjectToDestroy);        
        ObjectToDestroy.TakeDamage(100000, none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), DamageTypeToUse);
    }
    //return;    
}

defaultproperties
{
    bSpawnRandom=true
}