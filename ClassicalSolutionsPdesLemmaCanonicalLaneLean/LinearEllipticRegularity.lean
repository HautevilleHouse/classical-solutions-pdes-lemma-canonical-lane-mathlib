import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure LinearEllipticRegularity where
  operator : Type u
  domainRegularity : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  existenceWeakSolution : Prop
  uniquenessWeakSolution : Prop
  regularityGain : Prop

structure LinearEllipticRegularityEvidence (L : LinearEllipticRegularity) where
  domainRegularityClosed : L.domainRegularity
  interiorRegularityClosed : L.interiorRegularity
  boundaryRegularityClosed : L.boundaryRegularity
  existenceWeakSolutionClosed : L.existenceWeakSolution
  uniquenessWeakSolutionClosed : L.uniquenessWeakSolution
  regularityGainClosed : L.regularityGain

def LinearEllipticRegularityClosed (L : LinearEllipticRegularity) : Prop :=
  L.domainRegularity ∧ L.interiorRegularity ∧ L.boundaryRegularity ∧
  L.existenceWeakSolution ∧ L.uniquenessWeakSolution ∧ L.regularityGain

theorem linear_elliptic_regularity_closed_from_evidence
    (L : LinearEllipticRegularity) (E : LinearEllipticRegularityEvidence L) :
    LinearEllipticRegularityClosed L := by
  exact And.intro E.domainRegularityClosed
    (And.intro E.interiorRegularityClosed
      (And.intro E.boundaryRegularityClosed
        (And.intro E.existenceWeakSolutionClosed
          (And.intro E.uniquenessWeakSolutionClosed E.regularityGainClosed))))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse