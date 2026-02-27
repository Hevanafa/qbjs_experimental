# Utility script to compile game files to game.zip
# By Hevanafa, 13-09-2025

use strict;
use warnings;
use 5.32.1;

my $sevenzip_path = "C:\\Program Files\\7-Zip\\7z.exe";
my @cmd = (
	$sevenzip_path,
	"a",
	"game.zip",
	"assets/",
	"MAIN.BAS"
);

die "Couldn't find MAIN.BAS!" if !(-e "MAIN.BAS");
unlink "game.zip" if -e "game.zip";

print join " ", @cmd;
system @cmd
