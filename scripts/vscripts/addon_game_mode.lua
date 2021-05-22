-- https://developer.valvesoftware.com/wiki/Dota_2_Workshop_Tools/Scripting/API
-- https://moddota.com/api/#!/vscripts

if Vanilla==nil then
	Vanilla=class({})
end

function Precache( context )
	PrecacheResource( "particle", "particles/econ/items/mirana/mirana_crescent_arrow/mirana_spell_crescent_arrow.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_mirana/mirana_spell_arrow.vpcf", context )
end

require("game_setup")

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = Vanilla()
	GameRules.AddonTemplate:InitGameMode()
end

function Vanilla:InitGameMode()
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameSetup:init()
end

-- Evaluate the state of the game
function Vanilla:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end