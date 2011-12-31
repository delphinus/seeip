package SeeIP::Controller::Return;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use HTTP::Status qw!:constants status_message!;
use Time::HiRes;

=head1 NAME

SeeIP::Controller::Return - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 root

=cut

sub root : Chained('/') PathPart('') CaptureArgs(0) {}

=head2 return_ip

IP アドレスを返す

=cut

sub return_ip : Chained('root') PathPart('get') Args(1) {
    my ($self, $c, $type) = @_;

    $type = uc $type;
    if (-1 == index 'JSON YAML XML IP DYN', $type) {
        $c->res->body(status_message(HTTP_FORBIDDEN));
        $c->res->status(HTTP_FORBIDDEN);
        $c->detach;
    }

    $c->stash->{REMOTE_ADDR} = $c->engine->env->{REMOTE_ADDR} // '0.0.0.0';
    $c->stash->{timestamp} = int(Time::HiRes::time * 1000);
    $c->forward("View::$type");
}

=head2 default_return

デフォルトでは JSON で返す

=cut

sub default_return : Chained('root') PathPart('get') Args(0) {
    my ($self, $c) = @_;

    $c->forward('return_ip', ['JSON']);
}

=head1 AUTHOR

delphinus35 <delphinus@remora.cx>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
