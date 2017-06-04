#!/bin/perl
# Main procedure for the analysis
# perl main.pl out.tab 10 3 4

use strict;

open( IN,   $ARGV[0] )                     or die("Cannot find INPUT\n");
open( OUTC, ">diff" . $ARGV[1] . "c.txt" ) or die("Cannot find OUTPUTc\n");
open( OUTD, ">diff" . $ARGV[2] . "d.txt" ) or die("Cannot find OUTPUTd\n");
open( OUTDhomo, ">diff" . $ARGV[2] . "dhomo.txt" )
  or die("Cannot find OUTPUTdhomo\n");
open( OUTDhete, ">diff" . $ARGV[2] . "dhete.txt" )
  or die("Cannot find OUTPUTdhete\n");

my $countC     = 0;
my $countD     = 0;
my $countDhomo = 0;
my $countDhete = 0;

my @outArrayC;
my @outArrayD;
my @outArrayDhomo;
my @outArrayDhete;

my $count = 0;
my $line;
while ( $line = <IN> ) {
	chomp($line);
	my @array = split( "\\s+", $line );
	if ( $count > 0 ) {
		if (   $array[ $ARGV[3] ] eq $array[ $ARGV[4] ]
			or $array[ $ARGV[3] ] eq "./."
			or $array[ $ARGV[4] ] eq "./." )
		{
			$outArrayC[$countC] = $line . "\n";
			$countC++;
		}
		else {
			$outArrayD[$countD] = $line . "\n";
			$countD++;
			my @arrayT1 = split( "\/", $array[ $ARGV[3] ] );
			my @arrayT2 = split( "\/", $array[ $ARGV[4] ] );
			if (    ( $arrayT1[0] eq $arrayT1[1] )
				and ( $arrayT2[0] eq $arrayT2[1] ) )
			{
				$outArrayDhomo[$countDhomo] = $line . "\n";
				$countDhomo++;
			}
			else {
				$outArrayDhete[$countDhete] = $line . "\n";
				$countDhete++;
			}
		}

	}
	if ( $count % 1000000 == 0 ) {
		print $count. "\n";
	}
	$count++;
}

print "Patient: "
  . $ARGV[1]
  . " Common: "
  . $countC
  . " Diff: "
  . $countD
  . " DiffHomo: "
  . $countDhomo
  . " DiffHete "
  . $countDhete . "\n";

close IN;
print OUTC @outArrayC;
close OUTC;
print OUTD @outArrayD;
close OUTD;
print OUTDhomo @outArrayDhomo;
close OUTDhomo;
print OUTDhete @outArrayDhete;
close OUTDhete;
