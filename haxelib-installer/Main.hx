using StringTools;

typedef Haxelib =
{
    var name:String;
    @:optional var vers:String;
}

typedef Gitlib =
{
    var name:String;
    var url:String;
    @:optional var ref:String;
}

class Main
{
    #if sys
    // ---------- helpers ----------

    static function hasFlag(args:Array<String>, flag:String):Bool
    {
        return args.indexOf(flag) != -1;
    }

    static function askYesNo(question:String, defaultYes:Bool = true):Bool
    {
        var suffix = defaultYes ? " [Y/n] " : " [y/N] ";
        Sys.print(question + suffix);

        var input = Sys.stdin().readLine().trim().toLowerCase();
        if (input == "") return defaultYes;
        return input == "y" || input == "yes";
    }

    // ---------- haxelib actions ----------

    public static function installLibrary(
        name:String,
        vers:String = null,
        skipDependencies:Bool = true
    )
    {
        var cmd = 'haxelib install $name';
        if (vers != null) cmd += ' $vers';
        if (skipDependencies) cmd += ' --quiet';
        cmd += ' --always';

        Sys.println(cmd);
        Sys.command(cmd);
    }

    inline public static function updateLibrary(name:String)
    {
        Sys.println('haxelib update $name');
        Sys.command('haxelib update $name');
    }

    public static function installFromGit(
        name:String,
        url:String,
        ref:String = null
    )
    {
        var cmd = 'haxelib git $name $url';
        if (ref != null) cmd += ' $ref';
        cmd += ' --always';

        Sys.println(cmd);
        Sys.command(cmd);
    }

    // ---------- deps ----------

    static var haxelibs:Array<Haxelib> = [
        { name: 'lime', vers: '8.2.2' },
        { name: 'openfl', vers: '9.4.1' },
        { name: 'hxcpp', vers: '4.3.2'}
    ];

    static var gitlibs:Array<Gitlib> = [
        { name: 'flixel-brainy', url: 'https://github.com/Brainy0789/flixel-brainy', ref: 'main' },
        { name: 'gscript', url: 'https://github.com/gteamfnf/GScript', ref: 'master'}
    ];

    // ---------- commands ----------

    static function runInstall(args:Array<String>)
    {
        var autoYes = hasFlag(args, "--yes");

        if (!hasFlag(args, "--no-setup"))
        {
            if (autoYes || askYesNo("Setup haxelib?"))
            {
                Sys.command("haxelib setup");
            }
        }

        Sys.println('Setting up repo...');
        Sys.command('haxelib newrepo');

        Sys.println("Installing haxelib dependencies...");
        for (lib in haxelibs)
            installLibrary(lib.name, lib.vers);

        Sys.println("Installing git dependencies...");
        for (lib in gitlibs)
            installFromGit(lib.name, lib.url, lib.ref);

        Sys.println("All dependencies installed.");
    }

    static function runUpdate()
    {
        Sys.println("Updating haxelib dependencies...");
        for (lib in haxelibs)
            updateLibrary(lib.name);

        Sys.println("All dependencies updated.");
    }

    static function runCompile(args:Array<String>)
    {
        var autoYes = hasFlag(args, "--yes");

        if (autoYes || askYesNo("Setup lime?"))
        {
            Sys.command("haxelib run lime setup --always");
        }

        Sys.command("haxelib run lime test cpp");
    }

    static function printHelp()
    {
        Sys.println("
G Engine Setup Tool

Usage:
  install [--yes] [--no-setup]
  update
  compile [--yes]

Flags:
  --yes        Auto-confirm prompts
  --no-setup  Skip haxelib setup
");
    }

    // ---------- entry ----------

    static function main()
    {
        var args = Sys.args();

        if (args.length == 0)
        {
            printHelp();
            Sys.exit(1);
        }

        switch (args[0])
        {
            case "install":
                runInstall(args);

            case "update":
                runUpdate();

            case "compile":
                runCompile(args);

            case "help":
                printHelp();

            default:
                Sys.println('Unknown command: ${args[0]}');
                printHelp();
                Sys.exit(1);
        }
    }
    #else
    macro static function main()
    {
        throw 'Cannot compile to non sys targets!';

        return macro null;
    }
    #end
}