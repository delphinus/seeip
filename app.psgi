use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";
use SeeIP;

my $app = SeeIP->apply_default_middlewares(SeeIP->psgi_app);
$app;

