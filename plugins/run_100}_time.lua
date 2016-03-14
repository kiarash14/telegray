1 -- Implement a command !time [area] which uses
2 -- 2 Google APIs to get the desired result:
3 --  1. Geocoding to get from area to a lat/long pair
4 --  2. Timezone to get the local time in that lat/long location
5 
6 -- Globals
7 -- If you have a google api key for the geocoding/timezone api
8 api_key  = nil
9 
10 base_api = "https://maps.googleapis.com/maps/api"
11 dateFormat = "%A %d %B - %H:%M:%S"
12 
13 -- Need the utc time for the google api
14 function utctime()
15   return os.time(os.date("!*t"))
16 end
17 
18 -- Use the geocoding api to get the lattitude and longitude with accuracy specifier
19 -- CHECKME: this seems to work without a key??
20 function get_latlong(area)
21   local api      = base_api .. "/geocode/json?"
22   local parameters = "address=".. (URL.escape(area) or "")
23   if api_key ~= nil then
24     parameters = parameters .. "&key="..api_key
25   end
26 
27   -- Do the request
28   local res, code = https.request(api..parameters)
29   if code ~=200 then return nil  end
30   local data = json:decode(res)
31  
32   if (data.status == "ZERO_RESULTS") then
33     return nil
34   end
35   if (data.status == "OK") then
36     -- Get the data
37     lat  = data.results[1].geometry.location.lat
38     lng  = data.results[1].geometry.location.lng
39     acc  = data.results[1].geometry.location_type
40     types= data.results[1].types
41     return lat,lng,acc,types
42   end
43 end
44 
45 -- Use timezone api to get the time in the lat,
46 -- Note: this needs an API key
47 function get_time(lat,lng)
48   local api  = base_api .. "/timezone/json?"
49 
50   -- Get a timestamp (server time is relevant here)
51   local timestamp = utctime()
52   local parameters = "location=" ..
53     URL.escape(lat) .. "," ..
54     URL.escape(lng) .. 
55     "&timestamp="..URL.escape(timestamp)
56   if api_key ~=nil then
57     parameters = parameters .. "&key="..api_key
58   end
59 
60   local res,code = https.request(api..parameters)
61   if code ~= 200 then return nil end
62   local data = json:decode(res)
63   
64   if (data.status == "ZERO_RESULTS") then
65     return nil
66   end
67   if (data.status == "OK") then
68     -- Construct what we want
69     -- The local time in the location is:
70     -- timestamp + rawOffset + dstOffset
71     local localTime = timestamp + data.rawOffset + data.dstOffset
72     return localTime, data.timeZoneId
73   end
74   return localTime
75 end
76 
77 function getformattedLocalTime(area)
78   if area == nil then
79     return "The time in nowhere is never"
80   end
81 
82   lat,lng,acc = get_latlong(area)
83   if lat == nil and lng == nil then
84     return 'It seems that in "'..area..'" they do not have a concept of time.'
85   end
86   local localTime, timeZoneId = get_time(lat,lng)
87 
88   return "The local time in "..timeZoneId.." is: ".. os.date(dateFormat,localTime) 
89 end
90 
91 function run(msg, matches)
92   return getformattedLocalTime(matches[1])
93 end
94 
95 return {
96   description = "Displays the local time in an area", 
97   usage = "!time [area]: Displays the local time in that area",
98   patterns = {"^!time (.*)$"}, 
99   run =