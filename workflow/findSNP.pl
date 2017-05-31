open(IN,"/scratch/wangjue/data/DNACore/cancer/results/diff.txt") or die("Cannot input IN\n");
open(VCF,"all.vcf") or die("Cannot input VCF\n");
open(OUT,">diff.vcf") or die("Cannot input OUT\n");

$count=0;
while($line=<IN>){
chomp($line);
@array=split("\\s+",$line);
@array1 = split("Chr",$array[0]);
if($array1[1] eq "X"){
$chr = "X";
}elsif($array1[1] eq "Y"){
$chr = "Y";
}else{
$chr = $array1[1]+0;
}
$pos = $array[1];
$hm{$chr}{$pos}="";
$count++;
}
$size = keys %hm;
print "Size: ".$size."\n";

$count=0;
$lcount=0;
while($line=<VCF>){
chomp($line);
@array=split("\\s+",$line);
if($line !~ /^\#/){
if(exists $hm{$array[0]}{$array[1]}){
$outArray[$lcount]=$line."\n";
$lcount++;
}
}

if($count%1000000 ==0 ){
print $count."\n";
}

$count++;
}


close IN;
close VCF;
print OUT @outArray;
close OUT;
