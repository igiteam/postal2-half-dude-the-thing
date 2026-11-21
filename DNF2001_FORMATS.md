A short list documenting the art assets contained in the October 2001 build of
Duke Nukem Forever, and how to extract them to more common formats.

Format conversion status:

- [Textures (.DTX)](https://erysdren.me/docs/dnf2001/#textures-dtx) \- Fully Converted
- [Models (.CPJ)](https://erysdren.me/docs/dnf2001/#models-cpj) \- Partially Converted
- [Videos (.SMK)](https://erysdren.me/docs/dnf2001/#videos-smk) \- Fully Converted
- [Sounds (.DFX)](https://erysdren.me/docs/dnf2001/#sounds-dfx) \- Fully Converted
- [Levels (.DNF)](https://erysdren.me/docs/dnf2001/#levels-dnf) \- Partially Converted

## Textures (.DTX)

Textures are stored in .DTX files, which are renamed versions of .UTX files, a
common Unreal Engine format. They can be easily extracted with a simple batch
script and UCC.

To extract the files, copy the code below into a text file with the .bat
extension in the Textures folder of the build, then run it.

```
:: Path to ucc.exe from the DNF build.
set ucc=C:\Duke4\System\ucc.exe

:: Output directory.
set out=C:\Duke4\Textures_BMP\

:: Output format. You won't have to change this.
set fmt=Texture bmp

:: Create output folder.
md %out%

:: Loop through all .DTX files
for /R %%f in (*.dtx) do start /W %ucc% batchexport "%%f" %fmt% %out%%%~nf\
```

This script will produce 8-bit .BMP files of every texture in the build.

Remember to update the directories to reflect your installation!

## Models (.CPJ)

Models are stored in .CPJ files, which stands for Cannibal ProJect. CannibalEd
was the tool that 3DRealms used to create models for Duke Nukem Forever around
2001.

At time of writing, the format has not been fully cracked, and no batch export
is possible.

However, DNF2001 Community Discord user pazoo has created a basic Blender
plugin that allows users to import mesh data. Animations and skeletons are
currently not supported. You can download the plugin here:

https://github.com/patwork/io\_mesh\_cannibal

![](https://erysdren.me/images/cpj01.png)

![](https://erysdren.me/images/cpj02.png)

![](https://erysdren.me/images/cpj03.png)

## Videos (.SMK)

Videos are stored in .SMK files, which are a predecessor to the Bink video
format.

To convert them to another format, you'll need to download the RAD Video Tools.

After installation, you can run radvideo64.exe and navigate to the
`/Textures/smk/`. After doing that, select all of the .SMK files and then hit
"Convert" and select "Yes" on the popup.

You can set the export settings however you like, but I tend to turn off audio
(the video files don't contain any, anyways) and set the export format to MP4.

After you're done tinkering with the settings, hit the "Batch" button and then
hit "Start". It will take a while, but once it is done you'll have converted
versions of all video files from the build.

![](https://erysdren.me/images/radvideo01.png)

![](https://erysdren.me/images/radvideo02.png)

![](https://erysdren.me/images/radvideo03.png)

## Sounds (.DFX)

Sounds in this build are stored in .DFX files, which can again be extracted
with UCC.

This script is almost identical to the one I wrote for the textures, since it
also uses UCC.

To extract the files, copy the code below into a text file with the .bat
extension in the Sounds folder of the build, then run it.

```
:: Path to ucc.exe from the DNF build.
set ucc=C:\Duke4\System\ucc.exe

:: Output directory.
set out=C:\Duke4\Sounds_WAV\

:: Output format. You won't have to change this.
set fmt=Sound wav

:: Create output folder.
md %out%

:: Loop through all .DFX files
for /R %%f in (*.dfx) do start /W %ucc% batchexport "%%f" %fmt% %out%%%~nf\
```

This script will produce .WAV files of every sound in the build.

Remember to update the directories to reflect your installation!

## Levels (.DNF)

Level data is stored in .DNF files, which are an extended version of the old
Unreal .UNR format. There's no importer for this format explicitly, but with a
few simple steps you can import level geometry into Blender.

To do this, download the Blender .T3D import script from Clinton's 3D
Creations.

The .T3D format is an intermediary level format used by old Unreal Engine games
to easily transfer level data between different versions of the engine.

To export Duke Nukem Forever 2001 levels to .T3D, open up any level in the
DukeEd program in the game's System folder. It's very buggy and slow, but if
you get the level loaded successfully, you can go to File -> Export and save it
as a .T3D file.

After exporting the level file and installing the Blender plugin, you can go to
File -> Import -> .T3D in Blender and select the file you exported. The
subtractive BSP of the Unreal Engine usually fails to import properly, but all
of the additive brushes will load just fine, UVs and all. On a larger map file,
Blender may freeze for several minutes as it imports the data.

![](https://erysdren.me/images/dukeed01.png)

![](https://erysdren.me/images/dukeed02.png)

![](https://erysdren.me/images/dukeed03.png)

![](https://erysdren.me/images/dukeed04.png)