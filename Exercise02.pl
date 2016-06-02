 sub hubpost {
    my $hMsg  = shift;     # Message handle
    my $udata = shift;     # User data/message
    my $full  = shift;     # Full message (inkl. header)

    my $subject = pdsGet_PCH($full,"subject");
    my $string = pdsGet_PCH ($udata,"message");
    my $number = pdsGet_INT ($udata,"level");

    nimSendReply($hMsg);   # Must sent reply 
}

# MAIN ENTRY
$sess = Nimbus::Session->new("$prgname");
$sess->setInfo($version,"Nimsoft Corporation");
if ($sess->attach("$prgname")) {
    if ($sess->subscribe("alarm")) {
        exit;
    }
}
$sess->dispatch();
