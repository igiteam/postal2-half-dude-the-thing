///////////////////////////////////////////////////////////////////////////////
// DialogCowHeadGary
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Screams at a high pitch the whole time--kill him quick!
//
///////////////////////////////////////////////////////////////////////////////
class DialogCowHeadGary extends DialogGeneric;


///////////////////////////////////////////////////////////////////////////////
// Fill in this character's lines
///////////////////////////////////////////////////////////////////////////////
function FillInLines()
	{
	// Let super go first
	Super.FillInLines();

	Clear(lgreeting);
	Addto(lgreeting,							"HabibDialog.habib_ailili", 1);

	Clear(lGetDownMP);
	Addto(lGetDownMP,							"HabibDialog.habib_ailili", 1);

	Clear(lFollowMe);
	Addto(lFollowMe,							"HabibDialog.habib_ailili", 1);

	Clear(lStayHere);
	Addto(lStayHere,							"HabibDialog.habib_ailili", 1);

	Clear(lnextinline);
	Addto(lnextinline,							"HabibDialog.habib_ailili", 1);
	
	Clear(lhelpyouoverhere);
	Addto(lhelpyouoverhere,						"HabibDialog.habib_ailili", 1);

	Clear(lsomeonecuts);
	Addto(lsomeonecuts,							"HabibDialog.habib_ailili", 1);
	Addto(lsomeonecuts, 						"HabibDialog.habib_ailili", 1);

	Clear(lpleasemoveforward);
	Addto(lpleasemoveforward,					"HabibDialog.habib_ailili", 1);

	Clear(lcanihelpyou);
	Addto(lcanihelpyou,							"HabibDialog.habib_ailili", 1);

	clear(lGary_ResponseToIdiots);
	Addto(lGary_ResponseToIdiots, 				"HabibDialog.habib_ailili", 1);
												
	Clear(lgetbumped);
	Addto(lgetbumped, 							"HabibDialog.habib_ailili", 1);

	Clear(lGetMad);
	Addto(lGetMad,								"HabibDialog.habib_ailili", 1);

	Clear(llaughing);
	Addto(llaughing,							"GaryDialog.gary_bwahahaha", 1);

	Clear(lscreamingonfire);
	Addto(lscreamingonfire,						"GaryDialog.gary_aahputmeout", 1);

	Clear(lsomeoneonfire);
	addto(lsomeoneonfire,						"HabibDialog.habib_ailili", 1);	

	Clear(lgothit);
	addto(lgothit,								"HabibDialog.habib_ailili", 1);	
	Addto(lgothit,								"GaryDialog.gary_bwahahaha", 1);

	Clear(lAttacked);
	addto(lAttacked,								"HabibDialog.habib_ailili", 1);	
	addto(lAttacked,								"GaryDialog.gary_bwahahaha", 1);	

	Clear(lGotHitInCrotch);	
	addto(lGotHitInCrotch,						"HabibDialog.habib_ailili", 1);	

	Clear(lGrunt);
	addto(lGrunt,								"HabibDialog.habib_ailili", 1);	

	Clear(lCussing);
	addto(lCussing,								"HabibDialog.habib_ailili", 1);	

	Clear(ltrashtalk);
	Addto(ltrashtalk,							"HabibDialog.habib_ailili", 1);
	Addto(ltrashtalk,							"GaryDialog.gary_bwahahaha", 1);

	Clear(ldecidetofight);
	Addto(ldecidetofight,						"HabibDialog.habib_ailili", 1);

	Clear(lDoHeroics);
	Addto(lDoHeroics,							"HabibDialog.habib_ailili", 1);
	Addto(lDoHeroics,							"GaryDialog.gary_bwahahaha", 1);

	Clear(lCloseToWeapon);
	addto(lCloseToWeapon,						"HabibDialog.habib_ailili", 1);	

	Clear(laftergettingpissedon);
	Addto(laftergettingpissedon,				"HabibDialog.habib_ailili", 1);	

	Clear(lWhileFighting);
	Addto(lWhileFighting, 						"HabibDialog.habib_ailili", 1);

	Clear(ldying);
	Addto(ldying,								"HabibDialog.habib_ailili", 1);

	Clear(ldudedead);
	addto(ldudedead,							"HabibDialog.habib_ailili", 1);	

	Clear(lKickDead);
	Addto(lKickDead, 							"GaryDialog.gary_bwahahaha", 1);

	Clear(lNameCalling);
	Addto(lNameCalling,							"HabibDialog.habib_ailili", 1);	

	Clear(lWatchingCrazy);
	Addto(lWatchingCrazy, 						"HabibDialog.habib_ailili", 1);

	Clear(lbegforlife);
	Addto(lbegforlife,							"HabibDialog.habib_ailili", 1);

	Clear(lbegforlifeMin);
	Addto(lbegforlifeMin,						"HabibDialog.habib_ailili", 1);
	}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

