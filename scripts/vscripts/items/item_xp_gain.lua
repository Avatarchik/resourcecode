--[[
Author: DDSuper
Item: Xp Talisman
Data: 11.03.2019
Version: 7.23h
--]]

function Xp_gain(keys)
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability
	local XpGain = keys.XpGain

	if caster.AddExperience and caster:IsAttacking() and target:IsRealHero() and ability:IsCooldownReady() then
		caster:AddExperience(XpGain, false, false)
		ability:StartCooldown(keys.Cooldown)
	end
	if not caster.AddExperience and not caster:IsAttacking() and not target:IsRealHero() and not ability:IsCooldownReady() then return end
end
