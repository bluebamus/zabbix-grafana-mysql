<?php header("HTTP/1.1 404 Not Found"); ?>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ui/assets/styles/blue-theme.css?1732104530">
    <style>
        div#instructions {
            padding: 0.5em;
            padding-bottom: 0;
            margin: 0.5em;
        }

        pre {
            border: 1px solid grey;
            margin: 0.5em;
            margin-bottom: 0;
            padding: 0.5em;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <main>
            <output class="msg-global msg-bad collapsible">
                <span>
                    Manual intervention is required to complete upgrade!
                </span>

                <div class="msg-details">
                    <p>
                        Starting with Zabbix 7.2 official packages, frontend PHP files were moved from <b>/usr/share/zabbix</b> to <b>/usr/share/zabbix/ui</b>.</p>
                        <p>If you are seeing this message, Zabbix configuration for Nginx must be updated manually.
                    </p>

                    <div id="instructions">
                    <p>
                        <ol>
                            <li>Back up your old configuration file:
                                <pre># cp /etc/nginx/conf.d/zabbix.conf /etc/nginx/conf.d/zabbix.conf.bak</b></pre>
                            </li>

                            <li>Set the correct path in the configuration file:
                                <pre># sed -i 's:/usr/share/zabbix:/usr/share/zabbix/ui:g' /etc/nginx/conf.d/zabbix.conf</pre>
                            </li>

                            <li>Restart the web server:
                                <pre># systemctl restart nginx</pre>
                            </li>
                        </ol>
                    </p>
                    </div>

                    <p>
                        See also: <a href="https://www.zabbix.com/documentation/7.2/en/manual/installation/upgrade_notes_720#frontend-file-directory-changed-during-package-installation">Upgrade notes for 7.2.0</a>
                    </p>
                </div>
            </output>
        </main>
    </div>
</body>
</html>
