// ThingFireGrid.uc
// A spatial fire propagation manager inspired by Far Cry 2's system.
// Attach to a FlammableZone actor or spawn dynamically on first fire damage.

class ThingFireGrid extends Actor
    placeable;

// --- Grid Configuration ---
struct FireCell
{
    var vector  WorldPos;
    var float   HitPoints;
    var float   MaxHitPoints;      // Material resistance
    var float   BurnLifetime;      // How long it burns once ignited
    var float   CurrentBurnTime;
    var bool    bBurning;
    var bool    bDisabled;         // Under rock, underwater, etc.
    var int     GridX, GridY;      // For neighbor lookup
};

var() array<FireCell> Cells;
var() int GridWidth, GridHeight;
var() float CellSize;              // World units per cell
var() float BaseDamagePerTick;     // Damage a burning cell deals to neighbors
var() float TickInterval;          // How often to process (0.1 = 10Hz)

// --- Economy ---
var() int SpreadingPoints;         // Budget from the ignition source (Molotov, etc.)
var() int CostPerIgnition;         // Points consumed per cell lit (e.g., 8)

// --- Environmental ---
var() vector WindDirection;        // Can be set by a WeatherManager
var() float WindInfluence;         // 0-1, how strongly wind affects spread

// --- Runtime ---
var float AccumulatedTime;
var array<FireCell> BurningCells;  // Quick access list

// --- AABB Broadcast ---
var array<Box> BroadcastGroups;    // Merged AABBs for event optimization
var float BroadcastInterval;

function PostBeginPlay()
{
    Super.PostBeginPlay();
    // Optional: Build grid immediately if this is a pre-placed zone.
    // Otherwise, call BuildGrid() when first damaged by fire.
}

// Called when the zone takes fire damage (e.g., from a flamethrower).
// DamageSource is where the fire started.
function IgniteAt(vector DamageSource, int IgnitionBudget)
{
    if (Cells.Length == 0)
        BuildGrid(); // Dynamic creation on first fire

    SpreadingPoints = IgnitionBudget;

    // Find nearest cell to DamageSource and damage it.
    local int NearestIdx;
    NearestIdx = FindNearestCell(DamageSource);
    if (NearestIdx >= 0 && !Cells[NearestIdx].bDisabled)
    {
        Cells[NearestIdx].HitPoints -= 100.0; // Enough to ignite immediately
        if (Cells[NearestIdx].HitPoints <= 0)
            IgniteCell(NearestIdx);
    }
}

function BuildGrid()
{
    // 1. Determine bounding box of the flammable zone.
    // 2. Divide into Cells (2D for ground, 3D for objects).
    // 3. For each cell, trace/check against BlockingVolumes, water, etc.
    //    Set bDisabled = true if blocked.
    // 4. Populate Cells array with WorldPos, MaxHitPoints (material-based).
}

function IgniteCell(int CellIdx)
{
    if (Cells[CellIdx].bDisabled) return;
    if (Cells[CellIdx].bBurning) return;
    if (SpreadingPoints < CostPerIgnition) return; // Out of budget!

    Cells[CellIdx].bBurning = true;
    Cells[CellIdx].CurrentBurnTime = Cells[CellIdx].BurnLifetime;
    SpreadingPoints -= CostPerIgnition;
    BurningCells.AddItem(Cells[CellIdx]);

    // Spawn a visual fire emitter here (Postal 2 has FireEmitter classes).
    SpawnFireEmitter(Cells[CellIdx].WorldPos);

    // Broadcast the "I'm burning" event to nearby actors (AI, barrels, etc.)
    BroadcastBurnEvent(Cells[CellIdx].WorldPos);
}

function Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);
    AccumulatedTime += DeltaTime;

    if (AccumulatedTime < TickInterval)
        return;
    AccumulatedTime = 0.0;

    local int i;
    local FireCell CurrentCell;
    local array<int> NeighborIndices;

    // Process burning cells.
    for (i = 0; i < BurningCells.Length; i++)
    {
        CurrentCell = BurningCells[i];

        // 1. Damage neighbors (with wind/gravity scaling).
        NeighborIndices = GetNeighborIndices(CurrentCell.GridX, CurrentCell.GridY);
        foreach NeighborIndices as int NIdx
        {
            if (!Cells[NIdx].bBurning && !Cells[NIdx].bDisabled)
            {
                Cells[NIdx].HitPoints -= CalculateNeighborDamage(CurrentCell, Cells[NIdx]);
                if (Cells[NIdx].HitPoints <= 0)
                    IgniteCell(NIdx);
            }
        }

        // 2. Tick down burn lifetime.
        Cells[i].CurrentBurnTime -= TickInterval;
        if (Cells[i].CurrentBurnTime <= 0)
        {
            Cells[i].bBurning = false;
            BurningCells.RemoveItem(Cells[i]);
            // Optionally, mark cell as "burnt" and disable it permanently.
        }
    }

    // Update AABB broadcast groups (merge/split as needed).
    UpdateBroadcastGroups();
}

function float CalculateNeighborDamage(FireCell Burning, FireCell Neighbor)
{
    local vector Dir;
    local float DotWind, DamageScale;

    Dir = Normal(Neighbor.WorldPos - Burning.WorldPos);
    DotWind = Normal(WindDirection) Dot Dir;

    // Far Cry-style: 1.0 base, more downwind, less upwind.
    DamageScale = FClamp(1.0 + (DotWind * WindInfluence), 0.2, 2.0);

    // Add gravity influence (fire climbs faster).
    // DotGravity = Normal(vect(0,0,-1)) Dot Dir; ... similar scaling.

    return BaseDamagePerTick * DamageScale;
}

function BroadcastBurnEvent(vector BurnPos)
{
    // Use an Actor iterator or a custom event system to notify:
    // - Pawns within radius (trigger FearLevel spikes, Thing transformations)
    // - Other ThingFireGrids (cross-zone ignition, e.g., barrel rolls into grass)
    // - Destructible actors (barrels explode, walls collapse)
}
