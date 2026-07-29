import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

def ConstrainedMeshProcessingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mesh_processing_endgame (A : AdmissibleClass) :
    ConstrainedMeshProcessingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
