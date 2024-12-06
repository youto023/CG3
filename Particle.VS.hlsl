#include"Particle.hlsli"



struct TransformationMatrix
{
    float4x4 WVP;
    float4x4 World;
};
StructuredBuffer<TransformationMatrix> gTransformationMatrices : register(t0);

//struct VertexShaderOutput {
//	float32_t4 position : SV_POSITION;
//};

struct VertexShaderInput
{
    float4 position : POSITION0;
    float2 texcoord : TEXCOORD0;
};

VertexShaderOutput main(VertexShaderInput input, uint32_t instanceId : SV_InstanceID)
{
    VertexShaderOutput output;
    output.position = mul(input.position, gTransformationMatrices[instanceId].WVP); //output.position = input.position
    output.texcoord = input.texcoord;
    return output;
}