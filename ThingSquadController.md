# ThingSquadController --- Research and Architecture Document

**Project:** The Paranoia Engine --- *The Thing* remake\
**Target codebase:** Postal 2 / Unreal Engine 2\
**Status:** Proposed architecture and implementation plan\
**Primary source:** Current `ThingSquadController.uc` implementation
supplied for review

------------------------------------------------------------------------

## 1. Purpose

This document records the proposed architecture for expanding the
existing `ThingSquadController` into a modular NPC psychology and
squad-behaviour system.

The controller should remain the central coordinator for an NPC.
Independent gameplay systems should be separated into focused classes so
that they can be developed, tested, debugged and extended independently.

The design draws inspiration from three sources:

-   **The Thing (2002):** trust, fear, paranoia, infection, blood
    testing and transformation.
-   **Medal of Honor: Pacific Assault:** morale, squad orders, tactical
    behaviour and dialogue events.
-   **Postal 2:** the existing `FPSController` is intended to provide
    the underlying AI, movement, navigation and combat functionality.

These inspirations describe the intended design. They do not imply that
code or APIs from the other games can be copied directly into Postal 2.

## 2. Proposed class architecture

### 2.1 Central coordinator

**Class:** `ThingSquadController.uc`

**Role:** Central NPC AI coordinator.

`ThingSquadController` should own or coordinate the NPC's high-level
state and connect the independent gameplay systems. It should decide
when systems are updated and route relevant events between them.

It should not become the implementation location for every individual
mechanic. Trust calculations, fear responses, infection progression,
squad formations and dialogue playback should live in their respective
modules.

### 2.2 Independent systems

  Class                    Responsibility
  ------------------------ --------------------------------
  `ThingTrustSystem`       Trust and loyalty
  `ThingFearSystem`        Fear and panic
  `ThingParanoiaSystem`    Suspicion and reactions
  `ThingMoraleSystem`      Combat morale
  `ThingInfectionSystem`   Infection and testing
  `ThingSquadOrders`       Tactical commands
  `ThingSquadFormation`    Squad positioning and movement
  `ThingDialogueSystem`    Audio and reactions

#### `ThingTrustSystem`

Manages an NPC's trust in the player and potentially other squad
members. It should provide a clear interface for increasing or
decreasing trust and querying whether an NPC is willing to cooperate.

#### `ThingFearSystem`

Manages fear accumulation, reduction and panic-related state. It should
own the conditions that cause an NPC to become frightened, panic, freeze
or flee.

#### `ThingParanoiaSystem`

Manages suspicion and threat interpretation. It should evaluate relevant
observations and events, then communicate resulting reactions to the
controller.

#### `ThingMoraleSystem`

Manages combat morale, morale recovery and morale-related reactions. The
existing implementation uses a 0--19 morale scale inspired by Medal of
Honor: Pacific Assault. That scale is a project design choice and should
be validated against the intended behaviour.

#### `ThingInfectionSystem`

Manages infection state, infection progression, blood-test results and
the transition into transformation. Transformation should be coordinated
safely with the NPC controller and creature-spawning system.

#### `ThingSquadOrders`

Manages tactical commands issued by a squad leader, including:

-   Advance
-   Fallback
-   Flank
-   Charge

It should distribute orders to registered squad members and track the
active order.

#### `ThingSquadFormation`

Manages squad positioning and movement. It should determine where squad
members move relative to the player, leader, other squad members and
tactical objectives.

#### `ThingDialogueSystem`

Manages audio and reactions. It should translate gameplay events into
appropriate dialogue or vocal responses, with suitable priority and
cooldown handling.

### 2.3 Underlying Postal 2 AI

**Base class:** `Postal 2 FPSController`

The proposed controller currently extends `FPSController`. The intention
is to retain the native Postal 2 controller as the underlying movement,
navigation and combat AI foundation.

The exact available functions, properties, lifecycle behaviour and
compatibility of this base class must be verified against the target
Postal 2 source/API before implementation is finalised.

## 3. System relationship

The intended high-level relationship is:

``` text
                 ThingSquadController.uc
                  Central NPC AI coordinator
                            |
       +----------+---------+---------+----------+
       |          |         |         |          |
       v          v         v         v          v
  TrustSystem FearSystem Paranoia MoraleSystem InfectionSystem
       |          |         |         |          |
       +----------+---------+---------+----------+
                            |
                   Squad coordination
                      /          \
                     v            v
              ThingSquadOrders  ThingSquadFormation
                            |
                            v
                   ThingDialogueSystem
                            |
                            v
                 Postal 2 FPSController
            Movement, navigation and combat AI
```

This diagram represents logical responsibilities, not a final
UnrealScript ownership or object-construction design. The implementation
must decide which systems are owned by the controller, which are actors
or objects, and how references are initialised and cleaned up.

## 4. Recommended implementation order

The following order is intended to establish a reliable foundation
before adding more complex gameplay behaviour.

### Phase 1 --- Controller reliability

**Task:** Fix controller references and null checks.

Review all accesses to the controlled Pawn, player controller, player
Pawn, enemy and squad references. Ensure that optional references are
checked before use.

Also verify the correct Postal 2 / UE2 APIs for controller lifecycle
functions, navigation, movement, visibility checks, actor iteration and
spawning.

**Completion goal:** The controller can initialise and update without
relying on assumed non-null references or unverified engine functions.

### Phase 2 --- Squad registration and leadership

**Task:** Implement actual squad registration and leader management.

Provide operations to:

-   Register a squad member.
-   Remove a squad member.
-   Assign or change the squad leader.
-   Handle a leader becoming unavailable or being destroyed.
-   Keep squad-member references valid.
-   Prevent duplicate registrations.

**Completion goal:** Squad membership and leadership remain consistent
as NPCs enter, leave or die.

### Phase 3 --- Squad-wide tactical orders

**Task:** Implement coordinated Advance, Fallback, Flank and Charge
commands.

The leader should issue an order through `ThingSquadOrders`. The order
system should distribute it to valid registered members. Each member
should interpret the command and use the formation/movement system to
carry it out.

**Completion goal:** An order issued by the leader produces coordinated
behaviour across the squad, rather than changing only the leader's local
tactic variable.

### Phase 4 --- Morale and panic

**Task:** Add morale recovery, panic cooldowns and combat reactions.

The morale system should distinguish combat stress from recovery while
safe. Panic reactions should be state-aware and should not repeatedly
trigger dialogue or panic actions every update.

**Completion goal:** Morale changes over time predictably, and low
morale produces controlled, testable reactions.

### Phase 5 --- Trust and fear reactions

**Task:** Implement trust and fear responses to player actions.

Relevant events should be able to affect trust and fear. Examples
include healing, supplying ammunition, threatening squad members,
witnessing frightening events and seeing a Thing creature.

Keep trust and fear as separate values with separate rules and
consequences.

**Completion goal:** NPC cooperation and emotional reactions respond
consistently to gameplay events.

### Phase 6 --- Infection and transformation

**Task:** Implement infection progression and actual transformation.

The infection system should own infection state and progression. When
transformation is triggered, it should coordinate the creation of the
creature and the safe removal or replacement of the human NPC.

The current placeholder transformation code is not a complete
implementation.

**Completion goal:** An infected NPC can transition into a Thing
creature without leaving duplicate actors, invalid references or
inconsistent squad membership.

### Phase 7 --- Blood-test interactions

**Task:** Add blood-test interactions.

The interaction should request a result from `ThingInfectionSystem` and
communicate that result to the player and relevant NPCs. Human
confirmation and infection discovery should have clearly defined
consequences.

**Completion goal:** Blood testing is a real gameplay interaction rather
than a direct test of a controller variable from unrelated code.

### Phase 8 --- Creature fragmentation

**Task:** Add creature fragmentation and independent creature AI.

Fragmentation should be treated as a separate creature-system feature.
Each surviving fragment will need its own actor lifecycle and
appropriate movement, health and AI behaviour. The relationship between
the original creature and its fragments must be defined.

**Completion goal:** Fragments can survive and act independently
according to the intended creature design.

## 5. Technical verification required

Before rewriting or expanding the code, confirm the exact compiler and
API target.

**Key question: Is this being compiled against the original Postal 2
Unreal Engine 2 codebase, using its native `FPSController` class?**

This must be established before implementation because UnrealScript
dialects and game-specific APIs differ. A function that appears
plausible in generic UnrealScript may not exist in the Postal 2
codebase.

Verify at least:

-   The exact `FPSController` class declaration and inherited API.
-   Whether the proposed controller lifecycle functions are valid for
    that class.
-   The supported way to obtain the controlled Pawn and local player
    controller.
-   Available navigation and movement functions.
-   Actor spawning and destruction behaviour.
-   Supported object construction and ownership patterns.
-   Supported array operations and language syntax in the target
    compiler.
-   Available audio/dialogue APIs and asset references.

Do not treat example code or API names from Medal of Honor: Pacific
Assault or other Unreal Engine games as proof that the same API exists
in Postal 2.

## 6. Design principles

1.  **Keep the controller as coordinator.** Avoid turning it into a
    monolithic class containing every gameplay rule.
2.  **Separate independent state systems.** Trust, fear, paranoia,
    morale and infection should have distinct responsibilities.
3.  **Use explicit squad membership.** Leadership and membership should
    be managed through registration and cleanup rather than assumed
    references.
4.  **Separate orders from movement.** Orders describe intent;
    formations and movement implement positioning.
5.  **Make reactions state-aware.** Panic, dialogue and transformation
    should not repeatedly trigger because an update function runs every
    frame.
6.  **Verify the target API.** Use the actual Postal 2 headers/source
    and compiler behaviour as the authority.
7.  **Implement incrementally.** Complete and test each phase before
    building dependent systems on top of it.

## 7. Current status and next decision

The existing `ThingSquadController.uc` already sketches infection,
trust, fear, paranoia, morale, tactical orders, blood testing,
transformation and nearby-NPC broadcasts. Several operations remain
placeholders, and the proposed supporting classes have not yet been
established in the supplied implementation.

The immediate next decision is to confirm the target Postal 2 / UE2
compiler and native `FPSController` API. Once confirmed, Phase 1 can be
implemented against the real engine interfaces rather than guessed
function names.
