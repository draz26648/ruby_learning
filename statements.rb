#in ruby you can use statements like if, else, elsif, unless, case, when, while, until, for, break, next, redo, retry, return, begin, end, do, rescue, ensure, and raise

# if statement example

x = 10
y = 20

if x > y
    puts "x is greater than y"
elsif x < y
    puts "x is less than y"
else
    puts "x is equal to y"
end

# unless statement example

unless x > y
    puts "x is less than y"
else
    puts "x is greater than y"
end

# case statement example

case x
when 10
    puts "x is 10"
when 20
    puts "x is 20"
else
    puts "x is neither 10 nor 20"
end

# while statement example

i = 0

while i < 10
    puts i
    i += 1
end

# until statement example

i = 0

until i > 10
    puts i
    i += 1
end

# for statement example

for i in 0..10
    puts i
end

# break statement example

i = 0

while i < 10
    puts i
    i += 1
    break if i == 5
end

# next statement example

i = 0

while i < 10
    i += 1
    next if i == 5
    puts i
end

# redo statement example

i = 0

while i < 10
    i += 1
    redo if i == 5
    puts i
end

# retry statement example

i = 0

while i < 10
    i += 1
    retry if i == 5
    puts i
end

# return statement example

def add(x, y)
    return x + y
end

puts add(10, 20)

# begin statement example

begin
    puts "Hello World"
end

# end statement example

puts "Hello World"

# do statement example

10.times do
    puts "Hello World"
end

# rescue statement example

begin
    puts 10 / 0
rescue
    puts "Error"
end

# ensure statement example

begin
    puts 10 / 0
rescue
    puts "Error"
ensure
    puts "Ensure"
end

# raise statement example

begin
    raise "Error"
rescue
    puts "Error"
end