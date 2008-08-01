package Pod::Browser::Controller::Root;
use strict;
use warnings;
use lib(qw(/Users/mo/Documents/workspace/Catalyst-Controller-POD/lib));
use base 'Catalyst::Controller::POD';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';


=head1 NAME

Pod::Browser::Controller::Root - Root Controller for Pod::Browser

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub test : Local {
	my ($self, $c) = @_;
	
	$c->res->body("mulle". Data::Dumper::Dumper($self->self));
	
}

=head2 end

Attempt to render a view, if needed.

=cut 
sub end { }

=head1 AUTHOR

Moritz Onken

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
1;
