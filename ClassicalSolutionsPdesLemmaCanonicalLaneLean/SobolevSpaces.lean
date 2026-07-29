import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure SobolevSpaces where
  exponent : Nat
  weakDerivativeExistence : Prop
  embeddingTheorems : Prop
  compactEmbedding : Prop
  normCompleteness : Prop

structure SobolevSpaceEvidence (S : SobolevSpaces) where
  weakDerivativeExistenceClosed : S.weakDerivativeExistence
  embeddingTheoremsClosed : S.embeddingTheorems
  compactEmbeddingClosed : S.compactEmbedding
  normCompletenessClosed : S.normCompleteness

def SobolevSpacesClosed (S : SobolevSpaces) : Prop :=
  S.weakDerivativeExistence ∧ S.embeddingTheorems ∧
  S.compactEmbedding ∧ S.normCompleteness

theorem sobolev_spaces_closed_from_evidence (S : SobolevSpaces) (E : SobolevSpaceEvidence S) :
    SobolevSpacesClosed S := by
  exact And.intro E.weakDerivativeExistenceClosed
    (And.intro E.embeddingTheoremsClosed
      (And.intro E.compactEmbeddingClosed E.normCompletenessClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse