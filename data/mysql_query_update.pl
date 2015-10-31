#!/usr/bin/perl

# Updates queries for MySQL (from default).

use strict;


sub rewrite_query_part {
my $part = shift;

	$part =~ s/"/`/g;
	$part;
}

sub rewrite_query {
my $query = shift;

	# split into SELECT, FROM (everything is a table), remainder
	my $select = "";
	my $from = "";
	my $rest = "";

	return "sql=\n" if ($query !~ m/SELECT[ \t\n]/i); #empty query

	($select, my $from_rest) = split(/[ \t\n]FROM[ \t\n]/i, $query);
	if ($from_rest =~ m/[ \t\n]WHERE[ \t\n]/i) {
		($from, $rest) = split(/[ \t\n]WHERE[ \t\n]/i, $from_rest);
		$rest = " WHERE " . $rest;
	} else {
		$from = $from_rest; #no WHERE
	}
	$from = " FROM " . $from;

	$query = &rewrite_query_part($select)
		. &rewrite_query_part($from)
		. &rewrite_query_part($rest);

	$query =~ s/\\ FROM /\\\nFROM /g;
	$query =~ s/\\ WHERE /\\\nWHERE /g;

	$query;
}


sub rewrite_queries {

	print "Re-writing queries...\n";

	#for each query: parse and trigger rewrite:
	my @queries = glob("./queries/*.qpair");

	foreach my $qfn (@queries) {
		my $preface = "";
		my $rest = "";
		my $query = "";
		my $state = 0;

		open my $qf, "<", $qfn or die "Cannot open query file (ro).";
		while(<$qf>) {
		my $lne = $_;

			if ($state == 0) {
				if ($lne =~ m/^[ \t\n]*sql[ \t]*=/) {
					$state = 1;
					$query .= $lne;

					$state = 2
						if ($lne !~ m/\\$/);
				} else {
					$preface .= $lne;
				}
			} elsif ($state == 1) {
				$query .= $lne;

				$state = 2
					if ($lne !~ m/\\$/);
			} else {
				$rest .= $lne;
			}
		}
		close($qf);

		open $qf, ">", $qfn or die "Cannot open query file (rw).";
		print $qf $preface;
		print $qf &rewrite_query($query);
		print $qf $rest;
		close($qf);
	}

	1;
}

# main
&rewrite_queries();

1;

