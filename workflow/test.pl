# create a simple perl hash
$prices{'pizza'} = 12.00;
 $prices{'coke'} = 1.25;
 $prices{'sandwich'} = 3.00;
#
# # print all the elements in the hash
 print "before:\n";
 print %prices;
#
# # delete the hash element with the 'pizza' key
 print "\n\nremove pizza:\n";
 delete($prices{'pizza'});
 print %prices;
#
# # delete the hash element with the 'sandwich' key
 print "\n\nremove sandwich:\n";
 delete($prices{'sandwich'});
 print %prices;
#
# # delete the hash element with the 'coke' key
 print "\n\nremove coke:\n";
 delete($prices{'coke'});
 print %prices;
