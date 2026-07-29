import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure GeneralEquilibriumPackage where
  commoditySpace : Type u
  priceSpace : Type v
  preferences : Type w
  endowments : Type x
  excessDemand : Type y
  equilibriumPrice : Prop
  walrasLaw : Prop
  excessDemandContinuous : Prop
  boundaryCondition : Prop
  strictConvexity : Prop
  equilibriumPriceTerm : equilibriumPrice
  walrasLawTerm : walrasLaw
  excessDemandContinuousTerm : excessDemandContinuous
  boundaryConditionTerm : boundaryCondition
  strictConvexityTerm : strictConvexity

structure GeneralEquilibriumEvidence (G : GeneralEquilibriumPackage) where
  equilibriumPriceClosed : G.equilibriumPrice
  walrasLawClosed : G.walrasLaw
  excessDemandContinuousClosed : G.excessDemandContinuous
  boundaryConditionClosed : G.boundaryCondition
  strictConvexityClosed : G.strictConvexity

def GeneralEquilibriumClosed (G : GeneralEquilibriumPackage) : Prop :=
  G.equilibriumPrice ∧ G.walrasLaw ∧ G.excessDemandContinuous ∧
  G.boundaryCondition ∧ G.strictConvexity

theorem general_equilibrium_closed_from_evidence (G : GeneralEquilibriumPackage)
    (E : GeneralEquilibriumEvidence G) : GeneralEquilibriumClosed G := by
  exact And.intro E.equilibriumPriceClosed
    (And.intro E.walrasLawClosed
      (And.intro E.excessDemandContinuousClosed
        (And.intro E.boundaryConditionClosed E.strictConvexityClosed)))

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse