#

**Disclaimer:** The features here are based on my own game engine [Posit-92](https://github.com/Hevanafa/Posit-92_Wasm), which doesn't align with the main branch / official version of QBJS itself

## Requirements

* Perl to handle the module preprocessing

## Building

### Preprocessing

```powershell
perl .\preprocess.pl GAME.BAS
```

This outputs the entry point `MAIN.BAS` that is readable by QBJS

You can replace `GAME.BAS` with any entry point file

### Bundling to ZIP

```powershell
perl .\bundle.pl
```

This requires `MAIN.BAS` obtained from the section above
