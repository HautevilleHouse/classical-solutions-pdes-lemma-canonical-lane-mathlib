import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure SchauderEstimatePackage where
  holderSpace : Type u
  holderEstimate : Prop
  interiorRegularity : Prop
  holderEstimateTerm : holderEstimate
  interiorRegularityTerm : interiorRegularity

structure SchauderEstimateEvidence (S : SchauderEstimatePackage) where
  holderEstimateClosed : S.holderEstimate
  interiorRegularityClosed : S.interiorRegularity

def SchauderEstimateClosed (S : SchauderEstimatePackage) : Prop :=
  S.holderEstimate ∧ S.interiorRegularity

theorem schauder_estimate_closed_from_evidence (S : SchauderEstimatePackage)
    (E : SchauderEstimateEvidence S) : SchauderEstimateClosed S :=
  And.intro E.holderEstimateClosed E.interiorRegularityClosed

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse