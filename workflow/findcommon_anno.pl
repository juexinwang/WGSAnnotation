#perl findcommon_anno.pl Level1.txt /scratch/wangjue/software/annovar/diff1.hg38_multianno.txt outdiff1.txt > outdiff1Level1.txt
open(QUERY,@ARGV[0]) or die("Cannot Query");
open(TARGET,@ARGV[1]) or die("Cannot Target");
#open(TARGET,"test.txt") or die("Cannot Target");
open(OUT,">".@ARGV[2]) or die("Cannot output\n");

while($line=<QUERY>){
chomp($line);
$hm{$line}=$line;
}


while($line=<TARGET>){
chomp($line);
@array=split("\\s+",$line);
@arrayT=split(",",$array[6]);

#print "#:".scalar(@arrayT)."\n*\n";

for($i=0;$i<scalar(@arrayT);$i++){
	#print $arrayT[$i]."\t";
	if(exists $hm{$arrayT[$i]}){
		$hmm{$arrayT[$i]}=$hmm{$arrayT[$i]}.$line."\n";
		#print $line."\n";
	}
}
#print "\n";
}

$count=0;
foreach $key (sort(keys %hmm)) {
$outArray[$count]=$key."\n".$hmm{$key}."\n";
print $key."\n";
$count++;
}

print OUT @outArray;
close OUT;
close QUERY;
close TARGET;
