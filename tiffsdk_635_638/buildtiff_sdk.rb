#!/usr/bin/ruby

f = File.new("functions.txt", "r")
h = {}
#0x267A6DD2 [0x08A888E8] - __sceSasRevParam
regexp = /^(0x.+) \[(0x.+)\] - (.+)$/
while (line = f.gets)
	if (line.match(regexp)) 
	  line.scan(regexp) {|nid,address,name| 
		h[name] = address
	  }
	end
end


out = File.new("ctl0.c", "w")

out.puts %Q{#include "sdk.h"

int main(unsigned int text_addr);

// Sprungpunkt zum main Thread
int _start(unsigned int text_addr) __attribute__ ((section (".text.start")));

int _start(unsigned int text_addr)
	
	
	
	
}

h.each { |function,address|
	out.puts "\ #{function} = (void *)text_addr + #{address};"
}

out.puts %Q{


	main(text_addr);
	
}
out.close
