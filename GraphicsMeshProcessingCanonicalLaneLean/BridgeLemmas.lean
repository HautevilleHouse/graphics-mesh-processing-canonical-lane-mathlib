import GraphicsMeshProcessingCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MeshWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse