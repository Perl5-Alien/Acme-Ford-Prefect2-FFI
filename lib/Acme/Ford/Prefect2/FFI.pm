package Acme::Ford::Prefect2::FFI;

use strict;
use warnings;
use 5.008001;
use Acme::Alien::DontPanic2 ();
use FFI::Platypus::Declare;

# ABSTRACT: FFI test module for Alien::Base
# VERSION

=head1 SYNOPSIS

 use Acme::Ford::Prefect2::FFI;
 
 my $answer = Acme::Ford::Prefect2::FFI::answer(); # == 42 of course

=head1 DESCRIPTION

L<Alien::Base> comprises base classes to help in the construction of C<Alien::> modules.  Modules in the L<Alien> namespace are used to locate and install (if necessary)
external libraries needed by other Perl modules.

This module is a toy module to test the efficacy of the L<Alien::Base> system with its experimental FFI interfaces.  This module depends on another toy module 
L<Acme::Alien::DontPanic2> which provides the needed libdontpanic library to be able to tell us the C<answer> to life, the universe and everything.

=head1 FUNCTIONS

=head2 answer

 my $answer = Acme::Ford::Prefect2::FFI::answer();

Returns the answer to life the universe and everything.  Not exported.

=head1 SEE ALSO

=over 4

=item L<FFI::Platypus>

=item L<Alien::Base>

=item L<Alien>

=back

=cut

our($dll) = Acme::Alien::DontPanic2->dynamic_libs;
die "no dll found for libdontpanic" unless $dll;
lib $dll;

attach answer => [] => int => '';

1;

