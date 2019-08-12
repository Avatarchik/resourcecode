function damageapply(keys)
	local caster = keys.caster
	local ability = keys.ability
	local level = ability:GetLevel() - 1

	local distance = ability:GetLevelSpecialValueFor("fixed_distance", level)

	ApplyDamage({victim = keys.target, attacker = keys.caster, damage = keys.Damage, damage_type = DAMAGE_TYPE_MAGICAL,})
	if caster:HasScepter() then
		distance = ability:GetLevelSpecialValueFor("fixed_distance_scepter", level)
	end
end

