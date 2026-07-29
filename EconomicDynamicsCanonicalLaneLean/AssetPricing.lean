import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicDynamicsCanonicalLaneLean

structure AssetPricingPackage where
  stateSpace : Type u
  assetSpace : Type v
  dividendProcess : Type w
  pricingKernel : Type x
  noArbitrage : Prop
  lawOfOnePrice : Prop
  marketCompleteness : Prop
  stochasticDiscountFactor : Prop
  noArbitrageTerm : noArbitrage
  lawOfOnePriceTerm : lawOfOnePrice
  marketCompletenessTerm : marketCompleteness
  stochasticDiscountFactorTerm : stochasticDiscountFactor

structure AssetPricingEvidence (A : AssetPricingPackage) where
  noArbitrageClosed : A.noArbitrage
  lawOfOnePriceClosed : A.lawOfOnePrice
  marketCompletenessClosed : A.marketCompleteness
  stochasticDiscountFactorClosed : A.stochasticDiscountFactor

def AssetPricingClosed (A : AssetPricingPackage) : Prop :=
  A.noArbitrage ∧ A.lawOfOnePrice ∧ A.marketCompleteness ∧ A.stochasticDiscountFactor

theorem asset_pricing_closed_from_evidence (A : AssetPricingPackage)
    (E : AssetPricingEvidence A) : AssetPricingClosed A := by
  exact And.intro E.noArbitrageClosed
    (And.intro E.lawOfOnePriceClosed
      (And.intro E.marketCompletenessClosed E.stochasticDiscountFactorClosed))

end EconomicDynamicsCanonicalLaneLean
end HautevilleHouse