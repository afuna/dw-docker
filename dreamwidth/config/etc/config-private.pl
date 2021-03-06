#!/usr/bin/perl

# Dreamwidth configuration file.  Copy this out of the documentation
# directory to etc/config-private.pl and edit as necessary.  The reason
# it's not in the etc directory already is to protect it from
# getting clobbered when you upgrade to the newest Dreamwidth code in
# the future.
#
# This is where you define private, site-specific configs (e.g. passwords).

{
    package LJ;

    # database info.  only the master is necessary.
    %DBINFO = (
               'master' => {  # master must be named 'master'
                   'host' => $ENV{DB_PORT_3306_TCP_ADDR},
                   'port' => $ENV{DB_PORT_3306_TCP_PORT},
                   'user' => 'root',
                   'pass' => '',    # CHANGETHIS
                   'dbname' => 'dw_global',
                   'role' => {
                       'cluster1' => 1,
                       'slow' => 1,

                       # optionally, apache write its access logs to a mysql database
                       #logs => 1,
                   },
               },
               # example of a TCP-based DB connection
               #'somehostname' => {
               #    'host' => "somehost",
               #    'port' => 1234,
               #    'user' => 'username',
               #    'pass' => 'password',
               #},
               # example of a UNIX domain-socket DB connection
               #'otherhost' => {
               #    'sock' => "$HOME/var/mysqld.sock",
               #    'user' => 'username',
               #    'pass' => 'password',
               #},
    );

    # Schwartz DB configuration
    @THESCHWARTZ_DBS = (
            {
                dsn =>"dbi:mysql:dw_schwartz;host=$ENV{DB_PORT_3306_TCP_ADDR}",
                user => 'root',
                pass => '',     # CHANGETHIS
            },
        );

    # 32 vs 64 bit arch. By default everything goes to a 64 bit arch.
    # Automatically detected. Uncomment to force 32 bit arch support.
    #
    # WARNING: This must be set prior to setting up your site.  If you change it
    # later on a running site, things may go badly for you.
    #
    #$ARCH32 = "1";

    # allow changelog posting.  this allows unauthenticated posts to the changelog
    # community from the IP and users specified.  this does not work on its own,
    # you have to configure your version control server to do the posting.  see
    # cgi-bin/DW/Hooks/Changelog.pm for more information.
    %CHANGELOG = (
        enabled          => 0,
        community        => 'changelog',
        allowed_posters  => [ qw/ mark denise / ],
        allowed_ips      => [ qw/ 123.123.123.123 / ],
    );

    # example user account for FAQs. By default, [[username]] in an FAQ answer
    # will use the username of the logged-in user; however, if the viewer is
    # not logged in, this username will be used instead. (You should own this
    # account so that nobody can take it.)
    $EXAMPLE_USER_ACCOUNT = "username";

    # list of official journals, as a list of "'username' => 1" pairs
    # used to determine whether to fire off an OfficialPost notification
    # when an entry is posted; hash instead of array for efficiency
    %OFFICIAL_JOURNALS = (
        news => 1,
    );
    
    # the "news" journal, to be specially displayed on the front page, etc
    $NEWS_JOURNAL = "news";

    # temporary config variables to trigger special import workflow, in the form of 
    #    username => 1
    # turned on for the duration of the import
    # %LJ::ALLOW_COMM_IMPORT = (
    #    examplecomm => 1,
    #);

    # %LJ::FIX_COMMENT_IMPORT = (
    #    user_with_blank_imported_comments => 1,
    #);


    # list of alternate domains that point to your site.
    @ALTERNATE_DOMAINS = (
        'ljsite.org',
        'ljsite.net',
        'ljsite.co.uk',
        'ljsite.tld',
    );

    # Set this to the IP address of your main site.  This is used for Tor exit checking.
    #$EXTERNAL_IP = '127.0.0.1';

    # configuration/ID for statistics tracker modules which apply to
    # site pages (www, non-journal)
    %SITE_PAGESTAT_CONFIG = (
    #    google_analytics => 'UA-xxxxxx-x',
    );

    # Path (e.g. /bots) at which a informational page about your acceptable bot
    # policies are documented.  This URI is excluded from anti-bot measures, so
    # make sure it's as permissive as possible to allow humans in who may be
    # lazy in their typing.  For example, leave off the trailing slash (/bots
    # instead of /bots/) if your URI is a directory.
    #$BLOCKED_BOT_URI = '/bots';

    # If you wish to publish PubSubHubbub notifications, uncomment this.  You can
    # use this default hub location, as it's supported by Google, or you can run
    # your own (or use any other hub you want).
    # @HUBBUB_HUBS = ( 'http://pubsubhubbub.appspot.com/' );

    # Add any tags here that you wish to create global 'latest posts' feed groups.
    # %LATEST_TAG_FEEDSS =
    #     group_names => {
    #         # short name => long name, used for the UI
    #         nnwm09 => 'NaNoWriMo 2009',
    #     },
    #
    #     tag_maps => {
    #         # tag => short name, in this case, all of the tags in the list on the
    #         # right map to the 'nnwm09' group on the left
    #         map { $_ => 'nnwm09' } ( 'nnwm09', 'nano', 'nanowrimo' ),
    #     },
    # );

    # setup recaptcha
    #%RECAPTCHA = (
    #        public_key  => "...",
    #        private_key => "...",
    #);

    # setup textcaptcha
    #%TEXTCAPTCHA = (
    #        api_key => "...",
    #);

    # YouTube configuration.
    # To get access  to YouTube APIs, you will need to create a Google API key.
    # Uncomment this section and make sure to fill in the fields at the bottom of config-private.pl.
    #%YOUTUBE_CONFIG = (
    #        # api URL, the token gets appended to this
    #        api_url   =>        'https://www.googleapis.com/youtube/v3/videos?id=',
    #
    #        # credentials for the API
    #        apikey    => "...",
    #);
}

1;
