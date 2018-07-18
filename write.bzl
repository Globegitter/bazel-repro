def _impl(ctx):
    output = ctx.outputs.out
    ctx.actions.write(output = output, content = "I am a created js file")

file = rule(
    implementation = _impl,
    outputs = {"out": "%{name}.js"},
)