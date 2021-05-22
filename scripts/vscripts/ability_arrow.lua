ability_arrow=class({})

function ability_arrow:OnSpellStart()
  local caster = self:GetCaster()
  --A Liner Projectile must have a table with projectile info
  
  local cursorPt = self:GetCursorPosition()
  local casterPt = caster:GetAbsOrigin()

  local direction = cursorPt - casterPt
  direction = direction:Normalized()

  local speed = self:GetSpecialValueFor("speed")

	local info = 
	{
		Ability = self,
        EffectName = "particles/econ/items/mirana/mirana_crescent_arrow/mirana_spell_crescent_arrow.vpcf",
        vSpawnOrigin = caster:GetAbsOrigin(),
        fDistance = 2000,
        fStartRadius = 64,
        fEndRadius = 64,
        Source = caster,
        bHasFrontalCone = true,
        bReplaceExisting = false,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        fExpireTime = GameRules:GetGameTime() + 10.0,
		bDeleteOnHit = true,
		vVelocity = direction * speed,
		bProvidesVision = true,
		iVisionRadius = 500,
		iVisionTeamNumber = caster:GetTeamNumber()
  }
  

  ProjectileManager:CreateLinearProjectile(info)
end

function ability_arrow:OnProjectileHit(hTarget, vLocation)
 
  if hTarget == nil then
    print("arrow expired")
  else
    print("arrow hit: " .. hTarget:GetName())
  end

  return true
end