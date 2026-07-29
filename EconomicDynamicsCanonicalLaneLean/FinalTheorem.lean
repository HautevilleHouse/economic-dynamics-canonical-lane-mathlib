import canonicalLaneMathlib.AdmissibleClass
import EconomicDynamicsCanonicalLaneLean.GeneralEquilibrium
import EconomicDynamicsCanonicalLaneLean.UtilityTheory
import EconomicDynamicsCanonicalLaneLean.GrowthModels
import EconomicDynamicsCanonicalLaneLean.AssetPricing

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GeneralEquilibriumClosed A.object ∧ UtilityTheoryClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedEconomicDynamicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_economic_dynamics_endgame (A : AdmissibleClass) :
    ConstrainedEconomicDynamicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse