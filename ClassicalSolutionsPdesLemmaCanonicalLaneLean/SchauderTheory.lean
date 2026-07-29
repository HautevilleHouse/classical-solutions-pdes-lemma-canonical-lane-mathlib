import ClassicalSolutionsPdesLemmaCanonicalLaneLean.RegularityTheory

/-!
# Schauder Theory Package
-/

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure SchauderPackage {D : PdeDomainPackage} {R : RegularityPackage D} where
  aPrioriEstimates : Prop
  interiorSchauder : Prop
  boundarySchauder : Prop
  globalSchauder : Prop

def SchauderEvidence {D : PdeDomainPackage} {R : RegularityPackage D}
    (S : SchauderPackage R) : Prop :=
  S.aPrioriEstimates ∧ S.interiorSchauder ∧ S.boundarySchauder ∧ S.globalSchauder

def SchauderClosed {D : PdeDomainPackage} {R : RegularityPackage D}
    (S : SchauderPackage R) : Prop :=
  S.aPrioriEstimates ∧ S.interiorSchauder ∧ S.boundarySchauder ∧ S.globalSchauder

theorem schauder_closed_from_evidence {D : PdeDomainPackage}
    {R : RegularityPackage D} (S : SchauderPackage R)
    (E : SchauderEvidence S) : SchauderClosed S := by
  exact And.intro E (by exact And.intro (by exact And.left E) (by exact And.right (And.right (And.right E))) )

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse
