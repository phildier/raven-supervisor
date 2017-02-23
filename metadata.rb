name             'raven-supervisor'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures raven-supervisor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.11'

attribute "raven_supervisor",
    :display_name => "Raven Supervisor",
    :type => "hash"

attribute "raven_supervisor/username",
    :display_name => "Supervisor Username",
    :description => "Supervisor Username for XMLRPC",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven-supervisor::default"]

attribute "raven_supervisor/password",
    :display_name => "Supervisor Password",
    :description => "Supervisor Password for XMLRPC",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven-supervisor::default"]

attribute "raven_supervisor/port",
    :display_name => "Supervisor Port",
    :description => "Supervisor Listen Port for XMLRPC",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven-supervisor::default"]
