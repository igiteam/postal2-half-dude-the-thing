# postal2-half-dude-the-thing

# Postal 2: Half Dude - The Thing Remake

A total conversion mod for Postal 2 that fuses the free-roam sandbox chaos of Postal 2 with the unscripted paranoia and survival horror of *The Thing* (2002) and the atmosphere of Half-Life 2's Ravenholm.

## Github Treeview
[https://api.github.com/repos/igiteam/postal2-half-dude-the-thing/git/trees/main?recursive=1
](https://api.github.com/repos/igiteam/postal2-half-dude-the-thing/git/trees/main?recursive=1)

## Postal2 Half Dude mod - the base of the gameplay
[![Watch the video](https://img.youtube.com/vi/0WzzNyDDbVI/maxresdefault.jpg)](https://www.youtube.com/watch?v=0WzzNyDDbVI)
[![The Thing PC Redump](https://archive.org/download/thing-pc-redump/img.jpg)](https://archive.org/details/thing-pc-redump)

## Concept

This is not a linear horror game. It is a **paranoia sandbox**. The player is dropped into a sprawling, snowed-in environment (based on The Thing's Antarctic outpost) with a squad of NPCs who have their own lives, schedules, and secrets.

Nobody knows who is infected. There are no cutscenes that reveal the monster. The horror is emergent, created by the simulation itself. You recruit people. You blood-test them. You watch them break down under fear. And sometimes, you're too late.

## Core Pillars

### 1. Free-Roam Paranoia
- **Living NPCs**: Postal 2's native AI gives every NPC a schedule and a personality. They wander, they talk, they react.
- **Unscripted Infection**: 25% of NPCs are secretly infected. The infection timer is random. You never know when someone will turn.
- **No Scripted Scares**: The game does not tell you when someone is a Thing. You have to figure it out.

### 2. The Squad System (HL2 Inspired)
- **Recruitment**: You can ask NPCs to join your squad. If their `TrustLevel` is high enough, they follow you.
- **Shared Risk**: Every squad member is a potential threat. Do you bring your most trusted ally into the dark basement, or leave them upstairs with the others?
- **Squad Tactics**: NPCs use morale-based tactics (advance, fallback, flank, charge) inspired by *Medal of Honor: Pacific Assault*.

### 3. The Psychology Engine (The Thing Inspired)
- **TrustLevel (0-100)**: Increases when you heal them or pass a blood test. Decreases when you point a gun at them or kill a human.
- **FearLevel (0-100)**: Spikes when they see a monster or a corpse. Decays slowly over time.
- **ParanoiaLevel (0-100)**: Rises when you hold a weapon nearby. Makes NPCs jumpy and unpredictable.
- **MoraleLevel (0-19)**: A *MoHPA*-inspired combat stress meter. Low morale = panic. High morale = confidence.

### 4. The Blood Test
- The player's only tool for revealing the truth.
- Trace forward, use the test, and wait for the result.
- If the NPC is human: Trust increases, Fear decreases.
- If the NPC is a Thing: It transforms immediately and attacks.
- **Limited Uses**: You can't test everyone. You have to make choices.

### 5. The Thing Monster
- When an NPC's infection timer hits zero, they transform.
- The `ThingMonster` is a relentless melee hunter with high health and brutal damage.
- It screams when it spawns. It roars when it's hurt. It does not stop.

### 6. The Suicide System (Call of Cthulhu Inspired)
- If an NPC's `FearLevel` stays above 85 for more than 5 seconds, they snap.
- They play a scream, a gunshot, and then they kill themselves.
- Witnessing a suicide broadcasts fear to all nearby NPCs, potentially causing a chain reaction.
- **Visual Effects**: Screen blood overlays (via `ThingHUD`) and camera shakes make the moment visceral.

### 7. The Weapon Feel (Nightfire PS2 Inspired)
- **Sway**: The gun bobs as you walk, using the exact sine-wave math from Nightfire PS2.
- **Recoil**: A snappy kick that decays by 25% per frame.
- **ADS (Aim Down Sights)**: A smooth 10-frame transition to iron sights, using the exact smoothstep formula from Nightfire PS2.
- **Dead-Zone Free Aim**: The gun moves within a dead zone before the camera turns, giving the "Wii-style" feel.

### 8. The Fire System (Postal 2 Native)
- Postal 2's fire propagation is excellent for a *Thing* game.
- Fire spreads. NPCs catch fire. Things burn.
- The flamethrower is not just a weapon—it's a tool for survival. But fire is unpredictable. It can spread to your own shelter.

### 9. Facial Animation (WIP)
- **Goal**: Use extracted DigiMask textures from The Thing PS2 to create varied facial expressions.
- **Technique**: UV-scrolling texture layers (Max Payne / SWAT 3 style) with masks.
- **Fallback**: Pre-baked `MaterialSequence` swaps or bone-based eye/jaw animation.

## Technical Foundation

### Engine
- **Unreal Engine 2** (Postal 2's modified engine).
- **Editor**: POSTed (Postal 2 Editor).

### Core UnrealScript Classes
| Class | Purpose |
|-------|---------|
| `ThingGameInfo.uc` | Injects custom AI into Postal 2's maps. |
| `ThingSquadController.uc` | The AI brain (Trust, Fear, Paranoia, Infection). |
| `ThingRecruitTrigger.uc` | The interaction for recruiting NPCs. |
| `ThingBloodTest.uc` | The blood test item. |
| `ThingMonster.uc` | The creature body (health, attacks, animations). |
| `ThingMonsterController.uc` | The hunting AI. |
| `ThingWeapon.uc` | The Nightfire-style weapon feel (sway, recoil, ADS). |
| `TheThingSuicideSystem.uc` | The sanity/suicide manager. |
| `ThingHUD.uc` | The paranoia HUD (trust/fear bars, screen effects). |

### Asset Pipeline
1. **Models**: Extract from PS2 ISO → Blender → `.psk` / `.psa` → POSTed.
2. **Textures**: Extract → `.dds` / `.tga` → `.utx` → POSTed.
3. **Sounds**: Extract → `.wav` (22050 Hz, 16-bit, mono) → `.uax` → POSTed.
4. **Maps**: Rebuild manually in POSTed (no converter from PS2 format).

### Reference Links
- [https://archive.org/details/postal2_202004](https://archive.org/details/postal2_202004)
- [https://archive.org/details/thing-pc-redump](https://archive.org/details/thing-pc-redump)
- [https://github.com/kizoky/p2unrealscript](https://github.com/kizoky/p2unrealscript)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=558183480](https://steamcommunity.com/sharedfiles/filedetails/?id=558183480)
- [https://www.moddb.com/mods/chrzans-widescreen-fix-for-stp-and-aw/downloads/widescreen-fixes-source](https://www.moddb.com/mods/chrzans-widescreen-fix-for-stp-and-aw/downloads/widescreen-fixes-source)
- [https://github.com/Jeffsteelflex/nightfire-port](https://github.com/Jeffsteelflex/nightfire-port)
- [http://fallout.bplaced.net/gameserver/mohpa/files/mohpa_mdk/ai_and_scripting/class_reference.html](http://fallout.bplaced.net/gameserver/mohpa/files/mohpa_mdk/ai_and_scripting/class_reference.html)
- [https://www.moddb.com/games/postal-2/tutorials](https://www.moddb.com/games/postal-2/tutorials)
- [https://beyondunrealwiki.github.io/pages/unrealscript-lessons.html](https://beyondunrealwiki.github.io/pages/unrealscript-lessons.html)
- [https://github.com/BeyondUnrealWiki/BeyondUnrealWiki.github.io](https://github.com/BeyondUnrealWiki/BeyondUnrealWiki.github.io)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=259272369](https://steamcommunity.com/sharedfiles/filedetails/?id=259272369)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=257870337](https://steamcommunity.com/sharedfiles/filedetails/?id=257870337)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=627130941](https://steamcommunity.com/sharedfiles/filedetails/?id=627130941)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=1358868268](https://steamcommunity.com/sharedfiles/filedetails/?id=1358868268)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=545318800](https://steamcommunity.com/sharedfiles/filedetails/?id=545318800)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=472643736](https://steamcommunity.com/sharedfiles/filedetails/?id=472643736)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=737631813](https://steamcommunity.com/sharedfiles/filedetails/?id=737631813)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=738015266](https://steamcommunity.com/sharedfiles/filedetails/?id=738015266)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=768635358](https://steamcommunity.com/sharedfiles/filedetails/?id=768635358)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=791667661](https://steamcommunity.com/sharedfiles/filedetails/?id=791667661)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=3334953346](https://steamcommunity.com/sharedfiles/filedetails/?id=3334953346)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=2046034789](https://steamcommunity.com/sharedfiles/filedetails/?id=2046034789)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=2065382489](https://steamcommunity.com/sharedfiles/filedetails/?id=2065382489)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=2120417616](https://steamcommunity.com/sharedfiles/filedetails/?id=2120417616)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=3424785863](https://steamcommunity.com/sharedfiles/filedetails/?id=3424785863)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=3624720973](https://steamcommunity.com/sharedfiles/filedetails/?id=3624720973)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=3689128517](https://steamcommunity.com/sharedfiles/filedetails/?id=3689128517)
- [https://steamcommunity.com/sharedfiles/filedetails/?id=3774314243](https://steamcommunity.com/sharedfiles/filedetails/?id=3774314243)
- [http://fallout.bplaced.net/gameserver/mohpa/files/mohpa_mdk/ai_and_scripting/ai_and_scripting_topics.htm](http://fallout.bplaced.net/gameserver/mohpa/files/mohpa_mdk/ai_and_scripting/ai_and_scripting_topics.htm)
- [https://treegit.macosxjs.com/?url=https://github.com/Jeffsteelflex/nightfire-port](https://treegit.macosxjs.com/?url=https://github.com/Jeffsteelflex/nightfire-port)
- [https://treegit.macosxjs.com/?url=https://github.com/kizoky/p2unrealscript](https://treegit.macosxjs.com/?url=https://github.com/kizoky/p2unrealscript)

## The Ultimate POSTAL 2 Mods Installation Guide
[![The Ultimate POSTAL 2 Mods Installation Guide](https://img.youtube.com/vi/MMkF9aJnUSk/maxresdefault.jpg)](https://www.youtube.com/watch?v=MMkF9aJnUSk&t=7s)
## Postal 2 video tutorials
[![Postal 2 Editor Tutorials](https://img.youtube.com/vi/THaRzdtM5RY/hqdefault.jpg)](https://www.youtube.com/playlist?list=PLzlHQaNpSPoVHU1drEgjgEsZmX9DkNbBx)

## The Thing Editor & Modding
[![The Thing Editor Files](https://media.moddb.com/cache/images/downloads/1/181/180370/thumb_620x2000/thethingeditor.jpg)](https://www.moddb.com/games/the-thing/downloads/editor-files-password-viruspunk)
## How to Mod The Thing with Editor
[How to Mod The Thing with Editor](https://www.moddb.com/games/the-thing/tutorials/how-to-mod-the-thing-with-editor)

## The Thing 1982 OST
- [https://archive.org/details/the-thing-original-motion-picture-soundtrack?webamp=default](https://archive.org/details/the-thing-original-motion-picture-soundtrack?webamp=default)
[![The Thing Soundtrack](https://img.youtube.com/vi/kXBGDf2IDQI/maxresdefault.jpg)](https://www.youtube.com/watch?v=kXBGDf2IDQI&list=RDkXBGDf2IDQI)

## The Thing 1982 
- [https://archive.org/details/the-thing-original-motion-picture-soundtrack?webamp=default](https://archive.org/details/the-thing-original-motion-picture-soundtrack?webamp=default)
- [https://dn710209.ca.archive.org/0/items/the.-thing.-1982.1080p.-blu-ray.x-264-yts.-ag_202409/The.Thing.1982.1080p.BluRay.x264-%5BYTS.AG%5D.mp4](https://dn710209.ca.archive.org/0/items/the.-thing.-1982.1080p.-blu-ray.x-264-yts.-ag_202409/The.Thing.1982.1080p.BluRay.x264-%5BYTS.AG%5D.mp4)

  
## Current Status

- ✅ Design document finalized.
- ✅ Core UnrealScript classes drafted.
- ✅ Asset extraction pipeline identified.
- 🚧 Injection test (first playable prototype) in progress.
- 🚧 Map design (Antarctic outpost) not started.
- 🚧 Facial animation system under research.


[![Postal 2 PC Cover](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/main/postal2-pc-cover.png)](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/main/postal2-pc-cover.png) [![The Thing PS2 Cover](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/main/the-thing-2002-ps2-cover.png)](https://raw.githubusercontent.com/igiteam/postal2-half-dude-the-thing/main/the-thing-2002-ps2-cover.png)

## How to Contribute

1. Clone the repository.
2. Install Postal 2 (version 1409 recommended).
3. Set up POSTed and the UnrealScript compiler (`ucc.exe`).
4. Pick a task from the "Current Status" list.
5. Submit a pull request with your changes.

## License

This is a fan-made total conversion. All assets from *The Thing* (2002) and *Postal 2* belong to their respective copyright holders. This project is non-commercial and for educational/preservation purposes only.
