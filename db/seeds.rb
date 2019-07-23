# 0.1.step(0.1,0.01) { |i|
# 	Map.create(address: "地点A" + i.to_s, latitude: 35.153 + i , longitude: 136.97 + i )



 0.step(1, 0.001){|num|
     Map.create(address: "地点A" + num.to_s, latitude: 35.153 + num , longitude: 136.97 + num )
 }
