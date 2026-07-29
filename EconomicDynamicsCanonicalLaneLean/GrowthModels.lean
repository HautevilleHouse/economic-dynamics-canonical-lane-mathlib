import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure GrowthModelsPackage where
  productionFunction : Type u
  capitalAccumulation : Type v
  consumptionPath : Type w
  constantReturns : Prop
  smoothInadaConditions : Prop
  eulerEquation : Prop
  transversalityCondition : Prop
  balancedGrowthPath : Prop
  constantReturnsTerm : constantReturns
  smoothInadaConditionsTerm : smoothInadaConditions
  eulerEquationTerm : eulerEquation
  transversalityConditionTerm : transversalityCondition
  balancedGrowthPathTerm : balancedGrowthPath

structure GrowthModelsEvidence (G : GrowthModelsPackage) where
  constantReturnsClosed : G.constantReturns
  smoothInadaConditionsClosed : G.smoothInadaConditions
  eulerEquationClosed : G.eulerEquation
  transversalityConditionClosed : G.transversalityCondition
  balancedGrowthPathClosed : G.balancedGrowthPath

def GrowthModelsClosed (G : GrowthModelsPackage) : Prop :=
  G.constantReturns ∧ G.smoothInadaConditions ∧ G.eulerEquation ∧
  G.transversalityCondition ∧ G.balancedGrowthPath

theorem growth_models_closed_from_evidence (G : GrowthModelsPackage)
    (E : GrowthModelsEvidence G) : GrowthModelsClosed G := by
  exact And.intro E.constantReturnsClosed
    (And.intro E.smoothInadaConditionsClosed
      (And.intro E.eulerEquationClosed
        (And.intro E.transversalityConditionClosed E.balancedGrowthPathClosed)))

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse