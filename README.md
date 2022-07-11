# top10
Find top10 countries in a banned ip list using V

This uses "sudo fail2ban-client banned" to generate a list of banned ips. Then the script uses the geoiplookup program to determine the contries.

Build:

``` sh
v -prod top10.v
```

Run:

``` sh
sudo ./top10
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

