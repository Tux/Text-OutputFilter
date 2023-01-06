# NAME

OutputFilter - Enable post processing of output without fork

# SYNOPSIS

    use Text::OutputFilter;

    my $bucket = "";
    tie *STDOUT, "Text::OutputFilter";
    tie *HANDLE, "Text::OutputFilter", 4;
    tie *HANDLE, "Text::OutputFilter", 4,  *STDOUT;
    tie *STDOUT, "Text::OutputFilter", 4, \$bucket;
    tie *OUTPUT, "Text::OutputFilter", 4,  *STDOUT, sub { "$_[0]" };

# DESCRIPTION

This interface enables some post-processing on output streams,
like adding a left margin.

The tied filehandle is opened unbuffered, but the output is line
buffered. The `tie` takes three optional arguments:

- Left Margin

    The left margin must be a positive integer and defaults to `4` spaces.

- Output Stream

    The output stream must be an already open stream, with writing
    enabled. The default is `*STDOUT`. All input methods on the new
    stream are disabled. If a reference to a scalar is passed, it will
    be opened as PerlIO::scalar - in-memory IO, scalar IO. No checks
    performed to see if your perl supports it. If you want it, and your
    perl does not, upgrade.

    Using `binmode ()` on the new stream is allowed and supported.

    OPEN, SEEK, and WRITE are not (yet) implemented.

- Line Modifying Function

    The output is line buffered, to enable line-modifier functions.
    The line (without newline) is passed as the only argument to the
    sub-ref, whose output is printed after the prefix from the first
    argument. A newline is printed after the sub-ref's output.

    To **filter** a line, as in _remove_ it from the stream, make the
    sub return _undef_.

# TODO

Tests, tests, tests.
Tests with older perls

# AUTHOR

H.Merijn Brand <h.m.brand@procura.nl>

# COPYRIGHT AND LICENSE

Copyright (C) 2006-2023 H.Merijn Brand for PROCURA B.V.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

# SEE ALSO

perl(1), perlopen(1), 'open STDOUT, "|-"', Text::Filter
