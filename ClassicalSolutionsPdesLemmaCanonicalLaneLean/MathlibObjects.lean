import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure ClassicalSolutionsDomain where
  carrier : Type
  topology : TopologicalSpace carrier

structure ClassicalSolutionsAdmittedObject where
  domain : ClassicalSolutionsDomain
  pdeSatisfied : Prop
  classicalRegularity : Prop
  solutionExists : Prop
  conclusion : solutionExists

structure ClassicalSolutionsEndgameState where
  object : ClassicalSolutionsAdmittedObject

def ClassicalSolutionsWitnessClosed (O : ClassicalSolutionsAdmittedObject) : Prop :=
  O.solutionExists

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse