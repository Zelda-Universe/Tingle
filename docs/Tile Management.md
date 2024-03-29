Reference:
- https://en.wikipedia.org/wiki/Tiled_web_map
- https://en.wikipedia.org/wiki/Tile_Map_Service

Trying to use cross-platform tools with available source code and batch / command line (CLI) / scriptable interfaces.

Some good file format references and links to tools:
 - http://mk8.tockdom.com
 - http://wiki.tockdom.com
 - https://github.com/handsomematt/botw-modding/blob/master/docs/file_formats
 - https://botw-modding-database.fandom.com/wiki/File_types
 - https://wiki.oatmealdome.me
 - https://gist.github.com/zephenryus/b4dbea17de438a1f9f06779657eb4148

Note: Any scripts that run Image Magick commands, or if you use them yourself, that operate on large files, possibly 200+MiB, will be OOM killed on Linux, but just take a lot of memory and some time on Windows.
https://github.com/ImageMagick/ImageMagick/issues/6264

# Tile Mining


## Placeholder images

### Generating

  - Error:
    - Command: `dev/assets/tiles/generatePHTiles/GenerateErrorTile.fish`
    - Result: `tiles/_placeholder/error.png`

  - Map Fill-In:
    - Standard/Common Choice:
      - Command: `dev/assets/tiles/generatePHTiles/TLOrigin.fish`
      - Config:
        - `zoomLevel`
        - `zoomLevels`
        - `zoomLevelMax`
    - Manual Choice:
      - Command: `dev/assets/tiles/generatePHTiles/Centered.fish`
    - Results: `tiles/_placeholder/[**/]*.png`

### Linking

  - Command: `dev/assets/tiles/placeholderTiles/control.fish`
  - Parameters:
    - `<container/game name>`
    - `<submap name>`
    - `action [link|unlink]`

## Switch titles

  1. Get SARC for certain game data files.
    1. `git clone https://github.com/aboood40091/SARC-Tool`
    1. `pip install SarcLib`
  1. `pip install libyaz0`
  1. Decompress nsp from nsz: `./dev/tiles/switch/common/1_decompress.fish <nsz_path>`.
  1. Extract the ncas from the nsp: `./dev/tiles/switch/common/2_extractNCAs.fish <nsp_path>`.
  1. Use `hactool` to decrypt & extract the romfs from the ncas: `./dev/tiles/switch/common/3_extractRomFSContents.fish <nca_path>`.  You probably only need to do this for the single biggest nca file for any game.

### Breath of the Wild

  1. Convert the sbmaptex/BFRES files to a common image format like PNG, although some tools only support dds..
    - The files are found in `861707001401bbce36c7e421efac76d4.nca/romfs/UI/MapTex/MainField`.
    - I didn't find a tool that worked on the Switch's little endian format, was cross-platform, confidently virus-free, I felt like compiling, worked, or ran in batch, especially on the command line (CLI).
      - I looked at the following:
        - BFRES-Tool
          - `pip install PyQt5`
          - Would not open Switch files.
          - Working for Wii U files, but not in batch.
        - botw-tools
          - MrCheeze's repo does not have extractors.  More just mined data.
          - zephenryus has a parser that just prints name pos, name, string table size, and string table offset, and also may only work for Wii U files as well, but does include neat map compile code for a potential later step.
        - BFRES-Extractor
          - Only for extracting them as archives for other files?
          - Also does not have great virus scan results for some reason, even when self-compiling....
        - BfresLibrary/BfresPlatformConverter from NintenTools
          - Seems to focus only on converting between platforms, not exporting.
        - BFRES-Viewer
          - Breaks on Wii U files, seems to show something with Switch files, but ultimately does not work..
            - Has a todo export option for textures, but could not even recognize the data I gave it..
        - Wexos Toolbox
          - Does not have an export or batch function.
        - ModelThingy
        - NintenTools.Bfres
          - Not an active tool.
          - Support Wii U BFRES formats up to 3.x, but not Switch ones..
        - Switch-Toolbox
          - Works....
          - Only disabled by renaming `Lib/LibTennis32.dll` and `Lib/RG_ETC1.dll` because they showed some trange virus scan results, and the tool still works for our purposes without them!!
        - Syroot Bfres(.py)
          - On GitLab
          - Not an active tool..
    - Try Switch-Toolbox now.
      1. https://github.com/KillzXGaming/Switch-Toolbox/releases
      1. Tools > Batch Export Textures (All Supported Formats)
        - Should be placed under Tools > Textures.
          - Also note the other options here do not apply to the switch version at least.
        1. Select all sbmaptex files and click Open.
        1. Select output folder.
        1. Uncheck all (3) settings.
        1. Select the PNG format and hit Ok.
  1. `./dev/tiles/switch/games/botw/assembleTiles.fish <MapText_extracted_files_output_folder_path>`
    - Warning: The largest resolution mode, with no suffix for the folder, and `_0` for the files, can take an hour for each category being processed.

### Link's Awakening for Switch

  - Use `Switch Toolbox` to:
    - Load the `Game.arc` and `DgnTex.arc` files in the `romfs/region_common/ui` directory.
    - Double-click to load the `Game/timg/__Combined.bntx` and `DgnTex/timg/__Combined.bntx` files.
    - Right-click each of those file nodes in the tree view.
    - Select Extract All Textures.
    - Make a new folder with the same name as the arc file, and the path as the bntx archive.
    - Go inside there.
    - Select the PNG image format.
    - Uncheck all options.
    - Click Ok.
  - For the overworld map, it would use the `FldChip_##^H.png` files.
    - `dev/tiles/switch/games/lafs/assembleOverworldTiles.fish <FldChip_files_folder_path>`
    - Added manual scripts since most are not simple tiles.
    - Chose normal tiles that covered the most area and then filled in the uncompleted holes.  All seem to be the same resolution.
    - Only tested simply overlaying the `OpenMask` tiles.
  - For the dungeon maps:
    - There are the `Lv<dungeon_index><dungeon_name>_##G.png` files that the `dev/tiles/switch/games/lafs/assembleDgnTiles.fish <DgnTex_files_folder_path> <DgnMapGrid_file_path>` script would use.
    - These are be placed on the `DgnMapGrid_00^A.png` file by default in the `Game` folder where the `FldChip_*` files also are for nice effect that the script handles.
    - Assumes 1308x1040 with or without this file being provided, which is 1280x1024 for the map tile grid, plus offsets for padding.
    - Does not support layered dungeon maps yet that I think the other letter suffix format is for.


## Wii U titles

  1. Optionally copy/image entire game disc as a wud file, and then extract that.
    - `dd if=/dev/... of=/path/to/wud`?
    - `wudecrypt /path/to/image.wud /path/to/output_folder /path/to/commonkey.bin /path/to/disckey.bin`
  1. Get the extracted and decrypted game data files
    - Find the files on the internal storage
      - FTPiiu?
        - Which path exactly?  `mlc01`?
      - Or use `dumpling`
        - https://github.com/emiyl/dumpling
    - Or from the disc:
      - `dumpling`
        - https://github.com/emiyl/dumpling
      - `disc2app`
        - https://gbatemp.net/threads/release-disc2app-dump-installable-app-files-from-wiiu-game-disc.460668/
      1. Game package (app) Extraction Choices
          - `fuse-wiiu`
            - https://github.com/Maschell/fuse-wiiu
          - `cdecrypt`
            - https://gbatemp.net/threads/release-cdecrypt-v3-0.554220/
          - `wiiu-things`
            - https://github.com/ihaveamac/wiiu-things

### Breath of the Wild

  1. See similar entry under the Switch titles section with the sbmaptex files found inside `game/00050000101C9500/content/UI/MapTex/MainField`.



# Tile Cutting

## Main

  - Command: `dev/assets/tiles/mapTiles/all.fish`
  - Config:
    - `processZoomLevels`:
      - Type: `SSL int`
      - Possible Values: `0-<maxZoomLevelForImage> ...`
    - `processZoomLevelsMax`:
      - Type: `int`
      - Possible Values: `0-<maxZoomLevelForImage>`
    - `processSteps`
      - Type: `SSL int|string`
      - Possible Values:
        - Mode `Placeholder`:
          - `2`
          - `generateTiles`
        - Mode `Real`:
          - `2|3`
          - `createBaseZoomImages`
          - `cropTiles`
    - `outputAxisFolders`:
      - Type: `boolean`
      - Default: `false`
      - My Default: `true`
    - `resLevelChoice`:
      - Modes: `botw`
      - Type: `int`
      - Possible Values: `(0|1|2|3)`
      
  There is a possibility bad image tiles could be generated in the file system, where the cropping process would fail (be OOM-killed) on Linux, but on Windows will run, until it experiences a more specific problem running out of available file handles to use, creating files without proper IDATs to be saved.
  
  A proper 256x256 32-bit PNG image with only transparent pixels will be 479 bytes, but these will be 189 bytes.
  
  Identifying a file like this with Image Magick will present a Read Exception.
  
  https://stackoverflow.com/questions/17757114/imagemagick-to-verify-image-integrity#comment134216470_17764714
  
  You can clean up these files by running this command: `dev/assets/tiles/mapTiles/cleanBadFiles.fish`.

## History

  Now more of a history section since I finally researched and made scripts to do process the asset files such as cutting and organizing them as preparation.
  - `dev/assets/tiles/mapTiles/allAuto.fish`
    - No great way to program this, so disabled for now.

  Danilo says he used a [modified version of a] script called `tileCreator.js` (14.4 KB).
  I assume it's modified because the original tries to fetch data from a database which we do not use for our map tiles, directly at least.
  I may have found that original here: [tileCreator.js](https://github.com/AnderPijoan/vectorosm/blob/master/tileCreator/tileCreator.js).

  I would like a simpler and less proprietary process, also considering I cannot readily access the file.
  * https://gis.stackexchange.com/questions/285483/how-can-i-convert-an-image-into-map-tiles-for-leafletjs
  * https://wiki.openstreetmap.org/wiki/Creating_your_own_tiles
  So I have found tools like:
  * [geopython/mapslicer](https://github.com/geopython/mapslicer)
    * For my Mac had to do:
      * `brew install wxpython`
      * `brew install gdal`
    * Without experience, couldn't quite get it to work.
      * With or without a specified georeference I thought I found in our JS code, I believe the wizard would not proceed without a valid SRS.
      * Originally I thought I tried one and it was still looking for valid a SRS/XML file beside the input picture file, and would not proceed because it did not find one.
        * Probably I was trying preview and stopped.
        * Even doing this didn't help: https://trac.osgeo.org/gdal/wiki/FAQInstallationAndBuilding#HowtosetGDAL_DATAvariable
          * https://stackoverflow.com/questions/14444310/how-to-set-the-gdal-data-environment-variable-to-point-to-the-directory-containi
      * I tried geodetic and that didn't go too badly, but certainly did not return the results I wanted.  Looks like the origin being bottom left may be the biggest problem, and otherwise maybe specifying the offset, which may be in the SRS definition or rather the georeference properties at the beginning.
      * I set the tile profile to presentation.  I wish that would be enough, and it was have an appropriate SRS in the later list.
    * https://wiki.osgeo.org/wiki/MapSlicer
  * [gdal2tiles.py](https://gdal.org/gdal2tiles.html)
    * For my Mac had to do:
      * `brew install gdal`
    * Interesting leaflet fork, we may be using the top-left non-standard mapping origin.
      * [commenthol/gdal2tiles-leaflet](https://github.com/commenthol/gdal2tiles-leaflet)
        * Good invocation: `./gdal2tiles-leaflet-master/gdal2tiles.py -w none --resume -l -p raster -z '0-8' "$file" tiles`
    * https://wiki.openstreetmap.org/wiki/GDAL2Tiles
    * Without experience, couldn't quite get it to work.
      * Created some weird tiles that were blank and made multiple grided copies with lots of negative space in between, so actually tiles in each single image..
      * Thought a good invocation would be: `gdal2tiles.py -w none --resume -p raster -z '0-8' "$file" tiles`
  * [MapTiler](https://www.maptiler.com/)
    * Seems like too much of a proprietary app and not a configurable script.
    * Haven't tried it.  Feel like gdal2tiles should work..
  Others tried:
  * Mapeditor(?)
  * GenerateSlippyMapTiles.py
    * https://gist.github.com/jeffThompson/a08e5b8146352f3974bfa4100d0317f6
  Others not tried:
  * Tiled(?) (Editor)
  * MapTiler
