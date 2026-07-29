import ClassicalSolutionsPdesLemmaCanonicalLaneLean.MathlibObjects

/-!
# PDE Base Package
-/

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure PdeDomainPackage where
  region : Type u
  boundary : Type v
  regularityDegree : Nat
  domainSatisfiesConeCondition : Prop

def PdeDomainEvidence (D : PdeDomainPackage) : Prop :=
  D.domainSatisfiesConeCondition

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse
