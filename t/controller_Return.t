use strict;
use warnings;
use Test::More;


use Catalyst::Test 'SeeIP';
use SeeIP::Controller::Return;

ok( request('/return')->is_success, 'Request should succeed' );
done_testing();
