#!/pro/bin/perl

use strict;
use warnings;

use Getopt::Long qw(:config bundling nopermute);
my $check = 0;
my $opt_v = 0;
GetOptions (
    "c|check"		=> \$check,
    "v|verbose:1"	=> \$opt_v,
    ) or die "usage: $0 [--check]\n";

use lib "sandbox";
use genMETA;
my $meta = genMETA->new (
    from    => "OutputFilter.pm",
    verbose => $opt_v,
    );

$meta->from_data (<DATA>);

if ($check) {
    $meta->check_encoding ();
    $meta->check_required ();
    $meta->check_minimum ([ "t", "examples", "OutputFilter.pm", "Makefile.PL" ]);
    $meta->done_testing ();
    }
elsif ($opt_v) {
    $meta->print_yaml ();
    }
else {
    $meta->fix_meta ();
    }

__END__
--- #YAML:1.0
name:                    Text-OutputFilter
version:                 VERSION
abstract:                Filter and modify output
license:                 perl
author:              
    - H.Merijn Brand <h.m.brand@xs4all.nl>
generated_by:            Author
distribution_type:       module
provides:
    Text::OutputFilter:
        file:            OutputFilter.pm
        version:         VERSION
requires:     
    perl:                5.008
    Carp:                0
recommends:     
    perl:                5.020001
configure_requires:
    ExtUtils::MakeMaker: 0
test_requires:
    Test::More:          0
    Test::NoWarnings:    0
resources:
    license:             http://dev.perl.org/licenses/
    repository:          http://repo.or.cz/w/Text-OutputFilter.git
meta-spec:
    version:             1.4
    url:                 http://module-build.sourceforge.net/META-spec-v1.4.html
