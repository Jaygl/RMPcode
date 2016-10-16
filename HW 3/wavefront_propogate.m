function [val] = wavefront_propogate(val)
	set(0,'RecursionLimit',50000);
    [i j] = find(val == 0);
	
    global VAL
    VAL = val;
    fan2(i,j,0);
  	val = VAL;
    clear VAL;
end
