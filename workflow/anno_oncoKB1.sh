for i in {1..4};do
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff1.hg38_multianno.txt outdiff1\_Level$i\_tmp.txt 
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff2.hg38_multianno.txt outdiff2\_Level$i\_tmp.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff6.hg38_multianno.txt outdiff6\_Level$i\_tmp.txt 
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff8.hg38_multianno.txt outdiff8\_Level$i\_tmp.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff9.hg38_multianno.txt outdiff9\_Level$i\_tmp.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff10.hg38_multianno.txt outdiff10\_Level$i\_tmp.txt
done

