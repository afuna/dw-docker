#!/usr/bin/perl
# -*-perl-*-

# Dreamwidth configuration file.  Copy this out of the documentation
# directory to etc/config-local.pl and edit as necessary.  The reason
# it's not in the etc directory already is to protect it from
# getting clobbered when you upgrade to the newest Dreamwidth code in
# the future.
#
# This, and config-private.pl should be the only files you need to
# change to get the Dreamwidth code to run on your site.
#
# Use the  checkconfig.pl utility to find any other config variables
# that might not be documented here. You should be able to set config
# values here and have the DW code run; if you have to modify the
# code itself, it's a bug and you should report it.

{
    package LJ;

    # keep this enabled only if this site is a development server
    $IS_DEV_SERVER = 1;

    # change this to "1" if you only want changes that
    # have been tested in production on dreamwidth.org
    $USE_STABLE_CODE = 0;

    # home directory
    $HOME = $ENV{'LJHOME'};

    # the base domain of your site.
    $DOMAIN = "dreamwidth.dev";

    # human readable name of this site as well as shortened versions
    # CHANGE THIS
    $SITENAME = "A New Dreamwidth Installation";
    $SITENAMESHORT = "YourSite";
    $SITENAMEABBREV = "YS";
    $SITECOMPANY = "YourSite's Company";
    $SITEADDRESS = "123 Main St.<br />Somewhere, XX 12345";
    $SITEADDRESSLINE = "123 Main St. Somewhere, XX 12345";

    # MemCache information, if you have MemCache servers running
    #@MEMCACHE_SERVERS = ('hostname:port');
    #$MEMCACHE_COMPRESS_THRESHOLD = 1_000; # bytes

    # optional SMTP server if it is to be used instead of sendmail
    #$SMTP_SERVER = "127.0.0.1";
    #$MAIL_TO_THESCHWARTZ = 1;

    # If enabled, disable people coming in over Tor exits from using various parts of the site.
    $USE_TOR_CONFIGS = 0;

    # Configure what you want blocked here.  Requires $USE_TOR_CONFIGS to be on.
    %TOR_CONFIG = (
        shop => 1,     # Disallow Tor users from accessing the Shop.
    );

    # if you define these, little help bubbles appear next to common
    # widgets to the URL you define:
    %HELPURL = (
        paidaccountinfo => "#",
    );

    # additional domain from which to serve the iframes for embedded content
    # for security reasons, we strongly recommend that this not be on your $DOMAIN
    $EMBED_MODULE_DOMAIN = "embed.my-other-domain.net";

    # 404 page
    # Uncomment if you don't want the (dw-free) default, 404-error.bml
    # (Note: you need to provide your own 404-error-local.bml)
    # $PAGE_404 = "404-error-local.bml";

    # merchandise link
    # $MERCH_URL = "http://www.zazzle.com/dreamwidth*";

    # shop/pricing configuration
    # %SHOP = (
    #    key => [ $USD, months, account type, cost in points ],
    #    prem6  => [  20,  6, 'premium', 200 ],
    #    prem12 => [  40, 12, 'premium', 400 ],
    #    paid1  => [   3,  1, 'paid', 30    ],
    #    paid2  => [   5,  2, 'paid', 50    ],
    #    paid6  => [  13,  6, 'paid', 130   ],
    #    paid12 => [  25, 12, 'paid', 250   ],
    #    seed   => [ 200, 99, 'seed', 2000   ],
    #    points => [],     # if present, sell points
    #    vgifts => [],     # if present, sell virtual gifts
    #    rename => [ 15, undef, undef, 150 ],
    #);

    # number of days to display virtual gifts on the profile - default to two weeks
    # $VGIFT_EXPIRE_DAYS = 14;

    # You can turn on/off community importing here.
    $ALLOW_COMM_IMPORTS = 0;

    # If this is defined and a number, if someone tries to import more than this many
    # comments in a single import, the error specified will be raised and the job will fail.
    $COMMENT_IMPORT_MAX = undef;
    $COMMENT_IMPORT_ERROR = "Importing more than 10,000 comments is currently disabled.";

    # Set the URI for iOS to find the icon it uses for home-screen
    # bookmarks on user subdomains (or anything else rendered through
    # S2). This file is not part of the dw-free installation, and is
    # therefore disabled by default.
    #$APPLE_TOUCH_ICON = "$LJ::SITEROOT/apple-touch-icon.png";
}

1;
