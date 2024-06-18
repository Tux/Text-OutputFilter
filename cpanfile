requires   "Carp";

on "configure" => sub {
    requires   "ExtUtils::MakeMaker";

    recommends "ExtUtils::MakeMaker"      => "7.70";
    };

on "test" => sub {
    requires   "Test::More";
    requires   "Test::NoWarnings";

    recommends "Test::More"               => "1.302199";
    };
