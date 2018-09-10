# VKNetWorking_Swift
网络请求

#### 前言
本来是要转行了，感觉啥都不精，打工没钱途了，于是不准备看Swift了。可是，重点都在可是后面......因为万达的铺面转让费需要几十万，一时之间无法拿出那么多钱，故奔着活到老学到老的精神，看起Swift来了。
初入Swift，代码烂，大佬您高抬贵手。

#### 项目介绍
语法也没怎么看，哪里不懂了再去Google吧......然后写了个网络请求，网上不少swift的第三方库，说哪个好的都有，这个我觉得看个人习惯吧，这demo选择的是SwiftyJSON+Alamofire+ObjectMapper，至于为什么选了ObjectMapper，可能是因为Star多吧，毕竟哪个都没用过。

#### 使用说明
```
VKNetWorking.POST(urlString, param: params, vc: self, done: nil, success: { (json) in
            
            print("-----------------------------------------------")
            print(json)
            
        }, failture: nil)
        
如需要自己处理，实现done/success/failture，则不会走VKNetWorking内部的处理方法。
判断什么的都没写，只是个基本的请求。
```

