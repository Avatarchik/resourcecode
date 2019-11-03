-- Generated from template
require('util')
require('timers')

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_tusk.vsndevts", context )
    PrecacheResource( "soundfile", "soundevents/saitama_sound.vsndevts", context ) 
    PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_bounty_hunter.vsndevts", context )
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameRules:GetGameModeEntity():SetFountainPercentageHealthRegen( 70 )
	GameRules:GetGameModeEntity():SetFountainPercentageManaRegen( 70 )
	GameRules:GetGameModeEntity():SetFountainConstantManaRegen( 100 )
	GameRules:GetGameModeEntity():SetFixedRespawnTime( 10 )
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels( true )
	GameRules:GetGameModeEntity():SetCustomHeroMaxLevel( 50 ) 
	GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )
    GameRules:GetGameModeEntity():SetCustomGameForceHero("npc_dota_hero_tusk")
    GameRules:GetGameModeEntity():SetMaximumAttackSpeed( 10000 )
    GameRules:GetGameModeEntity():SetMinimumAttackSpeed( 50 )
    GameRules:GetGameModeEntity():SetMaxHealth( 20000000 )
end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end


GameRules:SetSameHeroSelectionEnabled( true )
GameRules:SetStrategyTime( 0.0 )
GameRules:SetPreGameTime( 15 )
 

XP_PER_LEVEL_TABLE = {
	 0,-- 1
    200,-- 2
    500,-- 3
    900,-- 4
    1400,-- 5
    2000,-- 6
    2600,-- 7
    3200,-- 8
    4400,-- 9
    5400,-- 10
    6000,-- 11
    8200,-- 12
    9000,-- 13
    10400,-- 14
    11900,-- 15
    13500,-- 16
    15200,-- 17
    17000,-- 18
    18900,-- 19
    20900,-- 20
    23000,-- 21
    25200,-- 22
    27500,-- 23
    29900,-- 24
    32400,-- 25
    35000,-- 26
    37700,-- 27
    40500,-- 28
    43400,-- 29
    46400,-- 30
    49500,-- 31
    52700,-- 32
    56000,-- 33
    59400,-- 34
    62900, -- 35
    66500,-- 36
    70200,-- 37
    74000,-- 38
    77900,-- 39
    81900,-- 40
    86000,-- 41
    90200,-- 42
    94500,-- 43
    98900,-- 44
    103400,-- 45
    108000,-- 46
    112700,-- 47
    117500,-- 48
    122400,-- 49
    127400, -- 50
}
