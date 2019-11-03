function kill_chance(keys)
	local ability = keys.ability
	local caster = keys.caster
	local target = keys.target

	if ability:IsCooldownReady() and caster:IsRealHero() and target:IsRealHero() then
		target:Kill(ability, caster)
		ability:StartCooldown(ability:GetCooldown(ability:GetLevel()))
		ability:StartCooldown(keys.CooldownSpell)
	end
	if not ability:IsCooldownReady() and not caster:IsRealHero() and not target:IsRealHero() then return end
end
function CooldownKick(keys)
	local ability = keys.ability
	local target = keys.target
	local caster = keys.caster
	local scepter = keys.ScepterNoWait
	local wait = keys.WaitPleases
	if ability:IsCooldownReady() and caster:IsRealHero() and target:IsRealHero() then
		ability:StartCooldown(ability:GetCooldown(ability:GetLevel()))
		ability:StartCooldown(wait)
	end
	if caster:HasScepter() then
		ability:StartCooldown(0)
		ability:EndCooldown()
		
	end
	if not ability:IsCooldownReady() and not caster:IsRealHero() and not target:IsRealHero() then return end
end
