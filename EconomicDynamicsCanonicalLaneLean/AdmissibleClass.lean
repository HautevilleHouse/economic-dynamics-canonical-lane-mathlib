import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure EconomicAgent where
  preferences : Type u
  endowment : Type v
  rationality : Prop

structure ArrowDebreuEconomy where
  agents : List EconomicAgent
  commodities : Type w
  priceSystem : Type x
  equilibriumExists : Prop
  equilibriumAllocation : Prop
  conclusion : equilibriumExists ∧ equilibriumAllocation

structure AdmissibleClass where
  object : ArrowDebreuEconomy
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ArrowDebreuWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ArrowDebreuWitnessClosed (O : ArrowDebreuEconomy) : Prop :=
  O.equilibriumExists ∧ O.equilibriumAllocation

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse