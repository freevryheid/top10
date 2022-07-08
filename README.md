# top10
Find top10 countries in a banned ip list

I use fail2ban on a linux server. I generate bannedip list using:

``` sh
fail2ban-client status sshd > bannedip
```

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


