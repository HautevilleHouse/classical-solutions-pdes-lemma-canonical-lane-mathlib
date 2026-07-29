import ClassicalSolutionsPdesLemmaCanonicalLaneLean.PDEBase

/-!
# Regularity Theory Package
-/

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure RegularityPackage {D : PdeDomainPackage} where
  holderEstimates : Prop
  sobolevEmbeddings : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  ellipticRegularityBoost : Prop

structure RegularityEvidence {D : PdeDomainPackage} (R : RegularityPackage D) where
  holderEstimatesClosed : R.holderEstimates
  sobolevEmbeddingsClosed : R.sobolevEmbeddings
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  ellipticRegularityBoostClosed : R.ellipticRegularityBoost

def RegularityClosed {D : PdeDomainPackage} (R : RegularityPackage D) : Prop :=
  R.holderEstimates ∧ R.sobolevEmbeddings ∧
  R.interiorRegularity ∧ R.boundaryRegularity ∧
  R.ellipticRegularityBoost

theorem regularity_closed_from_evidence {D : PdeDomainPackage}
    (R : RegularityPackage D) (E : RegularityEvidence R) :
    RegularityClosed R := by
  exact And.intro E.holderEstimatesClosed
    (And.intro E.sobolevEmbeddingsClosed
      (And.intro E.interiorRegularityClosed
        (And.intro E.boundaryRegularityClosed
          E.ellipticRegularityBoostClosed)))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse
