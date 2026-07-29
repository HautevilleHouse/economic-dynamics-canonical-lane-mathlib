import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure GameTheoryEquilibrium where
  players : Type u
  actionSpaces : Type v
  payoffFunctions : Type w
  nashEquilibriumExistence : Prop
  subgamePerfectImpl : Prop

def GameAdmissible (A : AdmissibleClass) : Prop :=
  GameTheoryEquilibrium.nashEquilibriumExistence A.object ∧
  GameTheoryEquilibrium.subgamePerfectImpl A.object

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse