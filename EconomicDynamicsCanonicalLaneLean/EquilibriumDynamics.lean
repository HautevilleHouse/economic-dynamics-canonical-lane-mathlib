import EconomicDynamicsCanonicalLaneLean.AssetPricing

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure EquilibriumDynamicsPackage {A : ArrowDebreuEconomy} {U : UtilityPackage A} {G : GrowthModelPackage A U} {P : AssetPricingPackage A U G} where
  generalEquilibrium : Prop
  dynamics : Prop
  stability : Prop
  welfareProperties : Prop

structure EquilibriumDynamicsEvidence {A : ArrowDebreuEconomy} {U : UtilityPackage A} {G : GrowthModelPackage A U} {P : AssetPricingPackage A U G} (D : EquilibriumDynamicsPackage A U G P) where
  generalEquilibriumClosed : D.generalEquilibrium
  dynamicsClosed : D.dynamics
  stabilityClosed : D.stability
  welfarePropertiesClosed : D.welfareProperties

def EquilibriumDynamicsClosed {A : ArrowDebreuEconomy} {U : UtilityPackage A} {G : GrowthModelPackage A U} {P : AssetPricingPackage A U G} (D : EquilibriumDynamicsPackage A U G P) : Prop :=
  D.generalEquilibrium ∧ D.dynamics ∧ D.stability ∧ D.welfareProperties

theorem equilibrium_dynamics_closed_from_evidence {A : ArrowDebreuEconomy} {U : UtilityPackage A} {G : GrowthModelPackage A U} {P : AssetPricingPackage A U G} (D : EquilibriumDynamicsPackage A U G P) (E : EquilibriumDynamicsEvidence D) : EquilibriumDynamicsClosed D := by
  exact And.intro E.generalEquilibriumClosed (And.intro E.dynamicsClosed (And.intro E.stabilityClosed E.welfarePropertiesClosed))

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse