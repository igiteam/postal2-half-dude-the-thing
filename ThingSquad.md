You're right — the key feature to study is dynamic recruitment, not just how HL2's existing squad members follow the player.

In Half-Life 2, ordinary friendly NPCs can be added to the player's squad at runtime. The squad is not simply a fixed array of NPCs spawned together: NPCs have squad membership, a shared squad object, a leader, and tactical-slot coordination. The NPC also has to be eligible to join; being friendly nearby does not automatically make every NPC a recruit. 
GitHub+1


That changes the design I recommend for Postal 2: we should build a recruitable player squad, where the player is the commander and compatible NPCs can be recruited, dismissed, and managed dynamically.
What HL2 actually does
I’ve now read the core squad implementation in the Source SDK: ai_squad.cpp, ai_squad.h, ai_squadslot.cpp, and ai_basenpc_squad.cpp.

The important mechanics are:
1. A squad manager creates or finds a squad. CAI_SquadManager::FindCreateSquad() looks up a squad by name, creates it if needed, then adds the NPC.
2. An NPC can join dynamically. CAI_Squad::AddToSquad() checks that the NPC exists and is alive, removes it from its previous squad if necessary, adds it to the new squad, and sets its squad reference and name.
3. Recruitment shares enemy knowledge. When a new NPC joins, HL2 copies the existing squad's remembered enemy information to that NPC. This is a particularly useful detail: recruits can join an ongoing fight without behaving as if they know nothing.
4. The squad has a real leader and membership rules. HL2 distinguishes silent members from ordinary members. Its leader is derived from the first non-silent member when the squad has more than one non-silent member.
5. Combat slots prevent everyone doing the same thing. NPCs request strategy slots; if a slot is occupied, another NPC cannot claim it. Slots are tracked per enemy in this SDK configuration.
6. Death and dismissal clean up membership. Removing an NPC clears its squad reference and name; death removal also notifies the remaining members.
Sources: squad manager and membership, squad data structure, NPC squad integration.
How I'd translate that into Postal 2
I'd implement these features:
HL2 feature	Postal 2 implementation
Player squad	One persistent ThingSquad belonging to the player
AddToSquad()	RecruitNPC()
RemoveFromSquad()	DismissNPC()
GetLeader()	Player is commander; optional NPC leader for autonomous behaviour
Enemy memory sharing	Copy the recruit's current enemy/target information into squad state
Strategy slots	Assign unique combat roles and positions
Squad follow	Each recruited NPC follows the player using Postal 2 navigation
Squad death cleanup	Remove dead NPCs and update the remaining roster

Recruitment should work like this
1. The player approaches an eligible friendly NPC.
2. The player uses an interaction key or recruitment command.
3. The system checks whether that NPC can be recruited, whether it is alive, and whether the squad has room.
4. The NPC joins the player's squad.
5. The NPC switches to squad-follow behaviour.
6. When combat starts, it receives the shared enemy information and chooses an available tactical role.
7. The player can dismiss it, and it returns to its normal behaviour.
I'd also make recruitment extensible: different NPC classes can opt in, with optional restrictions such as faction, trust, infection, or whether they're already assigned to another group.

One important distinction: HL2's squad manager is not itself the recruitment interaction. It handles membership after another system decides an NPC should join. The player-command and NPC eligibility logic need to be implemented separately. The SDK exposes commandability and auto-summoning as separate NPC capabilities. 
GitHub+1


For the mod, I'd therefore separate the code into:
- ThingSquad.uc — owns membership, recruitment, dismissal, squad capacity, shared enemy and orders.
- ThingSquadController.uc — controls each recruited NPC's following and combat behaviour.
- ThingSquadRecruitment.uc — handles finding eligible nearby NPCs and recruiting them.
- ThingSquadHud.uc — displays recruited members and their status.
The existing SquadMembers array in ThingSquadController should move into ThingSquad, rather than every NPC maintaining its own copy of the roster.

That's the architecture I'd build: walk up to ordinary compatible NPCs, recruit them into your group, and have them behave as a coordinated HL2-style squad — rather than requiring specially spawned squad members.
