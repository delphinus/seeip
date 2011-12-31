package SeeIP::View::YAML;
use Moose;
extends qw!Catalyst::View!;

use YAML;

sub process { my ($self, $c) = @_;
    $c->res->headers->content_type('text/yaml');
    $c->res->output($self->test . Dump $c->stash);
    1;
}

__PACKAGE__->meta->make_immutable;
