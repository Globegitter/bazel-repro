def _impl(ctx):
    output = ctx.outputs.out

    # Note: This is not how I am using the rule for my use-case, but it illustrates the same issue
    # that the js bundling has, where the bundler expects to find the file on the short_path based
    # on the relative import.
    myargs = [ctx.outputs.out.path] + [f.short_path for f in ctx.files.deps]

    ctx.actions.run_shell(
      command = "cat $2 > $1",
      outputs = [ctx.outputs.out],
      arguments = myargs,
      inputs = ctx.files.deps,
    )

read = rule(
    implementation = _impl,
    attrs = {"deps": attr.label_list()},
    outputs = {"out": "%{name}.js"},
)