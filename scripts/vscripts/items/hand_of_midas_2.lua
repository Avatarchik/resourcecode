
--[[--[[--[[--[[--[[--[[--[[--[[//
Author:DDSuper			//
Item:Hand of Midas 2		//								
--]]--]]--[[--[[--[[--[[--[[--[[//

function item_hand_of_midas_2_spell_start(keys)
	keys.caster:ModifyGold(keys.BonusGold, true, 1) -- Сколько ты получишь золота
	keys.target:EmitSound("DOTA_Item.Hand_Of_Midas") -- Звук предмета

	--[[

	Эффекты частиц, и контроль этих частиц
	--]]
	local midas_particle = ParticleManager:CreateParticle("particles/items2_fx/hand_of_midas.vpcf", PATTACH_ABSORIGIN_FOLLOW, keys.target)  -- Эффекты, частиц мидаса
	ParticleManager:SetParticleControlEnt(midas_particle, 1, keys.caster, PATTACH_POINT_FOLLOW, "attach_hitloc", keys.caster:GetAbsOrigin(), false) -- Контроль как и сказано

	if keys.target:IsRealHero() and keys.caster.AddExperience then  -- Если это цель настоящий герой 
		keys.caster:AddExperience(keys.GetXp, false, false) -- Дать опыт себе
		keys.target:ModifyGold(keys.ReduceGold, true, 0) -- Украсть, у него золота
		keys.caster:ReduceMana(100) -- Снизить ману. Если вы использовали на героя. Можете Убрать.
	end
	if keys.target:IsCreep() then -- Если это крип
		keys.caster:AddExperience(keys.target:GetDeathXP() * keys.XPMultiplier, false, false ) -- Дать себе опыт только с умножителем без умножителя keys.caster:AddExperience(keys.GetXp, false, false)
		keys.target:SetDeathXP(0) -- 0 Чтобы не получить опыт за крипа
		keys.target:SetMinimumGoldBounty(0) -- Убрать награду за крипа
		keys.target:SetMaximumGoldBounty(0) 
		keys.target:Kill(keys.ability, keys.caster) -- Убить крипа
	if keys.target:IsAncient() then return end -- Это древний крип? Если да тогда вернуть конец 
	end
end

function GoldOnAttackAndXp(keys) -- Если заклинатель атакует

	local ability = keys.ability
	local level = ability:GetLevel() - 1
	local killBoth = ability:GetSpecialValueFor("kill_both_health")

	if keys.caster:IsAttacking() and keys.target:IsRealHero() and keys.ability:IsCooldownReady() and not keys.caster:IsRangedAttacker() and keys.caster.AddExperience then -- Думаю поняли keys.ability:IsCooldownReady() абилка будет работать если кулдаун она не будет работать
		keys.caster:AddExperience(keys.Xp, false, false) -- Дать опыт 
		keys.caster:ModifyGold(keys.Gold, true, 1) -- Дать золото
	end

	if keys.caster:IsRangedAttacker() and keys.target:IsRealHero() and keys.ability:IsCooldownReady() then -- Если заклинатель дальнего боя
		keys.caster:AddExperience(keys.XpRange, false, false) -- Дать опыт только меньше
		keys.caster:ModifyGold(keys.GoldRange, true, 1) -- Дать золто тоже меньше
		keys.ability:StartCooldown(0.5) -- Добавить кулдаун
	end
end
