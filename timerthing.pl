#!/usr/bin/perl -w

use Term::ReadKey;

use strict;

my $t=0;

ReadMode 3;

my $on=0;

print '00:00:00';

while (1)
      {
      select(undef,undef,undef,0.1);
     
      my $c=ReadKey(-1);
         
      if ( (defined($c)) && ($c eq ' ') )
         { $on=($on ? 0:1); $c=undef; } 
     
      next unless ($on);

      $t++;          
  
      print "\b" x 8;

      my $dsec=$t;
      my $secs=int($dsec/10);
      $dsec-=$secs*10;
      my $minutes=int($secs/60);
      $secs-=$minutes*60;
      my $hours=int($minutes/60);
      $minutes-=$hours*60;

      print sprintf("%1d%1d:",int($hours/10),$hours%10);
      print sprintf("%1d%1d:",int($minutes/10),$minutes%10);
      print sprintf("%1d%1d",int($secs/10),$secs%10);
	      
      if ( ($hours == 99) && ($minutes == 59) && ($secs == 59) && ($dsec == 9 ) )
	      { $t=0; }

      reset("STDIN");
      }

