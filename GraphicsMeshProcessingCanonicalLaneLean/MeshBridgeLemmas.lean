import HautevilleHouse.GraphicsMeshProcessingCanonicalLaneLean.MeshAdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.triangularManifold ∧ A.object.orientable ∧ A.object.closed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse