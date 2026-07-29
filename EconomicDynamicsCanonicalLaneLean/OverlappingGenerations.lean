import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure OverlappingGenerationsPackage where
  agentType : Type u
  goodType : Type v
  endowmentProfile : Type w
  preferenceProfile : Type x
  equilibriumAllocation : Prop
  monetaryEquilibrium : Prop
  paretoOptimality : Prop
  bubblesPossible : Prop
  equilibriumAllocationTerm : equilibriumAllocation
  monetaryEquilibriumTerm : monetaryEquilibrium
  paretoOptimalityTerm : paretoOptimality
  bubblesPossibleTerm : bubblesPossible

structure OverlappingGenerationsEvidence (O : OverlappingGenerationsPackage) where
  equilibriumAllocationClosed : O.equilibriumAllocation
  monetaryEquilibriumClosed : O.monetaryEquilibrium
  paretoOptimalityClosed : O.paretoOptimality
  bubblesPossibleClosed : O.bubblesPossible

def OverlappingGenerationsClosed (O : OverlappingGenerationsPackage) : Prop :=
  O.equilibriumAllocation ∧ O.monetaryEquilibrium ∧ O.paretoOptimality ∧ O.bubblesPossible

theorem overlapping_generations_closed_from_evidence
    (O : OverlappingGenerationsPackage) (E : OverlappingGenerationsEvidence O) :
    OverlappingGenerationsClosed O := by
  exact And.intro E.equilibriumAllocationClosed
    (And.intro E.monetaryEquilibriumClosed
      (And.intro E.paretoOptimalityClosed E.bubblesPossibleClosed))

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse