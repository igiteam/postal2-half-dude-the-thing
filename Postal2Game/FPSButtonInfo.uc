///////////////////////////////////////////////////////////////////////////////
// ButtonInfo
// Copyright 2014 Running With Scissors, Inc
// All Rights Reserved
//
// Actor class for turning keyboard/button input names into icons
///////////////////////////////////////////////////////////////////////////////
class FPSButtonInfo extends Info
//	config(JoyButtons)
    config(User)
	notplaceable;
	
///////////////////////////////////////////////////////////////////////////////
// Consts, enums, variables, etc.
///////////////////////////////////////////////////////////////////////////////
const MAX_JOYSTICK_TYPES = 7;
const MAX_BUTTONS = 256;
	
enum EJoystickType
{
	JT_Generic,		// Generic joystick, uses button number prompts.
					// Also acts as a fallback if an icon is not found
					// for a control scheme (handles keyboard bindings)
	JT_Xbox360,		// Xbox 360 controller
	JT_XboxOne,		// Xbox One controller
	JT_PS3,			// Playstation 3 controller
	JT_PS4,			// Playstation 4 controller
	JT_Wii,			// Wii/Wii U controller
    JT_SteamDeck    // Steam Deck controller
};

struct SJoyIcon
{
	var config EJoystickType Type;
	var config Interactions.EInputKey Key;
	var config String Icon;
};

var bool bTestLoad;								// If true, logs all errors when loading textures

var config int JoystickType;							// Defines the currently-used input scheme
var array<SJoyIcon> JoyIcons;					// Defines all button icons
var localized string JoystickName[MAX_JOYSTICK_TYPES];	// Defines names of input schemes
var Texture MissingButton;								// Placeholder for missing buttons
var Texture MissingBinding;								// Indicates no binding for this input

var Texture ButtonIcons[MAX_BUTTONS];					// Icons for currently-loaded input scheme
var FPSHud MyHUD;										// Pointer back to our HUD
var config bool bSteamDeckFirstRun;

///////////////////////////////////////////////////////////////////////////////
// PostBeginPlay
// Populate all icons for our current joystick type
///////////////////////////////////////////////////////////////////////////////
event PostBeginPlay()
{
    // Load Steam Deck icons
    if (PlatformIsSteamDeck() && !bSteamDeckFirstRun) {
        bSteamDeckFirstRun = true;
        JoystickType = 6;
        SaveConfig();
        StaticSaveConfig();
    }

	LoadIcons(JoystickType);    
}

///////////////////////////////////////////////////////////////////////////////
// GetJoystickName
///////////////////////////////////////////////////////////////////////////////
function string GetJoystickName(int UseJT)
{
	return JoystickName[UseJT];
}

///////////////////////////////////////////////////////////////////////////////
// GetJoystickCount
///////////////////////////////////////////////////////////////////////////////
function int GetJoystickCount()
{
	return MAX_JOYSTICK_TYPES;
}

///////////////////////////////////////////////////////////////////////////////
// GetJoystickType
///////////////////////////////////////////////////////////////////////////////
function int GetJoystickType()
{
	return JoystickType;
}

///////////////////////////////////////////////////////////////////////////////
// SetJoystickType
// Changes current input scheme
///////////////////////////////////////////////////////////////////////////////
function SetJoystickType(int NewJT)
{
	LoadIcons(NewJT);
	JoystickType = NewJT;
	SaveConfig();
}

///////////////////////////////////////////////////////////////////////////////
// LoadIcons
// Loads all icons for a specific control scheme
///////////////////////////////////////////////////////////////////////////////
function LoadIcons(int UseJT)
{
	local int i;
	
	if (bTestLoad)
		log(self@"======================== LOADING ALL BUTTON ICONS");
	
	// Null out existing references
	for (i = 0; i < MAX_BUTTONS; i++)
		ButtonIcons[i] = None;
		
	// Populate icons with JT_Generic first, as a fallback.
	for (i = 0; i < JoyIcons.Length; i++)
		if (JoyIcons[i].Type == JT_Generic
			&& JoyIcons[i].Icon != "")
		{
			ButtonIcons[JoyIcons[i].Key] = Texture(DynamicLoadObject(JoyIcons[i].Icon,class'Texture'));
			if (bTestLoad && ButtonIcons[JoyIcons[i].Key] == None)
				warn("FAILED to load texture:"@JoyIcons[i].Icon);
            else if (bTestLoad)
                log("Loaded texture "@ButtonIcons[JoyIcons[i].Key]);
		}
	
	// Now load up the ones specific to our control scheme (if not JT_Generic)
	if (UseJT != 0)
		for (i = 0; i < JoyIcons.Length; i++)
			if (JoyIcons[i].Type == UseJT
				&& JoyIcons[i].Icon != "")
			{
				ButtonIcons[JoyIcons[i].Key] = Texture(DynamicLoadObject(JoyIcons[i].Icon,class'Texture'));
				if (bTestLoad && ButtonIcons[JoyIcons[i].Key] == None)
					warn("FAILED to load texture:"@JoyIcons[i].Icon);
            else if (bTestLoad)
                log("Loaded texture "@ButtonIcons[JoyIcons[i].Key]);
			}

	if (bTestLoad)
		log(self@"======================== LOADED ALL BUTTON ICONS");
}

///////////////////////////////////////////////////////////////////////////////
// GetIcon
// Returns the button icon for the passed-in key
///////////////////////////////////////////////////////////////////////////////
function Texture GetIcon(int UseKey)
{
	if (ButtonIcons[UseKey] != None)
		return ButtonIcons[UseKey];		
	else if (UseKey > 0)
		return MissingButton;
	else
		return MissingBinding;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bTestLoad=true
    JoyIcons[0]=16843008
    JoyIcons[1]=640113922
    JoyIcons[2]=1953789250
    JoyIcons[3]=1665756783
    JoyIcons[4]=779316847
    JoyIcons[5]=1652122955
    JoyIcons[6]=1685217647
    JoyIcons[7]=1768445791
    JoyIcons[8]=1298097524
    JoyIcons[9]=1702065519
    JoyIcons[10]=1717914719
    JoyIcons[11]=16777332
    JoyIcons[12]=1560412673
    JoyIcons[13]=1967269672
    JoyIcons[14]=1852798068
    JoyIcons[15]=1852793673
    JoyIcons[16]=1699425907
    JoyIcons[17]=1634689657
    JoyIcons[18]=1465869426
    JoyIcons[19]=1702127976
    JoyIcons[20]=1970228575
    JoyIcons[21]=1381983603
    JoyIcons[22]=1952999273
    JoyIcons[23]=16842752
    JoyIcons[24]=16842755
    JoyIcons[25]=693961220
    JoyIcons[26]=1953841704
    JoyIcons[27]=1231974260
    JoyIcons[28]=1936617315
    JoyIcons[29]=2036681518
    JoyIcons[30]=1918988130
    JoyIcons[31]=1750556516
    JoyIcons[32]=1600484457
    JoyIcons[33]=1937076045
    JoyIcons[34]=1766678373
    JoyIcons[35]=1701602404
    JoyIcons[36]=16842752
    JoyIcons[37]=16842757
    JoyIcons[38]=16842758
    JoyIcons[39]=16842759
    JoyIcons[40]=643629576
    JoyIcons[41]=1953841701
    JoyIcons[42]=1231974260
    JoyIcons[43]=1936617315
    JoyIcons[44]=2036681518
    JoyIcons[45]=1918988130
    JoyIcons[46]=1750556516
    JoyIcons[47]=1600484457
    JoyIcons[48]=1801675074
    JoyIcons[49]=1667330163
    JoyIcons[50]=16777317
    JoyIcons[51]=1560414465
    JoyIcons[52]=1967267616
    JoyIcons[53]=1852798068
    JoyIcons[54]=1852793673
    JoyIcons[55]=1699425907
    JoyIcons[56]=1634689657
    JoyIcons[57]=1465869426
    JoyIcons[58]=1702127976
    JoyIcons[59]=1650545759
    JoyIcons[60]=16842752
    JoyIcons[61]=16842762
    JoyIcons[62]=16842763
    JoyIcons[63]=509411852
    JoyIcons[64]=1953841693
    JoyIcons[65]=1231974260
    JoyIcons[66]=1936617315
    JoyIcons[67]=2036681518
    JoyIcons[68]=1918988130
    JoyIcons[69]=1816289124
    JoyIcons[70]=1600873313
    JoyIcons[71]=16777269
    JoyIcons[72]=1560415489
    JoyIcons[73]=1967268130
    JoyIcons[74]=1852798068
    JoyIcons[75]=1852793673
    JoyIcons[76]=1699425907
    JoyIcons[77]=1634689657
    JoyIcons[78]=1465869426
    JoyIcons[79]=1702127976
    JoyIcons[80]=1953383775
    JoyIcons[81]=29285
    JoyIcons[82]=917761
    JoyIcons[83]=983297
    JoyIcons[84]=34603265
    JoyIcons[85]=1109467741
    JoyIcons[86]=1869902965
    JoyIcons[87]=1868777838
    JoyIcons[88]=1261335406
    JoyIcons[89]=1868724581
    JoyIcons[90]=1600418401
    JoyIcons[91]=1953065047
    JoyIcons[92]=1750294373
    JoyIcons[93]=7628393
    JoyIcons[94]=285278464
    JoyIcons[95]=539057410
    JoyIcons[96]=1953789250
    JoyIcons[97]=1665756783
    JoyIcons[98]=779316847
    JoyIcons[99]=1652122955
    JoyIcons[100]=1685217647
    JoyIcons[101]=1768445791
    JoyIcons[102]=1130325364
    JoyIcons[103]=7107188
    JoyIcons[104]=302055680
    JoyIcons[105]=522214658
    JoyIcons[106]=1953789250
    JoyIcons[107]=1665756783
    JoyIcons[108]=779316847
    JoyIcons[109]=1652122955
    JoyIcons[110]=1685217647
    JoyIcons[111]=1768445791
    JoyIcons[112]=1096770932
    JoyIcons[113]=29804
    JoyIcons[114]=34799873
    JoyIcons[115]=1109467741
    JoyIcons[116]=1869902965
    JoyIcons[117]=1868777838
    JoyIcons[118]=1261335406
    JoyIcons[119]=1868724581
    JoyIcons[120]=1600418401
    JoyIcons[121]=1953065047
    JoyIcons[122]=1632657253
    JoyIcons[123]=6648693
    JoyIcons[124]=335610112
    JoyIcons[125]=623271170
    JoyIcons[126]=1953789250
    JoyIcons[127]=1665756783
    JoyIcons[128]=779316847
    JoyIcons[129]=1652122955
    JoyIcons[130]=1685217647
    JoyIcons[131]=1768445791
    JoyIcons[132]=1130325364
    JoyIcons[133]=1601400929
    JoyIcons[134]=1801678668
    JoyIcons[135]=16842752
    JoyIcons[136]=16842773
    JoyIcons[137]=16842774
    JoyIcons[138]=16842775
    JoyIcons[139]=16842776
    JoyIcons[140]=16842777
    JoyIcons[141]=16842778
    JoyIcons[142]=542966299
    JoyIcons[143]=1953841695
    JoyIcons[144]=1231974260
    JoyIcons[145]=1936617315
    JoyIcons[146]=2036681518
    JoyIcons[147]=1918988130
    JoyIcons[148]=1750556516
    JoyIcons[149]=1600484457
    JoyIcons[150]=6517573
    JoyIcons[151]=469827840
    JoyIcons[152]=486605056
    JoyIcons[153]=503382272
    JoyIcons[154]=520159488
    JoyIcons[155]=536936704
    JoyIcons[156]=555900162
    JoyIcons[157]=1953789250
    JoyIcons[158]=1665756783
    JoyIcons[159]=779316847
    JoyIcons[160]=1652122955
    JoyIcons[161]=1685217647
    JoyIcons[162]=1768445791
    JoyIcons[163]=1398760820
    JoyIcons[164]=1701011824
    JoyIcons[165]=16842752
    JoyIcons[166]=610075169
    JoyIcons[167]=1953841699
    JoyIcons[168]=1231974260
    JoyIcons[169]=1936617315
    JoyIcons[170]=2036681518
    JoyIcons[171]=1918988130
    JoyIcons[172]=1750556516
    JoyIcons[173]=1600484457
    JoyIcons[174]=1701273936
    JoyIcons[175]=7361887
    JoyIcons[176]=570491136
    JoyIcons[177]=623271170
    JoyIcons[178]=1953789250
    JoyIcons[179]=1665756783
    JoyIcons[180]=779316847
    JoyIcons[181]=1652122955
    JoyIcons[182]=1685217647
    JoyIcons[183]=1768445791
    JoyIcons[184]=1348429172
    JoyIcons[185]=1600481121
    JoyIcons[186]=1853321028
    JoyIcons[187]=16842752
    JoyIcons[188]=542966307
    JoyIcons[189]=1953841695
    JoyIcons[190]=1231974260
    JoyIcons[191]=1936617315
    JoyIcons[192]=2036681518
    JoyIcons[193]=1918988130
    JoyIcons[194]=1750556516
    JoyIcons[195]=1600484457
    JoyIcons[196]=6581829
    JoyIcons[197]=604045568
    JoyIcons[198]=539057410
    JoyIcons[199]=1953789250
    JoyIcons[200]=1665756783
    JoyIcons[201]=779316847
    JoyIcons[202]=1652122955
    JoyIcons[203]=1685217647
    JoyIcons[204]=1768445791
    JoyIcons[205]=1214211444
    JoyIcons[206]=6647151
    JoyIcons[207]=620822784
    JoyIcons[208]=640113922
    JoyIcons[209]=1953789250
    JoyIcons[210]=1665756783
    JoyIcons[211]=779316847
    JoyIcons[212]=1652122955
    JoyIcons[213]=1685217647
    JoyIcons[214]=1768445791
    JoyIcons[215]=1096770932
    JoyIcons[216]=2003792498
    JoyIcons[217]=1717914719
    JoyIcons[218]=16777332
    JoyIcons[219]=1560421889
    JoyIcons[220]=1967268901
    JoyIcons[221]=1852798068
    JoyIcons[222]=1852793673
    JoyIcons[223]=1699425907
    JoyIcons[224]=1634689657
    JoyIcons[225]=1465869426
    JoyIcons[226]=1702127976
    JoyIcons[227]=1920090463
    JoyIcons[228]=1432319855
    JoyIcons[229]=16777328
    JoyIcons[230]=1560422145
    JoyIcons[231]=1967269672
    JoyIcons[232]=1852798068
    JoyIcons[233]=1852793673
    JoyIcons[234]=1699425907
    JoyIcons[235]=1634689657
    JoyIcons[236]=1465869426
    JoyIcons[237]=1702127976
    JoyIcons[238]=1920090463
    JoyIcons[239]=1381988207
    JoyIcons[240]=1952999273
    JoyIcons[241]=16842752
    JoyIcons[242]=660406824
    JoyIcons[243]=1953841702
    JoyIcons[244]=1231974260
    JoyIcons[245]=1936617315
    JoyIcons[246]=2036681518
    JoyIcons[247]=1918988130
    JoyIcons[248]=1750556516
    JoyIcons[249]=1600484457
    JoyIcons[250]=1869771329
    JoyIcons[251]=1866751863
    JoyIcons[252]=28279
    JoyIcons[253]=2687233
    JoyIcons[254]=2752769
    JoyIcons[255]=2818305
    JoyIcons[256]=36438273
    JoyIcons[257]=1109928285
    JoyIcons[258]=1869902965
    JoyIcons[259]=1868777838
    JoyIcons[260]=1261335406
    JoyIcons[261]=1868724581
    JoyIcons[262]=1600418401
    JoyIcons[263]=1953065047
    JoyIcons[264]=1917869925
    JoyIcons[265]=1601465961
    JoyIcons[266]=1701995347
    JoyIcons[267]=28261
    JoyIcons[268]=36503809
    JoyIcons[269]=1109533533
    JoyIcons[270]=1869902965
    JoyIcons[271]=1868777838
    JoyIcons[272]=1261335406
    JoyIcons[273]=1868724581
    JoyIcons[274]=1600418401
    JoyIcons[275]=1953065047
    JoyIcons[276]=1850302309
    JoyIcons[277]=1953654131
    JoyIcons[278]=16842752
    JoyIcons[279]=542966318
    JoyIcons[280]=1953841695
    JoyIcons[281]=1231974260
    JoyIcons[282]=1936617315
    JoyIcons[283]=2036681518
    JoyIcons[284]=1918988130
    JoyIcons[285]=1750556516
    JoyIcons[286]=1600484457
    JoyIcons[287]=7103812
    JoyIcons[288]=788594944
    JoyIcons[289]=805372160
    JoyIcons[290]=488529154
    JoyIcons[291]=1953789250
    JoyIcons[292]=1665756783
    JoyIcons[293]=779316847
    JoyIcons[294]=1652122955
    JoyIcons[295]=1685217647
    JoyIcons[296]=1768445791
    JoyIcons[297]=811558260
    JoyIcons[298]=16842752
    JoyIcons[299]=509411889
    JoyIcons[300]=1953841693
    JoyIcons[301]=1231974260
    JoyIcons[302]=1936617315
    JoyIcons[303]=2036681518
    JoyIcons[304]=1918988130
    JoyIcons[305]=1750556516
    JoyIcons[306]=1600484457
    JoyIcons[307]=16777265
    JoyIcons[308]=1560424961
    JoyIcons[309]=1967267102
    JoyIcons[310]=1852798068
    JoyIcons[311]=1852793673
    JoyIcons[312]=1699425907
    JoyIcons[313]=1634689657
    JoyIcons[314]=1465869426
    JoyIcons[315]=1702127976
    JoyIcons[316]=12895
    JoyIcons[317]=36897025
    JoyIcons[318]=1109204573
    JoyIcons[319]=1869902965
    JoyIcons[320]=1868777838
    JoyIcons[321]=1261335406
    JoyIcons[322]=1868724581
    JoyIcons[323]=1600418401
    JoyIcons[324]=1953065047
    JoyIcons[325]=3366757
    JoyIcons[326]=872481024
    JoyIcons[327]=488529154
    JoyIcons[328]=1953789250
    JoyIcons[329]=1665756783
    JoyIcons[330]=779316847
    JoyIcons[331]=1652122955
    JoyIcons[332]=1685217647
    JoyIcons[333]=1768445791
    JoyIcons[334]=878667124
    JoyIcons[335]=16842752
    JoyIcons[336]=509411893
    JoyIcons[337]=1953841693
    JoyIcons[338]=1231974260
    JoyIcons[339]=1936617315
    JoyIcons[340]=2036681518
    JoyIcons[341]=1918988130
    JoyIcons[342]=1750556516
    JoyIcons[343]=1600484457
    JoyIcons[344]=16777269
    JoyIcons[345]=1560425985
    JoyIcons[346]=1967267102
    JoyIcons[347]=1852798068
    JoyIcons[348]=1852793673
    JoyIcons[349]=1699425907
    JoyIcons[350]=1634689657
    JoyIcons[351]=1465869426
    JoyIcons[352]=1702127976
    JoyIcons[353]=13919
    JoyIcons[354]=37159169
    JoyIcons[355]=1109204573
    JoyIcons[356]=1869902965
    JoyIcons[357]=1868777838
    JoyIcons[358]=1261335406
    JoyIcons[359]=1868724581
    JoyIcons[360]=1600418401
    JoyIcons[361]=1953065047
    JoyIcons[362]=3628901
    JoyIcons[363]=939589888
    JoyIcons[364]=488529154
    JoyIcons[365]=1953789250
    JoyIcons[366]=1665756783
    JoyIcons[367]=779316847
    JoyIcons[368]=1652122955
    JoyIcons[369]=1685217647
    JoyIcons[370]=1768445791
    JoyIcons[371]=945775988
    JoyIcons[372]=16842752
    JoyIcons[373]=509411897
    JoyIcons[374]=1953841693
    JoyIcons[375]=1231974260
    JoyIcons[376]=1936617315
    JoyIcons[377]=2036681518
    JoyIcons[378]=1918988130
    JoyIcons[379]=1750556516
    JoyIcons[380]=1600484457
    JoyIcons[381]=16777273
    JoyIcons[382]=16792065
    JoyIcons[383]=16792321
    JoyIcons[384]=16792577
    JoyIcons[385]=16792833
    JoyIcons[386]=16793089
    JoyIcons[387]=16793345
    JoyIcons[388]=16793601
    JoyIcons[389]=1560428801
    JoyIcons[390]=1967267102
    JoyIcons[391]=1852798068
    JoyIcons[392]=1852793673
    JoyIcons[393]=1699425907
    JoyIcons[394]=1634689657
    JoyIcons[395]=1465869426
    JoyIcons[396]=1702127976
    JoyIcons[397]=16735
    JoyIcons[398]=37880065
    JoyIcons[399]=1109204573
    JoyIcons[400]=1869902965
    JoyIcons[401]=1868777838
    JoystickName[0]="Generic/PC Gamepad"
    JoystickName[1]="XBox 360 Controller"
    JoystickName[2]="XBox One Controller"
    JoystickName[3]="PlayStation 3 Controller"
    JoystickName[4]="PlayStation 4 Controller"
    JoystickName[5]="Wii/Wii U Controller"
    JoystickName[6]="Steam Deck"
    MissingButton=Texture'ButtonIcons.blank'
    MissingBinding=Texture'ButtonIcons.blank'
}