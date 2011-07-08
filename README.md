Roulette
======
`Super easy pre-sharding for your ruby NOSQL store. Presharding is used to naively scale your data-stores horizontally. `

[What is presharding](http://antirez.com/post/redis-presharding.html)

[Presharding at Craigslist](http://blog.zawodny.com/2011/02/26/redis-sharding-at-craigslist/)

Bang
----
### Works with Redis ###
    redis_array  = [Redis.new(...), Redis.new(...), Redis.new(...)]

    roulette = Roulette.new(redis_array)
    roulette.set("foo", "bar")
    roulette.get("foo")
    => "bar"

### Works with Memcache ###
    memcache_array  = [Memcache.new(...), Memcache.new(...), Memcache.new(...)]

    roulette = Roulette.new(memcache_array)
    roulette.set("foo", "bar")
    roulette.get("foo")
    => "bar"
    
### Works with ANY store that takes a key as it's first argument ###

Simply call roulette like you would call any of your client libraries. Roulette will automatically split the data between different machines.

Limitations
-----------
If your operator needs all the keys to be on one machine, such as reddis' SUNION, then you're out of luck. Don't use pre-sharding (yet) because this library doesn't support that.


          .____.
       xuu$``$$$uuu.
     . $``$  $$$`$$$
    dP*$  $  $$$ $$$
    ?k $  $  $$$ $$$
     $ $  $  $$$ $$$
     ":$  $  $$$ $$$
      N$  $  $$$ $$$
      $$  $  $$$ $$$
       $  $  $$$ $$$
       $  $  $$$ $$$
       $  $  $$$ $$$
       $  $  $$$ $$$
       $  $  $$$ $$$
       $$#$  $$$ $$$
       $$'$  $$$ $$$
       $$`R  $$$ $$$
       $$$&  $$$ $$$
       $#*$  $$$ $$$
       $  $  $$$ @$$
       $  $  $$$ $$$
       $  $  $$$ $$$
       $  $  $B$ $$&.
       $  $  $D$ $$$$$muL.
       $  $  $Q$ $$$$$  `"**mu..
       $  $  $R$ $$$$$    k  `$$*t
       $  @  $$$ $$$$$    k   $$!4
       $ x$uu@B8u$NB@$uuuu6...$$X?
       $ $(`RF`$`````R$ $$5`"""#"R
       $ $" M$ $     $$ $$$      ?
       $ $  ?$ $     T$ $$$      $
       $ $F H$ $     M$ $$K      $  ..
       $ $L $$ $     $$ $$R.     "d$$$$Ns.
       $ $~ $$ $     N$ $$X      ."    "%2h
       $ 4k f  $     *$ $$&      R       "iN
       $ $$ %uz!     tuuR$$:     Buu      ?`:
       $ $F          $??$8B      | '*Ned*$~L$
       $ $k          $'@$$$      |$.suu+!' !$
       $ ?N          $'$$@$      $*`      d:"
       $ dL..........M.$&$$      5       d"P
     ..$.^"*I$RR*$C""??77*?      "nu...n*L*
    '$C"R   ``""!$*@#""` .uor    bu8BUU+!`
    '*@m@.       *d"     *$Rouxxd"```$
         R*@mu.           "#$R *$    !
         *%x. "*L               $     %.
            "N  `%.      ...u.d!` ..ue$$$o..
             @    ".    $*"""" .u$$$$$$$$$$$$beu...
            8  .mL %  :R`     x$$$$$$$$$$$$$$$$$$$$$$$$$$WmeemeeWc
           |$e!" "s:k 4      d$N"`"#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
           $$      "N @      $?$   <F$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
           $@       ^%Uu..   R#8buu$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
                      ```""*u$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
                             #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
                              "5$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
                                `*$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
                                  ^#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>
                                     "*$$$$$$$$$$$$$$$$$$$$$$$$$$>
                                       `"*$$$$$$$$$$$$$$$$$$$$$$$>
                                           ^!$$$$$$$$$$$$$$$$$$$$>
                                               `"#+$$$$$$$$$$$$$$>
                                                     ""**$$$$$$$$>
                                                            ```""


Next Steps
==========
- Configuration Library
- Support specific operations to specific shards


Contribution
============

Fork away. If you want to chat about a feature idea, or a question you can find me on the twitters [@schneems](http://twitter.com/schneems).  Put any major changes into feature branches. Make sure all tests stay green, and make sure your changes are covered. 


licensed under MIT License
Copyright (c) 2011 Schneems. See LICENSE.txt for
further details.