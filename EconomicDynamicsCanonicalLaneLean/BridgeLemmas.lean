import EconomicDynamicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ArrowDebreuWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse