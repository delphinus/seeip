package SeeIP::View::IP;
use Moose;
extends qw!Catalyst::View!;

sub process { my ($self, $c) = @_;
    $c->res->headers->content_type('text/plain');
    $c->res->output($c->stash->{REMOTE_ADDR});
    1;
}

__PACKAGE__->meta->make_immutable;
