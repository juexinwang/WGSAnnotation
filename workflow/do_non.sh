for i in {1..4};do
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff1.nonsynonymous outdiff1\_Level$i\_non.txt >  outdiff1\_Level$i\_gene\_non.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff2.nonsynonymous outdiff2\_Level$i\_non.txt >  outdiff2\_Level$i\_gene\_non.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff6.nonsynonymous outdiff6\_Level$i\_non.txt >  outdiff6\_Level$i\_gene\_non.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff8.nonsynonymous outdiff8\_Level$i\_non.txt >  outdiff8\_Level$i\_gene\_non.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff9.nonsynonymous outdiff9\_Level$i\_non.txt >  outdiff9\_Level$i\_gene\_non.txt
perl findcommon_anno_.pl Level$i.txt /scratch/wangjue/software/annovar/diff10.nonsynonymous outdiff10\_Level$i\_non.txt >  outdiff10\_Level$i\_gene\_non.txt
done

