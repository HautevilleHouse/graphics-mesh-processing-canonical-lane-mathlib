import GraphicsMeshProcessingCanonicalLaneLean.MeshBridgeLemma

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

def gateClosed (A : MeshAdmittedObject) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MeshAdmittedObject) :
    gateClosed A := by
  exact A.gateWitness

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
