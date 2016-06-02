use lib "c:\\program files (x86)\\nimsoft\\perllib\\";
#!/opt/nimsoft/bin/perl

my $probe = "cdm";
my $var = "/cpu/alarm/warning/threshold";

use Nimbus::API;
use Nimbus::PDS;
$sid = nimLogin("administrator","CAdemo123");

$pds = pdsCreate();

$iret = pdsPut_PCH($pds,"name","$probe");
$iret = pdsPut_PCH($pds,"var","$var");

($iret,$pds_out) = nimNamedRequest ("controller", "probe_config_get", $pds , 30);

$value = pdsGet_PCH($pds_out,"value");


print "\n\nThe \"$var\" value is: $value\n";
