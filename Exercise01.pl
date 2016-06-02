use lib "c:\\program files (x86)\\nimsoft\\perllib\\";

#!/opt/nimbus/bin/perl
#################################################################
# CodeWizard:  perl 
# This code was generated with the Nimsoft CodeWizard version 1.70
# Date: Tuesday, May 31, 2016
# Modification: rodma08 - Copyright CA Technologies - UIM Custom Engineering Team

use strict;
use Getopt::Std;
use Nimbus::API;

my $prgname       = "Exercise01";
my $version       = "1.00";
my %options;

###########################################################
# MAIN ENTRY
###########################################################

getopts("i:",\%options);

#Alarme simples - Nivel de severidade NIML_MAJOR
nimAlarm(NIML_MAJOR,"Mensagem de alarme simples!!!!");

#Alarme Avançado - Nivel de severidade, mensagem, subsystem id, suppression
my $checkid = nimSuppToStr(0,0,0,"$prgname/xxx");
nimAlarm(NIML_MAJOR,"Ola essa e uma mensagem avancada com suppr ID","1.1.1",$checkid);
exit;