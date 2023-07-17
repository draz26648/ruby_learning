#there and example of list and map in ruby

#list
list = [1,2,3,4,5,6,7,8,9,10]

#loop through list

for i in list
    puts i
end

#map

map = {
    "name" => "John",
    "age" => 20,
    "isMale" => true
}

#loop through map

for i in map
    #only prints the key
    puts i[1]
end