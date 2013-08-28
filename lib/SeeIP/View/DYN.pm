package SeeIP::View::DYN;
use Moose;

extends qw!Catalyst::View::TT!;

before process => sub { my ($self, $c) = @_;
    $c->stash->{template} = 'dyn.tt';
};

__PACKAGE__->meta->make_immutable;

=head1 NAME

SeeIP::View::DYN - TT View for SeeIP

=head1 DESCRIPTION

TT View for SeeIP.

=head1 SEE ALSO

L<SeeIP>

=head1 AUTHOR

delphinus35 <delphinus@remora.cx>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
