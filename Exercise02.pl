#!perl

use lib "c:\\program files (x86)\\nimsoft\\perllib\\";

use Nimbus::API;
use NimBUS::CFG;
use Nimbus::Session;

my $prgname = "lab56_probe";
my $config   = "";
my $loglevel =  2;
my $logfile  = "$prgname.log";

###########################################################
# Command-set callback function(s), with parameter transfer
#
sub read_pds {
	my ($hMsg,$level,$name,$age) = @_;
	nimLog(1,"PDS - level: $level, name: $name, age: $age");
	nimSendReply($hMsg);
	#my ($hMsg,$arg1,$arg2,$arg3) = @_;
    #my $reply = pdsCreate();
    #nimLog(0, "[read_psd] INFO: Sending request pds");
    #pdsPut_INT($reply,"filesize",$filesize);
    #nimSendReply($hMsg,0,$reply);
    #pdsDelete($reply);
    #pdsDump(arg1);
}

###########################################################
# DoWork - function called by dispatcher on timeout
#
sub doWork {
	
}

#######################################################################
# Service functions
#
sub restart {
}

sub timeout {
    doWork();
}

###########################################################
# Signal handler - Ctrl-Break
#
sub ctrlc {

    nimLog(0,"Got a control-C so am restarting");
    exit;
}

###########################################################
# Main
#
$config   = Nimbus::CFG->new("$prgname.cfg");
$loglevel = $config->{setup}->{loglevel}|| 2;
$logfile  = $config->{setup}->{logfile} || "$prgname.log";

nimLogSet($logfile,$prgname,$loglevel,0);
nimLog(0,"----------------- Starting  (pid: $$) ------------------");

	$sess = Nimbus::Session->new("$prgname");
	$sess->setInfo($version,"Nimsoft Software AS");
	
	if ($sess->server (NIMPORT_ANY,\&timeout,\&restart)==0) {
	    $sess->addCallback ("read_pds", "level,name,age%d");
	}else {
	    nimLog(0,"unable to create server session");
	    exit(1);
	}
	
	nimLog(0,"Going to dispatch the probe");
	
	$sess->dispatch();
	exit;