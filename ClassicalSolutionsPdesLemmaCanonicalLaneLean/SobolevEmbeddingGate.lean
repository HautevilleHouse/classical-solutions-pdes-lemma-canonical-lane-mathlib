import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure SobolevEmbeddingPackage where
  sobolevInequality : Prop
  morreyInequality : Prop
  gagliardoNirenberg : Prop
  compactEmbedding : Prop
  sobolevInequalityClosed : sobolevInequality
  morreyInequalityClosed : morreyInequality
  gagliardoNirenbergClosed : gagliardoNirenberg
  compactEmbeddingClosed : compactEmbedding

structure SobolevEmbeddingEvidence (S : SobolevEmbeddingPackage) where
  sobolevInequalityClosed : S.sobolevInequality
  morreyInequalityClosed : S.morreyInequality
  gagliardoNirenbergClosed : S.gagliardoNirenberg
  compactEmbeddingClosed : S.compactEmbedding

def SobolevEmbeddingClosed (S : SobolevEmbeddingPackage) : Prop :=
  S.sobolevInequality ∧ S.morreyInequality ∧ S.gagliardoNirenberg ∧ S.compactEmbedding

theorem sobolev_embedding_closed_from_evidence
    (S : SobolevEmbeddingPackage) (E : SobolevEmbeddingEvidence S) :
    SobolevEmbeddingClosed S := by
  exact And.intro E.sobolevInequalityClosed
    (And.intro E.morreyInequalityClosed
      (And.intro E.gagliardoNirenbergClosed E.compactEmbeddingClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse