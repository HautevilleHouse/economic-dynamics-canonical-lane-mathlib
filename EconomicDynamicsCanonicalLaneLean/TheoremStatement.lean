import HautevilleHouse.EconomicDynamicsCanonicalLaneLean.Formalization

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure EconomicSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicAdmittedObject where
  space : EconomicSpace
  completeness : Prop
  equilibriumExists : Prop
  modelType : Type
  modelTopology : TopologicalSpace modelType
  equilibriumMatched : Prop
  conclusion : equilibriumMatched

structure EconomicEndgameState where
  object : EconomicAdmittedObject

def EconomicWitnessClosed (O : EconomicAdmittedObject) : Prop :=
  O.equilibriumMatched

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse