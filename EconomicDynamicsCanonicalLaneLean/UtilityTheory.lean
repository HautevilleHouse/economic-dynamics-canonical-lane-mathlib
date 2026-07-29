import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure UtilityTheoryPackage where
  consumptionSet : Type u
  preferenceRelation : Type v
  utilityFunction : Type w
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  strictMonotonicity : Prop
  utilityRepresentsPreference : Prop
  completenessTerm : completeness
  transitivityTerm : transitivity
  continuityTerm : continuity
  strictMonotonicityTerm : strictMonotonicity
  utilityRepresentsPreferenceTerm : utilityRepresentsPreference

structure UtilityTheoryEvidence (U : UtilityTheoryPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  strictMonotonicityClosed : U.strictMonotonicity
  utilityRepresentsPreferenceClosed : U.utilityRepresentsPreference

def UtilityTheoryClosed (U : UtilityTheoryPackage) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧
  U.strictMonotonicity ∧ U.utilityRepresentsPreference

theorem utility_theory_closed_from_evidence (U : UtilityTheoryPackage)
    (E : UtilityTheoryEvidence U) : UtilityTheoryClosed U := by
  exact And.intro E.completenessClosed
    (And.intro E.transitivityClosed
      (And.intro E.continuityClosed
        (And.intro E.strictMonotonicityClosed E.utilityRepresentsPreferenceClosed)))

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse