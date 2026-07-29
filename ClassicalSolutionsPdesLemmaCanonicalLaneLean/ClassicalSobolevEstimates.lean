import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure SobolevEstimatePackage where
  functionSpace : Type u
  embeddingTheorem : Prop
  aPrioriEstimate : Prop
  regularityGain : Prop

structure SobolevEstimateEvidence (S : SobolevEstimatePackage) where
  embeddingTheoremClosed : S.embeddingTheorem
  aPrioriEstimateClosed : S.aPrioriEstimate
  regularityGainClosed : S.regularityGain

def SobolevEstimateClosed (S : SobolevEstimatePackage) : Prop :=
  S.embeddingTheorem ∧ S.aPrioriEstimate ∧ S.regularityGain

theorem sobolev_estimate_closed_from_evidence (S : SobolevEstimatePackage) (E : SobolevEstimateEvidence S) : SobolevEstimateClosed S := by
  exact And.intro E.embeddingTheoremClosed (And.intro E.aPrioriEstimateClosed E.regularityGainClosed)

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse