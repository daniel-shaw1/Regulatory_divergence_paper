if(@ARGV == 0) {
	print "***Purpose: Record positions with low read depth\n";
	print "***Use: low_read_depth.pl <genome coverage files>\n";
}

#use strict;
use warnings;
use Data::Dumper;

sub median {
    my (@data) = sort { $a <=> $b } @_;
    if ( scalar(@data) % 2 ) {
        return ( $data[ @data / 2 ] );
    } else {
        my ( $upper, $lower );
        $lower = $data[ @data / 2 ];
        $upper = $data[ @data / 2 - 1 ];
        return ( mean( $lower, $upper ) );
    }
}
sub mean {
    my (@data) = @_;
    my $sum;
    foreach (@data) {
        $sum += $_;
    }
    return ( $sum / @data );
}
sub max {
	my (@data) = @_;
    my $max = shift(@data);
    foreach (@data) {
        if ($_ > $max) {
        	$max = $_;
        }
    }
    return ( $max );
}
sub sum {
	my (@data) = @_;
    my $sum;
    foreach (@data) {
        $sum += $_;
    }
	return( $sum );
}

my $zeroDepthCounter = 0;
my $fileCounter = 0;
my %depthPositions;
while (@ARGV) {
	my $file = shift(@ARGV);
	print "$file\n";
	$fileCounter++;
	open (DEPTH, $file) || die "Unable to open depth file: $!\n";
	while (<DEPTH>) {
		chomp($_);
		my @splitLine = split(/\t/, $_);
		my $position = $splitLine[1];
		my $depth = $splitLine[2]; 
		if (!exists($depthPositions{$position})) {
			$depthPositions{$position} = $depth;
		}
		else {
			$depthPositions{$position} += $depth;
		}
	}
	close(DEPTH);
}

#determine what positions have lower than an average read depth across files
my @sortedPositions = sort {$a <=> $b} keys(%depthPositions);
open (OUT, ">low_depth_positions.txt") || die "Unable to write output file: $!\n";
my @totalSites;
foreach my $position (@sortedPositions) {
	#next if ($position < 2500000);
	my $averageDepth = $depthPositions{$position} / $fileCounter;
	push(@totalSites, $averageDepth);
	if ($averageDepth <= 6.5 || $averageDepth >= 26) {
		$zeroDepthCounter++;
		print OUT "$position\n";
	}
}
print "Total low depth sites: $zeroDepthCounter\n"; 
print mean(@totalSites) . "\n";
print median(@totalSites) . "\n";
