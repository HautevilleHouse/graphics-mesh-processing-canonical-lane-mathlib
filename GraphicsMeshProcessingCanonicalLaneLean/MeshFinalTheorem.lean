import GraphicsMeshProcessingCanonicalLaneLean.MeshGateLemma

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

def ConstrainedMeshClosure (A : MeshAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mesh_endgame (A : MeshAdmittedObject) :
    ConstrainedMeshClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
