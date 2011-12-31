use strict;
use warnings;

use SeeIP;

my $app = SeeIP->apply_default_middlewares(SeeIP->psgi_app);
$app;

