#!perl

use lib "c:\\program files (x86)\\nimsoft\\perllib\\";
use Nimbus::API;
use Nimbus::Session;
use Nimbus::PDS;

my $prgname = "Exercise04";
my $config   = "";
my $loglevel =  2;
my $logfile  = "$prgname.log";

$loglevel = $config->{setup}->{loglevel}|| 2;
$logfile  = $config->{setup}->{logfile} || "$prgname.log";

nimLogSet($logfile,$prgname,$loglevel,0);
nimLog(0,"----------------- Starting  (pid: $$) ------------------");
my $pds = pdsCreate();

	my($sid) = nimLogin("administrator", "CAdemo123");	
	($iret,$pds_out) = nimNamedRequest("controller", "gethub", $pds , 90);
	
	if ($iret == 0) {
		my $domain = pdsGet_PCH($pds_out,"domain");	
	    print("Domain: $domain\n");	    
	}