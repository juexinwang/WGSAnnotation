open(QUERY,"Level4.txt") or die("Cannot Query");
open(TARGET,"332gene.csv") or die("Cannot Target");

while($line=<QUERY>){
chomp($line);
@array=split("\"",$line);
$hm{$array[1]}=$array[1];
}

while($line=<TARGET>){
chomp($line);
if(exists $hm{$line}){
print $line."\n";
}
}

close QUERY;
close TARGET;
