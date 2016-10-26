#!/usr/local/bin/perl
# Mike McQuade
# genome-path-string.pl
# Reconstructs a string from its given genome path.

# Define the packages to use
use strict;
use warnings;

# Initialize variables
my (@patterns);

# Open the file to read
open(my $fh,"<ba3b.txt") or die $!;

# Read in the values from the file
while (my $line = <$fh>) {
	chomp($line);
	push @patterns,$line;
}

# Iterate through the given patterns, concatenating the genomes
# after the points where they overlap.
my $text = $patterns[0];
for (my $i = 1; $i < scalar(@patterns); $i++) {
	$text .= substr($patterns[$i],-1);
}

# Print out the text string of all the genomes' concatenations
print $text;

# Close the file
close($fh) || die "Couldn't close file properly";