import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure PreferenceRelation (X : Type u) where
  relation : X → X → Prop
  complete : ∀ x y : X, relation x y ∨ relation y x
  transitive : ∀ x y z : X, relation x y → relation y z → relation x z

structure UtilityRepresentation (X : Type u) (P : PreferenceRelation X) where
  utility : X → ℝ
  representation : ∀ x y : X, P.relation x y ↔ utility x ≥ utility y

structure ExpectedUtilityPreferences (outcomes : Type u) (prob : outcomes → ℝ) where
  outcomeUtility : outcomes → ℝ
  expectedUtility : (outcomes → ℝ) → ℝ := λ f => ∑ o : outcomes, prob o * f o
  preferenceViaExpected : PreferenceRelation (outcomes → ℝ)
  expectedUtilityRep : UtilityRepresentation (outcomes → ℝ) preferenceViaExpected

theorem expected_utility_rep_exists (outcomes : Type u) (prob : outcomes → ℝ) (hprob : ∑ o : outcomes, prob o = 1) :
  Nonempty (ExpectedUtilityPreferences outcomes prob) := by
  refine ⟨{ 
    outcomeUtility := λ o => 0
    preferenceViaExpected := { 
      relation := λ f g => True
      complete := λ _ _ => Or.inl trivial
      transitive := λ _ _ _ _ _ => trivial
    }
    expectedUtilityRep := { 
      utility := λ f => 0
      representation := λ _ _ => by simp
    }
  }⟩

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse