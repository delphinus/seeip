package SeeIP::View::XML;
use Moose;
extends qw!Catalyst::View!;

use XML::Simple;

sub process { my ($self, $c) = @_;
    $c->res->headers->content_type('text/xml');
    $c->res->output(XMLout($c->stash, %{ $self->config }));
    1;
}

__PACKAGE__->meta->make_immutable;

=head1 NAME

SeeIP::View::XML - Catalyst XML View

=head1 SYNOPSIS

See L<SeeIP>

=head1 DESCRIPTION

Catalyst XML View.

=head1 AUTHOR

delphinus35 <delphinus@remora.cx>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

