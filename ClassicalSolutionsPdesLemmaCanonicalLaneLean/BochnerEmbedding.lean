import ClassicalSolutionsPdesLemmaCanonicalLaneLean.RegularityTheory

/-!
# Bochner Embedding Package
-/

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure BochnerEmbeddingPackage {D : PdeDomainPackage}
    (R : RegularityPackage D) where
  sobolevEmbeddingLp : Prop
  sobolevEmbeddingHolder : Prop
  compactEmbedding : Prop
  embeddingBounds : Prop

def BochnerEmbeddingEvidence {D : PdeDomainPackage}
    {R : RegularityPackage D} (B : BochnerEmbeddingPackage R) : Prop :=
  B.sobolevEmbeddingLp ∧ B.sobolevEmbeddingHolder ∧
  B.compactEmbedding ∧ B.embeddingBounds

def BochnerEmbeddingClosed {D : PdeDomainPackage}
    {R : RegularityPackage D} (B : BochnerEmbeddingPackage R) : Prop :=
  B.sobolevEmbeddingLp ∧ B.sobolevEmbeddingHolder ∧
  B.compactEmbedding ∧ B.embeddingBounds

theorem bochner_embedding_closed_from_evidence {D : PdeDomainPackage}
    {R : RegularityPackage D} (B : BochnerEmbeddingPackage R)
    (E : BochnerEmbeddingEvidence B) : BochnerEmbeddingClosed B := by
  exact And.intro E.sobolevEmbeddingLpClosed
    (And.intro E.sobolevEmbeddingHolderClosed
      (And.intro E.compactEmbeddingClosed E.embeddingBoundsClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse
