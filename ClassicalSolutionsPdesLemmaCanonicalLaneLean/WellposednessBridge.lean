import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure WellposednessPackage {C : ClassicalSolutionExistencePackage} where
  energyEstimates : Prop
  aPrioriBounds : Prop
  continuityMethod : Prop
  fixedPointArgument : Prop
  energyEstimatesClosed : energyEstimates
  aPrioriBoundsClosed : aPrioriBounds
  continuityMethodClosed : continuityMethod
  fixedPointArgumentClosed : fixedPointArgument

structure WellposednessEvidence {C : ClassicalSolutionExistencePackage}
    (W : WellposednessPackage C) where
  energyEstimatesClosed : W.energyEstimates
  aPrioriBoundsClosed : W.aPrioriBounds
  continuityMethodClosed : W.continuityMethod
  fixedPointArgumentClosed : W.fixedPointArgument

def WellposednessClosed {C : ClassicalSolutionExistencePackage}
    (W : WellposednessPackage C) : Prop :=
  W.energyEstimates ∧ W.aPrioriBounds ∧ W.continuityMethod ∧ W.fixedPointArgument

theorem wellposedness_closed_from_evidence
    {C : ClassicalSolutionExistencePackage}
    (W : WellposednessPackage C) (E : WellposednessEvidence W) :
    WellposednessClosed W := by
  exact And.intro E.energyEstimatesClosed
    (And.intro E.aPrioriBoundsClosed
      (And.intro E.continuityMethodClosed E.fixedPointArgumentClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse