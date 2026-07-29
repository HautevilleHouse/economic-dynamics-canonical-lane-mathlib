import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure ArrowDebreuEconomyPackage where
  commoditySpace : Type u
  priceSet : Set (commoditySpace → ℝ)
  consumptionSets : commoditySpace → Set (commoditySpace)
  productionSets : commoditySpace → Set (commoditySpace)
  endowments : commoditySpace → commoditySpace
  preferences : commoditySpace → (commoditySpace → commoditySpace → Prop)

structure ArrowDebreuEquilibriumPackage (E : ArrowDebreuEconomyPackage) where
  equilibriumPrices : E.priceSet
  equilibriumAllocations : E.commoditySpace → E.commoditySpace
  marketClearing : Prop
  individualOptimality : Prop

structure ArrowDebreuEquilibriumEvidence
    {E : ArrowDebreuEconomyPackage} (A : ArrowDebreuEquilibriumPackage E) where
  marketClearingClosed : A.marketClearing
  individualOptimalityClosed : A.individualOptimality

def ArrowDebreuEquilibriumClosed {E : ArrowDebreuEconomyPackage}
    (A : ArrowDebreuEquilibriumPackage E) : Prop :=
  A.marketClearing ∧ A.individualOptimality

theorem arrow_debreu_equilibrium_closed_from_evidence
    {E : ArrowDebreuEconomyPackage} (A : ArrowDebreuEquilibriumPackage E)
    (E2 : ArrowDebreuEquilibriumEvidence A) : ArrowDebreuEquilibriumClosed A := by
  exact And.intro E2.marketClearingClosed E2.individualOptimalityClosed

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse