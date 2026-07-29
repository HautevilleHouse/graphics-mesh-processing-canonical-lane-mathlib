import GraphicsMeshProcessingCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure AdmissibleClass where
  object : MeshAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MeshWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse