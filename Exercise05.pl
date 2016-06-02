#!perl

use lib "c:\\program files (x86)\\nimsoft\\perllib\\";
use Nimbus::API;
use Nimbus::Session;

	my($sid) = nimLogin("administrator", "CAdemo123");
	my $pds = pdsCreate();
	my $iret = pdsPut_PCH($pds,"package","processes");
	$iret = pdsPut_PCH($pds,"robot","/rodma08-uim01_domain/rodma08-uim01_hub/rodma08-uim01");
	
	$iret = pdsPut_PCH($pds,"job_id","");
	$iret = pdsPut_PCH($pds,"job_description","Install processes probe");
	$iret = pdsPut_PCH($pds,"version","4.20");
	$iret = pdsPut_PCH($pds,"update","");
	$iret = pdsPut_PCH($pds,"start_at","");
	
	($iret,$pds_out) = nimNamedRequest("distsrv", "job_add", $pds,90);
	if ($iret == 0) {
	    my $job_id = pdsGet_PCH($pds_out,"job_id");	
	    print("Your job_id: $job_id\n");	    
	}