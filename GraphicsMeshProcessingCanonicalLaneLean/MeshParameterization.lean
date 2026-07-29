import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure UVCoordinate where
  u : Float
  v : Float

structure SeamEdge where
  vertexPair : (Nat × Nat)
  chart : Nat

structure MeshParameterization where
  uvCoords : List UVCoordinate
  seams : List SeamEdge
  anglePreserving : Prop
  areaPreserving : Prop
  injective : Prop
  anglePreservingTerm : anglePreserving
  areaPreservingTerm : areaPreserving
  injectiveTerm : injective

structure MeshParameterizationEvidence (P : MeshParameterization) where
  noFlip : ∀ c ∈ P.uvCoords, 0.0 ≤ c.u ∧ c.u ≤ 1.0 ∧ 0.0 ≤ c.v ∧ c.v ≤ 1.0
  seamConsistent : ∀ s ∈ P.seams, s.chart ≥ 0
  distortionBounded : P.anglePreserving ∧ P.areaPreserving
  injectiveMap : P.injective

def MeshParameterizationClosed (P : MeshParameterization) : Prop :=
  (∀ c ∈ P.uvCoords, 0.0 ≤ c.u ∧ c.u ≤ 1.0 ∧ 0.0 ≤ c.v ∧ c.v ≤ 1.0) ∧
  (∀ s ∈ P.seams, s.chart ≥ 0) ∧
  P.anglePreserving ∧
  P.areaPreserving ∧
  P.injective

theorem mesh_parameterization_closed_from_evidence (P : MeshParameterization) (E : MeshParameterizationEvidence P) : MeshParameterizationClosed P := by
  exact And.intro E.noFlip (And.intro E.seamConsistent (And.intro E.distortionBounded E.injectiveMap))

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse