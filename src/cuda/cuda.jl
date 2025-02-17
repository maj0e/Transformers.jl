using CUDA

import CUDA: CuArray

togpudevice(x) = gpu(x)
togpudevice(x, xs...) = (todevice(x), map(todevice, xs)...)
togpudevice(x::Union{Tuple, NamedTuple}) = map(todevice, x)
togpudevice(x::AbstractArray{<:Union{Int, <: NTuple{N, Int} where N}}) = CUDA.CuArray(x)

include("./statistic.jl")
include("./batch_gemm_gpu.jl")
include("./batch_tril_gpu.jl")
