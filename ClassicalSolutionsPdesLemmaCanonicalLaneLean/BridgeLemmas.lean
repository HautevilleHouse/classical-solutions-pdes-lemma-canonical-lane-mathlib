import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClassicalSolutionsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse