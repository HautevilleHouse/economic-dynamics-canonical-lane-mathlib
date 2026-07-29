import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure AssetPricingModel where
  stochasticProcess : Type u
  discountFactor : Type v
  pricingFormula : Type w
  noArbitrageCondition : Prop
  marketEfficiency : Prop

def AssetPricingAdmissible (A : AdmissibleClass) : Prop :=
  AssetPricingModel.noArbitrageCondition A.object ∧
  AssetPricingModel.marketEfficiency A.object

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse