import EconomicDynamicsCanonicalLaneLean.UtilityTheory

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure GrowthModelPackage {A : ArrowDebreuEconomy} {U : UtilityPackage A} where
  productionFunction : Type u
  capitalAccumulation : Prop
  steadyStateExists : Prop
  convergence : Prop

structure GrowthModelEvidence {A : ArrowDebreuEconomy} {U : UtilityPackage A} (G : GrowthModelPackage A U) where
  productionFunctionClosed : G.capitalAccumulation
  steadyStateExistsClosed : G.steadyStateExists
  convergenceClosed : G.convergence

def GrowthModelClosed {A : ArrowDebreuEconomy} {U : UtilityPackage A} (G : GrowthModelPackage A U) : Prop :=
  G.capitalAccumulation ∧ G.steadyStateExists ∧ G.convergence

theorem growth_model_closed_from_evidence {A : ArrowDebreuEconomy} {U : UtilityPackage A} (G : GrowthModelPackage A U) (E : GrowthModelEvidence G) : GrowthModelClosed G := by
  exact And.intro E.productionFunctionClosed (And.intro E.steadyStateExistsClosed E.convergenceClosed)

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse