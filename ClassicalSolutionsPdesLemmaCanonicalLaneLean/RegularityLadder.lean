import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure RegularityLadderPackage where
  functionSpaceChain : Type u
  embeddingReferences : Prop
  compactnessProperty : Prop
  embeddingReferencesTerm : embeddingReferences
  compactnessPropertyTerm : compactnessProperty

structure RegularityLadderEvidence (R : RegularityLadderPackage) where
  embeddingReferencesClosed : R.embeddingReferences
  compactnessPropertyClosed : R.compactnessProperty

def RegularityLadderClosed (R : RegularityLadderPackage) : Prop :=
  R.embeddingReferences ∧ R.compactnessProperty

theorem regularity_ladder_closed_from_evidence (R : RegularityLadderPackage)
    (E : RegularityLadderEvidence R) : RegularityLadderClosed R :=
  And.intro E.embeddingReferencesClosed E.compactnessPropertyClosed

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse