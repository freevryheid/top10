# top10
Find top10 countries in a banned ip list

This needs a list of "banned" ips seperated by spaces. I use fail2ban on a linux server. I generate bannedip list using:

``` sh
fail2ban-client status sshd > bannedip
```

and edit it to show only ip addresses seperated by spaces. The script uses the geoiplookup program.

Build or run:

``` sh
v run top10.v
```

I get:

``` sh

                 United States: 450
                         China: 408
                     Singapore: 255
                     Hong Kong: 240
                         India: 192
                       Germany: 158
                        Brazil: 129
                   Netherlands: 105
            Korea, Republic of: 104
            Russian Federation: 89
```

This lists the top 10 countries of suspects failing to gain access to my server. These could be hosts or compromised machines that are banned after numerous failed attempts to gain access as flagged by fail2ban. I typically have a list of around 3000+ banned ips.

