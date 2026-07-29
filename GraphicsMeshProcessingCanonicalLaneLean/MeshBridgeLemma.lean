import GraphicsMeshProcessingCanonicalLaneLean.MeshAdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

def bridgeClosed (A : MeshAdmittedObject) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : MeshAdmittedObject) :
    bridgeClosed A := by
  exact A.object.conclusion

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
