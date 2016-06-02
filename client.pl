#!perl

use lib "c:\\program files (x86)\\nimsoft\\perllib\\";

use Nimbus::API;
use Nimbus::Session;

	#my($sid) = nimLogin("administrator", "nimbus");
	my $pds = pdsCreate();
	# arg1,arg2_str,arg3_num
	pdsPut_PCH($pds, "level", "Marcio");
	pdsPut_PCH($pds, "name", "Robson");
	pdsPut_PCH($pds, "age", 22);
	

	($iret,$pds_out) = nimNamedRequest("lab56_probe", "read_pds", $pds);
	if ($iret == 0) {
		print $iret;
	    my $hello = pdsGet_PCH($pds_out,"read_pds");	
	    print("hello: $hello\n");	    
	}
	
