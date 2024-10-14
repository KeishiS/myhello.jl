module myhello

using
    Artifacts

export
    julia_add

greet() = print("Hello World!")

libmyhello = joinpath(
    artifact"myhello",
    "lib", "libmyhello.$(Libc.Libdl.dlext)"
)

julia_add(a::Int64, b::Int64) = @ccall libmyhello.myadd(a::Int64, b::Int64)::Int64

end # module myhello
