My [Project Euler](http://projecteuler.net) solutions

Follow my [progress](http://projecteuler.net/progress=coreymartella)

My Friend Key: 51694834390424_933f7909b412fa30c4b5fc43097ff065

You can quickly setup a new ruby file for any given problem if you have the nokogiri gem:

```ruby
load 'common.rb'
#this will create a file like p100.rb and set it up with the problem description
setup_p 100 # or whatever number you like, 
# this will try problem 100 and pass an arg of 123 to the p100 method
# it will copy the result to clipboard and time the execution
try_p 100, 123 
```