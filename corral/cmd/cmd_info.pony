use "cli"
use "files"
use "../bundle"
use "../util"

primitive CmdInfo
  fun apply(ctx: Context, cmd: Command) =>
    match BundleFile.load_bundle(ctx.env, ctx.path, ctx.log)
    | let bundle: Bundle =>
      ctx.env.out.print(
        "  information from " + Files.bundle_filename()
          + " in " + bundle.name())
      ctx.env.out.print("  info: " + bundle.info.json().string())
    | let err: Error =>
      ctx.env.out.print(err.message)
      ctx.env.exitcode(1)
    end
