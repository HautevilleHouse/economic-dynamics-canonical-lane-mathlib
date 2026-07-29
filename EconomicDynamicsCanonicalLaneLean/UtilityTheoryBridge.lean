import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure UtilityPreferencesPackage where
  consumptionSpace : Type u
  preferenceRelation : consumptionSpace → consumptionSpace → Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  strictMonotonicity : Prop

structure UtilityPreferencesEvidence (U : UtilityPreferencesPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  strictMonotonicityClosed : U.strictMonotonicity

def UtilityPreferencesClosed (U : UtilityPreferencesPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.strictMonotonicity

theorem utility_preferences_closed_from_evidence (U : UtilityPreferencesPackage)
    (E : UtilityPreferencesEvidence U) : UtilityPreferencesClosed U := by
  exact And.intro E.completenessClosed
    (And.intro E.transitivityClosed
      (And.intro E.continuityClosed E.strictMonotonicityClosed))

structure UtilityRepresentationPackage (U : UtilityPreferencesPackage) where
  utilityFunction : U.consumptionSpace → ℝ
  representing : ∀ x y, U.preferenceRelation x y ↔ utilityFunction x ≥ utilityFunction y

structure UtilityRepresentationEvidence {U : UtilityPreferencesPackage}
    (R : UtilityRepresentationPackage U) where
  representingClosed : R.representing

def UtilityRepresentationClosed {U : UtilityPreferencesPackage}
    (R : UtilityRepresentationPackage U) : Prop :=
  R.representing

theorem utility_representation_closed_from_evidence
    {U : UtilityPreferencesPackage} (R : UtilityRepresentationPackage U)
    (E : UtilityRepresentationEvidence R) : UtilityRepresentationClosed R := by
  exact E.representingClosed

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse