Far Cry Fire Propagation System — Summary
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
