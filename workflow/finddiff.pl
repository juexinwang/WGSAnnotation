open(IN,"out.tab") or die("Cannot find INPUT\n");
open(OUT1,">diff1.txt") or die("Cannot find OUTPUT1\n");;
open(OUT1d,">diff1d.txt") or die("Cannot find OUTPUT1d\n");;
open(OUT2,">diff2.txt") or die("Cannot find OUTPUT2\n");;
open(OUT2d,">diff2d.txt") or die("Cannot find OUTPUT2d\n");;
open(OUT6,">diff6.txt") or die("Cannot find OUTPUT6\n");;
open(OUT6d,">diff6d.txt") or die("Cannot find OUTPUT6d\n");;
open(OUT8,">diff8.txt") or die("Cannot find OUTPUT8\n");;
open(OUT8d,">diff8d.txt") or die("Cannot find OUTPUT8d\n");;
open(OUT9,">diff9.txt") or die("Cannot find OUTPUT9\n");;
open(OUT9d,">diff9d.txt") or die("Cannot find OUTPUT9d\n");;
open(OUT10,">diff10.txt") or die("Cannot find OUTPUT10\n");;
open(OUT10d,">diff10d.txt") or die("Cannot find OUTPUT10d\n");;
open(OUTdiff,">diff.txt") or die("Cannot find OUTPUT DIFF\n");;
open(OUTall,">commonall.txt") or die("Cannot find OUTPUT ALL\n");;

$c1=0;
$d1=0;
$c2=0;
$d2=0;
$c6=0;
$d6=0;
$c8=0;
$d8=0;
$c9=0;
$d9=0;
$c10=0;
$d10=0;
$call=0;

$count=0;
while($line=<IN>){
chomp($line);
@array=split("\\s+",$line);
if($count>0){
	if($array[3] eq $array[4] or $array[3] eq "./." or $array[4] eq "./."){
		$c10++;
	}else{
		$outArrayd10[$d10]=$line."\n";
		$d10++;
	}
	if($array[5] eq $array[6] or $array[5] eq "./." or $array[6] eq "./."){
		$c1++;
	}else{
                $outArrayd1[$d1]=$line."\n";
                $d1++;
        }
	if($array[7] eq $array[8] or $array[7] eq "./." or $array[8] eq "./."){
		$c2++;
	}else{
                $outArrayd2[$d2]=$line."\n";
                $d2++;
        }
	if($array[9] eq $array[10] or $array[9] eq "./." or $array[10] eq "./."){
		$c6++;
	}else{
                $outArrayd6[$d6]=$line."\n";
                $d6++;
        }
	if($array[11] eq  $array[12] or $array[11] eq "./." or $array[12] eq "./."){
		$c8++;
	}else{
                $outArrayd8[$d8]=$line."\n";
                $d8++;
        }
	if($array[13] eq $array[14] or $array[13] eq "./." or $array[14] eq "./."){
		$c9++;
	}else{
                $outArrayd9[$d9]=$line."\n";
                $d9++;
        }
	
	$common="";
	if($array[4] ne "./."){
		$common=$array[4];
	}elsif($array[6] ne "./."){
		$common=$array[6];
	}elsif($array[8] ne "./."){
		$common=$array[8];
	}elsif($array[10] ne "./."){
		$common=$array[10];
	}elsif($array[12] ne "./."){
		$common=$array[12];
	}elsif($array[14] ne "./."){
		$common=$array[14];
	}
	if (($array[4] eq $common or $array[4] eq "./.") and ($array[6] eq $common or $array[6] eq "./.") and ($array[8] eq $common or $array[8] eq "./.") and ($array[10] eq $common or $array[10] eq "./.") and ($array[12] eq $common or $array[12] eq "./.") and ($array[14] eq $common or $array[14] eq "./.") ){
		$outArrayall[$call]=$line."\n";
		$hm{$array[0]}{$array[1]}="";
		$call++;
	}

	
}
if($count%1000000==0){
	print $count."\n";
}
$count++;
}

$dd1=0;
for($i=0;$i<scalar(@outArrayd1);$i++){
	@array=split("\\s+",$outArrayd1[$i]);
	$key=$array[0]."_".$array[1];
	$hmm{$key}=$outArrayd1[$i];
	$hmm1{$key}=$outArrayd1[$i];
}

$dd2=0;
for($i=0;$i<scalar(@outArrayd2);$i++){
	@array=split("\\s+",$outArrayd2[$i]);
	$key=$array[0]."_".$array[1];
	$hmm2{$key}=$outArrayd2[$i];
}

foreach $key (keys %hmm){
	if(exists $hmm2{$key}){
	}else{
		delete($hmm{$key});
	}
}


$dd6=0;
for($i=0;$i<scalar(@outArrayd6);$i++){
	@array=split("\\s+",$outArrayd6[$i]);
	$key=$array[0]."_".$array[1];
	$hmm6{$key}=$outArrayd6[$i];
}
foreach $key (keys %hmm){
	if(exists $hmm6{$key}){
	}else{
		delete($hmm{$key});
	}
}

$dd8=0;
for($i=0;$i<scalar(@outArrayd8);$i++){
	@array=split("\\s+",$outArrayd8[$i]);
	$key=$array[0]."_".$array[1];
	$hmm8{$key}=$outArrayd8[$i];
}
foreach $key (keys %hmm){
	if(exists $hmm8{$key}){
	}else{
		delete($hmm{$key});
	}
}

$dd9=0;
for($i=0;$i<scalar(@outArrayd9);$i++){
	@array=split("\\s+",$outArrayd9[$i]);
	$key=$array[0]."_".$array[1];
	$hmm9{$key}=$outArrayd9[$i];
}
foreach $key (keys %hmm){
	if(exists $hmm9{$key}){
	}else{
		delete($hmm{$key});
	}
}


$dd10=0;
for($i=0;$i<scalar(@outArrayd10);$i++){
	@array=split("\\s+",$outArrayd10[$i]);
	$key=$array[0]."_".$array[1];
	$hmm10{$key}=$outArrayd10[$i];
}
foreach $key (keys %hmm){
	if(exists $hmm10{$key}){
	}else{
		delete($hmm{$key});
	}
}

$count=0;
$size = keys %hmm;
foreach $key (keys %hmm){
$outArrayD[$count]=$hmm{$key};
$count++;
}

foreach $key (keys %hmm1){
	if(not exists $hmm2{$key} and not exists $hmm6{$key} and not exists $hmm8{$key} and not exists $hmm9{$key} and not exists $hmm10{$key}){
		$outArraydd1[$dd1]=$hmm1{$key};
                $dd1++;
	}
}
foreach $key (keys %hmm2){
	if(not exists $hmm1{$key} and not exists $hmm6{$key} and not exists $hmm8{$key} and not exists $hmm9{$key} and not exists $hmm10{$key}){
		$outArraydd2[$dd2]=$hmm2{$key};
                $dd2++;
	}
}
foreach $key (keys %hmm6){
	if(not exists $hmm1{$key} and not exists $hmm2{$key} and not exists $hmm8{$key} and not exists $hmm9{$key} and not exists $hmm10{$key}){
		$outArraydd6[$dd6]=$hmm6{$key};
                $dd6++;
	}
}
foreach $key (keys %hmm8){
	if(not exists $hmm1{$key} and not exists $hmm2{$key} and not exists $hmm6{$key} and not exists $hmm9{$key} and not exists $hmm10{$key}){
		$outArraydd8[$dd8]=$hmm8{$key};
                $dd8++;
	}
}
foreach $key (keys %hmm9){
	if(not exists $hmm1{$key} and not exists $hmm2{$key} and not exists $hmm6{$key} and not exists $hmm8{$key} and not exists $hmm10{$key}){
		$outArraydd9[$dd9]=$hmm9{$key};
                $dd9++;
	}
}
foreach $key (keys %hmm10){
	if(not exists $hmm1{$key} and not exists $hmm2{$key} and not exists $hmm6{$key} and not exists $hmm8{$key} and not exists $hmm9{$key}){
		$outArraydd10[$dd10]=$hmm10{$key};
                $dd10++;
	}
}


print "Common 1: ".$c1." Diff1: ".$d1." Unique1: ".$dd1."\n";
print "Common 2: ".$c2." Diff2: ".$d2." Unique2: ".$dd2."\n";
print "Common 6: ".$c6." Diff6: ".$d6." Unique6: ".$dd6."\n";
print "Common 8: ".$c8." Diff8: ".$d8." Unique8: ".$dd8."\n";
print "Common 9: ".$c9." Diff9: ".$d9." Unique9: ".$dd9."\n";
print "Common 10: ".$c10." Diff10: ".$d10." Unique10: ".$dd10."\n";
print "Common all Cancer: ".$call." Common in all diff:".$size."\n";


close IN;
print OUT1 @outArrayd1;
close OUT1;
print OUT2 @outArrayd2;
close OUT2;
print OUT6 @outArrayd6;
close OUT6;
print OUT8 @outArrayd8;
close OUT8;
print OUT9 @outArrayd9;
close OUT9;
print OUT10 @outArrayd10;
close OUT10;


print OUT1d @outArraydd1;
close OUT1d;
print OUT2d @outArraydd2;
close OUT2d;
print OUT6d @outArraydd6;
close OUT6d;
print OUT8d @outArraydd8;
close OUT8d;
print OUT9d @outArraydd9;
close OUT9d;
print OUT10d @outArraydd10;
close OUT10d;

print OUTdiff @outArrayD;
close OUTdiff;

print OUTall @outArrayall;
close OUTall;

