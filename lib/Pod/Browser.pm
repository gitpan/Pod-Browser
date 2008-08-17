package Pod::Browser;
use strict;
use warnings;

use Catalyst::Runtime '5.70';

use parent qw/Catalyst/;

our $VERSION = '0.02';

__PACKAGE__->config( name => 'Pod::Browser' );

__PACKAGE__->setup(qw/ ConfigLoader Static::Simple/);


=head1 NAME

Pod::Browser - Pod Web Server based on Catalyst and ExtJS

=head1 SYNOPSIS

  pod_browser_server.pl

  visit http://localhost:3030

=head1 DESCRIPTION

This is a L<Catalyst> server which serves PODs. It allows you to browse through your local
repository of modules. On the front page is a search box
which uses CPAN's xml interface to retrieve the results. If you click on one of them
the POD is displayed in this application.

Cross links in PODs are resolved and pop up as a new tab. If the module you clicked on is
not installed this controller fetches the source code from CPAN and creates the pod locally.
There is also a TOC which is always visible and scrolls the current POD to the selected section.

It is written using a JavaScript framework called ExtJS (L<http://www.extjs.com>) which
generate beautiful and intuitive interfaces.

Have a look at L<http://cpan.org/authors/id/P/PE/PERLER/pod-images/pod-encyclopedia-01.png>

=head1 NOTICE

This is the second release. There are probably a lot of bugs.

=head1 CONFIGURATION

First you have to locate the config file. Try

  # locate pod_browser.yml

in your command line and open it.

=over

=item inc (Boolean)

Search for modules in @INC. Set it to 1 or 0.

Defaults to C<0>.

=item namespaces (Arrayref)

Filter by namespaces. See L<Pod::Simple::Search> C<limit_glob> for syntax.

Defaults to C<["*"]>

=item self (Boolean)

Search for modules in C<< $c->path_to( 'lib' ) >>.


Defaults to C<1>.

=item dirs (Arrayref)

Search for modules in these directories.

Defaults to C<[]>.

=head1 STARTING THE SERVER

The server backend is a Catalyst application which gives you the choice how you want to run the server.

=head2 Catalyst Development Server

The easiest way might be to start the server by running
  pod_browser_server.pl

This is the Catalyst development server but should be suffient for testing or usage by a limited number
of users.

=head2 FastCGI

For better performance you can chose the FastCGI server. See L<Catalyst::Manual::Cookbook/"FastCGI Deployment">
on how to set this up.

=head2 More Engines

There are many more Catalyst engines avaiable. Another interesting Engine might be L<Catalyst::Engine::Apache2>.
Check out the Catalyst::Engine namespace and see L<Catalyst::Manual::Cookbook/Deployment>.

=head1 BUGS

=head2 Jump to sections

There are some names of sections in some Pods which include special characters. There are still some problems with them.
It would be helpful if you report these Pods so I can work around these cases.

=head1 INTEGRATION IN CATALYST

If you want to integrate this application directly into your catalyst application have a look at L<Catalyst::Controller::POD>.
This controller is used by this application.

=head1 SEE ALSO

L<Catalyst>, L<Catalyst::Controller::POD>

ExtJS (L<http://www.extjs.com>) is used for the user interface.

Other Pod Web Servers:

L<Pod::Server>, L<Pod::Webserver>, L<Pod::POM::Web>

=head1 AUTHOR

Moritz Onken

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut