#!/usr/bin/perl

my $cum = 0;
while (chomp(my $in = <>)) {
  while (true) {
    $in = int($in / 3) - 2;
    last if $in <= 0;
    $cum += $in;
  }
}

print "$cum\n";
