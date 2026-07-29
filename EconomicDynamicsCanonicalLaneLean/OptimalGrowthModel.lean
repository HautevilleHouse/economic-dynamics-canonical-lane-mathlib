import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure OptimalGrowthModel where
  productionFunction : Type u
  utilityFunction : Type v
  capitalStock : Type w
  eulerEquation : Prop
  steadyStateExistence : Prop
  convergenceDynamics : Prop

def OptimalGrowthAdmissible (A : AdmissibleClass) : Prop :=
  OptimalGrowthModel.eulerEquation A.object ∧
  OptimalGrowthModel.steadyStateExistence A.object

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse