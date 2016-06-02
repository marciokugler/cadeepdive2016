#!perl
use lib "c:\\program files (x86)\\nimsoft\\perllib\\";
use strict;
use Getopt::Std;
use Nimbus::API;
use Nimbus::CFG;

my $prgname = "Exercise07";
my $version = "1.00";
my $config;
my %options;
my $loglevel = 0;
my $logfile  = "$prgname.log";
my $error;
my $errormessage;

###########################################################
# MAIN ENTRY
#
getopts("d:l:i:",\%options);
$config   = Nimbus::CFG->new("$prgname.cfg");
$loglevel = $options{d} || $config->{setup}->{loglevel}|| 0;
$logfile  = $options{l} || $config->{setup}->{logfile} || "$prgname.log";

nimLogSet($logfile,$prgname,$loglevel,0);
nimLog(0,"Starting probe. pid: $$");

# Get profiles
my @profiles = $config->getSections($config->{profiles});
nimLog(1,"Checking active profiles...");
foreach my $p (@profiles) {
  my $e = $config->{profiles}->{$p};
  if ($e->{active} eq "yes") {
    check_profile($p,$e);
  }
}

nimLog(0,"Exiting program");
exit;

# check_profile
#######################################################################
sub check_profile($$) {
  my $name     = shift;
  my $profile  = shift;
  return if (!defined($profile));

  my $server = $profile->{server} || "";
  my $type = $profile->{type} || "A";
  my $server_name = $profile->{name} || "www.yahoo.com";
  my $severity = $profile->{severity} || 4;

  nimLog(2,"Checking profile $name");
  nimLog(2,"profile_info: server: '$server', type: '$type', " .
    "server_name: '$server_name', severity: '$severity'");
}

