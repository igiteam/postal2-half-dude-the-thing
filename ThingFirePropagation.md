Far Cry Fire Propagation System — Summary
https://jflevesque.com/2012/12/06/far-cry-how-the-fire-burns-and-spreads/

This is Jean-Francois Levesque's 2012 blog post explaining the fire propagation system he architected for Far Cry 2 (and which Far Cry 3 reused). It's highly relevant to your Postal 2 Thing mod's "Fire System" pillar.

Core Concept
A grid-based fire simulation — 2D grid for grass/terrain, 3D grid for objects and trees. No fluid dynamics, no complex physics — just enough realism to maintain suspension of disbelief while staying fast and understandable.

Each grid cell has three essential properties:

World position

Radius

Hitpoints (e.g., 50 HP for a grass cell)

How Fire Starts
Engine tracks all damage (bullets, impacts, fire) and fires a damage event with amount/type/cause.

If damage is fire-based and entity is flammable:

The grid is created dynamically (only when needed — saves memory/disk).

The cell closest to the damage source takes the damage and loses HP.

When a cell loses all HP → it catches fire.

How Fire Spreads
A burning cell becomes a damager itself — it damages neighbor cells sharing an edge, reducing their HP. When they hit zero, they ignite too. That's the propagation front.

Each cell also has a finite burning lifetime (represents material energy — paper burns faster than wood).

Tuning Materials
Environment	Tweak
Wet jungle	↑ Hitpoints (hard to ignite, slow spread) + ↓ burning lifetime (dies out quickly)
Dry grass	↓ Hitpoints + ↑ lifetime
Grid Construction
Grass/Land: Axis-aligned 2D grid projected onto 3D terrain. Cells underwater or under objects (rocks, buildings) are disabled — no fire under a rock.

Objects: AABB surrounds the object → subdivided into equally-spaced cubes → each cube tested against the object's collision shape. Passing cubes are kept; failing ones discarded. Result: a voxel approximation of the object's burnable shape.

Wind Effect (the clever bit)
Get the dot product between the wind direction vector and the direction to the neighbor cell:

Positive → neighbor is downwind → more damage (spreads faster)

Negative → upwind → less damage

Interpolate damage amount by the dot product result

This alone produces a bell-shaped fire front moving with the wind. Gravity is simulated the exact same way.

Chain Reactions
Burning cells broadcast an "I'm on fire, I burn this much in this radius" event down the game event pipeline. Objects, AI, and other systems in range react:

AI freaks out

Flammable objects take damage and eventually ignite

Dynamic objects too — a burning oil barrel flying through the map broadcasts the event every step, igniting everything nearby

This creates systemic chain reactions — trees, explosives, and grass setting each other alight. Behaves as expected, yet sometimes gets totally out of control (like real fire).

Optimization Tricks
"Hair Transplant Strategy"
Limited particle emitters → constantly teleported from behind the camera to where they're needed.

Fire LOD: emitter density higher near player, lower with distance.

If still short on emitters → increase particle sizes to fill more screen volume.

Event Pipeline
Thousands of burning cells all advertising state clogs the CPU.

Fix: regroup burning cells into AABB groups that merge/split/change shape, then send events per AABB instead of per cell.

Additionally spread events across several frames to avoid framerate spikes.

Keeping It Under Control
Without constraints, fire will: burn the whole map, fill memory with grids/emitters, and choke framerate.

His solution: a closed-loop spreading-points economy:

Player throws a Molotov → gives the grass patch e.g. 60 spreading points.

Fire consumes 8 points per fire cell.

So that Molotov propagates ~7 cells before dying.

Two Molotovs → 120 points → ~15 cells → spreads farther.

Realistic enough to entertain, cheap enough to stay in budget.

Relevance to Your Mod
This is a direct blueprint for your "Fire System (Postal 2 Native)" pillar. Your design doc says "Fire spreads. NPCs catch fire. Things burn. The flamethrower is not just a weapon—it's a tool for survival. But fire is unpredictable. It can spread to your own shelter."

Concrete takeaways you could adapt to UnrealScript / UE2:

2D/3D hitpoint grids per flammable actor (dynamically created, disabled cells under rocks/buildings).

Edge-neighbor damage propagation + per-cell burning lifetime for material tuning.

Wind/gravity via dot-product damage scaling — cheap and convincing.

"I'm burning" broadcast events for chain reactions (barrels, trees, NPC panic) — fits your emergent-paranoia design perfectly.

Spreading-points budget so a single flamethrower burst can't burn the whole Antarctic outpost — critical for a survival-horror sandbox where you need the shelter to survive.

AABB grouping + frame-spread events if UE2's event pipeline becomes a bottleneck with many burning cells.

🗺️ Mapping Far Cry's Fire System to Postal 2
The core idea is to create a grid-based propagation manager that sits on top of Postal 2's existing fire damage types. You won't replace the engine's fire; you'll augment it with a spatial simulation that decides where and how fast fire spreads, using Far Cry's hitpoint/lifetime model.

1. Leveraging Postal 2's Native Fire Types
Postal 2 already has fire-related damage classes you can hook into: BurnedDamage, FireExplodedDamage, and OnFireDamage . Your grid's ignition logic can trigger these on actors, or you can use them as the "damage event" that tells your grid a cell should start losing hitpoints.

There is also a Fire package in the Postal 2 source , and a FireEmitterTalk keypoint , which confirms the engine has fire emitters you can spawn for visuals when a grid cell ignites.

2. The ThingFireGrid Actor
Instead of making every flammable object a grid, you create one ThingFireGrid actor per flammable zone (e.g., a patch of snow-grass, a wooden shack, an oil barrel cluster). This actor owns the 2D/3D cell array and runs the simulation in its Tick.

Key design choices for Postal 2:

Dynamic creation: Like Far Cry, only spawn the grid when the zone first takes fire damage . This keeps memory low since most of the Antarctic outpost won't be burning at once.

Disabled cells: When building the grid, do a fast trace or check against BlockingVolumes and static meshes. Mark cells under rocks, inside buildings, or underwater as bDisabled = true. They never ignite.

Spreading points budget: This is critical for your survival-horror design. A flamethrower burst or Molotov gives the grid a budget (e.g., 60 points). Each cell ignition costs points. When the budget hits zero, the fire stops spreading and only burns out what's already lit. This prevents the entire map from burning down and forces the player to use fire tactically rather than as a map-wide eraser.

3. Wind & Gravity (The Dot Product Trick)
Far Cry's wind simulation is elegant and cheap: damage to a neighbor is scaled by the dot product of the wind vector and the direction to that neighbor.

In UnrealScript, inside your Tick when processing a burning cell:

unrealscript
// Pseudo-UnrealScript for wind-scaled damage
local vector WindDir, ToNeighbor;
local float DotResult, DamageScale;

WindDir = Normal(Level.WindDirection); // Or a custom wind vector you control
ToNeighbor = Normal(NeighborCell.WorldPos - BurningCell.WorldPos);
DotResult = WindDir Dot ToNeighbor;

// Scale damage: 1.0 base, up to 2.0 downwind, down to 0.2 upwind
DamageScale = FClamp(1.0 + (DotResult * 1.0), 0.2, 2.0);
NeighborCell.HitPoints -= BurningCell.DamagePerTick * DamageScale;
This gives you the bell-shaped fire front without any fluid dynamics. Gravity works the same way with a downward vector, so fire climbs slopes faster than it descends.

4. The Event Broadcast (Chain Reactions)
When a ThingFireGrid cell ignites, it should broadcast an event. In UnrealScript, you can use a Pawn/Actor iterator within a radius, or leverage the engine's HurtRadius with a custom fire damage type.

For your mod specifically: This broadcast is what triggers your NPC psychology. A burning cell near an NPC should:

Spike their FearLevel

Possibly decrease TrustLevel if they think you started it

If the NPC is a Thing, make it scream and charge (since fire is one of the few things that hurts it)

5. Optimization: AABB Grouping & Frame Spreading
If you have many cells burning (e.g., a large wooden building), don't send an event per cell per tick. Group burning cells into Box structs (min/max corners) and send one event per AABB group per frame. Also, stagger the grid's neighbor-damage processing across multiple ticks if the grid is large (e.g., process every 3rd cell per tick) to avoid CPU spikes.

📝 ThingFireGrid.uc Outline
Here's a structural sketch. It's not compilable as-is—it's a blueprint for you to flesh out in POSTed.

unrealscript
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
🔥 Practical Notes for Your Mod
The Spreading Points budget is your most important gameplay lever. In Far Cry, it prevented map-wide chaos. In your Thing mod, it's thematic:

A single flamethrower burst should be enough to clear a small room or create a temporary fire barrier.

But if you're careless, fire can spread to the generator room or the only exit, cutting off your squad's retreat.

The player has to weigh: "Do I burn this Thing now, knowing the fire might consume our only shelter?"

For the Thing Monster: Fire should deal massive damage to ThingMonster but the monster should also become a fire source while burning, potentially igniting nearby cells and forcing the player to move. This creates the "fire is a tool, but an unpredictable one" feeling from your design doc.

Compilation reminder: When you write these .uc files, remember to delete the relevant .u file (e.g., ThingFireGrid.u) before running ucc make in your Postal2/System folder, or the compiler won't rebuild it .
